# `null` og nix

Java har en særlig værdi, `null`, som kan tildeles reference-typer for at indikere, at de ikke peger på noget objekt. Så en variabel kan være initialiseret uden at pege på et objekt. Når vi er færdige med at bruge et objekt, kan vi sætte variablen til `null`, så den ikke længere peger på objektet. Nu vil Java's garbage collector (GC) kunne slette objektet og frigøre hukommelse, hvis der ikke er andre referencer til objektet.

1. Hvilke(n) af variablene, der er `null` i følgende kode:
   ```java
   String a = null;
   String b = a;
   a = "Hello";
   ```
   - `a` og `b`
   - `a`
   - `b`
   - ingen af dem?
2. Hvilken af `BankAccount` objekterne er ikke længere refereret og kan derfor slettes af garbage collector'en?
   ```java
   BankAccount account1 = new BankAccount(123456);
   BankAccount account2 = new BankAccount(234567);
   BankAccount account11 = account2;
   ```
   - `BankAccount` objektet med kontonummer 123456
   - `BankAccount` objektet med kontonummer 234567
   - ingen af dem
   - begge
3. Hvilken fejl får vi ved at køre følgende kode?
   ```java
   String s = null;
   System.out.println(s.length());
   ```
   - Ingen fejl, programmet kører fint
   - `NullPointerException`, cannot invoke "String.length()" because "s" is null
   - variable s might not have been initialized
4. Hvilken fejl får vi ved at køre følgende kode?
   ```java
   String s;
   System.out.println(s);
   ```
   - Ingen fejl, programmet kører fint
   - `NullPointerException`, cannot invoke "String.length()" because "s" is null
   - variable s might not have been initialized
5. Hvilket objekt er ikke længere refereret når vi når til kommentaren `// her` i følgende kode:
   ```java
   BankAccount account = new BankAccount(123456);
   if (someCondition) {
       account = new BankAccount(987654);
   }
   // her
   ```
   - `BankAccount` objektet med kontonummer 123456
   - `BankAccount` objektet med kontonummer 987654
   - ingen af dem
   - begge