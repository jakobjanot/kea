default:
    @echo "Available recipes: serve-slides, serve-tutorials"

serve-slides:
    uvx mkslides serve courses/prog1-slides --config-file courses/prog1-slides/mkslides.yml

serve-tutorials:
    uvx mkslides serve courses/prog1-tutorials --config-file courses/prog1-tutorials/mkslides.yml