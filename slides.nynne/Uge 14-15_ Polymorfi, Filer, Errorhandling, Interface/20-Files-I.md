<!-- Slide number: 1 -->
Filer
Skrivning til og læsning fra filer

![](GoogleShape61p14.jpg)

### Notes:

<!-- Slide number: 2 -->
# Afsluttende Skriftlig Opgave
Frist: fredag d. 23. maj
Afsluttende tværfaglig opgave, der minder meget om den vi lige har haft. Også her skal i arbejde i grupper.
Fremlæggelser: mandag d. 26/05 hele dagen.
Denne fremlæggelse bliver for alle undervisere på 1. Semester og kommer til at ske fysisk.
Efter fremlæggelserne er der læseferie

### Notes:

<!-- Slide number: 3 -->
# Mundtlig Eksamen
Dato: 11./12./13. Juni 2025.
Eksamen tager afsæt i emner vi har gennemgået i løbet af dette semester.
Til den mundtlige eksamen trækkes et emne (af 10), og i vil blive bedt om at fortælle om og skrive kode til dette emne.
Vi vil gennemgå emnerne for eksamensspørgsmål i klassen, men ikke spørgsmålene i kan blive stillet.
Det der vægtes til eksamen er forståelse af emnet og evne for at kunne skrive kode. Redskaber såsom googling, chatgpt eller auto-complete må ikke benyttes.

### Notes:

<!-- Slide number: 4 -->
# Eksamensemner programmering 2025
Alle disse emner skal ses som overskrifter da der kan være flere ting der hører ind under emnet:

Hovedemner:
Metoder/metodekald. parameteroverførsel
Loops. for / for each / while / do while
if / else / switch
working with files / Scanner/printStream objekt
Arrays / multidimensional Arrays, traversing
ArrayList / vs Arrays
Klasser/objekter.
Arv. super klasse/subklasse
Interface / polymorphism
Collection sort

### Notes:

<!-- Slide number: 5 -->
# Prøveeksamen
d. 25. april: 08:30-11:45
d. 30. april: 08:30-11:45
Til prøveeksamen forbereder vi den rigtige eksamen, ved at skabe så meget som muligt den samme situation som i kommer til at få til eksamen.
Til den prøveeksamen trækkes et emne (af 10), og i vil blive bedt om at fortælle om og skrive kode til dette emne.
Det er en chance for at få gjort det super konkret hvad i skal terpe i jeres læseferie, for at forberede optimalt til de mundtlige eksamener i Juni.

### Notes:

<!-- Slide number: 6 -->
# Indtil nu har vores programmer ikke haft Persistence (hukommelse)

![](GoogleShape91p19.jpg)

### Notes:

<!-- Slide number: 7 -->

![](GoogleShape96p20.jpg)

### Notes:

<!-- Slide number: 8 -->
# Hvad er filer?
Filer består af data
Filtyper kan kendes på deres navne
extension (.txt .csv .word .pdf)
Nogle filtyper struktureres med et schema
Vi skal arbejde med .csv filer

### Notes:

<!-- Slide number: 9 -->
# Læse fra en fil
Scanner-klassen bruges til at læse en fil
Scanner class skal have en valid path til filen Paths.get("filename.extension")
Filen kan læses med et while loop
while (scanner.hasNextLine()){}
Der kan opstå fejl, og de kan fanges vha try og catch.
Vi går i dybden try catch i en hel klasse senere

### Notes:

<!-- Slide number: 10 -->
Skrive til en fil

![](GoogleShape115p23.jpg)
Opret en File-instans (med filnavnet)
File file = new File("./output.txt");

Opret en PrintStream-instans (med fil-instansen som parameter)
try (PrintWriter pw = new PrintWriter(file)) {}
Sørg for at metoden håndterer IOException (exception til input eller output)
try catch
Kald println() på PrintStream-instansen linje for linje
pw.println("Hejsa!");

### Notes:

<!-- Slide number: 11 -->
# PrintWriter

![](GoogleShape121p24.jpg)

### Notes:

<!-- Slide number: 12 -->
# FileOutputStream og write()

![](GoogleShape127p25.jpg)

### Notes:

<!-- Slide number: 13 -->
# Files-Klassen
https://docs.oracle.com/javase/7/docs/api/java/nio/file/Files.html

### Notes:

<!-- Slide number: 14 -->
# Indbyggede metoder på File class

![](GoogleShape139p27.jpg)
Kilde: https://www.w3schools.com/java/java_files.asp

### Notes:

<!-- Slide number: 15 -->
# Exceptions

![Image](GoogleShape147p28.jpg)

![Image](GoogleShape148p28.jpg)

![Image](GoogleShape146p28.jpg)

### Notes:

<!-- Slide number: 16 -->
# Hvad er Exceptions?
Exceptions er classes og objects i Java

De representerer uventede events der skaber problemer for vores program

ArrayOutOfBoundsExceptions

NullPointerException

Exceptions kan få vores program til at crashe eller ikke compile

Exceptions kan man bredt kategorisere som enten checked eller unchecked

### Notes:

<!-- Slide number: 17 -->
# Exceptions - Hvordan tackler man dem konceptuelt?
Man kan enten throw eller catch'e en exception

Throw: En exception har fundet sted, men bør ikke håndteres med denne metode

Catch: Her skal fejlen håndteres / fixes

I dag skal vi ikke håndtere exceptions

Vi vil have en hel klasse hvor vi går i dybden med exception handling

### Notes:

<!-- Slide number: 18 -->
# try catch

![Image](GoogleShape166p31.jpg)

### Notes:

<!-- Slide number: 19 -->
# try catch

![](GoogleShape172p32.jpg)

### Notes:

<!-- Slide number: 20 -->
# Hvorfor Exceptions?
Det er nødvendigt at tage os af forventelige fejl som ellers kan standse compileren / forhindre programmet i at køre
Definere hvad du vil have der skal ske når filen som DU har bedt programmet om at læse ikke findes
Java tvinger os til at håndtere de her fejl der typisk opstår i et system
Enten kan du fortælle programmet at det skal fortsætte trods fejlen, eller du kan printe en besked og stoppe programmet

### Notes:

<!-- Slide number: 21 -->
# Packages i Java
En package i Java er en gruppe relaterede classes. Tænk på det som en mappe i et filsystem.
Bruges til at undgå navne konflikter og holde styr på kode logik i et projekt
To slags packages: built-in som kommer fra Javas API og bruger-definerede, som du selv laver
java.util er en package, der har klassen Scanner
For at putte en fil i en hjemmelavet package skal du bare bruge et package keyword

### Notes:

<!-- Slide number: 22 -->
# Filplaceringer i IntelliJ
Filer ligger i roden af projektet.
Altså den mappe man har oprettet sit projekt i.

Kaldes også "Content Root"

![](GoogleShape191p35.jpg)

### Notes:

<!-- Slide number: 23 -->
# Filplaceringer i IntelliJ
Du kan bruge denne linje til at debugge hvis du ikke kan finde den rette sti til din fil:

System.out.println("Din nuværende mappe er: " + System.getProperty("user.dir"));

### Notes: