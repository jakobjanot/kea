# Aflevering af materialer

Vi har en `Library`-klasse, der kan håndtere lån af forskellige materialer på et bibliotek. Nu skal vi udvide funktionaliteten, så vi kan aflevere materialer. Det forudsættes at du har en `Library`-klasse, en `Resource`-superklasse og konkrete materialetyper som `Book`, m.v. der arver fra `Resource`, dvs.
```java
public abstract class Resource { 
    // ...
}
public class Book extends Resource { 
    // ...
}
public class Movie extends Resource { 
    // ...
}
public class VideoGame extends Resource { 
    // ...
}
```
```java
public class Library {
    private Resource[] resources;
    private Member[] members;
    private Loan[] loans;
    private int loanCount;
    
    public Library(Resource[] resources, Member[] members) {
        this.resources = resources;
        this.members = members;
        this.loans = new Loan[100];
        this.loanCount = 0;
    }

    public void borrow(Resource resource, 
                       Member member, 
                       LocalDate borrowedDate) {
        
        Loan loan = new Loan(resource, member, borrowedDate);
        loans[loanCount] = loan;
        loanCount++;
    }

    public void printLoans() {
        for (int i = 0; i < loanCount; i++) {
            System.out.println(loans[i]);
        }
    }

    // ...
}
```
1. Fortsæt med projektet `library-management-system` fra forrige tutorial og/eller bring dig ajour med det.
2. Tilføj en metode `public void returnLoan(Resource resource, LocalDate returnDate)` i `Library`-klassen, der registrerer at et givent medlem afleverer et givent materiale på en given dato. Metoden skal:
   - Søge i `loans`-arrayet efter et lån, der matcher `resource` og som ikke allerede er afleveret (dvs. hvor `returnDate` i lånet er `null`).
   - Hvis et sådant lån findes, skal dets `returnDate` sættes til den givne `returnDate`
3. Ret `toString()`-metoden i `Loan`-klassen, så den også viser afleveringsdatoen og om lånet er afsluttet eller ej.
4. (Valgfrit) Lav en metode `public void printActiveLoans()`, der printer alle lån, der ikke er afsluttede (dvs. hvor `returnDate` er `null`).
5. Test at det virker i `Main`-klassen, fx
   ```java
   Library library = new Library(resources, members);
   library.borrow(resource1, member1, LocalDate.of(2024, 6, 1));
   library.borrow(resource2, member2, LocalDate.of(2024, 6, 3));
   library.printLoans(); // eller printActiveLoans()
   System.out.println("---- Efter aflevering ----");
   library.returnLoan(resource1, LocalDate.of(2024, 6, 10));
   library.printLoans(); // eller printActiveLoans()
   ```