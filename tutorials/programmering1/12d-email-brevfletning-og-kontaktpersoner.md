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
3. Opdater konstruktøren og `toString`-metoden i `Email`-klassen til at bruge `Contact`-objekter, dvs.
   ```java
   String.format("""
        From: %s <%s>
        To: %s <%s>
        Subject: %s
        %s
        """, from.name, from.email, to.name, to.email, subject, body);
   ```
4. Oprettelsen af `Email`-objekter i `main` skal også opdateres til at bruge `Contact`-objekter. F.eks:
   ```java
    Email[] emails = new Email[] {
        new Email(
            new Contact("Alice", "alice@example.com"),
            new Contact("Bo", "bo@example.com"),
            "Long time no see",
            "Hej Bo, hvad går du og laver?"),
        new Email(
            new Contact("Christina", "chrisser@example.com"),
            new Contact("David", "david@example.com"),
            "Møde", 
            "Hej David, kaffe i morgen?"),
       // flere emails her
   };
5. Test dit program igen og se at det stadig virker som forventet.
6. Du kan også overskrive `toString`-metoden i `Contact`-klassen til at returnere en streng i formatet `Name <email>`, og så kan du forenkle `toString`-metoden i `Email`-klassen til:
   ```java
   String.format("""
        From: %s
        To: %s
        Subject: %s
        %s
        """, from, to, subject, body);
   ```