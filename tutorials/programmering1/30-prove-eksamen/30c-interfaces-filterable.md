# Interfaces

## Filterable

1. Lav et interface `Filterable` med en metode `matches` der modtager noget tekst.
2. Lav en klasse `Product` med `name` og `description` og implementér `Filterable`.
    - `matches()` skal returnere `true`, hvis `keyword` findes i navnet eller beskrivelsen.
3. Lav en metode der, givet en liste af `Filterable`, returnerer dem der matcher et søgeord.
