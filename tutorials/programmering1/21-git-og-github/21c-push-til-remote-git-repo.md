# Push til remote Git-repo
Vi har i de tidligere tutorials lavet et lokalt git-repo og et remote git-repo på GitHub og forbundet dem. Nu skal vi prøve at lave nogle commits lokalt og "pushe" dem til GitHub.
1. Fortsæt med det git-repo "bmi-calculator" du netop har klonet ned til din computer fra GitHub
2. Lav en ændring i koden, fx tilføj en `Main` klassen med en `main` metode som denne:
```java
public class Main {
    public static void main(String[] args) {
        double height = 1.75;
        double weight = 70.0;
        double bmi = weight / (height * height);
        System.out.println("Your BMI is: " + bmi);
    }
}
```
1. Lav et commit med beskeden "Tilføjet Main klasse med BMI beregning"
2. Vælg nu "Commit and Push..." knappen nederst i venstre hjørne af IntelliJ vinduet
3. Åbn Github i din browser og gå til dit repository
4. Er der nye ændringer i dit repository? Du skulle bl.a. gerne kunne se den `Main.java`
5. Lav endnu en ændring i koden, fx tilføj en `BMI` klasse med en metode `calculateBmi(double height, double weight)`. Opdater `main` metoden til at kalde denne nye metode
6. Lav et commit med beskeden "Flyttet BMI beregning til BMI klassen"
7. Vælg nu "Commit and Push..." knappen nederst i venstre hjørne af IntelliJ vinduet
8.  Åbn Github i din browser og gå til dit repository
9.  Er der nye ændringer i dit repository? Du skulle bl.a. gerne kunne se den `BMI.java` fil
10. Sejt du har nu lavet flere commits lokalt og pushed dem til dit remote Git-repo på GitHub!