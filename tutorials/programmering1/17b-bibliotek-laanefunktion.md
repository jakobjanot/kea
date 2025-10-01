# Bibliotek - lånefunktion

I denne opgave skal du udvide `Library`-klassen med funktionalitet til at håndtere lån af bøger. Vi fortsætter i IntelliJ projektet `library-management-system`, som du har arbejdet på i tidligere opgaver.

1. Vi har brug for metoder, hvormed man kan låne en bog. Tilføj en metode `public void addLoan(Book book, Member member, LocalDate borrowedDate)`, der laver et nyt lån af en given bog til et givet medlem. Metoden skal:
   Det kan fx se sådan ud:
   ```java
   public void addLoan(Book book, Member member, LocalDate borrowedDate) {
      loans[loanCount] = new Loan(book, member, borrowedDate);
      loanCount++;
   }
   ```

2. Test at det virker i `Main`-klassen, fx
   ```java
   Library library = new Library(books, members);
   library.addLoan(book1, member1, LocalDate.of(2024, 6, 1));
   library.addLoan(book1, member2, LocalDate.of(2024, 6, 3));
   library.addLoan(book2, member2, LocalDate.of(2024, 6, 3));
   ```
3. Biblioteket ønsker at være i stand til at printe en liste over alle lån. Tilføj en metode `public void printLoans()`, der printer alle lånene i biblioteket. Du kan overveje at bruge `loanCount` til at vide, hvor mange lån der er, så du ikke printer tomme pladser i `loans`-arrayet.
4. Test at det virker i `Main`-klassen, fx
   ```java
   Library library = new Library(books, members);
   library.addLoan(book1, member1, LocalDate.of(2024, 6, 1));
   library.addLoan(book1, member2, LocalDate.of(2024, 6, 3));
   library.addLoan(book2, member2, LocalDate.of(2024, 6, 3));
   library.printLoans();
   ```
5. Biblioteket ønsker at være i stand til at printe en liste over alle forsinkede lån. Tilføj en metode `public void printOverdueLoans()`, der printer alle forsinkede lån i biblioteket.
6. Test at det virker i `Main`-klassen, fx (du kan ændre datoerne, så nogle af lånene er forsinkede):
   ```java
   Library library = new Library(books, members);
   library.addLoan(book1, member1, LocalDate.of(2024, 5, 1));
   library.addLoan(book1, member2, LocalDate.of(2024, 6, 3));
   library.addLoan(book2, member2, LocalDate.of(2024, 6, 3));
   library.printOverdueLoans();
   ```
