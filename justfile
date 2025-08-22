default:
    @echo "Available recipes: serve-slides, serve-tutorials"

serve dir:
    uvx mkslides serve {{dir}} --config-file {{dir}}/mkslides.yml

build dir:
    uvx mkslides build {{dir}} --config-file {{dir}}/mkslides.yml