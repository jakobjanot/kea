*# Interfaces:

## Printable

1. Lav et interface `Printable` med en metode `printInfo()`.
2. Lav en klasse `Article` med attributterne `title` og `author`, og lad den implementere `Printable`.
    
    Metoden skal udskrive titel og forfatter.
    
3. Lav en liste med `Printable` objekter (fx `Article`, evt. flere slags), og kald `printInfo()` på dem alle.

---

## Payable

1. Lav et interface `Payable` med en metode `calculatePayment()`.
2. Lav en klasse `Freelancer` med `name`, `hourlyRate` og `hoursWorked`, der implementerer `Payable`.
3. Lav endnu en klasse `Invoice` med `amount`, der også implementerer `Payable`.
4. Lav en liste med `Payable` objekter og udskriv deres betalinger ved hjælp af `calculatePayment()`.

---

## Filterable

1. Lav et interface `Filterable` med en metode `matches` der modtager noget tekst.
2. Lav en klasse `Product` med `name` og `description` og implementér `Filterable`.
    - `matches()` skal returnere `true`, hvis `keyword` findes i navnet eller beskrivelsen.
3. Lav en metode der, givet en liste af `Filterable`, returnerer dem der matcher et søgeord.

---

## Measurable

1. Lav et interface `Measurable` med en metode `getMeasure()`.
2. Lav en klasse `Box` med attributterne `width`, `height`, `depth`, som implementerer `Measurable`.
    - `getMeasure()` returnerer volumen (w * h * d).
3. Lav en metode der returnerer den største `Measurable` i en liste.

---

## Drawable

1. Lav et interface `Drawable` med en metode `draw()`, der returnerer tekst.
2. Lav en klasse `Square` med `sideLength`, og en `draw()` metode der returnerer fx `"Drawing square with side 5"`.
3. Lav endnu en klasse `Circle` med `radius`, der også implementerer `Drawable`.
4. Lav en liste med `Drawable` objekter, og udskriv hvad de tegner.

---

# Sortering

### NameSorter

1. Lav en klasse `Person` med attributten `name`.
2. Tilføj en metode der returnerer antallet af bogstaver i navnet.
3. Implementér funktionalitet til at sortere en samling af personer efter længden på deres navn.

---

## DocumentManager

1. Lav en klasse `Document` med attributterne `title` og `lastEdited` (som tekst eller dato).
2. Tilføj en metode der returnerer `true`, hvis titlen indeholder et givent nøgleord.
3. Implementér funktionalitet der sorterer dokumenterne efter seneste redigering (fra nyeste til ældste).

---

## TaskPrioritizer

1. Lav en klasse `Task` med attributterne `description` og `priorityLevel` (lavt tal = høj prioritet).
2. Tilføj en metode `isUrgent()` der returnerer `true`, hvis `priorityLevel` er under 3.
3. Implementér funktionalitet der sorterer opgaver efter prioritet (fra højeste til laveste).

---

## FilmSorter

1. Lav en klasse `Film` med attributterne `title` og `rating` (f.eks. et tal fra 1-10).
2. Tilføj en metode der returnerer `true`, hvis rating er over 8.
3. Implementér funktionalitet der sorterer filmene alfabetisk efter titel.

---

## Scoreboard

1. Lav en klasse `PlayerScore` med `playerName` og `score`.
2. Tilføj en metode der returnerer `true`, hvis spilleren har opnået en score over 1000.
3. Implementér funktionalitet til at sortere spillerne i faldende rækkefølge efter score.

---

## CitySorter

1. Lav en klasse `City` med `name` og `population`.
2. Tilføj en metode der tjekker om byen er stor (fx over 100.000 indbyggere).
3. Implementér funktionalitet der sorterer byerne i stigende rækkefølge efter navn.
4. Implementér funktionalitet der sorterer byerne efter antallet af indbyggere (den by med flest indbyggere først)

---

# ArrayLists manipulation

## TaskManager

1. Lav en klasse `Task` med attributterne `description` og `isDone`.
2. Tilføj en metode `markDone()`.
3. Implementér funktionalitet der:
    - Finder en opgave med en given beskrivelse og markerer den som færdig.
    - Sletter alle opgaver der allerede er færdige fra listen.

---

## StudentRegister

1. Lav en klasse `Student` med `name` og `studentId`.
2. Tilføj en metode der returnerer `true`, hvis studentId starter med “KEA”.
3. Implementér funktionalitet der:
    - Finder og udskriver en studerende ud fra ID.
    - Ændrer navnet på en studerende med et bestemt ID.
    - Sletter alle studerende hvis navn starter med “Test”.

---

## ProductInventory

1. Lav en klasse `Product` med `name`, `quantity` og `price`.
2. Tilføj en metode `isOutOfStock()` som returnerer `true`, hvis quantity er 0.
3. Implementér funktionalitet der:
    - Finder et produkt ud fra navn og opdaterer prisen.
    - Fjerner alle udsolgte produkter fra listen.

---

## ContactList

1. Lav en klasse `Contact` med `name` og `phoneNumber`.
2. Tilføj en metode der returnerer `true`, hvis telefonnummeret starter med “+45”.
3. Implementér funktionalitet der:
    - Søger efter et navn og returnerer kontaktens nummer.
    - Ændrer nummeret for en given kontakt.
    - Sletter kontakter med ugyldige numre (ikke starter med +).

---

## LibrarySystem

1. Lav en klasse `Book` med `title`, `author` og `isAvailable`.
2. Tilføj en metode `borrow`.
3. Implementér funktionalitet der:
    - Finder en bog med bestemt titel og “låner” den.
    - Opdaterer forfatterens navn på en bestemt bog.
    - Fjerner alle bøger der ikke er tilgængelige.

---

# Iteration og conditions

## Message

1. Lav en klasse `Message` med `sender` og `content`.
2. Tilføj en metode `containsWord` der tager imod et ord, og returnerer `true`, hvis `content` indeholder ordet.
3. Implementér funktionalitet der returnerer **den første besked** i en liste, der indeholder et bestemt søgeord.

---

## Student

1. Lav en klasse `Student` med `name` og `grade`.
2. Tilføj en metode der returnerer `true`, hvis `grade` er under 4.
3. Implementér funktionalitet der returnerer **alle** studerende med karakterer under 4 i en ny liste.
4. Implementér en metode `studentsBelowAverage()` der returnerer en ny liste, med studerende hvis `grade` er under gennemsnittet.

---

## Flight

1. Lav en klasse `Flight` med `destination`, `duration` og `departureTime`.
2. Tilføj en metode `isShortFlight()` der returnerer `true`, hvis varigheden er under 90 minutter.
3. Implementér funktionalitet der returnerer **den første flyvning** til en bestemt destination, som er en kort flyvning.

---

## Product

1. Lav en klasse `Product` med `name`, `price` og `inStock`.
2. Tilføj en metode `isAffordable` der modtager en `maxPrice` og returnerer `true`, hvis prisen er under eller lig med `maxPrice`.
3. Implementér funktionalitet der returnerer **den billigste vare** i en liste, der stadig er på lager.

---

## Customer

1. Lav en klasse `Customer` med `name` og `loyaltyPoints`.
2. Tilføj en metode `isVIP()` der returnerer `true`, hvis `loyaltyPoints` er over 1000.
3. Implementér funktionalitet der:
    - Gennemgår en liste af kunder
    - Returnerer **den første VIP-kunde** der findes
    - Returnerer en liste af alle **VIP-kunder**.

---

# Filhåndtering

## LogSystem

1. Lav en klasse `LogEntry` med `message` og `timestamp`.
2. Tilføj en metode der returnerer hele logteksten i formatet: `"Tidspunkt: [timestamp] – [message]"`.
3. Implementér funktionalitet der:
    - Gemmer en liste af `LogEntry` i en tekstfil (én pr. linje).
    - Indlæser linjerne fra filen og gendanner `LogEntry` objekter i en liste.

---

## NameSaver

1. Lav en klasse `Person` med `firstName` og `lastName`.
2. Tilføj en metode `getFullName()` der returnerer fornavn og efternavn som én samlet streng.
3. Implementér funktionalitet der:
    - Skriver navnet på alle personer i en liste til en fil.
    - Læser navnene fra filen og gendanner personerne som objekter.

---

## SurveyResult

1. Lav en klasse `SurveyResult` med `respondentId` og `answer`.
2. Tilføj en metode der returnerer `"Respondent [id]: [answer]"`.
3. Implementér funktionalitet der:
    - Gemmer svarene i en fil.
    - Indlæser alle svar fra filen og returnerer dem i en liste af `SurveyResult`.

---

## HighScoreTracker

1. Lav en klasse `PlayerScore` med `playerName` og `score`.
2. Tilføj en metode der formaterer resultatet som: `"Navn: [playerName], Score: [score]"`.
3. Implementér funktionalitet der:
    - Gemmer og læser en liste af spilleres high scores til og fra en fil.

---

## TaskStorage

1. Lav en klasse `ToDoItem` med `title` og `isCompleted`.
2. Tilføj en metode der returnerer en tekstbaseret repræsentation, fx `"✔ Gør rent"` eller `"✘ Køb mælk"`.
3. Implementér funktionalitet der:
    - Gemmer alle opgaver i en fil.
    - Læser opgaverne fra filen og konverterer dem til `ToDoItem` objekter.

---

# Blandede

## MovieFan

1. Lav en klasse `MovieFan` med attributterne `name` og `favoriteGenre`.
2. Tilføj en metode `likesGenre` der returnerer `true`, hvis det er samme genre som `favoriteGenre` (ignorer store/små bogstaver).
3. Tilføj funktionalitet der kan sortere en liste af `MovieFan` objekter alfabetisk efter navn.

---

## ElectricCar

1. Lav en klasse `Car` med attributterne `make` (mærke) og `topSpeed`.
2. Lav en subklasse `ElectricCar`, der også har attributten `batteryCapacity`.
3. Lav en metode i `Car` der returnerer `"Fast"` hvis `topSpeed` > 180, ellers `"Standard"`. Sørg for at denne metode også virker på `ElectricCar`.

---

## Watering

1. Lav en klasse `Plant` med attributterne `type` og `daysSinceWatered`.
2. Lav en metode `needsWater()` der returnerer `true`, hvis planten ikke er vandet i mere end 3 dage.
3. Lav en metode `water()` der sætter `daysSinceWatered` til 0.
4. Lav funktionalitet der tæller hvor mange planter i en liste, der skal vandes.

---

## MovieTicket

1. Lav en klasse `MovieTicket` med `movieTitle`, `seatNumber` og `isScanned`.
2. Lav en metode `scanTicket()` der sætter `isScanned = true`. Hvis den allerede er scannet, skal den kaste en exception.
3. Lav en metode der returnerer antal billetter i en liste, som **ikke** er scannet endnu.

---

## DiceGame

1. Lav en klasse `DiceGame` med en attribut `targetNumber`, der genereres tilfældigt mellem 1 og 6.
2. Lav en metode `guess`, der modtager et gæt og returnerer om det er rigtigt, for lavt eller for højt.
3. Lav et simpelt loop hvor brugeren kan gætte indtil de rammer det rigtige tal.

---

## MusicTrack

1. Lav en klasse `MusicTrack` med attributterne `title` og `durationInSeconds`.
2. Lav en metode `isLongTrack()` der returnerer `true`, hvis en sang varer mere end 300 sekunder.
3. Lav funktionalitet der beregner den **gennemsnitlige længde** af en liste af `MusicTrack` objekter.*