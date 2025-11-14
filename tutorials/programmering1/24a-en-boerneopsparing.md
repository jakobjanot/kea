# En børneopsparing

Vi skal lave en ny type bankkonto, en børneopsparing, som er en slags opsparingskonto, dvs. hvor der bliver tilskrevet rente. Men der er en vigtig forskel: på en børneopsparing må man ikke hæve penge.

For at illustrere problemet, kan vi starte med at lave en børneopsparingskonto som en underklasse til `SavingsAccount`, du kender fra tidligere:

```java
public abstract class BankAccount {
    private double balance;

    public BankAccount(double balance) {
        this.balance = balance;
    }

    public void deposit(double amount) {
        setBalance(balance + amount);
    }

    public void withdraw(double amount) {
        setBalance(balance - amount);
    }

    public double getBalance() {
        return balance;
    }

    protected void setBalance(double balance) {
        this.balance = balance;
    }
}

public class CheckingAccount extends BankAccount {
    public CheckingAccount(double balance) {
        super(balance);
    }
}

public class SavingsAccount extends BankAccount {
    private double interestRate;

    public SavingsAccount(double balance, double interestRate) {
        super(balance);
        this.interestRate = interestRate;
    }

    void applyInterest() {
        setBalance(balance + balance * interestRate);
    }
}

public class ChildrensAccount extends SavingsAccount {
    public ChildrensAccount(double balance) {
        super(balance, 0.01); // 1% rente
    }
}
```

1. Lav et nyt IntelliJ-projekt med git og navngiv det `banking`.
2. Opret de tre klasser `BankAccount`, `SavingsAccount` og `ChildrensAccount` som vist ovenfor.
3. Lav et commit og push til GitHub.
4. Lav en `Main`-klasse med en `main`-metode, hvor du opretter to `SavingsAccount`-objekter og et `ChildrensAccount`-objekt.
5. Lav nu en metode `transfer(BankAccount from, BankAccount to, double amount)`, som hæver `amount` fra `from`-kontoen og indsætter det på `to`-kontoen.
6. Prøv at overføre penge fra en `SavingsAccount` til en `ChildrensAccount` ved at kalde `transfer`-metoden. Det virker fint. Men det burde jo ikke være muligt at hæve penge fra en børneopsparing!
7. Forklar, hvorfor det er muligt at hæve penge fra en `ChildrensAccount`, selvom vi ikke ønsker det.