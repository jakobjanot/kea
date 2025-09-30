---
title: 15 - Indkapsling
---
<!-- .slide: class="cover-12" -->
#### Indkapsling

---
<!-- .slide: class="o-sunlit-energy" -->

## Program:

- Acccess modifiers
- Indkapsling
- Getter og Setter metoder
- Application Programming Interface (API)
- Øvelser
- Opsummering

---

<!-- .slide: class="cover-3" -->
# Access Modifiers

--
<!-- .slide: class="large" -->
So far, har vi brugt `public` til alt

- klasser:
```java
public class BankAccount { // public class
    public double balance; // public field

    public BankAccount(int accountNumber) { // public constructor
        this.accountNumber = accountNumber;
        this.balance = 0.0;
    }

    public void deposit(double amount) { // public method
        this.balance += amount;
    }
}
```

--

`public` er en access modifier (dan: adgangsmodifikator)

--

Java har fire access modifiers:

- `public` betyder at alle kan se og bruge det
- `private` betyder at kun klassen selv kan se og bruge det
- `protected` betyder at kun klassen selv og dens subklasser kan se og bruge det
- (default) betyder at kun klassen selv og klasser *i samme pakke* kan se og bruge det

--

Måske har du set `private` før - ved et uheld

--
<!-- .slide: class="o-sunlit-energy" -->
## DEMO - Extract method i IntelliJ

Notes:
- Bruger man Extract method, så bliver den nye metode `private` som default
- Det er fordi det er en god ide at gøre metoder `private` som default, og så gøre dem `public` hvis det er nødvendigt

---
<!-- .slide: class="cover-7" -->

# Hvorfor indkapsling?

--

<!-- .slide: class="x-large" -->
Kan i huske bankkonto eksemplet?

```java
public class BankAccount {
    public int accountNumber;
    public double balance;
}
```

--

<!-- .slide: class="x-large" -->
Vi kan oprette en bankkonto og ændre dens saldo direkte

```java
BankAccount account = new BankAccount(337898);
account.balance = -1000.0; // uh oh, negativ saldo!
```

--
<!-- .slide: class="large" -->

Så lavede vi en `deposit` og `withdraw` metode for at undgå det

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

--

<!-- .slide: class="large" -->

De metoder sikrer at saldoen ikke kan blive negativ

```java
BankAccount account = new BankAccount(337898);
account.deposit(1000.0);
account.withdraw(500.0); // OK
account.withdraw(600.0); // ikke OK, saldoen er kun 500.0

account.deposit(-200.0); // ikke OK, kan ikke indsætte negative beløb
```

--

<!-- .slide: class="x-large" -->
MEN - vi kan stadig ændre saldoen direkte

```java
BankAccount account = new BankAccount(337898);
account.balance = -1000.0; // uh oh, negativ saldo!
```

--

Det er her indkapsling kommer ind i billedet

--

I al fremtid: Gør felter `private`

--

<!-- .slide: class="large" -->

**Før:**
```java
public class BankAccount {
    public int accountNumber;
    public double balance;
}
```
**Nu:**
```java
public class BankAccount {
    private int accountNumber;
    private double balance;
}
```

--

Ellers ligner resten af klassen sig selv

```java
public class BankAccount {
    private int accountNumber;
    private double balance;

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

--
<!-- .slide: class="large" -->

Nu kan vi ikke længere ændre `balance` direkte

```java
BankAccount account = new BankAccount(337898);
account.balance = -1000.0; // fejl! balance er utilgængelig
```
men vi kan stadig ændre den via `deposit` og `withdraw`

```java
account.deposit(500.0); // OK
account.withdraw(200.0); // OK
```

---
<!-- .slide: class="cover-9" -->
# Getter og Setter metoder

--

<!-- .slide: class="x-large" -->
Hvordan får vi adgang til `balance` og `accountNumber` nu?

```java
BankAccount account = new BankAccount(337898);
System.out.println(account.balance); // fejl! balance er utilgængelig
```

--

Løsningen er at lave getter og setter metoder

--
<!-- .slide: class="o-sunlit-energy" -->

## DEMO - getters og setters

--

```java
public class BankAccount {
    private int accountNumber;
    private double balance;

    // ... konstruktør, deposit, withdraw ...

    public int getAccountNumber() {
        return this.accountNumber;
    }

    public void setAccountNumber(int accountNumber) {
        this.accountNumber = accountNumber;
    }

    public double getBalance() {
        return this.balance;
    }

    public void setBalance(double balance) {
        if (balance >= 0) {
            this.balance = balance;
        }
    }
}
```

--

<!-- .slide: class="large" -->

Nu kan vi få adgang til `balance` og `accountNumber` via getters

```java
BankAccount account = new BankAccount(337898);
System.out.println(account.getBalance()); // 0.0
account.deposit(500.0);
System.out.println(account.getBalance()); // 500.0
System.out.println(account.getAccountNumber()); // 337898
```

--

<!-- .slide: class="x-large" -->
Men vi kan også ændre dem via setters

```java
BankAccount account = new BankAccount(337898);

account.setBalance(1000.0); // OK
account.setAccountNumber(123456); // OK
```

Argh...

--

Det har vi set før

Spørgsmål: Hvordan gør vi accountNumber skrivebeskyttet (read-only)?

Notes:
- Vi kan fjerne setAccountNumber metoden og gøre accountNumber til en konstant (final)
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

    // ... resten af klassen ...
}

--

Spørgsmål: Skal vi gøre balance til en konstant (final)?

Notes:
- Nej, fordi saldoen skal kunne ændres når vi indsætter eller hæver penge

--

Trick: Vi gør `setBalance` metoden `private`

```java
public class BankAccount {
    private int accountNumber;
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
        this.balance = balance;
    }

    // ... deposit og withdraw ...
}
```

--

<!-- .slide: class="large" -->
Nu kan vi kun ændre `balance` via `deposit` og `withdraw`

```java
BankAccount account = new BankAccount(337898);
account.setBalance(1000.0); // fejl! setBalance er private
account.deposit(500.0); // OK
account.withdraw(200.0); // OK
```

--

Hvad skal vi så med en `setBalance` metode?

--

<!-- .slide: class="large" -->
```java
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

private void setBalance(double balance) {
    this.balance = balance;
}
```

--

kan vi forenkle `deposit` og `withdraw` ved at flytte valideringen til `setBalance`?

--

<!-- .slide: class="large" -->
```java
public void deposit(double amount) {
    setBalance(this.balance + amount);
}

public void withdraw(double amount) {
    setBalance(this.balance - amount);
}

private void setBalance(double balance) {
    if (balance >= 0) {
        this.balance = balance;
    }
}
```

Ja, det kan vi. Snedigt - ik?

---

Følgende er ikke eksamensrelevant - men blot til reflektion

--
<!-- .slide: class="cover-1" -->
# API

--

Spørgsmål: Har nogen af jer hørt om **API** før?

--

API står for **A**pplication **P**rogramming **I**nterface

--

Et API er en samling af klasser, metoder og felter, **som udstilles for andre udviklere**, så de kan bruge dem i deres programmer

--

`public` klasser, metoder og felter er API'et,  
**som udviklere der bruger klassen** kan se og bruge

--

`private` klasser, metoder og felter er   
**implementation detaljer**, som kun klassen selv bruger

--

I vores `BankAccount` eksempel er flg. en del af vores API:
- klassen `BankAccount` (da den er `public`)
- konstruktøren `BankAccount(int accountNumber)` (da den er `public`)
- metoderne 
  - `getAccountNumber()`, 
  - `getBalance()`, 
  - `deposit(double amount)` og 
  - `withdraw(double amount)` ... da de er `public`

--

Spørgsmål: Kan vi ikke bare gøre alt `public`   
og så lade brugeren om at bruge det *rigtigt*?

--

# Nej!

--

**Nej**, fordi:

- Det er svært at forstå/bruge et API korrekt, hvis alt er `public`
- Det er svært at ændre et API, hvis alt er `public`
- Vi kan utilsigtet bryde kode, der bruger vores API, hvis alt er `public`
- Vi er nødt til at lægge alt kode i den metode, der bruger det, hvis alt er `public`

--

<!-- .slide: class="large" -->
```java
private void setBalance(double balance) {
    if (balance >= 0) {
        this.balance = balance;
    }
}
```

... hvis `setBalance(...)` var `public`,  
hvorfor bruge `deposit(...)` og `withdraw(...)`?

--

<!-- .slide: class="large" -->
Vi kan ændre reglerne for hvordan `balance` opdateres, *uden* at bryde kode, der bruger vores API, fx

```java
private void setBalance(double balance) {
    if (balance >= 0 && balance <= 1_000_000) { // max saldo 1 million
        this.balance = balance;
    }
}
```

---
<!-- .slide: class="cover-11" -->

# Versionering af API'er

--

Når vi ændrer et API, skal vi overveje om ændringen er **bagud kompatibel** eller ej

--

- En **bagud kompatibel** ændring betyder at kode, der bruger API'et, stadig virker uden ændringer
- En **ikke bagud kompatibel** ændring betyder at kode, der bruger API'et, skal ændres for at virke med den nye version af API'et

--

I software udvikling, er det almindeligt at vise om en ny version af et API er bagud kompatibel eller ej ved hjælp af versionsnumre

--

Semver (semantisk versionering) bruger tre tal:
- version 1.0.0
- version 1.1.0 (bagud kompatibel ændring af version 1.0.0)
- version 1.1.1 (bagud kompatibel **fejlrettelse** af version 1.1.0)
- version 2.0 (*ikke* bagud kompatibel ændring af version 1.1)

--

- -> 2.0.1 (fejlrettelser, bagud kompatibel)
- -> 2.1.0 (ny feature, bagud kompatibel)
- -> 2.0.0 (breaking change)

--

Så ja, rigtige udviklere tænker over hvilke dele af deres kode, der skal være `public` og hvilke der skal være `private`

---

<!-- .slide: class="sunlit-energy" -->

Nævn tre ting du tager med fra i dag?