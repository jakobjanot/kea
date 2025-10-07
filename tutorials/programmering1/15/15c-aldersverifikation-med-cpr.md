# Aldersverifikation med CPR

Første version af app'en var en stor succes, særligt blandt unge under 18 år, der nu kunne købe alkohol og tobak uden problemer. Regeringen har derfor besluttet at ændre kravene til app'en, så den istedet for navn og alder, skal bruge CPR-nummer til verifikation. CPR-nummeret består af 10 cifre,
- de første 6 cifre er personens fødselsdato i formatet, fx 130502 for 13. maj 2002
- de sidste 4 cifre er et løbenummer
1. Lav et nyt IntelliJ projekt kaldet `age-verification-cpr`. Lav en `Main`-klasse med følgende kode:
   ```java
   public class Main {
       public static void main(String[] args) {
           Person person = new Person("1305021234");
           System.out.println(person); // Personen er voksen / Personen er ikke voksen
           System.out.println("Er voksen: " + person.isAdult()); // false
       }
   }
   ```
2. Tilføj en `Person`-klassen i stil med tidligere, men med et `cpr` felt i stedet for `name` og `age`, fx
   ```java
   public class Person {
       private String cpr;
       // ...
   }
   ```
3. Nu skal vi i gang med at bruge alle de tricks vi har lært om `String` og `LocalDate` til at udtrække fødselsdatoen fra CPR-nummeret og beregne alderen. Lad os starte med en `getAge()` metode, der returnerer alderen som et `int`, fx
   ```java
   public int getAge() {
       int year = Integer.parseInt(cpr.substring(4, 6));

       if (year > 30) {
           year += 1900;
       } else {
           year += 2000;
       }

       // int month = ...
       // int day = ...

       LocalDate birthday = LocalDate.of(year, month, day);

       LocalDate today = LocalDate.now();
       Period age = Period.between(birthday, today);
       return age.getYears();
   }
   ```
4. Tilføj en `isAdult()` metode, der bruger `getAge()` til at afgøre om personen er voksen (18 år eller ældre).
5. Tilføj en `toString()` metode, der returnerer `"Personen er voksen"` eller `"Personen er ikke voksen"`, afhængig af om personen er voksen eller ej.
6. Test at det virker ved at køre `Main`-klassen.