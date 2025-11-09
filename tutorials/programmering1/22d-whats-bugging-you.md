# What's bugging you?

Når vi skriver programmer, begår vi fejl. Syntaxfejl er nemme at opdage, da IntelliJ og kompilatoren vil fortælle os om dem (røde streger under koden og fejlmeddelelser i konsollen). Runtime-fejl er lidt sværere at opdage, men vi har i de tidligere tutorials set, hvordan undtagelser kan hjælpe os med at fange og håndtere sådanne fejl.
Den sidste type fejl, logiske fejl, er groft sagt fejl i vores tankegang - vi har skrevet kode, der kører uden problemer, men som ikke gør det, vi egentlig ønsker. Disse fejl er ofte de sværeste at opdage ... og det er bl.a. derfor vi gør et stort nummer ud af at skrive læsbar kode og teste vores programmer grundigt.

I denne tutorial skal vi finde logiske fejl i simple programmer og bruge tre teknikker til at opdage og rette dem:
1. Print debugging
2. Brug af breakpoints i IntelliJ's debugger
3. Unit tests

## Print debugging
1. Fortsæt på eller opret et nyt Intellij-projekt `bmi-calculator` med tilhørende git repo (sæt flueben i **Create git repository**) og opret en `BmiCalculator`-klasse med følgende kode:
    ```java
    public class BmiCalculator {
        public static double calculateBmi(double weight, double height) {
            System.out.println("calculateBmi weight: " + weight + " and height: " + height);
            double bmi = weight / (height * height);
            System.out.println("Calculated BMI: " + bmi);
            return bmi;
        }
    }
    ```

## Brug af breakpoints i IntelliJ's debugger
2. Sæt et breakpoint ved at klikke i venstre margin ud for linjen:
    ```java
    double bmi = weight / (height * height);
    ```
3. Kør programmet i debug-tilstand ved at klikke på det lille bug-ikon ved siden af run-ikonet øverst til højre i IntelliJ.
4. Når programmet stopper ved breakpointet, kan du inspicere værdierne af `weight` og `height` ved at holde musen over variablerne eller ved at kigge i "Variables"-panelet nederst i vinduet.
5. Brug "Step Over" (F8) til at køre linjen og se resultatet af BMI-beregningen.
6. Hvad er den største ulempe ved print debugging sammenlignet med debugging vha. breakpoints?

## Unit tests
7. Opret en testklasse `BmiCalculatorTest` indeholdende følgende:
   ```java
   import org.junit.jupiter.api.Test;
   import static org.junit.jupiter.api.Assertions.assertEquals;

   public class BmiCalculatorTest {
       @Test
       public void testCalculateBmi() {
           double bmi = BmiCalculator.calculateBmi(80, 1.8);
           assertEquals(24.69, bmi, 0.01);
       }
    }
    ```
8. Kør testen ved at klikke på den grønne pil ved siden af testmetoden i IntelliJ.
9. Hvis testen fejler, kan du bruge debuggeren til at finde ud af, hvorfor.
10. Hvad var den letteste metode til at finde og rette fejlen i `calculateBmi`-metoden?
11. Commit og push dit arbejde til GitHub.
12. Hvad er fordelen ved at bruge unit tests til at opdage logiske fejl sammenlignet med print debugging og breakpoints?