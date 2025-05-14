<!-- Slide number: 1 -->
# Programmeringsøvelser 5
som til eksamen ...

<!-- Slide number: 2 -->
# Øvelse 13
Lav en klasse JuleGave med disse boolske attributter: isSoft, isRectangular og doesRattle.
Tilføj en konstruktør der sætter de tre attributter til random enten true eller false
Tilføj en metode couldBeLego der returnerer true hvis JuleGaven måske er LEGO (altså den er hård, rektangulær OG rasler)

### Notes:
(2) boolsk værdi isUsed sættes til true
(3) metode kan f.eks. udskrive "is already used" på skærmen, returnere en String med denne tekst, eller  kaste en exception (eksempelvis egen exception  "IsAlreadyUsedException")

<!-- Slide number: 3 -->
# Øvelse 14
Lav en klasse Image med attributterne: fileName, width og height.
Tilføj en metode isKnownFileType der returnerer true hvis filnavnet slutter på enten .gif, .jpg, .jpeg, .png, .webp eller .bmp
Tilføj to metoder: isPortrait og isLandscape, hvor den første returnerer true hvis billedet er højere end det er bredt, og den anden returnerer true hvis det omvendte er tilfældet.

### Notes:
(2) boolsk værdi isUsed sættes til true
(3) metode kan f.eks. udskrive "is already used" på skærmen, returnere en String med denne tekst, eller  kaste en exception (eksempelvis egen exception  "IsAlreadyUsedException")

<!-- Slide number: 4 -->
# Øvelse 15
Lav to klasser: Square med attributten width, og Circle med attributten radius.
Lav et interface Shape med metoden: getArea.
Lad både Square og Circle implementere Shape, og beregn arealet (square = w*w, circle = Math.PI*r*r)
Lav en liste af blandede cirkler og kvadrater, og lav en løkke der beregner og udskriver arealet af hver enkelt af dem.

### Notes:
(2) boolsk værdi isUsed sættes til true
(3) metode kan f.eks. udskrive "is already used" på skærmen, returnere en String med denne tekst, eller  kaste en exception (eksempelvis egen exception  "IsAlreadyUsedException")

<!-- Slide number: 5 -->
# Øvelse 16
Lav en klasse: ExamQuestion med attributterne number og grade
Tilføj en metode der sætter grade random til enten A, B, C, D, E eller F.
Implementer funktionalitet til at oprette en liste af 14 nummererede (fra 1 til 14) examquestions – hver med en tilfældig karakter.Udskriv listen til skærmen og til en fil “questions.txt”

### Notes: