---
title: 14 - Komposition
---
<!-- .slide: class="cover-10" -->
#### Komposition

---
<!-- .slide: class="o-sunlit-energy" -->

## Program:

- Lidt repetition
- Komposition
- Øvelser
- Opsummering

---

<!-- .slide: class="cover-4" -->
# Arrays af objekter

--
Vi kan lave arrays af objekter, fx `BankAccount`-objekter

```java
BankAccount[] accounts = new BankAccount[3];
accounts[0] = new BankAccount(337898);
accounts[1] = new BankAccount(337899);
accounts[2] = new BankAccount(337900);

accounts[0].deposit(100);
System.out.println(accounts[0].balance); // 100.0
```
--

og vi kan iterere over dem med en for-each løkke

```java
for (BankAccount account : accounts) {
    System.out.println("Saldo på konto " + account.accountNumber + ": " + account.balance);
}
```

---

<!-- .slide: class="cover-4" -->
# Hvordan var det nu med `null`

--

Objekter er reference-typer

--

En variabel indeholder en reference eller pegepil (eng: pointer) til et objekt i hukommelsen

--

`null` er en speciel reference-værdi, `null` pointer, der ikke peger (eng: points) på noget objekt

--

Derfor er det tilladt at initialisere en `BankAccount`-variabel med `null`
```java
BankAccount account = null;
```

--

og det er tilladt at have `null` i et array af objekter
```java
BankAccount[] accounts = new BankAccount[3];
accounts[0] = new BankAccount(337898);
accounts[1] = null; // ingen konto
accounts[2] = new BankAccount(337900);
```

--

Faktisk er alle elementer i et array af objekter `null`, indtil vi sætter dem til noget andet

```java
BankAccount[] accounts = new BankAccount[3];
System.out.println(accounts[0]); // null
System.out.println(accounts[1]); // null
System.out.println(accounts[2]); // null
```
---

Vi skal derfor huske at tjekke for `null`, før vi bruger en variabel, der peger på et objekt, fx

```java
BankAccount[] accounts = new BankAccount[3];
accounts[0] = new BankAccount(337898);
accounts[1] = null; // ingen konto
accounts[2] = new BankAccount(337900);

for (BankAccount account : accounts) {
    if (account != null) {
        System.out.println("Saldo " + account.balance);
    }
}
```

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

---
<!-- .slide: class="cover-4" -->

# Relationer mellem klasser

--

Vi havde en `BankAccount`-klasse

```java
public class BankAccount {
    int accountNumber;
    double balance;
}
```
--

Lad os give kontoen en ejer

Hvordan kunne en `Owner`-klasse se ud?

--
<!-- .slide=class="o-sunlit-energy" -->

DEMO Vi giver `BankAccount` en ejer `Owner`

Notes:
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

```java
public class BankAccount {
    int accountNumber;
    double balance;
    Owner owner;

    public BankAccount(int accountNumber) {
        this.accountNumber = accountNumber;
        this.balance = 0.0;
        this.owner = null;
    }
}
```

Og nu kan vi lave en konto med en ejer

```java
Owner owner = new Owner("Hanne Hansen", "hanne@example.com");
BankAccount account = new BankAccount(337898);
account.owner = owner;
System.out.println(account.owner.name); // Hanne Hansen
```

--

Det er svært at forestille sig en bankkonto uden en ejer. En konto kan faktisk ikke eksistere uden en ejer.

--

Lad os gøre det obligatorisk at angive en ejer, når vi laver en konto

--
<!-- .slide: class="o-sunlit-energy" -->
DEMO: Gør `Owner` obligatorisk for `BankAccount`

Notes:
Tilføj en `Owner`-parameter til konstruktøren
```java
public BankAccount(int accountNumber, Owner owner) {
    this.accountNumber = accountNumber;
    this.balance = 0.0;
    this.owner = owner; // krævet
}
```

Gør `owner`-feltet `final`, så det ikke kan ændres efterfølgende

--

Der er flere måder, hvorpå klasser har relationer til hinanden. 

--

Komposition er når et objekt "har et" (**has-a**) andet objekt som en del af sin tilstand (state).

--

En konto kan **ikke eksistere uden** en ejer.

Vi kalder det et "stærkt ejerskab" (strong ownership) - et kendetegn ved komposition.

---

<!-- .slide: class="sunlit-energy" -->

Nævn tre ting du tager med fra i dag?