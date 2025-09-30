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

Spørgsmål: Har i hørt om transaktioner?

--

- Det at ændre saldo på en konto er en transaktion.
- Banker har brug for historik over transaktioner.
- Og mulighed for at kunne genkøre/annullere dem.

--

Transaktioner:
- hæve penge, `deposit(...)`
- indsætte penge, `withdraw(...)`
- tilskrive rente, `addInterest()`
- overføre penge, `transfer(...)`

--

Lad os lave en `Transaction` klasse.
Den skal kunne overføre penge mellem to konti.

```java
public class Transaction {
    private Date date;

    private double amount;
    private String description;
    private BankAccount fromAccount;
    private BankAccount toAccount;

    public Transaction(double amount, String description,
                       BankAccount fromAccount, BankAccount toAccount) {
        this.date = new Date();
        this.amount = amount;
        this.description = description;
        this.fromAccount = fromAccount;
        this.toAccount = toAccount;
    }
    public void execute() {
        fromAccount.withdraw(amount);
        toAccount.deposit(amount);
    }
}
```

--

Men hvordan håndterer vi en hæve-transaktion, hvor der kun er een konto?

Lad os extende `Transaction` til `WithdrawTransaction` og `DepositTransaction`

```java
public class WithdrawTransaction extends Transaction {
    public WithdrawTransaction(double amount, String description,
                               BankAccount fromAccount) {
        super(amount, description, fromAccount, null);
    }
}
```

--

Men hov... `execute()` metoden i `Transaction` virker jo ikke for `WithdrawTransaction` og `DepositTransaction`

--

Vi kan tjekke `toAccount` i `execute()` metoden på `Transaction` klassen

```java
public void execute() {
    fromAccount.withdraw(amount);
    if (toAccount != null) {
        toAccount.deposit(amount);
    }
}
```

--

Men nu blander vi logik for `WithdrawTransaction` og `DepositTransaction` ind i `Transaction` klassen.

--

Det er bedre at override `execute()` i subklasserne

```java
public class WithdrawTransaction extends Transaction {
    public WithdrawTransaction(double amount, String description,
                               BankAccount fromAccount) {
        super(amount, description, fromAccount, null);
    }
    @Override
    public void execute() {
        fromAccount.withdraw(amount);
    }
}
```

--

```java
public class DepositTransaction extends Transaction {
    public DepositTransaction(double amount, String description,
                              BankAccount toAccount) {
        super(amount, description, null, toAccount);
    }
    @Override
    public void execute() {
        toAccount.deposit(amount);
    }
}
```

--

Måske vi skulle have en abstrakt `Transaction` klasse, for `Transaction` giver ikke mening i sig selv.

`abstract` er et keyword i Java:

```java
public abstract class Transaction { // abstract klasse
    private Date date;
    private double amount;
    private String description;
    public Transaction(double amount, String description) {
        this.date = new Date();
        this.amount = amount;
        this.description = description;
    }
    public abstract void execute(); // abstract metode
}
```

--

```java
public class WithdrawTransaction extends Transaction {
    // ...
    @Override
    public void execute() {
        fromAccount.withdraw(amount);
    }
}
```

--

\- En abstrakt klasse kan ikke instantieres

```java
Transaction t = new Transaction(100, "test"); // FEJL!
```

--

\- En abstrakt metode skal overrides i subklasser

```java
public abstract class Transaction {
    // ...
    public abstract void execute();
}
```

```java
public class WithdrawTransaction extends Transaction {
    // ...
    @Override
    public void execute() {
        fromAccount.withdraw(amount);
    }
}
```

--

\- En abstrakt klasse kan have både abstrakte og konkrete metoder

```java
public abstract class Transaction {
    private Date date;
    private double amount;
    private String description;
    public Transaction(double amount, String description) {
        this.date = new Date();
        this.amount = amount;
        this.description = description;
    }
    public abstract void execute(); // abstrakt
    public String getDescription() { // konkret
        return description;
    }
}
```

--

\- En abstrakt metode kan kun være i en abstrakt klasse

--

Var det lige lidt for `abstract`?

---
<!-- .slide: class="cover-4" -->
# is-a vs has-a

--

Kan i huske at vi talte om en "has-a" relation, da vi havde om komposition?

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