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
