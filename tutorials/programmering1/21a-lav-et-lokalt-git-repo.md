# Lav et lokalt Git-repo

1. Lav et nyt projekt i IntelliJ kaldet "bmi-calculator", men inden du klikker "Create", sæt et flueben i "Create Git repository"
2. Tilføj en klasse eller en fil til projektet, fx en `Main` klasse med en `main` metode som denne:
```java
public class Main {
    public static void main(String[] args) {
        double height = 1.75;
        double weight = 70.0;
        double bmi = BMI.calculateBmi(height, weight);
        System.out.println("Your BMI is: " + bmi);
    }
}
```
1. I IntelliJ vinduets venstre side, klik på knappen der ligner en streg med ring imellem under - den der er under "Project" knappen, der ligner en mappe.
2. Du kan se en række filer, bl.a. Main.java under Changes. Klik på Changes, hvorved der er flueben ud for alle filer.
3. Skriv en commit besked i boksen, hvor der står "Commit message", fx "Oprettet IntelliJ projekt med en Main klasse med BMI beregning".
4. Tryk "Commit" knappen nederst.
5. Du har nu lavet dit første commit i dit lokale Git repository!
6. Tilføj en klasse mere kaldet "BMI" og flyt BMI beregningen derover i en metode `calculateBmi(double height, double weight)`. Opdater `main` metoden til at kalde denne nye metode
7. Gentag trin 3-6 for at lave et nyt commit med beskeden "Flyttet BMI beregning til BMI klassen".
8.  Klik på den nederste knap i venstre side, der ligner en forgrening med ringe på hver gren.
9.  Her kan du se git loggen - historikken over dine commits. Klik på de forskellige commits for at se, hvilke filer der er ændret i hvert commit.
10. Prøv at klikke på seneste (øverste) commit, og derefter dobbeltklik på filen `Main.java`. Se hvordan koden har ændret sig i Main.java mellem de to commits.