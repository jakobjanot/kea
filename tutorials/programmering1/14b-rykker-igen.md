# Rykker igen

Her fortsætter vi på IntelliJ-projektet `library-management-system` og det forudsættes nu, at du har en `Main`-klasse, en `Member`-klasse og en `Book`-klasse, som i den forrige øvelse.
I forrige øvelse udvidede vi `Book`-klassen med endnu et felt, `LocalDate borrowedDate` og en metode `getDueDate()`, der beregner afleveringsdatoen som 14 dage efter udlånsdatoen. Pyha, `Book`-klassen er ved at blive ret stor og kompleks. Måske har `Book`-klassen for mange ansvarsområder? Den skal både holde styr på bogens data (forfatter, titel, isbn), hvem der har lånt den og hvornår den skal afleveres. Måske skulle vi have en separat klasse til at holde styr på udlån?
1. Opret en ny klasse `Loan` i projektet.
2. En `Loan` skal have et `Member`-objekt, et `Book`-objekt og en `LocalDate borrowedDate`, så vi kan oprette et `Loan`-objekt med fx
   ```java
   Loan loan1 = new Loan(member1, book1, LocalDate.of(2024, 6, 1));
   Loan loan2 = new Loan(member2, book2, LocalDate.of(2024, 6, 3));
   ```
3. Gør felterne `final`, så et lån ikke kan ændres efter oprettelse.
4. Tilføj en metode `public LocalDate getDueDate()`, der returnerer afleveringsdatoen, som er 14 dage efter `borrowedDate`. Du kan lægge dage til en dato med `borrowedDate.plusDays(14)`.
5. Nu er det tid til at rette `Book`-klassen, så den ikke længere har ansvar for udlån. Du kan evt. "rulle" ændringerne vi lavede i den forrige øvelse tilbage.
6. Tilføj en `toString`-metode, så vi kan udskrive et lån på en pæn måde, fx
   ```java
   System.out.println(loan1); // Allan B. Downey: Think Java (9781492072508) - Udlånt til Thorkild Hansen (Lånernummer: 356), afleveringsfrist 2024-06-15
   ```