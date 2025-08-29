from playwright.sync_api import sync_playwright
import os, sys

def export_pdfs(html_dir: str):
    with sync_playwright() as p:
        browser = p.chromium.launch()
        page = browser.new_page()

        files = [f for f in os.listdir(html_dir) if f.endswith(".html")]
        for file in files:
            filepath = f"file://{os.path.abspath(os.path.join(html_dir, file))}"
            page.goto(filepath, wait_until="networkidle")

            pdf_path = os.path.join(html_dir, file.replace(".html", ".pdf"))

            page.pdf(
                path=pdf_path,
                print_background=True,
                prefer_css_page_size=True
                # margin={"top": "0mm", "right": "0mm", "bottom": "0mm", "left": "0mm"}
            )
            print(f"✔ Exported {pdf_path}")

        browser.close()

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python pdf.py <html_dir>")
        sys.exit(1)
    html_dir = os.path.abspath(sys.argv[1])
    export_pdfs(html_dir)
