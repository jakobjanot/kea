# En almindelig bankkonto

Lad os starte med at lave en almindelig bankkonto, der kan sætte penge ind og hæve penge - og repetere hvad vi har lært om klasser, felter, metoder, konstruktører og indkapsling.

1. Opret et nyt IntelliJ-projekt `account-types`.
2. Start på ny med at lave en `BankAccount`-klasse, hvor du gør brug af indkapsling, dvs. skjul felter vha. `private` og brug istedet `getter` og `setter`-metoder til at tilgå og ændre felterne.
3. Tilføj to felter: `balance` og `accountNumber`.
4. Lav en konstruktør, der initialiserer felterne.
5. Lav getter/setter-metoder til felterne, overvej hvilke der skal være `public` og hvilke der skal være `private`, eksempel:
    ```java
    public double getBalance() {
         return balance;
    }
    
    private void setBalance(double balance) {
         this.balance = balance;
    }
    ```
    Bemærk, at du *ikke* skal tjekke om `balance` er negativ i `setBalance`.
6. Tilføj en `deposit` og en `withdraw`-metode, der sætter penge ind og hæver penge fra kontoen, eksempel:
    ```java
    public void deposit(double amount) {
         if (amount > 0) {
             setBalance(getBalance() + amount);
         }
    }
    ```
7. Tilføj en `toString`-metode, der returnerer en tekstbeskrivelse af kontoen, fx `"Konto 3267: 1000.0 kr."`.
8. Prøv at teste `BankAccount`-klassen i en `Main`-klasse med en `main`-metode, fx
    ```java
    public class Main {
        public static void main(String[] args) {
            BankAccount ba = new BankAccount(3267);
            System.out.println(ba); // Konto 3267: 0.0 kr.
            ba.deposit(500);
            System.out.println(ba); // Konto 3267: 500.0 kr.
            ba.withdraw(700);
            System.out.println(ba); // Konto 3267: -200.0 kr.
        }
    }
    ```