# Bibliotek

Vi har tidligere arbejdet på at lave et bibliotekssystem i IntelliJ-projektet `library-management-system` og det forudsættes nu, at du har en `Main`-klasse, en en `Member`-klasse og en `Book`-klasse, som i den forrige øvelse.
Tidligere skulle vi selv holde styr på listerne med bøger, medlemmer og lån, men nu går vi skridtet videre og laver en klasse til at holde styr på alle bøgerne, medlemmerne og lånene. Lad os kalde den `Library`. Vi laver et simpelt bibliotekssystem, hvor medlemmer kan låne bøger og aflevere bøger. Når lånet oprettes lægges det i en liste i `Library`-klassen med en låne-dato, og når bogen afleveres, registreres afleveringsdatoen i lånet, altså forbliver lånet i lånelisten, dog som afsluttet. Det er meget almindeligt, at biblioteker ønsker at kende historikken over lån, så vi bevarer alle lån.

1. Opret en ny klasse `Library` i projektet.
2. Et `Library` skal holde styr på:
   - en liste af `Book`-objekter, 
   - en liste af `Member`-objekter og 
   - en liste af `Loan`-objekter
   - en tæller, der holder styr på hvor mange lån, der er oprettet i biblioteket (bruges til at holde styr på, hvor i `loans`-arrayet, det næste lån skal gemmes).
   Vi lader 
    ```java
    public class Library {
        private Book[] books;
        private Member[] members;
        private Loan[] loans;
        private int loanCount;

        // ...
    }
    ```
3. Tilføj en konstruktør, der som parametre tager en liste af `Book`-objekter og en liste af `Member`-objekter. Vi gør i øvrigt plads til et antal lån svarende til antallet af bøger.
    ```java
    public Library(Book[] books, Member[] members) {
        this.books = books;
        this.members = members;
        this.loans = new Loan[100]; // plads til 100 lån
        this.loanCount = 0;
    }
    ```
4. Put data i `Library`-objektet i `Main`-klassen, fx
   ```java
   Book[] books = {book1, book2, book3};
   Member[] members = {member1, member2, member3};
   Library library = new Library(books, members);
   ```
5. Tilføj getters til `loans`, `books` og `members` i `Library`-klassen.
6. Biblioteket ønsker at være i stand til at printe en liste over alle medlemmer. Tilføj en metode `public void printMembers()`, der printer alle medlemmerne i biblioteket.
5. Test at det virker i `Main`-klassen, fx
   ```java
   Library library = new Library(books, members);
   library.printMembers();
   ```
6. Biblioteket ønsker at være i stand til at printe en liste over alle bøger. Tilføj en metode `public void printBooks()`, der printer alle bøgerne i biblioteket.