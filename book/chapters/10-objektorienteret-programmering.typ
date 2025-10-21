= Objektorienteret Programmering

Objektorienteret programmering (OOP) handler om at organisere kode omkring objekter der interagerer med hinanden. I dette kapitel lærer vi de tre fundamentale principper i OOP:

- **Komposition** - objekter der indeholder andre objekter
- **Indkapsling** - beskyttelse og styring af adgang til data
- **Arv** - genbrugeligt

 af kode gennem klasseh

ierarki

Disse tre koncepter arbejder sammen for at skabe fleksibel, genbrugelig og vedligeholdelsesvenlig kode.

== Del 1: Komposition

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

Komposition er når et objekt indeholder andre objekter som en del af sin tilstand (state). Vi siger, at objektet "har en" (**has-a**) relation til det andet objekt.

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
- Et lån **har et** medlem
- Et lån **har en** bog
- Et lån **har en** udlånsdato

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

**1. Bedre organisation:** Relateret data grupperes sammen i meningsfulde enheder.

**2. Genbrugelighed:** En `Address`-klasse kan bruges af mange andre klasser (`Person`, `Company`, `Store`, osv.).

**3. Vedligeholdelse:** Hvis vi skal ændre hvordan en adresse repræsenteres, skal vi kun ændre ét sted.

**4. Indkapsling:** Vi kan skjule kompleksitet inde i objekter.

**5. Typsikkerhed:** Kompilatoren hjælper os med at bruge objekterne korrekt.

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
- **Komposition** betyder at et objekt indeholder andre objekter
- Vi bruger "has-a" til at beskrive kompositionsrelationer
- Obligatoriske relationer kan håndhæves gennem konstruktørparametre
- `final` kan bruges til at gøre relationer permanente
- **Stærkt ejerskab** betyder at et objekt ikke kan eksistere uden et andet
- Komposition giver bedre organisation, genbrugelighed og typsikkerhed
- Objekter kan indeholde objekter i flere niveauer

Komposition er et fundamentalt princip i objektorienteret programmering. Det giver os mulighed for at bygge komplekse systemer ud af simple, genbrugelige dele - præcis som LEGO-klodser.


== Del 2: Indkapsling

I de foregående kapitler har vi lavet klasser med `public` felter, som alle kunne se og ændre. Men hvad nu hvis vi vil have mere kontrol over, hvordan data i vores objekter bliver brugt? Det er her indkapsling kommer ind i billedet.

== Access modifiers

Indtil nu har vi brugt `public` til næsten alt:

```java
public class BankAccount {
    public int accountNumber;    // public felt
    public double balance;       // public felt

    public BankAccount(int accountNumber) { // public konstruktør
        this.accountNumber = accountNumber;
        this.balance = 0.0;
    }

    public void deposit(double amount) {    // public metode
        this.balance += amount;
    }
}
```

`public` er en såkaldt **access modifier** (adgangsmodifikator på dansk). Det er et nøgleord, der bestemmer, hvem der kan se og bruge en klasse, et felt, en konstruktør eller en metode.

=== De fire access modifiers

Java har fire forskellige access modifiers:

**1. `public`** betyder at alle kan se og bruge det - uanset hvor i koden de er.

**2. `private`** betyder at kun klassen selv kan se og bruge det - ingen andre.

**3. `protected`** betyder at kun klassen selv og dens subklasser kan se og bruge det (mere om dette i kapitlet om arv).

**4. _(ingen modifier)_** også kaldet "package-private" betyder at kun klassen selv og klasser i samme pakke kan se og bruge det.

I dette kapitel fokuserer vi på `public` og `private`.

=== Extract Method og private

Måske har du set `private` før - ved et uheld. Når du bruger IntelliJ's "Extract Method" funktionalitet til at udtrække kode til en ny metode, bliver den nye metode automatisk `private`.

Det er faktisk en god ide at gøre metoder `private` som standard, og så kun gøre dem `public`, hvis andre klasser skal bruge dem.

== Hvorfor indkapsling?

Lad os se på et problem med vores `BankAccount`-klasse:

```java
public class BankAccount {
    public int accountNumber;
    public double balance;
}
```

Vi kan oprette en bankkonto og ændre saldoen direkte:

```java
BankAccount account = new BankAccount(337898);
account.balance = -1000.0; // Uh oh, negativ saldo!
```

Dette er et problem! En bankkonto bør ikke kunne have negativ saldo (medmindre banken tilbyder kassekredit).

=== Første forsøg: Metoder til indsætning og hævning

Vi kan prøve at løse problemet ved at tilføje metoder til indsætning og hævning:

```java
public class BankAccount {
    public int accountNumber;
    public double balance;

    public void deposit(double amount) {
        if (amount > 0) {
            this.balance += amount;
        }
    }

    public void withdraw(double amount) {
        if (amount > 0 && amount <= this.balance) {
            this.balance -= amount;
        }
    }
}
```

Nu kan vi bruge disse metoder sikkert:

```java
BankAccount account = new BankAccount(337898);
account.deposit(1000.0);
account.withdraw(500.0);  // OK
account.withdraw(600.0);  // Ingen effekt - ikke nok penge
account.deposit(-200.0);  // Ingen effekt - negativt beløb
```

Men vi har stadig et problem:

```java
account.balance = -1000.0; // Stadig muligt!
```

Vi kan stadig ændre `balance` direkte og omgå vores sikkerhedstjek.

== Private felter

Løsningen er at gøre felterne `private`:

```java
public class BankAccount {
    private int accountNumber;  // Ændret til private
    private double balance;     // Ændret til private

    public BankAccount(int accountNumber) {
        this.accountNumber = accountNumber;
        this.balance = 0.0;
    }

    public void deposit(double amount) {
        if (amount > 0) {
            this.balance += amount;
        }
    }

    public void withdraw(double amount) {
        if (amount > 0 && amount <= this.balance) {
            this.balance -= amount;
        }
    }
}
```

Nu kan vi ikke længere ændre `balance` direkte udefra:

```java
BankAccount account = new BankAccount(337898);
account.balance = -1000.0; // Kompileringsfejl!
```

Men vi kan stadig ændre den via metoderne:

```java
account.deposit(500.0);   // OK
account.withdraw(200.0);  // OK
```

Dette er **indkapsling** - vi skjuler de interne detaljer og styrer adgangen gennem metoder.

== Getter og setter metoder

Hvis felterne er `private`, hvordan får vi så adgang til værdierne? For eksempel, hvordan udskriver vi saldoen?

```java
BankAccount account = new BankAccount(337898);
System.out.println(account.balance); // Fejl! balance er private
```

Løsningen er at lave **getter-metoder** (også kaldet accessor methods):

```java
public class BankAccount {
    private int accountNumber;
    private double balance;

    // ... konstruktør, deposit, withdraw ...

    public int getAccountNumber() {
        return this.accountNumber;
    }

    public double getBalance() {
        return this.balance;
    }
}
```

Nu kan vi få adgang til værdierne:

```java
BankAccount account = new BankAccount(337898);
account.deposit(500.0);
System.out.println("Saldo: " + account.getBalance()); // 500.0
System.out.println("Konto: " + account.getAccountNumber()); // 337898
```

=== Navngivningskonvention

Getter-metoder følger en fast navngivningskonvention i Java:
- For et felt `balance` laver vi en metode `getBalance()`
- For et felt `accountNumber` laver vi en metode `getAccountNumber()`
- For et boolean felt `active` kan vi bruge `isActive()` i stedet for `getActive()`

=== Setter-metoder

Hvis vi vil lade andre ændre et felt, kan vi lave en **setter-metode** (også kaldet mutator method):

```java
public class BankAccount {
    private int accountNumber;
    private double balance;

    // ... andre metoder ...

    public void setBalance(double balance) {
        if (balance >= 0) {
            this.balance = balance;
        }
    }

    public void setAccountNumber(int accountNumber) {
        this.accountNumber = accountNumber;
    }
}
```

Men vent! Skal vi virkelig tillade dette?

```java
BankAccount account = new BankAccount(337898);
account.setBalance(1000000.0);  // Gratis penge?
account.setAccountNumber(123456); // Skift kontonummer?
```

== Read-only felter

For nogle felter giver det ikke mening at kunne ændre dem. Et kontonummer bør ikke kunne ændres efter kontoen er oprettet. Her har vi to muligheder:

**1. Gør feltet `final`:**

```java
public class BankAccount {
    private final int accountNumber;
    private double balance;

    public BankAccount(int accountNumber) {
        this.accountNumber = accountNumber;
        this.balance = 0.0;
    }

    public int getAccountNumber() {
        return this.accountNumber;
    }

    // Ingen setAccountNumber() metode!
}
```

**2. Lad være med at lave en setter:**

Selv hvis feltet ikke er `final`, kan vi simpelthen undlade at lave en `setAccountNumber()` metode. Så kan feltet kun sættes i konstruktøren.

== Private setter-metoder

For `balance` har vi et andet problem. Saldoen skal kunne ændres, men kun gennem `deposit()` og `withdraw()`. 

Vi kan gøre setter-metoden `private`:

```java
public class BankAccount {
    private final int accountNumber;
    private double balance;

    public BankAccount(int accountNumber) {
        this.accountNumber = accountNumber;
        this.balance = 0.0;
    }

    public int getAccountNumber() {
        return this.accountNumber;
    }

    public double getBalance() {
        return this.balance;
    }

    private void setBalance(double balance) {
        if (balance >= 0) {
            this.balance = balance;
        }
    }

    public void deposit(double amount) {
        if (amount > 0) {
            setBalance(this.balance + amount);
        }
    }

    public void withdraw(double amount) {
        if (amount > 0 && amount <= this.balance) {
            setBalance(this.balance - amount);
        }
    }
}
```

Nu kan `setBalance()` kun kaldes indefra klassen:

```java
account.setBalance(1000.0); // Fejl! Private metode
account.deposit(1000.0);    // OK
```

=== Fordele ved private setters

Ved at bruge en `private` setter kan vi:
- Centralisere valideringen af saldoen ét sted
- Forenkle `deposit()` og `withdraw()`
- Gøre det lettere at ændre reglerne senere

For eksempel, hvis vi vil tilføje en maksimal saldo:

```java
private void setBalance(double balance) {
    if (balance >= 0 && balance <= 1_000_000) {
        this.balance = balance;
    }
}
```

Nu er reglen implementeret ét sted, og begge `deposit()` og `withdraw()` respekterer den automatisk.

== Et praktisk eksempel: Aldersverifikation

Lad os se på et andet eksempel. Vi skal lave en app, der kan verificere om en person er myndig, uden at afsløre personens nøjagtige alder.

Vi starter med en simpel `Person`-klasse:

```java
public class Person {
    public String name;
    public int age;

    @Override
    public String toString() {
        return name + ", " + age + " år";
    }
}
```

Vi kan bruge den sådan:

```java
Person person = new Person();
person.name = "Alfons Åberg";
person.age = 5;
System.out.println(person); // Alfons Åberg, 5 år
```

Men med `public` felter kan vi gøre forkerte ting:

```java
person.age = -10;  // Negativ alder?
person.age = 200;  // 200 år gammel?
person.name = "";  // Tomt navn?
```

=== Tilføj indkapsling

Lad os gøre felterne `private`:

```java
public class Person {
    private String name;
    private int age;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        if (age >= 0 && age <= 150) {
            this.age = age;
        }
    }

    @Override
    public String toString() {
        return getName() + ", " + getAge() + " år";
    }
}
```

Bemærk at vi også bruger getter-metoderne i `toString()`.

Nu kan vi bruge klassen sådan:

```java
Person person = new Person();
person.setName("Alfons Åberg");
person.setAge(5);
System.out.println(person); // Alfons Åberg, 5 år

person.setAge(-10);  // Ignoreres - ugyldigt
person.setAge(200);  // Ignoreres - ugyldigt
```

=== Tilføj aldersverifikation

Nu kan vi tilføje en metode til at tjekke om personen er myndig:

```java
public class Person {
    private String name;
    private int age;

    // ... getters og setters ...

    public boolean isAdult() {
        return age >= 18;
    }
}
```

Brug:

```java
Person person = new Person();
person.setName("Alfons Åberg");
person.setAge(5);

if (person.isAdult()) {
    System.out.println("Velkommen!");
} else {
    System.out.println("Du er for ung!");
}
```

Det smarte er, at vi kan tjekke om personen er myndig uden at få selve alderen.

== Private hjælpemetoder

Private metoder er ikke kun til setters. Vi kan også bruge dem til at organisere kompleks kode.

Forestil dig at vi har en `Person`-klasse med et CPR-nummer:

```java
public class Person {
    private String cpr;

    public Person(String cpr) {
        this.cpr = cpr;
    }

    public int getAge() {
        // Udtræk år fra CPR
        int year = Integer.parseInt(cpr.substring(0, 2));
        if (year > 30) {
            year += 1900;
        } else {
            year += 2000;
        }
        
        // Udtræk måned og dag fra CPR
        int month = Integer.parseInt(cpr.substring(2, 4));
        int day = Integer.parseInt(cpr.substring(4, 6));
        
        // Beregn alder
        LocalDate birthday = LocalDate.of(year, month, day);
        LocalDate today = LocalDate.now();
        Period age = Period.between(birthday, today);
        return age.getYears();
    }
}
```

Dette er en kompleks metode! Vi kan gøre den mere læsbar ved at bruge private hjælpemetoder:

```java
public class Person {
    private String cpr;

    public Person(String cpr) {
        this.cpr = cpr;
    }

    private int extractYearFromCpr() {
        int year = Integer.parseInt(cpr.substring(0, 2));
        if (year > 30) {
            return year + 1900;
        } else {
            return year + 2000;
        }
    }

    private int extractMonthFromCpr() {
        return Integer.parseInt(cpr.substring(2, 4));
    }

    private int extractDayFromCpr() {
        return Integer.parseInt(cpr.substring(4, 6));
    }

    private LocalDate birthDateFromCpr() {
        return LocalDate.of(
            extractYearFromCpr(),
            extractMonthFromCpr(),
            extractDayFromCpr()
        );
    }

    public int getAge() {
        LocalDate birthday = birthDateFromCpr();
        LocalDate today = LocalDate.now();
        Period age = Period.between(birthday, today);
        return age.getYears();
    }
}
```

Nu er `getAge()` meget lettere at læse! Og de private hjælpemetoder kan ikke bruges udenfor klassen, så vi kan ændre eller fjerne dem uden at påvirke andet kode.

== API - Application Programming Interface

Et **API** (Application Programming Interface) er den del af koden, som andre udviklere kan se og bruge.

I vores klasser består API'et af:
- `public` klasser
- `public` konstruktører
- `public` metoder
- `public` konstanter (final static felter)

`private` dele er **implementeringsdetaljer** - interne ting, som kun klassen selv bruger.

I vores `BankAccount`-eksempel er API'et:
- Klassen `BankAccount`
- Konstruktøren `BankAccount(int accountNumber)`
- Metoderne `getAccountNumber()`, `getBalance()`, `deposit()` og `withdraw()`

Ikke-API (implementeringsdetaljer):
- Felterne `accountNumber` og `balance`
- Metoden `setBalance()` (fordi den er private)

=== Hvorfor skelne mellem API og implementering?

Der er flere grunde til at holde API'et lille:

**1. Lettere at bruge:** Jo færre `public` metoder, jo lettere er klassen at forstå og bruge.

**2. Lettere at ændre:** Vi kan ændre `private` dele uden at påvirke kode, der bruger klassen.

**3. Mindre risiko for fejl:** Brugere kan ikke komme til at bruge klassen forkert.

**4. Bedre organisation:** Vi er tvunget til at tænke over hvilke operationer der giver mening.

== Versionering af API'er

Når vi ændrer et API, skal vi overveje om ændringen er **bagudkompatibel** eller ej.

- **Bagudkompatibel:** Eksisterende kode virker stadig uden ændringer
- **Ikke bagudkompatibel:** Eksisterende kode skal ændres for at virke

Eksempler på bagudkompatible ændringer:
- Tilføje en ny `public` metode
- Tilføje en ny konstruktør (hvis der stadig er den gamle)
- Gøre en metode mere tolerant (acceptere flere input)

Eksempler på ikke-bagudkompatible ændringer:
- Fjerne en `public` metode
- Ændre en metodes signatur (parametre eller returtype)
- Ændre en metodes opførsel på en måde, der bryder eksisterende kode

=== Semantisk versionering (SemVer)

Mange projekter bruger semantisk versionering til at indikere typen af ændringer:

**Version X.Y.Z** hvor:
- **X** (major): Ikke-bagudkompatible ændringer
- **Y** (minor): Nye funktioner, bagudkompatible
- **Z** (patch): Fejlrettelser, bagudkompatible

Eksempel:
- `1.0.0` → `1.0.1`: Fejlrettelse
- `1.0.1` → `1.1.0`: Ny funktion
- `1.1.0` → `2.0.0`: Breaking change (ikke bagudkompatibel)

== Retningslinjer for indkapsling

Her er nogle gode regler:

**1. Gør alle felter `private`**
- Altid, uden undtagelse
- Brug getters og setters hvis nødvendigt

**2. Gør metoder `private` som standard**
- Kun gør dem `public` hvis andre klasser skal bruge dem
- Overvej om metoden er en del af API'et

**3. Brug `final` for uforanderlige felter**
- Hvis et felt ikke skal kunne ændres efter konstruktionen
- Det gør koden mere forudsigelig

**4. Valider input i setters**
- Tjek at værdier er gyldige
- Ignorer eller kast fejl ved ugyldige værdier

**5. Hold API'et minimalt**
- Kun det mest nødvendige skal være `public`
- Det er lettere at tilføje metoder senere end at fjerne dem

**6. Brug private hjælpemetoder**
- Opdel komplekse metoder i mindre dele
- Det gør koden mere læsbar og testbar

== Øvelser

=== Øvelse 1: Rectangle-klasse

Lav en `Rectangle`-klasse med private felter for bredde og højde. Tilføj:
1. En konstruktør, der tager bredde og højde
2. Getters for bredde og højde
3. Metoder til at beregne areal og omkreds
4. Valider at bredde og højde er positive

=== Øvelse 2: Email-klasse

Lav en `Email`-klasse med et privat felt for email-adressen. Tilføj:
1. En konstruktør, der validerer at email'en indeholder `@`
2. En getter for email'en
3. En metode `getDomain()`, der returnerer delen efter `@`
4. Overvej: skal der være en setter?

=== Øvelse 3: Counter-klasse

Lav en `Counter`-klasse til at tælle noget (fx antal besøgende). Tilføj:
1. Et privat felt `count` initialiseret til 0
2. Metoder `increment()`, `decrement()` og `reset()`
3. En getter `getCount()`
4. Sørg for at count ikke kan blive negativ

=== Øvelse 4: Temperature-klasse

Lav en `Temperature`-klasse, der gemmer en temperatur i Celsius. Tilføj:
1. Et privat felt for temperaturen i Celsius
2. En konstruktør og getter
3. Metoder `toFahrenheit()` og `toKelvin()`
4. Valider at temperaturen ikke er under -273.15 (absolut nulpunkt)

=== Øvelse 5: Refactorer BankAccount

Tag `BankAccount`-klassen fra kapitlet og tilføj:
1. En metode `transfer(BankAccount other, double amount)` til at overføre penge
2. Valider at der er nok penge før overførslen
3. Brug `withdraw()` og `deposit()` eller `setBalance()`?
4. Hvilken tilgang er bedst og hvorfor?

== Opsummering

I dette kapitel har vi lært:

- **Access modifiers** styrer hvem der kan se og bruge kode (`public`, `private`, `protected`)
- **Indkapsling** betyder at skjule interne detaljer og styre adgang gennem metoder
- Felter skal altid være `private`
- **Getters** giver læseadgang til private felter
- **Setters** giver skriveadgang med mulighed for validering
- Private setters kan bruges til intern validering
- **Read-only felter** kan implementeres med `final` eller ved at undlade setters
- **Private hjælpemetoder** organiserer kompleks kode
- **API** er de `public` dele, som andre kan bruge
- **Implementeringsdetaljer** er de `private` dele
- God indkapsling gør kode mere robust, læsbar og vedligeholdbar

Indkapsling er et af de mest fundamentale principper i objektorienteret programmering. Det beskytter data, gør klasser lettere at bruge og giver fleksibilitet til at ændre implementeringen uden at påvirke brugere af klassen.


== Del 3: Arv

Arv (eng: inheritance) er en fundamental mekanisme i objektorienteret programmering, der gør det muligt at genbruge kode ved at oprette nye klasser baseret på eksisterende klasser. I dette kapitel skal vi se, hvordan arv fungerer i Java, og hvordan det kan hjælpe os med at organisere vores kode bedre.

== Motivation for arv

Forestil dig at en bank har brug for forskellige typer konti med forskellige regler:

- **Almindelig konto:** Kan indsætte og hæve penge
- **Opsparingskonto:** Som almindelig konto, men kan ikke overskride saldoen og får renter
- **Kreditkonto:** Kan overskride saldoen op til en grænse, men betaler rente på gæld

Hvad har de tilfælles?
- Alle har et kontonummer
- Alle har en saldo
- Alle kan indsætte penge
- Alle kan hæve penge (med forskellige regler)

I stedet for at skrive den samme kode tre gange, kan vi bruge **arv**.

== Grundlæggende arv

Vi starter med vores kendte `BankAccount`-klasse:

```java
public class BankAccount {
    private int accountNumber;
    private double balance;

    public BankAccount(int accountNumber) {
        this.accountNumber = accountNumber;
        this.balance = 0.0;
    }

    public int getAccountNumber() {
        return accountNumber;
    }

    public double getBalance() {
        return balance;
    }

    public void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
        }
    }

    public void withdraw(double amount) {
        if (amount > 0) {
            balance -= amount;
        }
    }

    protected void setBalance(double balance) {
        this.balance = balance;
    }
}
```

Nu kan vi lave en `SavingsAccount` (opsparingskonto), der **arver** fra `BankAccount`:

```java
public class SavingsAccount extends BankAccount {
    private double interestRate;

    public SavingsAccount(int accountNumber, 
                         double interestRate) {
        super(accountNumber);
        this.interestRate = interestRate;
    }

    public void applyInterest() {
        double interest = getBalance() * interestRate;
        deposit(interest);
    }
}
```

Nøgleordene her er:
- **`extends`** betyder at `SavingsAccount` arver fra `BankAccount`
- **`super(...)`** kalder konstruktøren i superklassen

== Terminologi

Når en klasse arver fra en anden, bruger vi denne terminologi:

- **Superklasse** (også kaldet baseklasse eller parent class): Den klasse, der bliver arvet fra. I vores eksempel er `BankAccount` superklassen.

- **Subklasse** (også kaldet afledt klasse eller child class): Den klasse, der arver. I vores eksempel er `SavingsAccount` subklassen.

Vi siger at `SavingsAccount` **arver fra** `BankAccount`, eller at `SavingsAccount` **udvider** (extends) `BankAccount`.

== Hvad arver subklassen?

Når `SavingsAccount` arver fra `BankAccount`, får den adgang til:

**1. Alle `public` og `protected` metoder:**
```java
SavingsAccount account = new SavingsAccount(123456, 0.05);
account.deposit(1000);      // Fra BankAccount
account.withdraw(200);      // Fra BankAccount
System.out.println(account.getBalance()); // Fra BankAccount
account.applyInterest();    // NY! Fra SavingsAccount
```

**2. Alle `protected` felter** (hvis de var `protected` i stedet for `private`)

**3. IKKE `private` felter eller metoder** - disse er kun tilgængelige i selve klassen.

== Super-nøgleordet

`super` bruges til to ting:

**1. Kalde superklassens konstruktør:**
```java
public SavingsAccount(int accountNumber, 
                     double interestRate) {
    super(accountNumber); // Kalder BankAccount konstruktør
    this.interestRate = interestRate;
}
```

Første linje i en subklasse-konstruktør skal normalt være et kald til `super(...)`. Hvis du ikke skriver det eksplicit, indsætter Java automatisk `super()` (uden parametre).

**2. Kalde superklassens metoder:**
```java
@Override
protected void setBalance(double balance) {
    if (balance >= 0) {
        super.setBalance(balance); // Kalder BankAccount's setBalance
    }
}
```

== Overriding af metoder

En subklasse kan **overskrive** (eng: override) metoder fra superklassen for at ændre deres opførsel.

Lad os sige at en opsparingskonto ikke må have negativ saldo. Vi kan overskrive `setBalance()`:

```java
public class SavingsAccount extends BankAccount {
    private double interestRate;

    public SavingsAccount(int accountNumber, 
                         double interestRate) {
        super(accountNumber);
        this.interestRate = interestRate;
    }

    @Override
    protected void setBalance(double balance) {
        if (balance >= 0) {
            super.setBalance(balance);
        }
        // Ignorerer negative værdier
    }

    public void applyInterest() {
        double interest = getBalance() * interestRate;
        deposit(interest);
    }
}
```

**`@Override` annotationen** er valgfri, men anbefales. Den fortæller kompilatoren, at du mener at overskrive en metode, og giver en fejl, hvis metoden ikke findes i superklassen.

Nu kan vi teste:

```java
SavingsAccount account = new SavingsAccount(123456, 0.05);
account.deposit(1000);
System.out.println(account.getBalance()); // 1000.0

account.withdraw(1200); // Forsøger at hæve mere end saldoen
System.out.println(account.getBalance()); // Stadig 1000.0!
```

== Protected access modifier

Vi har nu brugt alle tre vigtigste access modifiers:

**1. `private`** - kun synlig i klassen selv
**2. `public`** - synlig overalt  
**3. `protected`** - synlig i klassen selv OG i subklasser

I vores eksempel gjorde vi `setBalance()` `protected` så den kan kaldes fra `SavingsAccount`:

```java
public class BankAccount {
    // ...
    protected void setBalance(double balance) {
        this.balance = balance;
    }
}
```

Hvis den var `private`, kunne subklassen ikke overskrive den eller kalde den.

== Flere niveauer af arv

Arv kan gå i flere niveauer. En børneopsparing er en speciel slags opsparingskonto:

```java
import java.time.LocalDate;
import java.time.Period;

public class ChildrensSavingsAccount extends SavingsAccount {
    private LocalDate ownerBirthDate;

    public ChildrensSavingsAccount(int accountNumber,
                                  double interestRate,
                                  LocalDate ownerBirthDate) {
        super(accountNumber, interestRate);
        this.ownerBirthDate = ownerBirthDate;
    }

    private boolean isAdult() {
        LocalDate today = LocalDate.now();
        Period age = Period.between(ownerBirthDate, today);
        return age.getYears() >= 18;
    }

    @Override
    public void withdraw(double amount) {
        if (isAdult()) {
            super.withdraw(amount);
        } else {
            System.out.println(
                "Kan ikke hæve - ejer er ikke myndig");
        }
    }
}
```

Nu har vi et arvehierarki:
```
BankAccount
    ↑
SavingsAccount
    ↑
ChildrensSavingsAccount
```

Test:

```java
// Barn født i 2015
ChildrensSavingsAccount kid = 
    new ChildrensSavingsAccount(
        123456, 
        0.05, 
        LocalDate.of(2015, 1, 1));
        
kid.deposit(1000);
kid.applyInterest(); // Virker
kid.withdraw(200);   // Virker IKKE - ikke myndig

// Voksen født i 2000
ChildrensSavingsAccount adult = 
    new ChildrensSavingsAccount(
        654321, 
        0.05, 
        LocalDate.of(2000, 1, 1));
        
adult.deposit(1000);
adult.withdraw(200); // Virker - er myndig
```

== Abstrakte klasser

Nogle gange giver det ikke mening at oprette objekter af superklassen. For eksempel, hvad er en "transaktion" i sig selv? 

Der findes forskellige typer transaktioner:
- Indsættelse
- Hævning
- Overførsel mellem konti

Men en generel "transaktion" uden type giver ikke mening.

Vi kan gøre klassen **abstrakt**:

```java
import java.util.Date;

public abstract class Transaction {
    private Date date;
    private double amount;
    private String description;

    public Transaction(double amount, String description) {
        this.date = new Date();
        this.amount = amount;
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public double getAmount() {
        return amount;
    }

    public abstract void execute();
}
```

Nøglepunkter:
- Klassen er markeret med `abstract`
- Metoden `execute()` er abstrakt - ingen implementation
- Abstrakte klasser kan **ikke** instantieres direkte

Nu kan vi lave konkrete transaktionstyper:

```java
public class DepositTransaction extends Transaction {
    private BankAccount account;

    public DepositTransaction(double amount,
                             String description,
                             BankAccount account) {
        super(amount, description);
        this.account = account;
    }

    @Override
    public void execute() {
        account.deposit(getAmount());
    }
}
```

```java
public class WithdrawTransaction extends Transaction {
    private BankAccount account;

    public WithdrawTransaction(double amount,
                              String description,
                              BankAccount account) {
        super(amount, description);
        this.account = account;
    }

    @Override
    public void execute() {
        account.withdraw(getAmount());
    }
}
```

```java
public class TransferTransaction extends Transaction {
    private BankAccount fromAccount;
    private BankAccount toAccount;

    public TransferTransaction(double amount,
                              String description,
                              BankAccount fromAccount,
                              BankAccount toAccount) {
        super(amount, description);
        this.fromAccount = fromAccount;
        this.toAccount = toAccount;
    }

    @Override
    public void execute() {
        fromAccount.withdraw(getAmount());
        toAccount.deposit(getAmount());
    }
}
```

Brug:

```java
BankAccount account1 = new BankAccount(123456);
BankAccount account2 = new BankAccount(654321);

Transaction t1 = new DepositTransaction(1000, "Løn", account1);
Transaction t2 = new WithdrawTransaction(200, "Hævning", account1);
Transaction t3 = new TransferTransaction(300, "Overførsel", 
                                        account1, account2);

t1.execute();
t2.execute();
t3.execute();
```

=== Regler for abstrakte klasser

**1. En abstrakt klasse kan ikke instantieres:**
```java
Transaction t = new Transaction(100, "Test"); // FEJL!
```

**2. En abstrakt metode skal overskrives i subklasser:**
```java
public class MyTransaction extends Transaction {
    // SKAL implementere execute()
    @Override
    public void execute() {
        // implementation
    }
}
```

**3. En abstrakt klasse kan have både abstrakte og konkrete metoder:**
```java
public abstract class Transaction {
    // Abstrakt - skal implementeres i subklasse
    public abstract void execute();
    
    // Konkret - kan bruges direkte
    public String getDescription() {
        return description;
    }
}
```

**4. En abstrakt metode kan kun være i en abstrakt klasse:**
```java
public class MyClass { // FEJL - ikke abstrakt
    public abstract void myMethod(); // Men har abstrakt metode
}
```

== Is-a vs. Has-a relationer

Vi har nu set to måder at relatere klasser på:

**Has-a (Komposition):** En klasse indeholder en anden som et felt.
```java
public class Car {
    private Engine engine; // Car HAS-A Engine
}
```

**Is-a (Arv):** En klasse er en specialisering af en anden.
```java
public class Car extends Vehicle {
    // Car IS-A Vehicle
}
```

=== Hvordan vælger man?

Spørg dig selv: "Er X en type af Y?" eller "Har X en Y?"

**Eksempler på is-a:**
- En hund er et dyr → `Dog extends Animal`
- En opsparingskonto er en bankkonto → `SavingsAccount extends BankAccount`
- En cirkel er en form → `Circle extends Shape`

**Eksempler på has-a:**
- En bil har en motor → `Car` har et `Engine` felt
- En person har en adresse → `Person` har et `Address` felt
- En bog har en forfatter → `Book` har et `Author` felt

== Fordele og ulemper ved arv

=== Fordele

**1. Genbrugelighed:** Fælles kode skrives kun én gang i superklassen.

**2. Udvidelse:** Nye typer kan tilføjes uden at ændre eksisterende kode.

**3. Polymorfi:** Vi kan behandle objekter af forskellige typer ens (mere om dette senere).

**4. Organisation:** Hierarkier gør kodestrukturen klar.

=== Ulemper og advarsler

**1. Tæt kobling:** Subklasser er tæt koblet til superklassen - ændringer i superklassen påvirker alle subklasser.

**2. Kompleksitet:** Dybe arvehierarkier kan blive svære at forstå.

**3. Fragmentering:** Funktionalitet spredes over flere klasser.

**Vigtig regel:** Foretræk komposition frem for arv når begge giver mening. Arv skaber stærkere binding mellem klasser.

== Constructor chaining

Når vi opretter et objekt af en subklasse, kaldes konstruktører i en kæde:

```java
public class BankAccount {
    public BankAccount(int accountNumber) {
        System.out.println("BankAccount konstruktør");
        // ...
    }
}

public class SavingsAccount extends BankAccount {
    public SavingsAccount(int accountNumber, 
                         double interestRate) {
        super(accountNumber);
        System.out.println("SavingsAccount konstruktør");
        // ...
    }
}

public class ChildrensSavingsAccount extends SavingsAccount {
    public ChildrensSavingsAccount(int accountNumber,
                                  double interestRate,
                                  LocalDate birthDate) {
        super(accountNumber, interestRate);
        System.out.println("ChildrensSavingsAccount konstruktør");
        // ...
    }
}
```

Output når vi opretter et `ChildrensSavingsAccount`:
```
BankAccount konstruktør
SavingsAccount konstruktør
ChildrensSavingsAccount konstruktør
```

Superklassens konstruktør kaldes **altid først**.

== Hvornår skal man bruge arv?

Brug arv når:
- Der er en klar "is-a" relation
- Subklassen virkelig er en specialisering af superklassen
- Du vil udnytte polymorfi (næste kapitel)
- Det giver mening at genbruge implementation

Undgå arv når:
- Relationen er "has-a" i stedet for "is-a"
- Du kun vil genbruge nogle få metoder (brug komposition i stedet)
- Hierarkiet bliver meget dybt (mere end 3-4 niveauer)

== Øvelser

=== Øvelse 1: Geometriske former

Lav en abstrakt klasse `Shape` med en abstrakt metode `double getArea()`. Lav derefter konkrete klasser:
- `Circle` med radius
- `Rectangle` med bredde og højde
- `Triangle` med base og højde

Test at du kan beregne arealet af hver form.

=== Øvelse 2: Medarbejdere

Lav en `Employee`-klasse med navn og grundløn. Lav derefter:
- `HourlyEmployee` der betales pr. time
- `SalariedEmployee` der får fast månedsløn
- `CommissionEmployee` der får grundløn plus provision

Alle skal have en metode `double calculatePay()`.

=== Øvelse 3: Køretøjer

Lav et arvehierarki:
- `Vehicle` (abstrakt) med mærke og model
- `Car` extends `Vehicle` med antal døre
- `Motorcycle` extends `Vehicle` med cylindervolumen
- `ElectricCar` extends `Car` med batteristørrelse

Tilføj passende metoder til hver.

=== Øvelse 4: Udvid opsparingskonto

Tag `SavingsAccount` fra kapitlet og tilføj:
1. En maksimal saldo (fx 100.000 kr)
2. En metode der tjekker om indskud ville overstige grænsen
3. Overskrivning af `deposit()` der respekterer grænsen

=== Øvelse 5: Transaktionshistorik

Lav en `Account`-klasse (lignende `BankAccount`) der:
1. Holder en liste af transaktioner (brug `ArrayList<Transaction>`)
2. Tilføjer transaktioner til listen når de udføres
3. Kan udskrive hele transaktionshistorikken

== Opsummering

I dette kapitel har vi lært:

- **Arv** lader en klasse genbruge kode fra en anden klasse
- **`extends`** nøgleordet bruges til at lave en subklasse
- **Superklasse** er den klasse, der arves fra
- **Subklasse** er den klasse, der arver
- **`super(...)`** kalder superklassens konstruktør
- **`super.method()`** kalder superklassens metode
- **`@Override`** markerer at en metode overskriver en metode fra superklassen
- **`protected`** gør felter/metoder tilgængelige for subklasser
- **Abstrakte klasser** kan ikke instantieres og kan have abstrakte metoder
- **Abstrakte metoder** skal implementeres i subklasser
- **Is-a** relation indikerer arv, **has-a** indikerer komposition
- Konstruktører kaldes i kæde fra superklasse til subklasse
- Foretræk komposition frem for arv når begge er mulige

Arv er et kraftfuldt værktøj til at organisere og genbruge kode. Men brug det med omtanke - for meget arv kan gøre kode kompleks og svær at vedligeholde.
