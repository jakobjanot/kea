# Bibliotek

Her fortsætter vi på IntelliJ-projektet `library-management-system` og det forudsættes nu, at du har en `Main`-klasse, en en `Member`-klasse og en `Book`-klasse, som i den forrige øvelse.
Vi har brug for en klasse til at holde styr på alle bøgerne, medlemmerne og lånene. Lad os kalde den `Library`.
1. Opret en ny klasse `Library` i projektet.
2. Et `Library` skal have 
   - en liste af `Book`-objekter, 
   - en liste af `Member`-objekter og 
   - en liste af `Loan`-objekter
    Vi har et *mini-bibliotek*, og vi kender ikke til ArrayList endnu, så vi kan bruge et array med en fast størrelse på fx 10 bøger, 10 medlemmer og 10 lån. Tilføj felterne til `Library`-klassen, fx
    ```java
    public class Library {
        private Book[] books;
        private Member[] members;
        private Loan[] loans;
        // ...
    }
    ```
3. Tilføj en konstruktør, der som parametre tager en liste af `Book`-objekter og en liste af `Member`-objekter. Vi gør i øvrigt plads til et antal lån svarende til antallet af bøger.
    ```java
    public Library(Book[] books, Member[] members) {
        this.books = books;
        this.members = members;
        this.loans = new Loan[books.length];
    }
    ```
4. Biblioteket ønsker at være i stand til at printe en liste over alle medlemmer. Tilføj en metode `public void printMembers()`, der printer alle medlemmerne i biblioteket.
5. Test at det virker i `Main`-klassen, fx
   ```java
   Library library = new Library(books, members);
   library.printMembers();
   ```
6. Biblioteket ønsker at være i stand til at printe en liste over alle bøger. Tilføj en metode `public void printBooks()`, der printer alle bøgerne i biblioteket.
7. Vi har brug for metoder, hvormed man kan låne en bog. Tilføj en metode `public boolean loanBook(Book book, Member member, LocalDate borrowedDate)`, der laver et nyt lån af en given bog til et givet medlem. Metoden skal:
   - Tjekke om bogen er tilgængelig (dvs. `book.isAvailable()`)
   - Hvis bogen er tilgængelig, skal den oprette et nyt `Loan`-objekt med den givne bog, medlem og udlånsdato, sætte `book.borrowedBy` til det givne medlem og gemme det nye lån i `loans`-arrayet. Metoden skal returnere `true`, hvis lånet lykkedes.
    - Hvis bogen ikke er tilgængelig, skal metoden returnere `false`.
8. Test at det virker i `Main`-klassen, fx
   ```java
   Library library = new Library(books, members);
   boolean loaned1 = library.loanBook(book1, 
                                      member1, 
                                      LocalDate.of(2024, 6, 1));
   System.out.println(loaned1); // true
   boolean loaned2 = library.loanBook(book1, 
                                      member2, 
                                      LocalDate.of(2024, 6, 3));
   System.out.println(loaned2); // false
   boolean loaned3 = library.loanBook(book2,
                                      member2, 
                                      LocalDate.of(2024, 6, 3));
   System.out.println(loaned3); // true
   ```
9. Biblioteket ønsker at være i stand til at printe en liste over alle lån. Tilføj en metode `public void printLoans()`, der printer alle lånene i biblioteket.
10. Test at det virker i `Main`-klassen, fx
   ```java
   Library library = new Library(books, members);
   library.loanBook(book1, member1, LocalDate.of(2024, 6, 1));
   library.printLoans();
   ```
11. Biblioteket ønsker at være i stand til at printe en liste over alle forsinkede lån. Tilføj en metode `public void printOverdueLoans()`, der printer alle forsinkede lån i biblioteket.
12. Test at det virker i `Main`-klassen, fx
   ```java
   Library library = new Library(books, members);
   library.loanBook(book1, member1, LocalDate.of(2024, 5, 1));
   library.printOverdueLoans();
   ```
