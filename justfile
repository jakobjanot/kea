default:
    @echo "Available recipes: serve-slides, serve-tutorials"

serve dir:
    uvx mkslides serve {{dir}} --config-file {{dir}}/mkslides.yml

clean:
    rm -rf site

build dir:
    rm -rf site
    uvx mkslides build {{dir}} --config-file {{dir}}/mkslides.yml

pdf dir:
    mkdir -p pdf/{{dir}}
    just build {{dir}} && rm -f "site/index.html" ; for file in site/*.html; do \
       [ ! -f "pdf/{{dir}}/${file%.html}.pdf" ] && decktape reveal "$file" "pdf/{{dir}}/${file%.html}.pdf" & \
    done