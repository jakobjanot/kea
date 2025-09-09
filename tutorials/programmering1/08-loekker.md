# Løkker - Øvelser

---

# 7-tabellen

1. Skriv et program, der printer 7-tabellen fra 7 til 70, så det ser sådan ud:
    ```java
    7
    14
    21
    28
    35
    42
    49
    56
    63
    70
    ```
2. Tilret koden, så outputtet nu ser sådan ud:
    ```
    1 * 7 = 7
    2 * 7 = 14
    3 * 7 = 21
    4 * 7 = 28
    5 * 7 = 35
    6 * 7 = 42
    7 * 7 = 49
    8 * 7 = 56
    9 * 7 = 63
    10 * 7 = 70
    ```
3. Prøv at bruge `System.out.printf` til at formatere outputtet. Vi ønsker at bruge **leading spaces** for at justere tallene, så fx `*` og `=` står i samme kolonne. Det kan gøres med `"%2d"` for at reservere 2 pladser til et heltal. Resultatet skal se sådan ud:
    ```
     1 * 7 =  7
     2 * 7 = 14
     3 * 7 = 21
     4 * 7 = 28
     5 * 7 = 35
     6 * 7 = 42
     7 * 7 = 49
     8 * 7 = 56
     9 * 7 = 63
    10 * 7 = 70
    ```
4. Kan du genbruge koden til at printe alle tabeller fra 1 til 10?
    ```
      1   2   3   4   5   6   7   8   9  10
      2   4   6   8  10  12  14  16  18  20
      3   6   9  12  15  18  21  24  27  30
      4   8  12  16  20  24  28  32  36  40
      5  10  15  20  25  30  35  40  45  50
      6  12  18  24  30  36  42  48  54  60
      7  14  21  28  35  42  49  56  63  70
      8  16  24  32  40  48  56  64  72  80
      9  18  27  36  45  54  63  72  81  90
      10 20  30  40  50  60  70  80  90 100
    ```
---

# Sum-sum

- En sum af et array af tal, kan beregnes således:
```java
double[] tal = {1.0, 2.0, 3.0, 4.0, 5.0};
double sum = 0;
for (int i = 0; i < tal.length; i++) {
    sum += tal[i];
}
System.out.println("Summen er: " + sum);
```
- Når den studerende får sit uddannelsesbevis, skal han/hun have et gennemsnit på mindst 2.0.
- Et gennemsnit af en række tal er summen af tallene divideret med antallet af tal, fx er gennemsnittet af 1, 5, 2, 6 lig med (1 + 5 + 2 + 6) / 4 = 3.5
1. Med inspiration fra kode-eksemplet ovenfor, lav et program, der udskriver følgende:
```
Diplom
Gennemsnit: 3.5
Bestået:    Ja
```
2. En studerende har igennem sit studie fået karaktererne 7, 00, 02, 4, 00, -3, 02, -3, 7. Udskriv diplomet.
3. Prøv at ændre karaktererne og se hvordan det påvirker gennemsnittet og om den studerende består eller ej.
---

# Beregning af vægtet gennemsnit

- På et studie er nogle fag større end andre, fx er der flere timer og således ECTS-point i *Programmering 1* end i *IT- og forretningsudvikling*. For at tage højde for dette, kan man beregne et vægtet gennemsnit, hvor man vægter karaktererne efter antal timer.
- En datamatikers 9 eksamener (I alt 150 ECTS)
    - Programmering 1 (15 ECTS)
    - Programmering 1/Systemudv. 1/IT- og forretn./Teknologi 1 (45 ECTS)
    - Systemudvikling 2 (10 ECTS)
    - Teknologi 2 (10 ECTS)
    - Programmering 2 (10 ECTS)
    - Valgfag 1 (10 ECTS)
    - Valgfag 2 (10 ECTS)
    - Valgfag 3 (10 ECTS)
    - Praktik (15 ECTS)
    - Hovedprojekt (15 ECTS)
- Derfor er fx. vægten af karakteren fra eksamen i *Programmering 1* `15/150`. Og tilsvarende, vægten *Systemudvikling 2* er `10/150`, osv.
1. Udskrift diplomet for en datamatiker, der har fået følgende karakterer:
   - Programmering 1: 4
   - Programmering 1/Systemudv. 1/IT- og forretn./Teknologi 1: 10
   - Systemudvikling 2: 7
   - Teknologi 2: 4
   - Programmering 2: -3
   - Valgfag 1:7
   - Valgfag 2: 7
   - Valgfag 3: 02
   - Praktik: 12

---



---

# A-B-C sangen

- Uden at bruge lister, implementer A-B-C sangen i Java, så computeren printer ABC sangen ud.

> A - B - C - D - E - F - G - H - I - J - K - L - M - N - O - P - Q - R - S - T - U - V - W - X - Y - Z - Now I know my ABCs, next time won't you sing with me?

Notes:

```java
public class Main {
    public static void main(String[] args) {
        for (char c = 'A'; c <= 'Z'; c++) {
            System.out.print(c + " - ");
        }
        System.out.println("Now I know my ABCs, next time won't you sing with me?");
    }
}
```

---

