set positional-arguments

default:
    @echo "Available recipes: slides-serve, slides-html, slides-pdf, tutorials-html, tutorials-pdf"

install:
    uv run playwright install chromium
    npm install -g decktape

slides-serve dir:
    uv --offline run mkslides serve {{dir}} --config-file {{dir}}/mkslides.yml

slides-html dir:
    uv --offline run mkslides build {{dir}} --config-file {{dir}}/mkslides.yml

slides-pdf dir:
    just slides-html {{dir}} && \
    for slide in $(find ./site -name "*.html" -maxdepth 1 | sort -rn); do \
        [ ! -f "site/$(basename "$slide" .html).pdf" ] && decktape reveal "$slide" "site/$(basename "$slide" .html).pdf"; \
    done

tutorials-html dir:
    uv run python render.py html {{dir}}

tutorials-pdf dir:
    uv run python render.py pdf {{dir}}