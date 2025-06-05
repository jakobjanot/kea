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
    public static bool isNormalWeight(double bmi) {
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
8. Nu hvor du har **gode navne** på metoderne, kan behøver du ikke længere de variablerne `bool isUnderNormalWeight`, `bool isNormalWeight` og `bool isOverweight` i `main` metoden. Du kan i stedet kalde metoderne direkte i `System.out.println`, dvs.
    ```java
    System.out.println("Under normalvægt: " + isUnderNormalWeight(bmi));
    System.out.println("Normalvægt: " + isNormalWeight(bmi));
    System.out.println("Overvægt: " + isOverweight(bmi));
    ```
9. Kør programmet igen - virker det som forventet?

---

# Øvelse - *Tag det med et gran salt*

**Historie**

Før man fik køleskabe, brugte man salt til at konservere kød, så det kunne holde længere.
Man brugte ved tørsaltning et gram salt per lod kød eller 1 gram salt per centiliter til hvis man skulle konservere i saltlage. Bruger man for lidt salt, rådner kødet. 

Uheldigvis er der også en anden dansk måleenhed, der hedder **gran**. Men hvis man "tog det med et gran salt", så betød det at kødet ikke var konserveret ordentligt og usundt at spise.

Lad os finde ud af hvad et **gran** salt er, og lave et program, der konverterer det til **gram**.

--

**gran** er en gammel måleenhed ligesom **pund**, **tommer** og **alen**, som vi ikke bruger mere.

Et **gran** er en **1/5760 af et pund**

Et **pund** er **500 gram**

--

1. Lav en Java-klasse `GranConverter` med en `main` metode
2. Tilføj en metode `granToPund` der konverterer gran til pund
3. Tilføj en metode `gramToGran` der konverterer gram til gran - kan du bruge `granToPund`?
4. I `main` metoden, konverter 1 gran til gram og udskriv resultatet
5. Hvor meget er 1 gran i gram?
6. Hvor mange gran salt skal vi have for at få 1 gram?