set positional-arguments

default:
    @echo "Available recipes: slides-serve, slides-html, slides-pdf, tutorials-html, tutorials-pdf"

install:
    uv run playwright install chromium

slides-serve dir:
    uv --offline run mkslides serve {{dir}} --config-file {{dir}}/mkslides.yml

slides-html dir:
    uv --offline run mkslides build {{dir}} --config-file {{dir}}/mkslides.yml --site-dir site/{{dir}}

slides-pdf dir:
    just slides-html {{dir}} && \
    uv run python scripts/render-slides.py site/{{dir}}

tutorials-html dir:
    uv run python scripts/render-tutorials.py html {{dir}}

tutorials-pdf dir:
    uv run python scripts/render-tutorials.py pdf {{dir}}