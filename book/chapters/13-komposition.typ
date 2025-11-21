= Komposition

I de foregående kapitler har vi arbejdet med objekter, der indeholder simple værdier som tal, strenge og boolske værdier. Men hvad nu hvis et objekt skal indeholde andre objekter? Det er her komposition kommer ind i billedet.

== Arrays af objekter

Vi kan oprette arrays af objekter på samme måde, som vi opretter arrays af andre typer. For eksempel kan vi lave et array af `BankAccount`-objekter:

```java
BankAccount[] accounts = new BankAccount[3];
accounts[0] = new BankAccount(337898);
accounts[1] = new BankAccount(337899);
accounts[2] = new BankAccount(337900);

accounts[0].deposit(100);
System.out.println(accounts[0].balance); // 100.0
```

Vi kan iterere over arrays af objekter med en for-each løkke:

```java
for (BankAccount account : accounts) {
    System.out.println("Saldo på konto " + 
        account.accountNumber + ": " + 
        account.balance);
}
```

Dette fungerer præcis som med arrays af primitive typer, men der er én vigtig forskel: objekter er reference-typer.

== Repetition af `null`

Som vi så i forrige kapitel, er objekter reference-typer. Det betyder, at en variabel ikke indeholder selve objektet, men i stedet en reference (eller "pegepil") til objektet i hukommelsen.

`null` er en speciel reference-værdi, der ikke peger på noget objekt. Vi kalder det en "null pointer" - en pegepil, der ikke peger nogen steder hen.

Det er derfor tilladt at initialisere en objektvariabel med `null`:

```java
BankAccount account = null;
```

Og det er også tilladt at have `null` i et array af objekter:

```java
BankAccount[] accounts = new BankAccount[3];
accounts[0] = new BankAccount(337898);
accounts[1] = null; // ingen konto her
accounts[2] = new BankAccount(337900);
```

=== Standardværdien for objekter

Når vi opretter et nyt array af objekter, er alle elementerne automatisk sat til `null`:

```java
BankAccount[] accounts = new BankAccount[3];
System.out.println(accounts[0]); // null
System.out.println(accounts[1]); // null
System.out.println(accounts[2]); // null
```

Dette er anderledes end for primitive typer, hvor standardværdien er 0, false osv.

=== Tjek for `null`

Fordi elementer i et array kan være `null`, skal vi huske at tjekke for det, før vi bruger dem:

```java
BankAccount[] accounts = new BankAccount[3];
accounts[0] = new BankAccount(337898);
accounts[1] = null;
accounts[2] = new BankAccount(337900);

for (BankAccount account : accounts) {
    if (account != null) {
        System.out.println("Saldo: " + account.balance);
    }
}
```

Hvis vi glemmer at tjekke for `null`, kan vi få en `NullPointerException`:

```java
String name = null;
System.out.println(name.length()); // NullPointerException!
```

Fejlen sker fordi vi prøver at kalde metoden `length()` på en reference, der ikke peger på noget objekt.

=== Brug af `null` i metoder

Det er udbredt at bruge `null` til at indikere "ingen værdi" i metoder, der returnerer objekter:

```java
public static BankAccount findAccount(int accountNumber) {
    // søg efter kontoen...
    if ( /* konto ikke fundet */ ) {
        return null; // indikerer "ikke fundet"
    }
    return new BankAccount(accountNumber);
}
```

Når vi kalder sådan en metode, skal vi altid tjekke om resultatet er `null`:

```java
BankAccount account = findAccount(123456);
if (account != null) {
    System.out.println("Fundet konto med saldo: " + 
        account.balance);
} else {
    System.out.println("Konto ikke fundet");
}
```

== Hvad er komposition?

Komposition er når et objekt indeholder andre objekter som en del af sin tilstand (state). Vi siger, at objektet "har en" (*has-a*) relation til det andet objekt.

Lad os se på et eksempel med vores `BankAccount`-klasse:

```java
public class BankAccount {
    int accountNumber;
    double balance;
}
```

Hver bankkonto har en ejer. Vi kunne lave en `Owner`-klasse:

```java
public class Owner {
    String name;
    String email;

    public Owner(String name, String email) {
        this.name = name;
        this.email = email;
    }
}
```

Nu kan vi give `BankAccount` en ejer ved at tilføje et felt af typen `Owner`:

```java
public class BankAccount {
    int accountNumber;
    double balance;
    Owner owner;

    public BankAccount(int accountNumber) {
        this.accountNumber = accountNumber;
        this.balance = 0.0;
        this.owner = null; // ingen ejer endnu
    }
}
```

Nu kan vi oprette en konto med en ejer:

```java
Owner owner = new Owner("Hanne Hansen", 
                        "hanne@example.com");
BankAccount account = new BankAccount(337898);
account.owner = owner;

System.out.println(account.owner.name); // Hanne Hansen
System.out.println(account.owner.email); // hanne@example.com
```

Vi har nu komponeret `BankAccount` af flere dele: et kontonummer, en saldo og en ejer.

== Obligatoriske relationer

I virkeligheden kan en bankkonto ikke eksistere uden en ejer. Det giver ikke mening at have en konto, som ingen ejer. Vi bør derfor gøre det obligatorisk at angive en ejer, når vi opretter en konto.

Vi kan gøre dette ved at tilføje `Owner` som en parameter til konstruktøren:

```java
public class BankAccount {
    int accountNumber;
    double balance;
    Owner owner;

    public BankAccount(int accountNumber, Owner owner) {
        this.accountNumber = accountNumber;
        this.balance = 0.0;
        this.owner = owner; // krævet parameter
    }
}
```

Nu er vi tvunget til at angive en ejer, når vi opretter en konto:

```java
Owner owner = new Owner("Hanne Hansen", 
                        "hanne@example.com");
BankAccount account = new BankAccount(337898, owner);
```

Dette vil give en kompileringsfejl:

```java
// Fejl: mangler owner parameter
BankAccount account = new BankAccount(337898);
```

=== Uforanderlige relationer

Vi kan gøre ejerskabet permanent ved at markere `owner`-feltet som `final`:

```java
public class BankAccount {
    final int accountNumber;
    final double balance;
    final Owner owner; // kan ikke ændres

    public BankAccount(int accountNumber, Owner owner) {
        this.accountNumber = accountNumber;
        this.balance = 0.0;
        this.owner = owner;
    }
}
```

Nu kan vi ikke ændre ejeren efter kontoen er oprettet:

```java
Owner owner1 = new Owner("Hanne Hansen", 
                         "hanne@example.com");
BankAccount account = new BankAccount(337898, owner1);

Owner owner2 = new Owner("Peter Jensen", 
                         "peter@example.com");
account.owner = owner2; // Kompileringsfejl!
```

== Stærkt ejerskab

Når et objekt ikke kan eksistere uden et andet objekt, kalder vi det "stærkt ejerskab" (strong ownership). Det er et kendetegn ved komposition.

I vores eksempel:
- En `BankAccount` kan ikke eksistere uden en `Owner`
- `BankAccount` "ejer" sin `Owner` reference
- Relationen er obligatorisk og ofte permanent

Dette er anderledes end blot at have en reference til et objekt, der kunne eksistere uafhængigt.

== Et mere komplekst eksempel: Bibliotekssystem

Lad os se på et bibliotekssystem med bøger, medlemmer og udlån. Vi starter med en simpel `Book`-klasse:

```java
public class Book {
    final String author;
    final String title;
    final String isbn;

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

Og en `Member`-klasse:

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

=== En klasse til udlån

Når et medlem låner en bog, skal vi holde styr på hvem der lånte hvad og hvornår. I stedet for at tilføje dette ansvar til `Book`-klassen, kan vi oprette en separat `Loan`-klasse:

```java
import java.time.LocalDate;

public class Loan {
    final Member member;
    final Book book;
    final LocalDate borrowedDate;

    public Loan(Member member, 
                Book book, 
                LocalDate borrowedDate) {
        this.member = member;
        this.book = book;
        this.borrowedDate = borrowedDate;
    }
}
```

Et `Loan`-objekt sammensætter tre ting:
- Et `Member`-objekt (hvem lånte?)
- Et `Book`-objekt (hvad blev lånt?)
- En `LocalDate` (hvornår blev det lånt?)

Vi kan oprette udlån sådan her:

```java
Member member1 = new Member("Thorkild Hansen", 356);
Book book1 = new Book("Allan B. Downey", 
                      "Think Java", 
                      "9781492072508");

Loan loan1 = new Loan(member1, 
                      book1, 
                      LocalDate.of(2024, 6, 1));
```

=== Has-a relationer

`Loan`-klassen har flere "has-a" relationer:
- Et lån *har et* medlem
- Et lån *har en* bog
- Et lån *har en* udlånsdato

Alle tre relationer er obligatoriske - et lån kan ikke eksistere uden alle tre dele.

=== Tilføj funktionalitet

Vi kan tilføje metoder til `Loan` for at beregne afleveringsdatoen:

```java
public class Loan {
    final Member member;
    final Book book;
    final LocalDate borrowedDate;

    public Loan(Member member, 
                Book book, 
                LocalDate borrowedDate) {
        this.member = member;
        this.book = book;
        this.borrowedDate = borrowedDate;
    }

    public LocalDate getDueDate() {
        return borrowedDate.plusDays(14);
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

Nu kan vi bruge `Loan`-objekter til at håndtere udlån:

```java
Loan loan1 = new Loan(member1, 
                      book1, 
                      LocalDate.of(2024, 6, 1));

System.out.println(loan1);
// Allan B. Downey: Think Java (9781492072508) 
// - Udlånt til Thorkild Hansen (Lånernummer: 356), 
// afleveringsfrist 2024-06-15

if (loan1.isOverdue()) {
    System.out.println("Bogen er forsinket!");
}
```

== Komposition vs. primitive typer

Lad os sammenligne forskellige måder at repræsentere data på:

=== Med primitive typer

```java
public class Person {
    String name;
    int birthYear;
    int birthMonth;
    int birthDay;
}
```

=== Med komposition

```java
import java.time.LocalDate;

public class Person {
    String name;
    LocalDate birthDate; // et sammenhængende objekt
}
```

Ved at bruge `LocalDate` i stedet for tre separate tal:
- Får vi en mere meningsfuld type
- Kan vi bruge alle `LocalDate`'s metoder (fx beregne alder)
- Undgår vi ugyldige datoer (fx 32. januar)
- Gør koden mere læsbar

== Komposition med flere niveauer

Objekter kan indeholde objekter, der selv indeholder objekter:

```java
public class Address {
    String street;
    String city;
    String zipCode;
}

public class Owner {
    String name;
    String email;
    Address address; // et objekt
}

public class BankAccount {
    int accountNumber;
    double balance;
    Owner owner; // som selv indeholder et objekt
}
```

Nu kan vi tilgå data gennem flere niveauer:

```java
Owner owner = new Owner("Hanne Hansen", 
                        "hanne@example.com");
owner.address = new Address("Hovedgaden 1", 
                            "København", 
                            "1000");

BankAccount account = new BankAccount(337898, owner);

System.out.println(account.owner.address.city); 
// København
```

== Fordele ved komposition

Komposition giver os flere fordele:

*1. Bedre organisation:* Relateret data grupperes sammen i meningsfulde enheder.

*2. Genbrugelighed:* En `Address`-klasse kan bruges af mange andre klasser (`Person`, `Company`, `Store`, osv.).

*3. Vedligeholdelse:* Hvis vi skal ændre hvordan en adresse repræsenteres, skal vi kun ændre ét sted.

*4. Indkapsling:* Vi kan skjule kompleksitet inde i objekter.

*5. Typsikkerhed:* Kompilatoren hjælper os med at bruge objekterne korrekt.

== Øvelser

=== Øvelse 1: Person med adresse

Lav en `Address`-klasse med felter for gade, by og postnummer. Lav derefter en `Person`-klasse, der har et navn og en adresse. Test at du kan oprette personer med adresser.

=== Øvelse 2: Ordre i en webshop

Design klasser til en webshop:
- En `Product`-klasse med navn og pris
- En `Customer`-klasse med navn og email
- En `Order`-klasse der sammensætter en kunde, en dato og en liste af produkter (array)

Gør kunde og dato obligatoriske i `Order`-konstruktøren.

=== Øvelse 3: Bil med motor

Lav en `Engine`-klasse med felter for cylindervolumen (fx 2000 for en 2,0 liter motor) og hestekræfter. Lav derefter en `Car`-klasse, der har mærke, model og en motor. Test at du kan tilgå motorens data gennem bil-objektet.

=== Øvelse 4: Team med spillere

Lav en `Player`-klasse med navn og trøjenummer. Lav en `Team`-klasse, der har et holdnavn og et array af spillere. Tilføj en metode til `Team`, der kan udskrive alle spillere på holdet.

=== Øvelse 5: Udvid bibliotekssystemet

Tag udgangspunkt i `Loan`-klassen fra kapitlet:
1. Tilføj en metode `getDaysOverdue()`, der returnerer antal dage, et lån er overskredet (eller 0 hvis ikke overskredet)
2. Tilføj en metode `getFine()`, der beregner en bøde på 5 kr. per dag, lånet er overskredet
3. Test metoderne med både aktuelle og forsinkede lån

== Opsummering

I dette kapitel har vi lært:

- Arrays kan indeholde objekter, og nye arrays har `null` som standardværdi
- Vi skal altid tjekke for `null`, før vi bruger objektreferences
- *Komposition* betyder at et objekt indeholder andre objekter
- Vi bruger "has-a" til at beskrive kompositionsrelationer
- Obligatoriske relationer kan håndhæves gennem konstruktørparametre
- `final` kan bruges til at gøre relationer permanente
- *Stærkt ejerskab* betyder at et objekt ikke kan eksistere uden et andet
- Komposition giver bedre organisation, genbrugelighed og typsikkerhed
- Objekter kan indeholde objekter i flere niveauer

Komposition er et fundamentalt princip i objektorienteret programmering. Det giver os mulighed for at bygge komplekse systemer ud af simple, genbrugelige dele - præcis som LEGO-klodser.
