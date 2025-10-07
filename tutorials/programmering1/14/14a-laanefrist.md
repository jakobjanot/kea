# Lånefrist

Her fortsætter vi på IntelliJ-projektet `library-management-system` og det forudsættes nu, at du har en 
- `Main`-klasse, 
- `Member`-klasse, der ligner
   ```java
   public class Member {
      final String name;
      final int id;
   
      public Member(String name, int id) {
         this.name = name;
         this.id = id;
      }
   
      @Override
      public String toString() {
         return name + " (Lånernummer: " + id + ")";
      }
   }
   ```
- `Book`-klasse, der ligner
  ```java
  public class Book {
     final String author;
     final String title;
     final String isbn;
     Member borrowedBy;
  
     public Book(String author, String title, String isbn) {
        this.author = author;
        this.title = title;
        this.isbn = isbn;
        this.borrowedBy = null;
     }
  
     public boolean isAvailable() {
        return borrowedBy == null;
     }
  
     public boolean loanBook(Member member) {
         if (isAvailable()) {
            borrowedBy = member;
            return true;
         }
  
         return false;
     }
  
     public void returnBook() {
         borrowedBy = null;
     }

     @Override
     public String toString() {
        String status = isAvailable() ? "På hylden" : 
            "Udlånt til " + borrowedBy;
        return author + ": " + title + 
               " (" + isbn + ") - " + status;
     }
   }
   ```
Biblioteket kan holde styr på hvem der har lånt hvilke bøger, men ved ikke hvornår bøgerne skal afleveres, da de ikke registrerer udlånsdatoen. Næste skridt må være at tilføje et udlåns-dato felt til `Book`-klassen.
1. Tilføj et felt `LocalDate borrowedDate` til `Book`-klassen.
2. Ret konstruktøren, så `borrowedDate` sættes til `null`, når en bog oprettes.
3. Ret `loanBook`-metoden, så `borrowedDate` sættes til dags dato, når en bog lånes ud. Du kan få dags dato med `LocalDate.now()`.
4. Ret `returnBook`-metoden, så `borrowedDate` sættes til `null`, når en bog returneres.
5. Tilføj en metode `public LocalDate getDueDate()`, der returnerer afleveringsdatoen, som er 14 dage efter `borrowedDate`. Hvis bogen ikke er udlånt (dvs. `borrowedDate == null`), skal metoden returnere `null`. Du kan lægge dage til en dato med `borrowedDate.plusDays(14)`.
6. Ret `toString`-metoden, så den også viser fristen for aflevering, hvis bogen er udlånt, fx
   ```java
   System.out.println(book1); 
      // Allan B. Downey: Think Java 
      // (9781492072508) - Udlånt 
      // til Thorkild Hansen 
      // (Lånernummer: 356), 
      // afleveringsfrist 2024-06-01
   ```
   Hint: Du kan bruge `getDueDate()` direkte i strengen, da `LocalDate` har en `toString`-metode, der skriver datoen i formatet `YYYY-MM-DD`.
7. Test at det virker i `Main`-klassen, fx
   ```java
   System.out.println(book1); 
      // Allan B. Downey: Think Java 
      // (9781492072508) - På hylden
   boolean loaned = book1.loanBook(member1);
   System.out.println(book1); 
      // Allan B. Downey: Think Java 
      // (9781492072508) - Udlånt 
      // til Thorkild Hansen 
      // (Lånernummer: 356), 
      // afleveringsfrist 2024-06-01
   book1.returnBook();
   System.out.println(book1); 
      // Allan B. Downey: Think Java 
      // (9781492072508) - På hylden
   ```