= Indkapsling

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

`public` er en såkaldt *access modifier* (adgangsmodifikator på dansk). Det er et nøgleord, der bestemmer, hvem der kan se og bruge en klasse, et felt, en konstruktør eller en metode.

=== De fire access modifiers

Java har fire forskellige access modifiers:

*1. `public`* betyder at alle kan se og bruge det - uanset hvor i koden de er.

*2. `private`* betyder at kun klassen selv kan se og bruge det - ingen andre.

*3. `protected`* betyder at kun klassen selv og dens subklasser kan se og bruge det (mere om dette i kapitlet om arv).

*4. _(ingen modifier)_* også kaldet "package-private" betyder at kun klassen selv og klasser i samme pakke kan se og bruge det.

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

Dette er *indkapsling* - vi skjuler de interne detaljer og styrer adgangen gennem metoder.

== Getter og setter metoder

Hvis felterne er `private`, hvordan får vi så adgang til værdierne? For eksempel, hvordan udskriver vi saldoen?

```java
BankAccount account = new BankAccount(337898);
System.out.println(account.balance); // Fejl! balance er private
```

Løsningen er at lave *getter-metoder* (også kaldet accessor methods):

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

Hvis vi vil lade andre ændre et felt, kan vi lave en *setter-metode* (også kaldet mutator method):

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

*1. Gør feltet `final`:*

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

*2. Lad være med at lave en setter:*

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

Et *API* (Application Programming Interface) er den del af koden, som andre udviklere kan se og bruge.

I vores klasser består API'et af:
- `public` klasser
- `public` konstruktører
- `public` metoder
- `public` konstanter (final static felter)

`private` dele er *implementeringsdetaljer* - interne ting, som kun klassen selv bruger.

I vores `BankAccount`-eksempel er API'et:
- Klassen `BankAccount`
- Konstruktøren `BankAccount(int accountNumber)`
- Metoderne `getAccountNumber()`, `getBalance()`, `deposit()` og `withdraw()`

Ikke-API (implementeringsdetaljer):
- Felterne `accountNumber` og `balance`
- Metoden `setBalance()` (fordi den er private)

=== Hvorfor skelne mellem API og implementering?

Der er flere grunde til at holde API'et lille:

*1. Lettere at bruge:* Jo færre `public` metoder, jo lettere er klassen at forstå og bruge.

*2. Lettere at ændre:* Vi kan ændre `private` dele uden at påvirke kode, der bruger klassen.

*3. Mindre risiko for fejl:* Brugere kan ikke komme til at bruge klassen forkert.

*4. Bedre organisation:* Vi er tvunget til at tænke over hvilke operationer der giver mening.

== Versionering af API'er

Når vi ændrer et API, skal vi overveje om ændringen er *bagudkompatibel* eller ej.

- *Bagudkompatibel:* Eksisterende kode virker stadig uden ændringer
- *Ikke bagudkompatibel:* Eksisterende kode skal ændres for at virke

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

*Version X.Y.Z* hvor:
- *X* (major): Ikke-bagudkompatible ændringer
- *Y* (minor): Nye funktioner, bagudkompatible
- *Z* (patch): Fejlrettelser, bagudkompatible

Eksempel:
- `1.0.0` → `1.0.1`: Fejlrettelse
- `1.0.1` → `1.1.0`: Ny funktion
- `1.1.0` → `2.0.0`: Breaking change (ikke bagudkompatibel)

== Retningslinjer for indkapsling

Her er nogle gode regler:

*1. Gør alle felter `private`*
- Altid, uden undtagelse
- Brug getters og setters hvis nødvendigt

*2. Gør metoder `private` som standard*
- Kun gør dem `public` hvis andre klasser skal bruge dem
- Overvej om metoden er en del af API'et

*3. Brug `final` for uforanderlige felter*
- Hvis et felt ikke skal kunne ændres efter konstruktionen
- Det gør koden mere forudsigelig

*4. Valider input i setters*
- Tjek at værdier er gyldige
- Ignorer eller kast fejl ved ugyldige værdier

*5. Hold API'et minimalt*
- Kun det mest nødvendige skal være `public`
- Det er lettere at tilføje metoder senere end at fjerne dem

*6. Brug private hjælpemetoder*
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

- *Access modifiers* styrer hvem der kan se og bruge kode (`public`, `private`, `protected`)
- *Indkapsling* betyder at skjule interne detaljer og styre adgang gennem metoder
- Felter skal altid være `private`
- *Getters* giver læseadgang til private felter
- *Setters* giver skriveadgang med mulighed for validering
- Private setters kan bruges til intern validering
- *Read-only felter* kan implementeres med `final` eller ved at undlade setters
- *Private hjælpemetoder* organiserer kompleks kode
- *API* er de `public` dele, som andre kan bruge
- *Implementeringsdetaljer* er de `private` dele
- God indkapsling gør kode mere robust, læsbar og vedligeholdbar

Indkapsling er et af de mest fundamentale principper i objektorienteret programmering. Det beskytter data, gør klasser lettere at bruge og giver fleksibilitet til at ændre implementeringen uden at påvirke brugere af klassen.
