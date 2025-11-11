# Undtagelsen

Kan du huske vores `BankAccount`-klasse fra tidligere? Den så groft set sådan her ud:

```java
public class BankAccount {
    private double balance;

    public BankAccount(double initialBalance) {
        balance = initialBalance;
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

    private void setBalance(double balance) {
        if (balance > 0) {
            this.balance = balance;
        }
    }
}
```
1. Lav et nyt Intellij-projekt med tilhørende git repo (sæt flueben i **Create git repository**) og opret `BankAccount`-klassen som vist ovenfor samt en `Main`-klasse med en `main`-metode.
2. Tryk på `Git`-fanen i højre side og lav et commit med en besked du selv vælger.
3. Opret et nyt repository på GitHub (uden README-fil) - copyér URL'en til dit nye repo.
4. Tryk på `Push`-knappen og vælg `Define remote` - indsæt URL'en til dit GitHub-repo og tryk `OK` og derefter `Push` igen for at uploade dit projekt til GitHub.
5. Test `BankAccount`-klassen med følgende kode i din `main`-metode. Hvad sker der?
   ```java
   BankAccount account = new BankAccount(1000);
   account.withdraw(-500);
   ```
   Svar: Ikke noget. Og programmøren der bruger klassen får ingen advarsel om, at noget gik galt.
6. Ændr `setBalance`-metoden, så den kaster en `IllegalArgumentException`, hvis `balance` er negativ:
   ```java
   private void setBalance(double balance) {
       if (balance < 0) {
           throw new IllegalArgumentException(
                "Balance cannot be negative");
       }
       this.balance = balance;
   }
   ```
7. Test igen med samme kode i `main`-metoden. Hvad sker der nu?
   Svar: Programmet crasher med en `IllegalArgumentException`.
8. Håndter undtagelsen i `main`-metoden med en `try-catch`-blok, så programmet i stedet udskriver en fejlbesked:
   ```java
   public static void main(String[] args) {
       BankAccount account = new BankAccount(1000);
       try {
           account.withdraw(-500);
       } catch (IllegalArgumentException e) {
           System.out.println("Fejl: " + e.getMessage());
       }
   }
   ```
9. Lav et commit med en passende besked og push til GitHub.
