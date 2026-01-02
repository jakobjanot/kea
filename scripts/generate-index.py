from pathlib import Path

#!/usr/bin/env python3
"""
Generate a simple index.html that links to slides/*/index.html
and tutorials/*/index.html.
"""


ROOT = Path(__file__).resolve().parent.parent
SITE_DIR = ROOT / "site"
OUTPUT_FILE = SITE_DIR / "index.html"


def collect_indices(base: Path) -> list[tuple[str, str]]:
    """Return list of (name, href) for subfolders under base containing index.html."""
    items: list[tuple[str, str]] = []
    if not base.is_dir():
        return items
    for sub in sorted(p for p in base.iterdir() if p.is_dir()):
        index_file = sub / "index.html"
        if index_file.is_file():
            rel_href = str(index_file.relative_to(SITE_DIR))
            items.append((sub.name, rel_href))
    return items


def build_section(title: str, entries: list[tuple[str, str]]) -> str:
    """Build HTML section for a list of entries."""
    if not entries:
        return f"<h2>{title}</h2><p>No entries found.</p>"
    lines = [f"<h2>{title}</h2>", "<ul>"]
    for name, href in entries:
        lines.append(f'  <li><a href="{href}">{name}</a></li>')
    lines.append("</ul>")
    return "\n".join(lines)


def main() -> None:
    slides = collect_indices(SITE_DIR / "slides")
    tutorials = collect_indices(SITE_DIR / "tutorials")

    html_parts = [
        "<!DOCTYPE html>",
        '<html lang="en">',
        "<head>",
        '  <meta charset="utf-8" />',
        "  <title>Index</title>",
        "</head>",
        "<body>",
        "<h1>Index</h1>",
        build_section("Slides", slides),
        build_section("Tutorials", tutorials),
        "</body>",
        "</html>",
    ]
    OUTPUT_FILE.write_text("\n".join(html_parts), encoding="utf-8")
    print(f"Wrote {OUTPUT_FILE}")


if __name__ == "__main__":
    main()