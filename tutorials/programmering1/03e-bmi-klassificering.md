# BMI klassificering

- Vi skal udvide vores BMI-program, så det oversættes til hverdagssprog, baseret på BMI-værdien.
    - Under 18.5: "Under normalvægt"
    - 18.5 til 25: "Normalvægt"
    - Over 25: "Overvægt"

1. Fortsæt i din `BMICalculator` klasse.
2. I `main` metoden tilføj:
    ```java
    System.out.println("Under normalvægt: " + isUnderNormalWeight(bmi));
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

