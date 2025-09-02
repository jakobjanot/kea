# Find fejlen

- Når der er syntax fejl i din Java kildekode vil Java-compiler'en vise en fejlmeddelelse.
- Opret en projekt `lots-of-errors` og en klasse `Main`.
- Prøv at rette fejlene i nedestående kode-bidder, så de ikke længere giver fejl.
- Når du har rettet koden, så brug IntelliJ's "Reformat Code" funktion for at sikre korrekt indrykning.
    - Ctrl + Alt + L på Windows
    - Cmd + Option + L på Mac

1. ```java
import java.lang.Math;

public class Main {
    public static void main(String[] args) {
        earthDiameter double = 12742.0; // km

        double earthCircumference = Math.PI * earthDiameter;
        System.out.println("Jordens omkreds er " + earthCircumference + " km");
    }
}
```
2. ```java
import java.lang.Math;

public class Main {
}
public static void main(String[] args) {
    int momsAge = 40;
    int dadsAge = 42;

    int oldestAge = Math.max(momsAge, dadsAge);
    System.out.println("Den ældste forælder er " + oldestAge + " år gammel.");
}
```
3. ```java
public class Main {
    public static void main(String[] args) {
        boolean hasRedEye = true;
        boolean hasPush = false;
        System.out.println("Skal behandles med antibiotika: " + needsAntibiotica);
        boolean needsAntibiotica = hasRedEye || hasPush;
    }
}
4. ```java
public class Main {
    public static void main(String[] args) {
        System.out.println("Hastighed: " + calculateSpeed(100, 2) + " km/t");
    }

    public static double calculateSpeed(double distance, double time) {
        distance / time;
    }
}

5. ```java
import java.lang.Math;

public class Main {
    public static void main(String[] args) {
        double earthDiameter = 12742.0; // km
        System.out.println("Jordens omkreds er " + calculateEarthCircumference(earthDiameter) + " km");
    }

    public static String calculateEarthCircumference(double diameter) {
        return Math.PI * diameter;
    }
}