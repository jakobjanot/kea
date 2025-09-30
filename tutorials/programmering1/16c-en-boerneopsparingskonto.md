# En børneopsparing

Man kan også lave en børneopsparing, der er en speciel type opsparingskonto, hvor man ikke kan hæve penge, før barnet fylder 18 år. Det er et eksempel på *flere niveauer af arv*, idet `ChildrensSavingsAccount` arver fra `SavingsAccount`, der igen arver fra `BankAccount`.

1. Fortsæt med projektet `account-types` fra forrige tutorial.
2. Opret en ny klasse `ChildrensSavingsAccount`, der arver fra `SavingsAccount`.
3. En `ChildrensSavingsAccount` skal have et ekstra felt `ownerBirthDate` (fødselsdatoen på kontoejeren) af typen `LocalDate`.
4. Lav en konstruktør, der initialiserer alle felterne (inkl. dem fra `SavingsAccount` og `BankAccount`), prøv selv - det ligner meget den konstruktør, du lavede i `SavingsAccount`.
5. Ret `withdraw`-metoden, der overskriver `withdraw`-metoden i klassen, den arver fra, så den kun tillader hævning, hvis kontoejeren er voksen (18 år eller ældre). Du kan måske bruge nogle ideer fra din `isAdult`-metode som du implementered i en tidligere øvelse.
6. Lav en `Main`-klasse med en `main`-metode, hvor du tester at det virker, fx
    ```java
    public class Main {
        public static void main(String[] args) {
            ChildrensSavingsAccount csa = 
                new ChildrensSavingsAccount(
                    "12345678", 
                    0.05, 
                    LocalDate.of(2015, 1, 1));
            System.out.println(csa);
            csa.deposit(1000);
            System.out.println(csa);
            csa.addInterest();
            System.out.println(csa);
            csa.withdraw(200); // virker ikke
            System.out.println(csa);

            // prøv at lave en ChildrensSavingsAccount med en voksen ejer
            ChildrensSavingsAccount csa2 = 
                new ChildrensSavingsAccount(
                    "87654321", 
                    0.05, 
                    LocalDate.of(2000, 1, 1));
            System.out.println(csa2);
            csa2.deposit(1000);
            System.out.println(csa2);
            csa2.addInterest();
            System.out.println(csa2);
            csa2.withdraw(200); // virker
            System.out.println(csa2);
        }
    }
    ```
