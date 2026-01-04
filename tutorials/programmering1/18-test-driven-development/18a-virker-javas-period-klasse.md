# Virker Javas Period klasse?

Vi har tidligere arbejdet med Javas klasser til datoer og perioder, fx hvormed vi kunne beregne antal år eller dage mellem to datoer.
Man kan roligt stole på, at Javas indbyggede metoder er gennemtestede, men lad os nu tjekke det alligevel. Og finder du en fejl - så giver jeg i hvert fald gerne is til hele klassen.

1. Opret et IntelliJ-projekt kaldet `period-tests`. Lav IKKE en `Main`-klasse med en `main`-metode som du plejer.
2. Lav en klasse kaldet `PeriodTest` med flg. indhold
   ```java
   import org.junit.jupiter.api.Test;
   import static org.junit.jupiter.api.Assertions.*;
   import java.time.LocalDate;
   import java.time.Period;
   
   public class PeriodTest {
       @Test
       public void yearsInPeriodBetweenTwoDates() {
           // ...
       }
   }
   ```
   Intellij vil nu spørge om du vil tilføje JUnit5 til projektet - det skal du sige ja til. JUnit5 er et test-framework som vi bruger til at skrive tests i Java. Det er IKKE en del af Javas standard-bibliotek, ligesom fx `java.time` er. Derfor skal vi have det med som en dependency i projektet. Du kan evt højreklikke på @Test og add'e JUNit 5.x.x, så sørger IntelliJ for at hente JUnit5 og sætte det op i projektet for dig.
   VIGTIGT Det kan være nødvendigt at lukke og genåbne IntelliJ-projektet for at få det til at virke.
3. Prøv at tilføje to variable `to` and `from` af typen `LocalDate`. Du kan bruge `LocalDate.of`.
4. Tilføje en variabel af typen `Period`, hvor du beregner en periode mellem de to datoer. Du kan bruge `Period.between(to, from)`
5. Brug `assertEquals` til at tjekke at der er der det korrekte antal år i perioden, fx 
   ```java
   assertEquals(2, period.getYears());
   ```
6. Prøv at oprette en ny test-klasse `MathTest` hvor du nu tester `Math.max(...)` metoden i Javas lommeregner klasse `java.util.Math` - den der returner det største af to tal
7. I samme test-klasse, tilføjer du også en test af `Math.min(...)`
8. På samme måde tilføjer du en test af `Math.floor(...)` der bruges til at runde ned.