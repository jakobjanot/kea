# Julefrokost, igen

Vi fortsætter med julefrokost-opgaven og Intellij-projektet `christmas-party`.

1. Tilføj en overloadet konstruktør til `Date`-klassen der kun tager `day` og `month`, og sætter `year` til det nuværende år (2025). Hint: Du kan få det nuværende år ved at bruge `java.time.Year.now().getValue()`.
2. Test den nye konstruktør i `main` ved at oprette en dato med kun dag og måned, f.eks. `new Date(24, 12)`, og udskriv den.
3. Hvis du har lavet `equals`-metoden i den tidligere opgave, så prøv at sammenligne en dato oprettet med den nye konstruktør med en dato oprettet med den gamle konstruktør, f.eks. `new Date(24, 12)` og `new Date(24, 12, 2025)`. Virker det som forventet?
4. Det er en god idé at gøre objektet immutable, så vi kan være sikre på at datoen ikke ændrer sig efter den er oprettet. Dette kan vi gøre ved at tilføje `final` til felterne i `Date`-klassen, f.eks.
   ```java
   public class Date {
       final int day;
       final int month;
       final int year;
       // osv.
   ```
5. Prøv at ændre et af felterne i `main`, f.eks. `partyDates[0].day = 1;`. Hvad sker der? Forklar hvorfor.

