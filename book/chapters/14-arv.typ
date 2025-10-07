= Arv

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
