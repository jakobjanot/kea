# Refaktorering: Extract method i IntelliJ

- En af de vigtigste ting, når vi skriver kode, er at gøre den læsbar og nem at vedligeholde. 
- En måde at gøre det på er at extracte linjer af kode, der udfører en bestemt opgave, til en ny metode - som vi kan give et sigende navn og genbruge andres steder i koden.
- Lad os prøve at lave BMI-programmet en gang til, men anvende extract method i IntelliJ.

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
7. Gør det samme for hver af de tre `boolean`s nedeunder (`isUnderNormalWeight`, `isNormalWeight`, `isOverweight`). 
8. Nu hvor du har **gode navne** på metoderne, kan behøver du ikke længere de variablerne `boolean isUnderNormalWeight`, `boolean isNormalWeight` og `boolean isOverweight` i `main` metoden. Du kan i stedet kalde metoderne direkte i `System.out.println`, dvs.
    ```java
    System.out.println("Under normalvægt: " + isUnderNormalWeight(bmi));
    System.out.println("Normalvægt: " + isNormalWeight(bmi));
    System.out.println("Overvægt: " + isOverweight(bmi));
    ```
9. Kør programmet igen - virker det som forventet?
