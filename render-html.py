import os, sys
from markdown_it import MarkdownIt

md = MarkdownIt()

def render_html(md_dir: str):
    files = [f for f in os.listdir(md_dir) if f.endswith(".md")]
    for file in files:
        outputfile = f"{os.path.abspath(os.path.join(md_dir, file.replace('.md', '.html')))}"
        print(f"Rendering {file}...")
        title = os.path.splitext(file)[0]
        
        with open(os.path.join(md_dir, file), "r", encoding="utf-8") as f:
            content = md.render(f.read())

        with open("style.css", "r", encoding="utf-8") as f:
            css = f.read()

        with open("template.html", "r", encoding="utf-8") as f:
            template = f.read()

        output = template.replace("{{ content }}", content) \
                         .replace("{{ css }}", css) \
                         .replace("{{ title }}", title)
        with open(outputfile, "w", encoding="utf-8") as f:
            f.write(output)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python html.py <md_dir>")
        sys.exit(1)
    md_dir = os.path.abspath(sys.argv[1])
    render_html(md_dir)
