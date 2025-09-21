# Email brevfletning

Husker du den tidligere opgave med email brevfletning? Du er velkommen til at genbruge noget af koden herfra.

1. Opret et Intellij-projekt `bulk-email` med en klasse kaldet `Main` med en `main`-metode.
2. Opret en klasse `Email` har felterne `toName`, `toEmail`, `fromName`, `fromEmail`, `subject` og `body`. Klassen skal have en konstruktør der tager alle felterne som parametre, det kunne se således ud:

   ```java
   public class Email {
       String toName;
       String toEmail;
       String fromName;
       String fromEmail;
       String subject;
       String body;

       public Email(String toName, String toEmail, String fromName, String fromEmail, String subject, String body) {
           this.toName = toName;
           this.toEmail = toEmail;
           this.fromName = fromName;
           this.fromEmail = fromEmail;
           this.subject = subject;
           this.body = body;
       }
   }
   ```
3. I `main` skal du oprette et array med mindst 5 `Email`-objekter med forskellige værdier, f.eks:

   ```java
   Email[] emails = new Email[] {
       new Email("Alice", "alice@example.com", 
                 "Bo", "bo@example.com", 
                 "Long time no see",
                 "Hej Bo, hvad går du og laver?"),
       new Email("Christina", "chrisser@example.com", 
                 "David", "david@example.com", 
                 "Møde", "Hej David, kaffe i morgen?"),
       // flere emails her
   };
4. Skriv en `toString`-metode i `Email`-klassen der returnerer en streng med emailens indhold i et pænt format, f.eks:
   ```txt
   From: Alice <alice@example.com>
   To: Bo <bo@example.com>
   Subject: Long time no see
   Hej Bo, hvad går du og laver?
   ```
   Du kan overveje at anvende `String.format`, der bruger samme syntax som `printf`, dvs. med `%s` som pladsholder for strenge. F.eks:
   ```java
   String.format("""
        From: %s <%s>
        To: %s <%s>
        Subject: %s
        %s
        """, fromName, fromEmail, toName, toEmail, subject, body);
   ```
   Bemærk, at `"""` bruges til at lave en "tekstblok" (text block) i Java, som bevarer linjeskift og indrykning.
5. I `main` skal du gennemgå arrayet med emails og udskrive hver email med `System.out.println(email)`, som automatisk kalder `toString`-metoden.
6. Test dit program og se at alle emails bliver udskrevet korrekt.