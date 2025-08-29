set positional-arguments

default:
    @echo "Available recipes: serve, clean, build, pdf"

install:
    uv run playwright install chromium
    npm install -g decktape

slides-serve dir:
    uv --offline run mkslides serve {{dir}} --config-file {{dir}}/mkslides.yml

slides-html dir:
    uv --offline run mkslides build {{dir}} --config-file {{dir}}/mkslides.yml

slides-pdf dir:
    just html {{dir}} && \
    for slide in site/*.html; do \
        [ ! -f "site/$(basename "$slide" .html).pdf" ] && decktape reveal "$slide" "site/$(basename "$slide" .html).pdf" & \
    done