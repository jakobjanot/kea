# Beregn BMI

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

- En af de vigtigste ting, når vi skriver kode, er at gøre den **læsbar** og nem at **vedligeholde**. 
- En måde at gøre det på er at **extract**e linjer af kode, der udfører en bestemt opgave, til en ny **metode** - som vi kan **give et sigende navn** og **genbruge** andres steder i koden.
- Lad os prøve at lave BMI-programmet en gang til, men anvende **extract method** i IntelliJ.

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
# Øvelse - Phone Home

- Kode er for mennesker - så navngivning af metoder er vigtigt! 
- Lav et nyt Java-projekt `phone-home` hvori du tilføjer koden herunder. 
- **Ret navnene** på metoder og parametre, så koden bliver mere forståelig - `checkThis` er der jo ingen der forstår.

```java
public class PhoneHome {
    public static void main(String[] args) {
        String phoneNumber = "004512345678";

        System.out.println("Er telefonnummeret " + check(phoneNumber) + " et gyldigt dansk telefonnummer? " + checkMoreStuff(phoneNumber));
    }

    public static boolean check(String phoneNumber) {
        return checkThis(phoneNumber) && checkThat(phoneNumber);
    }

    public static boolean checkThis(String phoneNumber) {
        return phoneNumber.startsWith("0045");
    }
        
    public static boolean checkThat(String phoneNumber) {
        return phoneNumber.length() == 12;
    }
}
```

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

# Øvelse - Invitationer

**Refaktorering** er når vi ændrer på vores kode for at gøre den bedre, uden at ændre på dens funktionalitet. En god måde at refaktorere på er at **extract**e en del af koden til en metode, så den kan genbruges og så den får et sigende navn. Lav et nyt Java-projekt i IntelliJ, som du navngiver `invitations` og tilføj koden herunder. Refaktorer den, så den bliver mere læselig.

```java
public class Invitations {
    public static void main(String[] args) {
        System.out.println("Hej Ahmed, du er inviteret til house warming på fredag kl. 19.");
        System.out.println("Hej Bent, du er inviteret til fødselsdagsfest på lørdag kl. 15.");
        System.out.println("Hej Charlotte, du er inviteret til fødselsdagsfest på lørdag kl. 15.");
        System.out.println("Hej David, du er inviteret til fødselsdagsfest på lørdag kl. 15.");
        System.out.println("Hej Ektarina, du er inviteret til house warming på fredag kl. 19.");
        System.out.println("Hej Frank, du er inviteret til house warming på fredag kl. 19.");
    }
}
```

---

# Øvelse - Email brevfletning

- Vi skal lave et program, der laver en simpel brevfletning, så du kan generere en masse mails. Der er flg. krav:
    - Navn på modtager
    - Email-addresse på modtager
    - Navn på afsender
    - Email-adresse på afsender
    - Tidspunkt for afsendelse
    - Besked
    - Du skal tjekke at email-adresserne ender på `.dk`
    - Programmet skal udskrive emails som eksempelvis:
        ```txt
        From: Flemming <flemse@hotmail.com>
        To: Kirsten <kisser@gmail.com>
        Subject: Invitation til fest

        Hej Kirsten
        Du er inviteret til fest på fredag kl. 19.
        Hilsen Flemming
        ```
- Tænk over hvordan du kan 
    - bruge flere metoder til at gøre koden mere læselig 
    - bruge gode navne på metoder
    - genbruge metoder du allerede har lavet i en tidligere øvelse?
---

# Øvelse - En timer (med rekursion)

- Vi har vores brød i ovenen og har brug for at sætte en timer. En timer er et program, der **tæller ned** fra et givet tal til 0. En måde at løse det på er **rekursion**. Rekursion er en teknik, hvor **metodem kalder sig selv**.

***

1. Lav et nyt IntelliJ projekt med en `Countdown` klasse med en `main` metode.
3. I `main` metoden, tilføj følgende kode:
    ```java
    int startNumber = 10; // Startnummer for nedtælling
    countdown(startNumber);
    ```
4. Tilføj en metode `countdown` der tager et heltal som parameter og udskriver tallet og kalder sig selv med tallet minus 1, indtil tallet når 0. (`if` kommer vi til senere på semesteret, så det er ok at du ikke forstår det)
```java
public static void countdown(int number) {
    System.out.println(number);

    if (number > 0) countdown(number - 1);
}
```
5. Kør programmet og se nedtællingen i konsollen.
6. Prøv at ændre `startNumber` til et `100` og se hvordan nedtællingen ændrer sig.
7. Prøv at fjerne `if (number > 0)` og se hvad der sker.
8. Prøv at ændre `countdown(number - 1)` til `countdown(number + 1)` og se hvad der sker.

---

# Øvelse - Stopur
Det modsatte af en timer er vel et **stopur**. Det tæller op fra 0 til vi stopper det. Her vælger vi dog at stoppe det når vi når 10. 

***

1. Lav et nyt projekt med navnet `stopwatch`.
2. Prøv at bruge **rekursion** som i `Countdown`-øvelsen, men **tæl op fra 0 til 10**.
3. Virker det?
4. Prøv at give din tælle-op-metode to parametre isteden for én, dvs. `countup(int number, int maxNumber)`, hvor `maxNumber` er det tal du vil tælle op til. Ret metoden, så den bruger `maxNumber` til at stoppe tællingen.
5. Kald metoden i `main` med `countup(0, 10);`.
6. Kør programmet med forskellige start og slut værdier og se resultatet i konsollen.

---

# Øvelse - C02 udledning

En dansker udleder 6,7 ton CO2 om året.
Et ton C02 har et rumfang på 1,96 kubikmeter.

1. Lav et program, der beregner, hvor stor siden er på den kasse (kube) vi skal bruge for at rumme den mængde CO2 vi udleder på et år.

Hint: Kig på `Math`-klassens `cbrt` (cube root).