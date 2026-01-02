from __future__ import annotations

import shutil
import sys
from pathlib import Path

from markdown_it import MarkdownIt
from playwright.sync_api import sync_playwright

md = MarkdownIt()


REPO_ROOT = Path(__file__).resolve().parent.parent
SCRIPT_ROOT = Path(__file__).resolve().parent
TEMPLATE_PATH = SCRIPT_ROOT / "template.html"
CSS_PATH = SCRIPT_ROOT / "style.css"
INDEX_TEMPLATE_PATH = SCRIPT_ROOT / "index-template.html"


def render_html(md_dir: Path) -> Path:
    md_dir = md_dir.resolve()
    rel = md_dir.relative_to(REPO_ROOT)
    html_dir = REPO_ROOT / "site" / rel

    # Copy entire directory tree to the site/ mirror.
    if html_dir.exists():
        shutil.rmtree(html_dir)
    shutil.copytree(md_dir, html_dir, dirs_exist_ok=True)

    css = CSS_PATH.read_text(encoding="utf-8")
    template = TEMPLATE_PATH.read_text(encoding="utf-8")

    for md_file in sorted(html_dir.rglob("*.md")):
        title = md_file.stem
        content = md.render(md_file.read_text(encoding="utf-8"))

        outputfile = md_file.with_suffix(".html")
        output = (
            template.replace("{{ content }}", content)
            .replace("{{ css }}", css)
            .replace("{{ title }}", title)
        )
        print(f"Rendering {md_file.relative_to(REPO_ROOT)} -> {outputfile.relative_to(REPO_ROOT)}...")
        outputfile.write_text(output, encoding="utf-8")
        md_file.unlink()  # remove source md from site copy

    return html_dir


def render_pdf(html_dir: Path) -> Path:
    html_dir = html_dir.resolve()
    html_files = sorted(html_dir.rglob("*.html"))

    with sync_playwright() as p:
        browser = p.chromium.launch()
        page = browser.new_page()

        for html_file in html_files:
            filepath = html_file.resolve().as_uri()
            pdf_path = html_file.with_suffix(".pdf")
            if pdf_path.exists():
                continue

            page.goto(filepath, wait_until="load")

            # Wait for MathJax to finish typesetting (set in template.html).
            try:
                page.wait_for_function("window.__mathjaxDone === true", timeout=30_000)
            except Exception:
                pass  # still produce a PDF

            print(
                f"Rendering {html_file.relative_to(REPO_ROOT)} -> {pdf_path.relative_to(REPO_ROOT)}..."
            )

            page.pdf(
                path=str(pdf_path),
                print_background=True,
                prefer_css_page_size=True,
            )

        browser.close()

    return html_dir


def build_index(html_dir: Path) -> None:
    html_dir = html_dir.resolve()
    entries: dict[str, list[tuple[Path, Path | None]]] = {}

    index_tpl = INDEX_TEMPLATE_PATH.read_text(encoding="utf-8") if INDEX_TEMPLATE_PATH.exists() else ""

    for html_file in sorted(html_dir.rglob("*.html")):
        if html_file.name == "index.html":
            continue
        rel = html_file.relative_to(html_dir)
        group = rel.parts[0] if len(rel.parts) > 1 else "_root"
        pdf_path = html_file.with_suffix(".pdf")
        entries.setdefault(group, []).append((rel, pdf_path if pdf_path.exists() else None))

    lines: list[str] = []
    
    for group in sorted(entries.keys()):
        items = entries[group]
        # Root items without a subgroup
        if group == "_root":
            lines.append("<ul>")
            for rel, pdf in items:
                html_href = rel.as_posix()
                label = rel.name
                pdf_link = f" <small><a href='{pdf.relative_to(html_dir).as_posix()}'>pdf</a></small>" if pdf else ""
                lines.append(f"<li><a href='{html_href}'>{label}</a>{pdf_link}</li>")
            lines.append("</ul>")
            continue

        lines.append("<details>")
        lines.append(f"<summary>{group}</summary>")
        lines.append("<ul>")
        for rel, pdf in items:
            html_href = rel.as_posix()
            label = rel.with_suffix("").name
            pdf_link = f" <small><a href='{pdf.relative_to(html_dir).as_posix()}'>pdf</a></small>" if pdf else ""
            lines.append(f"<li><a href='{html_href}'>{label}</a>{pdf_link}</li>")
        lines.append("</ul>")
        lines.append("</details>")

    content_html = "\n".join(lines)
    if index_tpl:
        out_html = (
            index_tpl.replace("{{ title }}", "Tutorials Index")
                     .replace("{{ heading }}", f"Tutorials Index ({html_dir.relative_to(REPO_ROOT)})")
                     .replace("{{ content }}", content_html)
        )
    else:
        out_html = content_html

    (html_dir / "index.html").write_text(out_html, encoding="utf-8")


def main() -> None:
    if len(sys.argv) < 3:
        print("Usage: python render-tutorials.py <html|pdf> <path/to/tutorials/...>", file=sys.stderr)
        sys.exit(1)

    render_to = sys.argv[1]
    md_dir = Path(sys.argv[2]).resolve()

    if render_to == "html":
        html_dir = render_html(md_dir)
        build_index(html_dir)
    elif render_to == "pdf":
        html_dir = render_html(md_dir)
        render_pdf(html_dir)
        build_index(html_dir)
    else:
        print("render_to must be 'html' or 'pdf'", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()