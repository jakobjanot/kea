default:
    @echo "Available recipes: serve-slides, serve-tutorials"

serve-slides dir:
    uvx mkslides serve {{dir}}/slides --config-file config/ek-slides.yml

serve-tutorials dir:
    uvx mkslides serve {{dir}}/tutorials --config-file config/ek-tutorials.yml

clean:
    rm -rf site

build-slides dir:
    rm -rf site
    uvx mkslides build {{dir}}/slides --config-file config/ek-slides.yml

build-tutorials dir:
    rm -rf site
    uvx mkslides build {{dir}}/tutorials --config-file config/ek-tutorials.yml

pdf-slides dir:
    mkdir -p pdf/{{dir}}/slides
    just build-slides {{dir}} && rm -f "site/index.html" ; for file in site/*.html; do \
       [ ! -f "pdf/{{dir}}/slides/${file%.html}.pdf" ] && decktape reveal "$file" "pdf/{{dir}}/slides/${file%.html}.pdf" & \
    done

pdf-tutorials dir:
    mkdir -p pdf/{{dir}}/tutorials
    just build-tutorials {{dir}} && rm -f "site/index.html" ; for file in site/*.html; do \
       [ ! -f "pdf/{{dir}}/tutorials/${file%.html}.pdf" ] && decktape reveal "$file" "pdf/{{dir}}/tutorials/${file%.html}.pdf" & \
    done