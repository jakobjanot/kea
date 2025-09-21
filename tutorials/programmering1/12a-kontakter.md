# Kontakter

På din telefon gemmer du kontaktpersoner med navn, email og telefonnummer. I denne opgave skal du lave et program der håndterer kontaktpersoner på en lignende måde.

1. Opret et Intellij-projekt `contacts` med en klasse og en `main`-metode.
2. Opret et array med 3 kontaktpersoner, hvor hver kontaktperson er repræsenteret som en instans af en `Contact`-klasse. Klassen skal have felterne `name`, `email` og `phoneNumber`, og en konstruktør der tager alle felterne som parametre, det kunne se således ud:
    ```java
    public class Contact {
         String name;
         String email;
         String phoneNumber;
    
         public Contact(String name, String email, String phoneNumber) {
              this.name = name;
              this.email = email;
              this.phoneNumber = phoneNumber;
         }
    }
    ```
3. Skriv en `toString`-metode i `Contact`-klassen der returnerer en streng med kontaktpersonens oplysninger i et pænt format, f.eks:
    ```txt
    Alice <alice@example.com>
    ```
3. Prøv at udskrive alle kontaktpersoner i `main` ved at bruge `System.out.println(contact)`, som automatisk kalder `toString`-metoden.
4. Prøv nu at tilføje en overloadet konstruktør til `Contact`-klassen der kun tager `name` og `email`, og sætter `phoneNumber` til en tom streng. Opret yderligere 2 kontaktpersoner i `main` ved at bruge denne nye konstruktør, og udskriv dem også.
5. Test dit program og se at alle kontaktpersoner bliver udskrevet korrekt.