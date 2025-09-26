# Lånefrist igen

Her fortsætter vi på IntelliJ-projektet `library-management-system` og det forudsættes nu, at du har en `Main`-klasse, en `Member`-klasse, som i den forrige øvelse.
I forrige øvelse udvidede vi `Book`-klassen med endnu et felt, `LocalDate borrowedDate` og en metode `getDueDate()`, der beregner afleveringsdatoen som 14 dage efter udlånsdatoen. Pyha, `Book`-klassen er ved at blive ret stor og kompleks. Måske har `Book`-klassen for mange ansvarsområder? Den skal både holde styr på bogens data (forfatter, titel, isbn), hvem der har lånt den og hvornår den skal afleveres. Måske skulle vi have en separat klasse til at holde styr på udlån?
1. Prøv at ændre `Book`-klassen tilbage til det oprindelige, hvor den ikke havde ansvar for udlån. `Book`-klassen skal igen se sådan ud:
   ```java
   public class Book {
       private final String author;
       private final String title;
       private final String isbn;
       
       public Book(String author, 
                   String title, 
                   String isbn) {
           this.author = author;
           this.title = title;
           this.isbn = isbn;
       }
       
       @Override
       public String toString() {
           return author + ": " + title + " (" + isbn + ")";
       }
   }
   ```
2. Opret nu i stedet en ny klasse `Loan` i projektet.
3. En `Loan` skal have et `Member`-objekt, et `Book`-objekt og en `LocalDate borrowedDate`, så vi kan oprette et `Loan`-objekt med fx
   ```java
   Loan loan1 = new Loan(member1, 
                         book1, 
                         LocalDate.of(2024, 6, 1));
   Loan loan2 = new Loan(member2, 
                         book2, 
                         LocalDate.of(2024, 6, 3));
   ```
4. Gør felterne `final`, så et lån ikke kan ændres efter oprettelse.
5. Vi har i undervisningen talt om **Komposition**, hvor en klasse har en "har-en" (eng: *has-a*) relation til en anden klasse. Diskuter/overvej hvorvidt nogle af klasserne `Book`, `Member` og `Loan` har en "har-en" relation til hinanden.
6. Tilføj en metode `public LocalDate getDueDate()`, der returnerer afleveringsdatoen, som er 14 dage efter `borrowedDate`. Du kan lægge dage til en dato med `borrowedDate.plusDays(14)`.
7. Tilføj også en metode `public boolean isOverdue()`, der returnerer `true`, hvis afleveringsdatoen er overskredet. Hint: Du kan sammenligne `LocalDate` datoer med dens `isAfter`-metode, fx
```java
LocalDate today = LocalDate.now();
LocalDate someOtherDate = LocalDate.of(2024, 6, 15);
today.isAfter(someOtherDate);
```
7. Tilføj en `toString`-metode, så vi kan udskrive et lån på en pæn måde, fx
   ```java
   System.out.println(loan1); 
    // Allan B. Downey: Think Java 
    // (9781492072508) - Udlånt 
    // til Thorkild Hansen 
    // (Lånernummer: 356), 
    // afleveringsfrist 2024-06-15
   ```