---
title: 16 - Arv
---
<!-- .slide: class="cover-12" -->
#### Arv

---
<!-- .slide: class="o-sunlit-energy" -->

## Program:

- Arv
- Overriding
- Abstrakte klasser og metoder
- is-a vs has-a
- Øvelser
- Opsummering

---

<!-- .slide: class="cover-3" -->
# Arv

--

Arv i Java er en anden måde at genbruge kode på.

--

Arv i Java gør det muligt at oprette nye klasser baseret på eksisterende klasser.

--

Hvis vi tager udgangspunkt i vores bank-eksempel.  
Banker har brug for forskellige typer konti, med forskellige regler:
- Opsparingskonto, kan ikke overskride saldoen, har rente-tilskrivning
- Kreditkonto, kan overskride saldoen, rente på overskredet beløb

--

Hvad kan en opsparingskonto, betalingskonto og kreditkonto have tilfælles?
- Alle har et kontonummer
- Alle har en saldo
- Alle kan indsætte penge
- Alle kan hæve penge

--

Vi kan lave en generel `BankAccount` klasse, som har de fælles ting.

```java
public class BankAccount {
    private int accountNumber;
    private double balance;
    // ...
}
```

--

Vi kan så lave specifikke kontotyper, som arver de fælles ting fra `BankAccount` klassen.

```java
public class CheckinAccount extends BankAccount {
    private double interestRate;
    // ...
}
```

--

`extends` betyder, at `SavingsAccount` arver `BankAccount`s felter og metoder, så

```java
SavingsAccount account = new SavingsAccount(1245678, 0.05);
account.deposit(2000); // fra BankAccount
account.withdraw(500); // fra BankAccount
System.out.println(account.getBalance()); // fra BankAccount
account.addInterest(); // NY! fra SavingsAccount
```

--
<!-- .slide: class="o-sunlit-energy" -->
DEMO SavingsAccount extends BankAccount. 
\- der kan tilskrive rente

Notes:

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

    private void setBalance(double balance) {
        this.balance = balance;
    }
}


public class SavingsAccount extends BankAccount {
    private double interestRate;

    public SavingsAccount(int accountNumber, double interestRate) {
        super(accountNumber);
        this.interestRate = interestRate;
    }

    public void addInterest() {
        double interest = getBalance() * interestRate;
        deposit(interest);
    }

    // her kommer overriding eksemplet senere
}
```

--

Konstruktøren i `SavingsAccount`:

```java
public SavingsAccount(int accountNumber, double interestRate) {
    super(accountNumber);
    this.interestRate = interestRate;
}
```

hvad er `super(...)`?

--

- `BankAccount` er **super**klasse til `SavingsAccount`
- `SavingsAccount` er **sub**klasse til `BankAccount`

--

```java
public SavingsAccount(int accountNumber, double interestRate) {
    super(accountNumber); // kalder BankAccount constructor
    this.interestRate = interestRate;
}
```

--

... for `BankAccount` konstruktøren initialiserer jo `accountNumber` feltet

```java
public BankAccount(int accountNumber) {
    this.accountNumber = accountNumber;
    this.balance = 0.0;

    public BankAccount(int accountNumber) {
        this.accountNumber = accountNumber;
        this.balance = 0.0;
    }

    // ...
}
```

---
<!-- .slide: class="cover-2" -->
# Overriding

--

Vi kan overskrive metoder i superklassen, ved at lave en metode med samme signatur i subklassen.

--

Nyt krav: En opsparingskonto må ikke have negativ saldo.

--

Spørgsmål: Hvordan kan vi sikre det?

--
<!-- .slide: class="o-sunlit-energy" -->
DEMO Overriding setBalance

Notes:

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

    private void setBalance(double balance) {
        this.balance = balance;
    }
}

public class SavingsAccount extends BankAccount {
    private double interestRate;

    public SavingsAccount(int accountNumber, double interestRate) {
        super(accountNumber);
        this.interestRate = interestRate;
    }

    public void addInterest() {
        double interest = getBalance() * interestRate;
        deposit(interest);
    }

    @Override
    private void setBalance(double balance) {
        if (balance >= 0) {
            super.setBalance(balance);
        }
    }
}

```


Hmm... det kan vi jo ikke, for `setBalance(...)` er `private` i `BankAccount`.
--

Vi skal lige genbesøge access modifiers.

--

- `public` betyder, at feltet/metoden er tilgængelig overalt
- `private` betyder, at feltet/metoden kun er tilgængelig i den klasse, hvor den er defineret.
- `protected` betyder, at feltet/metoden er tilgængelig i den klasse, hvor den er defineret, samt **i subklasser** !!!

--

Så vi må ændre `setBalance(...)` i `BankAccount` til `protected`

```java
public class BankAccount {
    // ...
    protected void setBalance(double balance) {
        this.balance = balance;
    }
}
```

```java
public class SavingsAccount extends BankAccount {
    // ...
    @Override
    protected void setBalance(double balance) {
        if (balance >= 0) {
            super.setBalance(balance);
        }
    }
}
```

--
<!-- .slide: class="o-sunlit-energy" -->

DEMO Overriding setBalance ...igen

Notes:

```java
p```java
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

public class SavingsAccount extends BankAccount {
    private double interestRate;

    public SavingsAccount(int accountNumber, double interestRate) {
        super(accountNumber);
        this.interestRate = interestRate;
    }

    public void addInterest() {
        double interest = getBalance() * interestRate;
        deposit(interest);
    }

    @Override
    protected void setBalance(double balance) {
        if (balance >= 0) {
            super.setBalance(balance);
        }
    }
}
```

---
<!-- .slide: class="cover-1" -->
#### Abstrakte klasser og metoder

--

Spørgsmål: Findes der overhovedet en "basis" bankkonto?

--

Måske skulle vi gøre `BankAccount` abstrakt.

`abstract` er et keyword i Java:

```java
public abstract class BankAccount { // abstract klasse
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

--

```java
public class SavingsAccount extends BankAccount {
    private double interestRate;

    public SavingsAccount(int accountNumber, double interestRate) {
        super(accountNumber);
        this.interestRate = interestRate;
    }

    public void addInterest() {
        double interest = getBalance() * interestRate;
        deposit(interest);
    }

    @Override
    protected void setBalance(double balance) {
        if (balance >= 0) {
            super.setBalance(balance);
        }
    }
}
```

--

Hvad er nyt? En abstrakt klasse kan ikke instantieres

```java
BankAccount account = new BankAccount(123456); // FEJL: Kan ikke instantieres
SavingsAccount savingsAccount = new SavingsAccount(123456, 0.05); // OK
```

---

<!-- .slide: class="cover-2" -->

## Polymorfisme

--

Vi kan have en variabel af typen `BankAccount`, som refererer til et `SavingsAccount` objekt.

```java
BankAccount account = new SavingsAccount(123456, 0.05);
account.deposit(1000);
account.addInterest(); // FEJL: addInterest() er ikke i BankAccount
```

--

Hvornår er polymorfisme nyttigt?

--

```java
BankAccount[] accounts = new BankAccount[3];
accounts[0] = new SavingsAccount(123456, 0.05);
accounts[1] = new CheckinAccount(234567, 0.01);
accounts[2] = new SavingsAccount(345678, 0.03);
```

--

```java
BankAccount[] accounts = new BankAccount[3];
accounts[0] = new SavingsAccount(123456, 0.05);
accounts[1] = new CheckinAccount(234567, 0.01);
accounts[2] = new SavingsAccount(345678, 0.03);

for (BankAccount account : accounts) {
    account.deposit(1000);
}
```

--

Men...

```java
BankAccount[] accounts = new BankAccount[3];
accounts[0] = new SavingsAccount(123456, 0.05);
accounts[1] = new CheckinAccount(234567, 0.01);
accounts[2] = new SavingsAccount(345678, 0.03);

for (BankAccount account : accounts) {
    account.addInterest(); // FEJL: addInterest() er ikke i BankAccount
}
```
--

Vi kan ikke kalde `addInterest()` på en `BankAccount` reference, selvom det faktisk er et `SavingsAccount` objekt.

---

<!-- .slide: class="cover-6" -->

## `instanceof` operatoren

--

Vi kan bruge `instanceof` operatoren til at tjekke, om et objekt er en instans af en bestemt klasse.

--

```java
BankAccount[] accounts = new BankAccount[3];
accounts[0] = new SavingsAccount(123456, 0.05);
accounts[1] = new CheckinAccount(234567, 0.01);
accounts[2] = new SavingsAccount(345678, 0.03);

for (BankAccount account : accounts) {
    if (account instanceof SavingsAccount) {
        SavingsAccount savingsAccount = (SavingsAccount) account; // typecasting
        savingsAccount.addInterest();
    }
}
```

---

<!-- .slide: class="cover-3" -->

## Abstrakte metoder

--

En abstrakt klasse kan have både abstrakte og konkrete metoder

--

En abstrakt metode er en metode, som ikke har en implementation, og som skal implementeres i subklasser.

```java
public abstract class BankAccount {
    // ...
    public abstract void addInterest(); // abstrakt metode
}

public class SavingsAccount extends BankAccount {
    // ...
    @Override
    public void addInterest() {
        double interest = getBalance() * interestRate;
        deposit(interest);
    }
}   
```

--

En abstrakt metode kan kun være i en abstrakt klasse

--

Var det lige lidt for `abstract`?

---
<!-- .slide: class="cover-4" -->
# is-a vs has-a

--

Kan i huske at vi talte om en "has-a" association, da vi havde om komposition?

--

En bil har en motor - klassen `Car` **has-a** `Engine`.

```java
public class Car {
    private Engine engine;
    // ...
}
```

--

En bil er et køretøj - klassen `Car` **is-a** `Vehicle`.

```java
public class Car extends Vehicle {
    // ...
}
```

--

Relationer mellem klasser:

- `has-a` relation er komposition
- `is-a` relation er arv

---

<!-- .slide: class="sunlit-energy" -->

Nævn tre ting du tager med fra i dag?