---
title: 12 - Objekter med state og adfærd
---
<!-- .slide: class="cover-9" -->
#### Objekter med state *og* adfærd

---
<!-- .slide: class="o-sunlit-energy" -->

## Program:

- Objekter med tilstand *og* adfærd
- Øvelser
- Opsummering

---

Vi har set klasser anvendt som 
- **navnerum** til at gruppere relaterede metoder, fx `DistanceConverter`
- **egne datatyper**, fx `Contact`

--

Vi har set objekter, fx `Contact` anvendt som 
- databærere med felter, fx `name` og `email`
- *uforanderlige* (immutable) værdier

--

I dag skal vi 
- se på objekter, der både har tilstand *og* adfærd
- se på objekter, der kan ændre tilstand (er mutable)

--

Som eksempel skal vi lave en simpel bankapplikation

--

Spørgsmål: Hvad data har en bankkonto?

--
<!-- .slide: class="o-sunlit-energy" -->

DEMO: En simpel bankkonto med et kontonummer og en saldo

Notes:
```java
public class BankAccount {
    int accountNumber;
    double balance;
}
```
Lad os lave en konstruktor til `BankAccount`, der tager et kontonummer som parameter og sætter saldoen til 0.0
```java
public BankAccount(int accountNumber) {
    this.accountNumber = accountNumber;
    this.balance = 0.0;
}
```
Skal `accountNumber` være `final`? Hvorfor/hvorfor ikke?
Skal `balance` være `final`? Hvorfor/hvorfor ikke?
Nej, fordi den skal netop kunne ændres.

--

Jeg vil gerne kunne indsætte penge på kontoen
```java
BankAccount account = new BankAccount(337898);
account.balance = 100;
```

--

Jeg kunne også
```java
BankAccount account = new BankAccount(337898);
account.balance = 1000000000000000;
```

# 🤑

--

Kan I se problemet?

--

Vi må have regler for hvordan `balance` kan ændres

--

Lad os tilføje adfærd til `BankAccount`-klassen:
- en `deposit`-metode til at indsætte penge
- en `withdraw`-metode til at hæve penge

--

Hvilke regler skal der gælde for at hæve penge?

Notes:
- Der må ikke hæves mere end der er på kontoen

--

<!-- .slide: class="o-sunlit-energy" -->
DEMO: En simpel bankkonto

Notes:
```java
public class BankAccount {
    final int accountNumber;
    double balance;

    public BankAccount(String accountNumber) {
        this.accountNumber = accountNumber;
        this.balance = 0.0;
    }

    public void deposit(double amount) {
        balance += amount;
    }

    public boolean withdraw(double amount) {
        if (amount <= balance) {
            balance -= amount;
            return true;
        }
        return false;
    }
}
```

--

Spørgsmål: Hvorfor er der ingen `static` i `deposit` og `withdraw`?

--

Fordi de skal virke på en bestemt konto, dvs. et bestemt objekt.

--

Derfor skal de være instansmetoder, dvs. uden `static`.

```java
BankAccount account = new BankAccount(337898);
account.deposit(100);
account.withdraw(50);

BankAccount.withdraw(50); // fejl
BankAccount.deposit(100); // fejl
```

---
<!-- .slide: class="cover-5" -->
# Objekter som argumenter og returværdier

--

Vi har mødt mange metoder, der tager `String` som argument og/eller returværdi, fx

```java
public static String toUpperCase(String s) {
    // ...
}
```

--

```java
public static boolean transfer(BankAccount from, BankAccount to, double amount) {
    // ...
}
```

Bare tænk: `String` erstattet med `BankAccount` - de er begge reference-typer og objekter. Det samme gælder arrays af objekter.

---
<!-- .slide: class="cover-4" -->
# Arrays af objekter

--

Kan I huske String-arrays?

```java
String[] playlist = new String[3];
playlist[0] = "Lukas Graham - 7 Years";
playlist[1] = "Adele - Hello";
playlist[2] = "MØ - Final Song";

System.out.println(playlist[2]); // MØ - Final Song
```

--

Prøv med `BankAccount`-objekter

```java
BankAccount[] accounts = new BankAccount[3];
accounts[0] = new BankAccount(337898);
accounts[1] = new BankAccount(337899);
accounts[2] = new BankAccount(337900);

accounts[0].deposit(100);
System.out.println(accounts[0].balance); // 100.0
```

--

```java
for (String song : playlist) {
    System.out.println(song);
}
```

--

```java
for (BankAccount account : accounts) {
    System.out.println("Saldo på konto " + account.accountNumber + ": " + account.balance);
}
```

---

<!-- .slide: class="cover-4" -->
# Hvad er `null`

--

Kan I huske den med at en variabel er en navngivning af en plads i hukommelsen?

--

```java
int age;
System.out.println(age); // Fejl: variable age might not have been initialized

String name;
System.out.println(name); // Fejl: variable name might not have been initialized
```

Vi kan ikke kompilere, fordi `age` og `name` ikke er initialiseret.

--

Men med `null` kan vi have en variabel, der *ikke* peger på noget objekt, men er initialiseret

```java
String name = null;
System.out.println(name); // null
```

dvs. `name` peger ikke på noget `String`-objekt, men er stadig initialiseret.

--

Hvordan? Fordi `null` er en reference-værdi, der ikke peger på noget objekt.

På engelsk bruger vi ordet "pointer" for den pil, der peger på et objekt i hukommelsen. `null` er en "null pointer", dvs. en pil, der ikke peger på noget som helst.

--

`NullPointerException` (NPE) er en meget almindelig fejl i Java-programmering.
Det sker når vi prøver at bruge en variabel, der er `null`, som om den pegede på et objekt, fx

```java
String name = null;
System.out.println(name.length()); // NullPointerException
```

A.k.a. vi troede name var en `String`, som har en `length()` - men det havde den jo ikke, da den var `null`.

--

Alligevel er det meget udbredt at bruge `null` til at indikere "ingen værdi", fx i en metode, der skal returnere et objekt

```java
public static BankAccount findAccount(int accountNumber) {
    if ( /* account not found */ ) {
        return null; // ingen konto fundet
    }
    return new BankAccount(accountNumber); // konto fundet
}
```

--

og det er så vores ansvar at tjekke for `null`, når vi kalder metoden

```java
BankAccount account = findAccount(337898);
if (account != null) {
    System.out.println("Konto fundet: " + account.accountNumber);
} else {
    System.out.println("Konto ikke fundet");
}
```

--

Så i Java skal man ofte holde styr på om en variabel er `null` eller peger på et objekt 

--

## Garbage collector (GC)

--

Husker i stack'en og heap'en?

- primitive typer (int, double, boolean, ...) ligger i stack'en (lille)
- reference-typer (objekter) ligger i heap'en (stor)

--

Primitive typer slettes automatisk når de går **ud af scope**, fx 

```java
public static void foo() {
    int x = 42;
    // x eksisterer her
} 
// x eksisterer ikke her
```

--

```java
if (true) {
    double y = 3.14;
    // y eksisterer her
}
else {
    // y eksisterer ikke her
}
```

--

For reference-typer (objekter) er det anderledes.  Referencen (addressen) til et objekt ligger i stack'en og slettes når den går ud af scope

```java
public static void foo() {
    BankAccount account = new BankAccount(337898);
    // account eksisterer her og peger på et BankAccount-objekt i heap'en
}
// account-referencen eksisterer ikke her
```

... MEN objektet ligger stadig i heap'en og fylder plads, selvom vi ikke kan komme til det længere.

--

En anden måde at miste referencen til et objekt er at sætte variablen til `null`

```java
BankAccount account = new BankAccount(337898);
account = null; 
// nu peger account-referencen ikke længere på BankAccount-objektet
```

--

Eller sætte den til at pege på et andet objekt

```java
BankAccount account = new BankAccount(987654);
account = new BankAccount(123456); 
// nu peger account-referencen på et andet BankAccount-objekt
```

Nu kan vi ikke længere komme til det første `BankAccount`-objekt med kontonummer 987654.

--

Fylder vi så heap'en op med ubrugte objekter? (Tænk: rumskrot)

Nej, heldigvis har Java en flittig rengøringshjælp, der hedder garbage collector'en (GC).

--

## Garbage collector'en

- er en process, der kører i baggrunden i Java Virtual Machine (JVM)
- opdager objekter, der ikke længere er refereret af nogen variabel
- frigør heap-hukommelse ved at slette de ubrugte objekter

--

Har alle programmeringssprog en garbage collector?
Nej, fx C og C++ har ikke en garbage collector. I de sprog er det programmørens ansvar at frigøre hukommelse, når den ikke længere er nødvendig.

---

<!-- .slide: class="sunlit-energy" -->

Nævn tre ting du tager med fra i dag?