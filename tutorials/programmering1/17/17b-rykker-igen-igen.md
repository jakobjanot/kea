# Rykker igen igen

Her fortsætter vi på IntelliJ-projektet `library-management-system` og det forudsættes nu, at du har en `Main`-klasse, en `Member`-klasse og en `Book`-klasse, som i den forrige øvelse og en `Loan`-klasse, som kunne se sådan ud:
```java
public class Loan {
    private final Member member;
    private final Book book;
    private final LocalDate borrowedDate;
    private final static int LOAN_DAYS = 14;

    public Loan(Member member, 
                Book book, 
                LocalDate borrowedDate) {
        this.member = member;
        this.book = book;
        this.borrowedDate = borrowedDate;
    }

    public LocalDate getDueDate() {
        return borrowedDate.plusDays(LOAN_DAYS);
    }

    public boolean isOverdue() {
        LocalDate today = LocalDate.now();
        return today.isAfter(getDueDate());
    }

    @Override
    public String toString() {
        return book + " - Udlånt til " + member + 
               ", afleveringsfrist " + getDueDate();
    }
}
```
Vi har efterhånden brug for en klasse til at holde styr på alle bøgerne, medlemmerne og lånene. Lad os kalde den `Library`.
1. Opret en ny klasse `Library` i projektet.
2. Et `Library` skal have 
   - en liste af `Book`-objekter, 
   - en liste af `Member`-objekter og 
   - en liste af `Loan`-objekter. 
   Vi har et *mini-bibliotek*, og vi kender ikke til ArrayList endnu, så vi kan bruge et array med en fast størrelse på fx 100 bøger, 100 medlemmer og 100 lån. Tilføj felterne til `Library`-klassen, fx
   ```java
   public class Library {
       private Book[] books;
       private Member[] members;
       private Loan[] loans;
       // ...
   }
   ```
3. Tilføj en konstruktør, der initialiserer felterne med nye tomme arrays af størrelse 100, fx
   ```java
   public Library() {
       books = new Book[100];
       members = new Member[100];
       loans = new Loan[100];
   }
   ```
4. Tilføj en metode `public boolean addBook(Book book)`, der tilføjer en bog til biblioteket. Metoden skal finde den første ledige plads i `books`-arrayet (dvs. en plads med `null`), sætte den givne bog ind på den plads og returnere `true`. Hvis der ikke er plads i arrayet, skal metoden returnere `false`.
5. Tilføj tilsvarende metoder `public boolean addMember(Member member)` og `public boolean addLoan(Loan loan)`, der tilføjer et medlem og et lån til biblioteket.
6. Tilføj en metode `public Loan loanBook(Book book, Member member)`, der laver et nyt lån af en given bog til et givet medlem. Metoden skal:
   - Tjekke om bogen er tilgængelig (dvs. ikke allerede er udlånt). Du kan tjekke om en bog er udlånt ved at kigge i `loans`-arrayet og se om der findes et `Loan`-objekt med den givne bog.
   - Hvis bogen er tilgængelig, skal der oprettes et nyt `Loan`-objekt med dags dato som `borrowedDate`, lånet skal tilføjes til `loans`-arrayet (brug `addLoan`-metoden) og metoden skal returnere det nye `Loan`-objekt.
   - Hvis bogen ikke er tilgængelig, skal metoden returnere `null`.
7. Tilføj en metode `public void printOverdueLoans()`, der udskriver alle lån, der er overskredet (dvs. hvor `isOverdue()` returnerer `true`).
8. Test at det virker i `Main`-klassen, fx
   ```java
   public static void main(String[] args) {
       Library library = new Library();
         Member member1 = new Member("Thorkild Hansen", 356);
         Member member2 = new Member("Lise Andersen", 287);
         library.addMember(member1);
         library.addMember(member2);

         Book book1 = new Book("Allan B. Downey", "Think Java", "9781492072508");
         Book book2 = new Book("Rachel Cusk", "Omrids", "9788702208433");
         library.addBook(book1);
         library.addBook(book2);
         Loan loan1 = library.loanBook(book1, member1);
         System.out.println(loan1);
         Loan loan2 = library.loanBook(book1, member2);
         System.out.println(loan2);
         // Simuler et gammelt lån ved at oprette det manuelt
         Loan oldLoan = new Loan(member2, book2, LocalDate.of(2024, 5, 1));
         library.addLoan(oldLoan);
         System.out.println("Overskredne lån:");
         library.printOverdueLoans();
   }
   ```

   9. Udvid `Library`-klassen til at kunne slette lån, dvs. tilføj en metode `public boolean returnBook(Book book)`, der fjerner lånet for den givne bog fra `loans`-arrayet (dvs. sætter den plads i arrayet til `null`). Metoden skal returnere `true`, hvis lånet blev fundet og fjernet, ellers `false`. Test at det virker i `Main`-klassen, fx
   ```java
   System.out.println("Returnerer book1: " + library.returnBook(book1));
   ```

   10. Implementeringen kunne se sådan ud:
   ```java
   public boolean returnBook(Book book) {
       for (Loan loan : loans) {
           if (loan != null && loan.getBook().equals(book)) {
               int index = Arrays.binarySearch(loans, loan);
               if (index >= 0) {
                   loans[index] = null;
                   return true;
               }
           }
       }
       return false;
   }
   ```

   11. findLoan(Book book) - returnerer Loan objektet for den givne bog eller null hvis bogen ikke er udlånt
   10. Hvorfor har vi ikke brug for at fortælle returnBook hvilken `Member`, der returnerer bogen?
   