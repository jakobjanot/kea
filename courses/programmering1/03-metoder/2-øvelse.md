---
title: 02#2 - Metoder - Øvelser
---

# Øvelse - Så til søs

Vi skal lave et program, der konverterer en afstand i sømil (nautiske mil) til kilometer

1. Lav et nyt Java-projekt i IntelliJ, som du
    -   navngiver `nautical-converter`
    -   som Buildsystem vælger du `IntelliJ`
    -   som JDK vælger du `21`

2. Navngiv klassen `NauticalConverter`
3. Tilføj en `main` metode
4. Og skriv følgende kode i `main` metodens krop:
    ```java
    double nauticalMiles = 10;
    double km = nauticalMilesToKilometers(nauticalMiles);
    System.out.println(nauticalMiles + " nautiske mil er " + kilometers + " kilometer.");
    ```
5. En sømil (nautical mile) er 1,852 meter
6. Tilføj metoden `nauticalMilesToKilometers`
7. Tjek resultatet, en sømil er næsten dobbelt så lang som en kilometer

---

# Øvelse - hvilken type returnerer metoden?

1. Lav et nyt Java-projekt i IntelliJ, som du navngiver `return-type`.
2. Lav en Java-klasse `ReturnType`, der ser sådan ud:
    ```java
    public class ReturnType {
        public static void main(String[] args) {
            ??? result = add(5, 10);
            System.out.println("Resultatet er: " + result);

        }

        public static ??? add(int a, int b) {
            return a + b;
        }
    }
    ```
3. Udfyld `???` med den rigtige type, så programmet kan kompileres og køre.

--

4. På samme måde som før, prøv om du kan få programmet til at køre ved at
    - kalde metoden
    - udfylde `???` i de følgende metoder:

5. 
    ```java
        public static ??? isEven(int number) {
            return number % 2 == 0;
        }
    ```

6. 
    ```java
        public static ??? fullName(String firstName, String lastName) {
            return firstName + " " + lastName;
        }
    ```

7. 
    ```java
        public static ??? getLength(String text) {
            return text.length();
        }
    ```

8. 
    ```java
        public static ??? greet(String name) {
            System.out.println("Hello, " + name + "!");
        }
    ```

9. 
    ```java
        public static ??? getFirstCharacter(String text) {
            return text.charAt(0);
        }
    ```

---

# Øvelse - Beregn BMI

Vi skal lave et program, der beregner Body Mass Index (BMI) baseret på vægt og højde.

1. Lav en Java-klasse `BMICalculator` med en `main` metode.
2. Tilføj en metode `calculateBMI` der tager vægt (i kg) og højde (i meter) som parametre og returnerer BMI.
3. I `main` metoden:
    - Indtast vægt og højde som variabler.
    - Beregn BMI ved hjælp af `calculateBMI`.
    - Udskriv BMI
5. Test programmet med forskellige værdier for vægt og højde.

Eksempel:
```java
double weight = 70; // kg
double height = 1.75; // meter
double bmi = calculateBMI(weight, height);
System.out.println("BMI: " + bmi);
```

---

# Øvelse - BMI klassificering

- Vi skal udvide vores BMI-program, så det oversættes til hverdagssprog, baseret på BMI-værdien.
    - Under 18.5: "Under normalvægt"
    - 18.5 til 25: "Normalvægt"
    - Over 25: "Overvægt"

1. Fortsæt i din `BMICalculator` klasse.
2. I `main` metoden tilføj:
    ```java
    System.out.println("Undervægt: " + isUnderNormalWeight(bmi));
    System.out.println("Normalvægt: " + isNormalWeight(bmi));
    System.out.println("Overvægt: " + isOverweight(bmi));
    ```
3. Tilføj metoderne `isUnderNormalWeight`, `isNormalWeight` og `isOverweight`, eksempel:
    ```java
    public static boolean isNormalWeight(double bmi) {
        return bmi >= 18.5 && bmi < 25;
    }
    ```
4. Test programmet med forskellige værdier for vægt og højde.

---

# Øvelse - Refaktorering: Extract method i IntelliJ

En af de vigtigste ting, når vi skriver kode, er at gøre den **læsbar** og nem at **vedligeholde**. 

En måde at gøre det på er at **extract**e linjer af kode, der udfører en bestemt opgave, til en ny **metode** - som vi kan **give et sigende navn** og **genbruge** andres steder i koden.

Lad os prøve at lave BMI-programmet en gang til, men anvende **extract method** i IntelliJ.

--

1. Lav et nyt Java-projekt i IntelliJ, som du navngiver `bmi-refactor`.
2. Lav en Java-klasse `BMIRefactor`, som ser sådan ud:
    ```java
    public class BMIRefactor {
        public static void main(String[] args) {
            double weight = 70; // kg
            double height = 1.75; // meter
            double bmi = weight / (height * height);

            boolean isUnderNormalWeight = bmi < 18.5;
            boolean isNormalWeight = bmi >= 18.5 && bmi < 25;
            boolean isOverweight = bmi >= 25;
            
            System.out.println("BMI: " + bmi);
            System.out.println("Under normalvægt: " + isUnderNormalWeight);
            System.out.println("Normalvægt: " + isNormalWeight);
            System.out.println("Overvægt: " + isOverweight);
        }
    }
    ```
3. Kør programmet - virker det som forventet?
4. Marker `weight / (height * height)` i koden, og tryk **Ctrl + Alt + M** (Windows/Linux) eller **Cmd + Option + M** (Mac) for at **extract**e det til en metode.
5. Ret navnet til noget sigende, fx `calculateBMI` og tryk `Enter`.
6. Tjek, at du har fået en ny metode i din klasse og `double bmi = calculateBMI(weight, height);` i `main` metoden.

--

7. Gør det samme for hver af de tre `boolean`s nedeunder (`isUnderNormalWeight`, `isNormalWeight`, `isOverweight`). 
8. Nu hvor du har **gode navne** på metoderne, kan behøver du ikke længere de variablerne `boolean isUnderNormalWeight`, `boolean isNormalWeight` og `boolean isOverweight` i `main` metoden. Du kan i stedet kalde metoderne direkte i `System.out.println`, dvs.
    ```java
    System.out.println("Under normalvægt: " + isUnderNormalWeight(bmi));
    System.out.println("Normalvægt: " + isNormalWeight(bmi));
    System.out.println("Overvægt: " + isOverweight(bmi));
    ```
9. Kør programmet igen - virker det som forventet?

---

# Øvelse - `Math`-klassen
Vi skal lave et program, der bruger `Math`-klassen til at udføre nogle matematiske beregninger.
1. Lav et nyt Java-projekt i IntelliJ, som du navngiver `math-exercises`.
2. Lav en Java-klasse `MathExercises` med en `main` metode.
3. I `main` metoden, tilføj følgende kode:
    ```java
    System.out.println("Den største værdi af 10 og 20 er: " + Math.???(10, 20));

    System.out.println("2.45 afrundet til nærmeste heltal er: " + Math.???(2.45));

    System.out.println("2.3 rundet op til nærmeste heltal er: " + Math.???(2.9));
    
    System.out.println("Kvadratroden af 16 er: " + Math.???(16));

    double pi = Math.???;
    System.out.println("Arealet af en cirkel med radius 5 er: " + pi * Math.???(5, 2));
    ```
4. Udfyld `???` med de rigtige metoder fra `Math`-klassen, så programmet kan kompileres og køre.

---

# Øvelse - C02 udledning

En gennemsnitlig dansker udleder 6,7 ton CO2 om året.
Et ton C02 har et rumfang på 1,96 kubikmeter.

1. Lav et program, der beregner, hvor stor siden er på den kasse (kube) vi skal bruge for at rumme den mængde CO2 vi udleder på et år.

Hint: Kig på `Math`-klassens `cbrt` (cube root).