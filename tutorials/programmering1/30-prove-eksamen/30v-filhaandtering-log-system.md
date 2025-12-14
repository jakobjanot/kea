# Filhåndtering

## LogSystem

1. Lav en klasse `LogEntry` med `message` og `timestamp`.
2. Tilføj en metode der returnerer hele logteksten i formatet: `"Tidspunkt: [timestamp] – [message]"`.
3. Implementér funktionalitet der:
    - Gemmer en liste af `LogEntry` i en tekstfil (én pr. linje).
    - Indlæser linjerne fra filen og gendanner `LogEntry` objekter i en liste.
