<!-- Slide number: 1 -->
# Programmeringsøvelser 6
som til eksamen ...

<!-- Slide number: 2 -->
# Øvelse 17
Lav en klasse Candidate med attributterne: name, party og numberOfvotes.
Lav en anden klasse Election til at indeholde en liste af kandidater. Tilføj en metode getTotalVotes der returnerer det totale antal stemmer for alle kandidater.
Tilføj en metode getCandidatesFromParty der returner en liste af alle kandidater fra et bestemt parti

### Notes:

<!-- Slide number: 3 -->
# Øvelse 18
Lav en abstrakt klasse Media med attributterne name og duration
Lav yderligere to klasser Audio og Video der arver fra Media. Audio har en loudness attribut med en værdi som fx -10.4dB. Video har en aspectRatio attribut med en værdi som fx “16:9” eller “3:4”.
Implementer funktionalitet der tager en liste af media-objekter (blandede Audio og Video) og skriver information om dem ud til en fil “mediainfo.txt”. Tilføj loudness og aspectRatio information til outputtet når muligt.

### Notes:

<!-- Slide number: 4 -->
# Øvelse 19
Lav en klasse Dream med attributterne date, duration (i minutter) og type (problemløsende, neutral eller mareridt).
Tilføj en metode isPleasant der fortæller om drømmen er behagelig (et mareridt er aldrig, en problemløsende drøm kun hvis den er kortere end 10 minutter, en neutral kun hvis den er længere end 10 minutter!)
Implementer funktionalitet til at sortere en liste af Dream objekter efter dato

### Notes:

<!-- Slide number: 5 -->
# Øvelse 20
Lav et interface DataObject med metoderne getId (der giver et tal) og getData (der giver en liste af strenge).
Lav to klasser User og Student, der begge implementerer interfacet, så begge med attributterne id og name, samt User med username, og Student med email.getData skal returnere et array af alle klassens attributter.
Lav en liste af blandede User og Student objekter, og implementer funktionalitet der udskriver al data fra alle objekter i listen.

### Notes: