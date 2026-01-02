#!/usr/bin/env python3
from __future__ import annotations

import argparse
import os
from pathlib import Path

from playwright.sync_api import TimeoutError as PlaywrightTimeoutError
from playwright.sync_api import sync_playwright

def _as_file_url(path: Path) -> str:
    # Use a file:// URL so relative assets resolve.
    return path.resolve().as_uri()


WAIT_FOR_ASSETS_JS = r"""
(async () => {
  const timeoutMs = 20000;

  function withTimeout(promise, label) {
    return new Promise((resolve) => {
      const t = setTimeout(() => resolve({ ok: false, label, reason: 'timeout' }), timeoutMs);
      promise.then(
        () => { clearTimeout(t); resolve({ ok: true, label }); },
        (e) => { clearTimeout(t); resolve({ ok: false, label, reason: String(e) }); },
      );
    });
  }

  // Ensure Reveal (if present) has initialized.
  const revealReady = async () => {
    const start = Date.now();
    while (Date.now() - start < timeoutMs) {
      const Reveal = window.Reveal;
      if (Reveal) {
        try {
          // Reveal >=4 has isReady(), older builds still set it.
          if (typeof Reveal.isReady === 'function' && Reveal.isReady()) return true;
          // Fallback: if the slides container exists and has sections.
          const deck = document.querySelector('.reveal .slides');
          if (deck && deck.querySelector('section')) return true;
        } catch (_) {
          // ignore
        }
      }
      await new Promise(r => setTimeout(r, 100));
    }
    return false;
  };

  await revealReady();

  // Force Reveal lazy-loaded images to start loading.
  for (const img of Array.from(document.images || [])) {
    try {
      img.loading = 'eager';
      const ds = img.dataset || {};
      if ((!img.getAttribute('src') || img.getAttribute('src') === '') && ds.src) {
        img.setAttribute('src', ds.src);
      }
      if ((!img.getAttribute('srcset') || img.getAttribute('srcset') === '') && ds.srcset) {
        img.setAttribute('srcset', ds.srcset);
      }
    } catch (_) {
      // ignore
    }
  }

  // Background images via data-background-image (Reveal feature)
  const bgUrls = [];
  for (const section of Array.from(document.querySelectorAll('section[data-background-image]'))) {
    const url = section.getAttribute('data-background-image');
    if (url) bgUrls.push(url);
  }

  // Background images directly in inline styles (basic url(...) parsing).
  const styleBgUrls = [];
  for (const el of Array.from(document.querySelectorAll('[style]'))) {
    const style = (el.getAttribute('style') || '');
    const m = style.match(/background-image\s*:\s*url\(([^)]+)\)/i);
    if (m && m[1]) {
      const raw = m[1].trim().replace(/^['\"]|['\"]$/g, '');
      if (raw) styleBgUrls.push(raw);
    }
  }

  // Background images defined in CSS (computed styles), common for theme classes.
  const computedBgUrls = [];
  const bgCandidates = document.querySelectorAll('body, section, .reveal, .slides, [class*="cover"], [class*="background"], [class*="bg"]');
  for (const el of Array.from(bgCandidates)) {
    const cs = window.getComputedStyle(el);
    const bg = cs && cs.getPropertyValue('background-image');
    if (!bg) continue;
    // Skip gradients and none.
    if (/gradient|none/i.test(bg)) continue;
    const match = bg.match(/url\(([^)]+)\)/i);
    if (match && match[1]) {
      const raw = match[1].trim().replace(/^['\"]|['\"]$/g, '');
      if (raw) computedBgUrls.push(raw);
    }
  }

  const uniqueUrls = Array.from(new Set([...bgUrls, ...styleBgUrls, ...computedBgUrls]));

  const waitForImgEl = (img) => {
    return new Promise((resolve) => {
      if (!img) return resolve();
      if (img.complete && img.naturalWidth > 0) return resolve();
      const done = () => resolve();
      img.addEventListener('load', done, { once: true });
      img.addEventListener('error', done, { once: true });
    });
  };

  const waitForUrl = (url) => {
    return new Promise((resolve) => {
      if (!url) return resolve();
      const img = new Image();
      img.onload = () => resolve();
      img.onerror = () => resolve();
      img.src = url;
    });
  };

  // Wait for all <img> elements to complete.
  const imgPromises = Array.from(document.images || []).map((img, i) => withTimeout(waitForImgEl(img), `img:${i}`));

  // Wait for any discovered background-image URLs.
  const urlPromises = uniqueUrls.map((url, i) => withTimeout(waitForUrl(url), `bg:${i}`));

  const results = await Promise.all([...imgPromises, ...urlPromises]);
  return {
    ok: results.every(r => r.ok),
    pending: results.filter(r => !r.ok).map(r => ({ label: r.label, reason: r.reason })),
    counts: {
      imgs: (document.images || []).length,
      bgUrls: uniqueUrls.length,
    }
  };
})();
"""


def print_reveal_pdf(
    *,
    html_dir: Path,
    out_dir: Path,
    glob: str = "*.html",
    timeout_ms: int = 45000,
    scale: float = 1.0,
) -> None:
    html_dir = html_dir.resolve()
    out_dir = out_dir.resolve()

    if not html_dir.exists() or not html_dir.is_dir():
        raise SystemExit(f"html dir not found: {html_dir}")

    out_dir.mkdir(parents=True, exist_ok=True)

    html_files = sorted(html_dir.glob(glob), key=lambda p: p.name)
    if not html_files:
        raise SystemExit(f"no HTML files matched {glob!r} in {html_dir}")

    # Keep index.html last (usually an overview), unless it's the only file.
    if len(html_files) > 1:
        index = [p for p in html_files if p.name == "index.html"]
        others = [p for p in html_files if p.name != "index.html"]
        html_files = others + index

    with sync_playwright() as p:
        browser = p.chromium.launch()
        context = browser.new_context()

        try:
            for html_file in html_files:
                pdf_path = out_dir / (html_file.stem + ".pdf")

                url = _as_file_url(html_file) + "?print-pdf"
                print(f"Printing {html_file.name} -> {pdf_path.relative_to(Path.cwd()) if pdf_path.is_absolute() else pdf_path}...")

                page = context.new_page()
                try:
                    # Wait for page load and then for network to go idle to give CSS/images time to settle.
                    page.goto(url, wait_until="load", timeout=timeout_ms)
                    page.wait_for_load_state("networkidle", timeout=timeout_ms)
                    page.wait_for_timeout(500)

                    # Use print media and let reveal's print styles kick in.
                    page.emulate_media(media="print")

                    asset_state = page.evaluate(WAIT_FOR_ASSETS_JS)
                    if not asset_state.get("ok"):
                        pending = asset_state.get("pending") or []
                        counts = asset_state.get("counts") or {}
                        print(
                            f"  Warning: assets not fully ready (imgs={counts.get('imgs')}, bgUrls={counts.get('bgUrls')}), "
                            f"pending={len(pending)}"
                        )

                    page.pdf(
                        path=str(pdf_path),
                        print_background=True,
                        prefer_css_page_size=True,
                        scale=scale,
                    )
                except PlaywrightTimeoutError:
                    raise SystemExit(f"Timed out while printing {html_file}")
                finally:
                    page.close()
        finally:
            context.close()
            browser.close()


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Print mkslides (Reveal.js) HTML output to PDF reliably (waits for images before printing)."
    )
    parser.add_argument(
        "html_dir",
        type=Path,
        help="Directory containing built slide HTML files (e.g. site/slides/programmering1)",
    )
    parser.add_argument(
        "--out-dir",
        type=Path,
        default=None,
        help="Output directory for PDFs (defaults to html_dir)",
    )
    parser.add_argument(
        "--glob",
        default="*.html",
        help="Glob of HTML files to print within html_dir (default: *.html)",
    )
    parser.add_argument(
        "--timeout-ms",
        type=int,
        default=int(os.environ.get("SLIDES_PDF_TIMEOUT_MS", "45000")),
        help="Timeout for loading each deck (default: 45000 or env SLIDES_PDF_TIMEOUT_MS)",
    )
    parser.add_argument(
        "--scale",
        type=float,
        default=float(os.environ.get("SLIDES_PDF_SCALE", "1.0")),
        help="PDF scale (default: 1.0 or env SLIDES_PDF_SCALE)",
    )

    args = parser.parse_args()
    out_dir = args.out_dir or args.html_dir

    print_reveal_pdf(
        html_dir=args.html_dir,
        out_dir=out_dir,
        glob=args.glob,
        timeout_ms=args.timeout_ms,
        scale=args.scale,
    )


if __name__ == "__main__":
    main()
