# On the same page

Her fortsætter vi på IntelliJ-projektet `library-management-system` og det forudsættes nu, at du har en `Main`-klasse, hvor du har tre `Book`-objekter og en `Book`-klasse der ligner
```java
public class Book {
   final String author;
   final String title;
   final long isbn;

   public Book(String author, String title, long isbn) {
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

1. Vi vil gerne kunne udlåne bøger. Til det skal vi kunne holde styr på om en bog er tilgængelig eller udlånt.
2. Tilføj et felt `boolean isAvailable` til `Book`-klassen. Spørgsmål: Skal `isAvailable` være `final`? Hvorfor/hvorfor ikke?
3. Sæt `this.isAvailable = true;` i konstruktøren.
4. Ret `toString`-metoden, så den også viser om bogen er tilgængelig, fx
   ```java
   System.out.println(book1); // Allan B. Downey: Think Java (9781492072508) - Udlånt
   System.out.println(book2); // Rachel Cusk: Omrids (9788763851664) - På hylden
   ```
   Hint: Brug en lokal variabel `status` i din `toString`-metode i stil med:
   ```java
   String status = isAvailable ? "På hylden" : "Udlånt";
   ```
   Måske husker du `? :`, er en såkaldt ternary operator, der er en kortere måde at skrive en `if-else` på.
5. Tilføj en metode `public boolean loanBook()` til `Book`-klassen.
   - Hvis bogen er tilgængelig, skal metoden sætte `isAvailable` til `false` og returnere `true`.
   - Hvis bogen ikke er tilgængelig, skal metoden returnere `false`.
6. Tilføj en metode `public void returnBook()` til `Book`-klassen.
   - Metoden skal sætte `isAvailable` til `true`.
7. Test at det virker i `Main`-klassen, fx
   ```java
   System.out.println(book1); // Allan B. Downey: Think Java (9781492072508) - På hylden
   boolean loaned = book1.loanBook();
   System.out.println(book1); // Allan B. Downey: Think Java (9781492072508) - Udlånt
   ```