set positional-arguments

default:
    @echo "Available recipes: serve, clean, build, pdf"

install:
    uv run playwright install chromium

serve dir:
    uv --offline run mkslides serve {{dir}} --config-file config/slides.yml

clean:
    rm -rf site

build dir:
    uv --offline run mkslides build {{dir}} --config-file config/tutorials.yml
    uv --offline run python pdf.py site