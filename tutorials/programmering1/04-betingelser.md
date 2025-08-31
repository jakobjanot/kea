# Betingelser
---
# Opgave: BMI Classifier - if/else if/else

Vi har tidligere lavet en metode BMI klassificering - vi vil prøve at udnytte vores nye viden om `if`, `else if` og `else` til at forbedre den.
Klassificeringen skal være baseret på følgende grænser:
- Undervægt: BMI < 18.5
- Normalvægt: 18.5 <= BMI < 25
- Overvægt: 25 <= BMI < 30
- Fedme: BMI >= 30

--

1. Lav et nyt Java-projekt i IntelliJ, som du navngiver `bmi-classifier-if-else`.
2. Lav en Java-klasse `BMIClassifier` med en `main` metode.
3. Tag udgangspunkt i følgende kode:
    ```java
    public class BMIClassifier {
        public static void main(String[] args) {
            double bmi = 22.5;
            String classification = classifyBMI(bmi);
            System.out.println("BMI: " + bmi + " - Klassifikation: " + classification);
        }

        public static String classifyBMI(double bmi) {
            if (bmi < 18.5) {
                return "Undervægt";
            } else if (bmi < 25) {
                return "Normalvægt";
            } else if ...
    }
    ```
4. Færdiggør `classifyBMI`
5. Kør programmet og se outputtet
6. Prøv at ændre værdien af `bmi` og se hvordan det påvirker outputtet

---

# Øvelse - Grupper i klassen (fortsat)
- Hvis der er 43 studerende (`int totalStudents = 43`) er der ikke nogen gruppestørrelse, hvor alle har en gruppe - vi må gøre noget andet
- Vi synes ikke at nogen skal være alene i en gruppe, dvs. `remainingStudents` skal være over 1.
- Sæt en `boolean` variabel `acceptableGroupSize = remainingStudents > 1;`
- Udskriv `acceptableGroupSize` til skærmen
- Prøv at ændre `groupSize` og se hvordan det påvirker resultatet
- Kan du finde en gruppe størrelse, hvor `acceptableGroupSize` er `true`?

---

# Øvelse - Hos lægen

- Lav et nyt Java-projekt `doctor` med klassen `Doctor` og en `main` metode
- Lad os lave et program der vurderer om din øjenbetændelse kræver antibiotika
- Lav `boolean` variabler for

    - `hasPus` - Gul sekret i øjet
    - `hasRedness` - Rødme i øjet
    - `isOneEyeOnly` - Ensidighed. Starter i et øje, evt. spreder sig

- Lav en `boolean` variabel
`needsAntibiotics` og sæt den til at være lig med `hasPus && (hasRedness || isOneEyeOnly)`
- Prøv at ændre værdierne af `hasPus`, `hasRedness` og `hasPain` og se hvordan det påvirker resultatet
- Kan du finde en kombination af værdier, hvor `needsAntibiotics` er `true`?
- Kan du finde en kombination, hvor det er `false`?
- Prøv at lave din egen regel for hvornår antibiotika er nødvendigt

