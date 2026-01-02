set positional-arguments

default:
    @echo "Available recipes: slides-serve, slides-html, slides-pdf, tutorials-html, tutorials-pdf"

install:
    uv run playwright install chromium

serve-slides dir:
    uv --offline run mkslides serve {{dir}} --config-file {{dir}}/mkslides.yml

build-slides dir:
    uv --offline run mkslides build {{dir}} --config-file {{dir}}/mkslides.yml --site-dir site/{{dir}}

pdf-slides dir:
    just build-slides {{dir}} && \
    uv run python scripts/render-slides.py site/{{dir}}

build-tutorials dir:
    uv run python scripts/render-tutorials.py html {{dir}}

pdf-tutorials dir:
    uv run python scripts/render-tutorials.py pdf {{dir}}

build-all-slides:
    for course in $(ls -d slides/*/); do \
        just build-slides "${course%/}"; \
    done

pdf-all-slides:
    for course in $(ls -d slides/*/); do \
        just pdf-slides "${course%/}"; \
    done

build-all-tutorials:
    for course in $(ls -d tutorials/*/); do \
        just build-tutorials "${course%/}"; \
    done

pdf-all-tutorials:
    for course in $(ls -d tutorials/*/); do \
        just pdf-tutorials "${course%/}"; \
    done

build-index:
    uv run python scripts/generate-index.py