# Email, brevfletning og kontaktpersoner
Dette er en fortsættelse af Intellij-projektet `bulk-email` fra den tidligere opgave om email brevfletning.

1. Prøv nu at erstatte `toName` og `toEmail` med et enkelt felt `to` af typen `Contact`, erstat også `fromName` og `fromEmail` med `from` af typen `Contact`. 
2. Genanvend klassen `Contact` fra opgaven om kontaktpersoner, eller opret den hvis du ikke har lavet den. Den kunne se således ud:
   ```java
   public class Contact {
       String name;
       String email;

       public Contact(String name, String email) {
           this.name = name;
           this.email = email;
       }
   }
   ```
3. Opdater konstruktøren til at tage to `Contact`-type objekter `from` og `to` som parametre i stedet. Det kunne se således ud:
   ```java
   public Email(Contact from, 
                Contact to, 
                String subject, 
                String body) {
       // Du færdiggør selv
   ```
4. Opdater også `toString`-metoden i `Email`-klassen til at bruge `Contact`-objekterne `from` og `to`.
4. Oprettelsen af `Email`-objekter i `main` skal også opdateres til at bruge `Contact`-objekter. F.eks:
   ```java
   Contact alice = new Contact("Alice", "alice@example.com");
   Contact bo = new Contact("Bo", "bo@example.com");
   Email email = new Email(
        alice,
        bo,
        "Long time no see",
        "Hej Bo, hvad går du og laver?");
   };
5. Test dit program igen og se at det stadig virker som forventet.
6. Hvis du ikke allerede har gjort det, kan du også overskrive `toString`-metoden i `Contact`-klassen til at returnere en streng i formatet `Name <email>`, og så kan du forenkle `toString`-metoden i `Email`-klassen til:
   ```java
   String.format("""
        From: %s
        To: %s
        Subject: %s
        %s
        """, from, to, subject, body);
   ```
7. Vi skal egentlig ikke bruge `alice` og `bo`-objekterne til andet end at oprette `email`-objektet, så du kan også overveje at oprette `Contact`-objekterne inline i konstruktøren til `Email`, f.eks:
   ```java
   Email email = new Email(
        new Contact("Alice", "alice@example.com"),
        new Contact("Bo", "bo@example.com"),
        "Long time no see",
        "Hej Bo, hvad går du og laver?");
   ```
   Prøv at oprette flere `Email`-objekter på denne måde, og se at det stadig virker som forventet.