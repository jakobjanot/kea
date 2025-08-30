import os, sys
from markdown_it import MarkdownIt
from playwright.sync_api import sync_playwright
import os, sys

md = MarkdownIt()

root_dir = os.path.dirname(__file__)

def render_html(md_dir: str):
    html_dir = os.path.join(root_dir, "site", os.path.relpath(md_dir, start=root_dir))
    
    os.makedirs(html_dir, exist_ok=True)
    os.system(f"cp -r {md_dir}/* {html_dir}/")

    files = [f for f in os.listdir(html_dir) if f.endswith(".md")]
    for file in files:
        outputfile = f"{os.path.abspath(os.path.join(html_dir, file.replace('.md', '.html')))}"
        print(f"Rendering {file}...")
        title = os.path.splitext(file)[0]
        
        with open(os.path.join(html_dir, file), "r", encoding="utf-8") as f:
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

    os.system(f"rm {os.path.join(html_dir, '*.md')}")
    return html_dir

def render_pdf(html_dir: str):
    with sync_playwright() as p:
        browser = p.chromium.launch()
        page = browser.new_page()

        html_files = [f for f in os.listdir(html_dir) if f.endswith(".html")]
        for html_file in html_files:
            filepath = f"file://{os.path.abspath(os.path.join(html_dir, html_file))}"
            page.goto(filepath, wait_until="networkidle")

            pdf_path = os.path.join(html_dir, html_file.replace(".html", ".pdf"))
            print(f"Rendering {os.path.basename(pdf_path)}...")

            page.pdf(
                path=pdf_path,
                print_background=True,
                prefer_css_page_size=True
                # margin={"top": "0mm", "right": "0mm", "bottom": "0mm", "left": "0mm"}
            )

        browser.close()
    
    return html_dir

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python render.py <md_dir>")
        sys.exit(1)

    render_to = sys.argv[1]
    md_dir = os.path.abspath(sys.argv[2])

    if render_to == "html":
        html_dir = render_html(md_dir)
    elif render_to == "pdf":
        html_dir = render_html(md_dir)
        render_pdf(html_dir)