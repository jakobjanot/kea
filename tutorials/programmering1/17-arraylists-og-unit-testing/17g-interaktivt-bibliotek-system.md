# Interaktivt bibliotekssystem

Nu hvor vi har et bibliotekssystem, der kan håndtere lån og aflevering af bøger, så lad os gøre det interaktivt, så brugeren kan vælge at låne eller aflevere bøger via konsollen.

1. Fortsæt med projektet `library-management-system` fra forrige tutorial og/eller bring dig ajour med det.
2. I `Main`-klassen, tilføj en `Scanner` til at læse input fra brugeren:
   ```java
   import java.util.Scanner;
   // ...
   public class Main {
       public static void main(String[] args) {
           Scanner scanner = new Scanner(System.in);
           Resource[] resources = {
               new Book("978-87-02-11260-5", "Harry Potter og de vises sten", "J.K. Rowling"),
               new Movie("1234567890123", "Toy Story", "Pixar", "John Lasseter"),
               new VideoGame("9876543210987", "The Legend of Zelda: Breath of the Wild", "Nintendo", Platform.PLAYSTATION_5)
           };
           Member[] members = {
               new Member("1234", "Thorkild Hansen"),
               new Member("4321", "Alice Jensen")
           };
           Library library = new Library(resources, members);
           // ...
       }
   }
   ```
3. Først skal vores nye brugerflade kun kunne låne materialer. Tilføj kode i `main`-metoden til at spørge brugeren om et resourceId (fx ISBN-nummeret på en bog), et memberId og en lånedato, og kald derefter `library.borrow(...)` med de indtastede værdier. Print om lånet lykkedes eller ej.
   ```java
   System.out.println("Indtast resourceId (fx ISBN-nummer):");
   String resourceId = scanner.nextLine();
   System.out.println("Indtast memberId:");
   String memberId = scanner.nextLine();
   System.out.println("Indtast lånedato (YYYY-MM-DD):");
   String dateStr = scanner.nextLine();
   LocalDate borrowedDate = LocalDate.parse(dateStr);
   boolean success = library.borrow(resourceId, memberId, borrowedDate);
   if (success) {
       System.out.println("Lånet blev registreret.");
   } else {
       System.out.println("Lånet kunne ikke registreres.");
   }
   ```
5. Test at det virker ved at køre `Main`-klassen og indtaste forskellige værdier.
6. Prøv nu at flytte koden til at låne ind i en metode `private static void handleBorrow(Library library, Scanner scanner)`, og kald denne metode fra `main`, dvs.
    ```java
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Resource[] resources = { // ... samme som før ... };
        Member[] members = { // ... samme som før ... };
        Library library = new Library(resources, members);
        handleBorrow(library, scanner);
    }
    
    private static void handleBorrow(Library library, Scanner scanner) {
         // Koden til at låne materialer ...
    }
    ```
7. Tilføj nu funktionalitet til at aflevere materialer, som bruger `Library`-klassens `returnLoan`-metode. Lav en metode `private static void handleReturn(Library library, Scanner scanner)`, der spørger brugeren om et resourceId og en afleveringsdato (`memberId` er ikke nødvendig), og kalder `library.returnLoan(...)` med de indtastede værdier. Print om afleveringen lykkedes eller ej.
8. Tilføj en løkke til `main`-metoden, der viser en menu med muligheder for brugeren:
   ```java
   while (true) {
       System.out.println("Vælg en mulighed:");
       System.out.println("1. Lån");
       System.out.println("2. Aflever");
       System.out.println("3. Vis alle lån");
       System.out.println("4. Afslut");
       int choice = scanner.nextInt();
       scanner.nextLine(); // Forbrug den resterende newline
       switch (choice) {
           case 1:
               handleBorrow(library, scanner);
               break;
           case 2:
               handleReturn(library, scanner);
               break;
           case 3:
               // Vis alle lån
               break;
           case 4:
               System.out.println("Afslutter...");
               scanner.close();
               System.exit(0);
               break;
           default:
               System.out.println("Ugyldigt valg. Prøv igen.");
       }
   }
   ```
   9. Færdiggør menuen ved at tilføje en mulighed for at vise alle lån ved at kalde `library.printLoans()` eller `library.printActiveLoans()`.
   10. Test at det virker ved at køre `Main`-klassen og bruge menuen til at låne, aflevere og vise lån.