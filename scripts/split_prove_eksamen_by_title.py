#!/usr/bin/env python3
from __future__ import annotations

import argparse
import re
from pathlib import Path


SEP_RE = re.compile(r"^\s*---\s*$")
H1_RE = re.compile(r"^\s*(\*\s*)?#\s+(.+?)\s*$")


DANISH_MAP = str.maketrans(
    {
        "æ": "ae",
        "ø": "oe",
        "å": "aa",
        "Æ": "ae",
        "Ø": "oe",
        "Å": "aa",
    }
)


def slugify(text: str) -> str:
    text = text.strip().translate(DANISH_MAP)
    text = re.sub(r"([a-z0-9])([A-Z])", r"\1-\2", text)
    text = text.lower()
    text = re.sub(r"[`*_#]+", " ", text)
    text = re.sub(r"[^a-z0-9\s-]", " ", text)
    text = re.sub(r"\s+", " ", text).strip()
    text = text.replace(" ", "-")
    text = re.sub(r"-+", "-", text).strip("-")
    return text or "untitled"


def split_chunks(text: str) -> list[str]:
    chunks: list[str] = []
    buf: list[str] = []
    for line in text.splitlines(keepends=True):
        if SEP_RE.match(line):
            chunk = "".join(buf).strip("\n")
            if chunk.strip():
                chunks.append(chunk)
            buf = []
        else:
            buf.append(line)
    tail = "".join(buf).strip("\n")
    if tail.strip():
        chunks.append(tail)
    return chunks


def first_nonempty_line(lines: list[str]) -> str | None:
    for ln in lines:
        if ln.strip():
            return ln
    return None


def extract_title(chunk: str, index: int) -> str:
    first = first_nonempty_line(chunk.splitlines())
    if first:
        m = H1_RE.match(first)
        if m:
            return m.group(2).strip()
    return f"untitled-{index:02d}"


def unique_path(out_dir: Path, stem: str, overwrite: bool) -> Path:
    path = out_dir / f"{stem}.md"
    if overwrite or not path.exists():
        return path
    k = 2
    while True:
        candidate = out_dir / f"{stem}-{k}.md"
        if not candidate.exists():
            return candidate
        k += 1


def parse_args() -> argparse.Namespace:
    p = argparse.ArgumentParser(
        description="Split a prove-eksamen markdown file on '---' into per-task files named from each chunk's H1 title.",
    )
    p.add_argument("src", type=Path, help="Path to 30-prove-eksamener.md")
    p.add_argument(
        "--out-dir",
        type=Path,
        default=None,
        help="Output directory (default: same directory as src)",
    )
    p.add_argument(
        "--dry-run",
        action="store_true",
        help="Don't write files; only print what would be created",
    )
    p.add_argument(
        "--overwrite",
        action="store_true",
        help="Overwrite existing files instead of adding -2, -3 suffixes",
    )
    return p.parse_args()


def main() -> int:
    args = parse_args()
    src: Path = args.src.resolve()
    if not src.exists():
        raise SystemExit(f"Source file not found: {src}")

    out_dir: Path = (args.out_dir.resolve() if args.out_dir else src.parent)
    text = src.read_text(encoding="utf-8")
    chunks = split_chunks(text)

    created: list[Path] = []
    for i, chunk in enumerate(chunks, start=1):
        title = extract_title(chunk, i)
        filename_stem = slugify(title)
        out_path = unique_path(out_dir, filename_stem, overwrite=args.overwrite)
        created.append(out_path)

        if args.dry_run:
            continue

        out_path.write_text(chunk.strip() + "\n", encoding="utf-8")

    print(f"Chunks: {len(chunks)}")
    print(f"Out dir: {out_dir}")
    print("Planned files:" if args.dry_run else "Created files:")
    for p in created:
        print(f"- {p.name}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
