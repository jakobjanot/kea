# Konti med interfaces

Fortsæt på IntelliJ-projektet `banking`, som du lavede i den forrige øvelse.
Vi vil nu ændre designet, så vi bruger interfaces i stedet for arv til at modellere de forskellige kontotyper.

Du skal bruge de samme tre kontotyper som før: `BankAccount`, `SavingsAccount` og `ChildrensAccount`, men ændre dem så de implementerer tre interfaces: `Depositable`, `Withdrawable` og `InterestBearing`.

1. Opret tre interfaces med de nævnte navne og de relevante metoder:
   - `Depositable` skal have en `deposit(double amount)`-metode.
   - `Withdrawable` skal have en `withdraw(double amount)`-metode.
   - `InterestBearing` skal have en `applyInterest()`-metode.
2. Ændr `BankAccount`-klassen, så den ikke har `deposit` og `withdraw` metoderne længere.
3. Start med at ændre `CheckingAccount`-klassens definition, så den implementerer `Depositable` og `Withdrawable` interfacene:
   ```java
      class CheckingAccount extends BankAccount implements Depositable, Withdrawable { 
        // ... 
      }
    ```
4. IntelliJ vil nu klage over, at `CheckingAccount` ikke implementerer de nødvendige metoder: `deposit` og `withdraw`. Implementer dem i `CheckingAccount`-klassen. Hint: Du kan jo kopiere `deposit` og `withdraw` metoderne fra den oprindelige `BankAccount`-klasse.
5. Gør det samme for `SavingsAccount`, som skal implementere alle tre interfaces: `Depositable`, `Withdrawable` og `InterestBearing`.
6. Til sidst skal du ændre `ChildrensAccount`, så den kun implementerer `Depositable` og `InterestBearing`. Implementer de nødvendige metoder i `ChildrensAccount`.
7. Tilpas `transfer`-metoden i din `Main`-klasse, så den bruger de nye interfaces:
   ```java
   public void transfer(Withdrawable from, Depositable to, double amount) {
      // Hæv penge fra from-kontoen
      // Indsæt penge på to-kontoen
   }
   ```
8. Prøv nu at overføre penge fra en `ChildrensAccount` til en `SavingsAccount` ved at kalde `transfer`-metoden. Det burde nu ikke være muligt at hæve penge fra en børneopsparing! Hvad sker der, når du prøver?
9. Så vi udnytter nu typesystemet til at forhindre uønskede operationer på konti. Du kan ikke engang kompilere koden, fordi `ChildrensAccount` ikke implementerer `Withdrawable` og derfor ikke kan bruges som `from`-parameter i `transfer`-metoden. Snedigt, ikke?