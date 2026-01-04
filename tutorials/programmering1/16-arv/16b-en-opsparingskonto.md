# En opsparingskonto med arv
Nu skal vi anvende arv til at lave en opsparingskonto, der arver fra den almindelige bankkonto.
Arv er en måde, hvorpå man kan genbruge kode i klasser. En subklasse (underklasse) arver felter og metoder fra en superklasse (overklasse), så vi ikke behøver at skrive den samme kode igen (DRY - Don't Repeat Yourself plejer vi at sige).

1. Fortsæt med projektet `account-types` fra forrige tutorial.
2. Opret en ny klasse `SavingsAccount`, der arver fra `BankAccount`.
9. En `SavingsAccount` skal have et ekstra felt `interestRate` (rentesatsen i procent, fx 0.05 for 5%).
10. Lav en konstruktør, der initialiserer alle felterne (inkl. dem fra `BankAccount`, fx
    ```java
    public SavingsAccount(int accountNumber, 
                          double interestRate) {
         this.accountNumber = accountNumber;
         this.interestRate = interestRate;
    }
    ```
11. Virker det? Nej, fordi `accountNumber` og `balance` er `private` i `BankAccount`, så vi kan ikke tilgå dem direkte. Vi kan ændre access modifieren på felterne i `BankAccount` til `protected`, så de kan tilgås fra subklasser.
12. Virker det nu?
13. Vi kunne have valgt en anden tilgang. Prøv at ændre access modifieren på felterne i `BankAccount` tilbage til `private`. Vi kan istedet kalde superklassens `BankAccount`s konstruktør vha. `super(...)` fra `SavingsAccount`s konstruktør, fx
    ```java
    public SavingsAccount(int accountNumber, 
                          double interestRate) {
         super(accountNumber);
         this.interestRate = interestRate;
    }
    ```
    Virker det nu?
13. Nu skal vi tilføje den metode, der gør opsparingskontoen særlig, idet den kan tilføje renter til kontoen. Lav en `applyInterest`-metode, der tilføjer renter til kontoen, fx
    ```java
    public void applyInterest() {
         double interest = getBalance() * interestRate;
         deposit(interest);
    }
    ```
12. Lav en `Main`-klasse med en `main`-metode, hvor du tester at det virker, fx
    ```java
    public class Main {
        public static void main(String[] args) {
            SavingsAccount sa = new SavingsAccount(12345678, 0.05);
            System.out.println(sa);
            sa.deposit(1000);
            System.out.println(sa);
            sa.applyInterest();
            System.out.println(sa);
            sa.withdraw(200);
            System.out.println(sa);
        }
    }
    ```
    