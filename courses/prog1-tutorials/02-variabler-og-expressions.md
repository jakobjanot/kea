---
title: 02 - Variabler og expressions - Øvelser
---

# Øvelse - ASCII art
- De programmer vi laver, som skriver til konsollen, kalder vi **konsol-applikationer**. 
- Konsol-applikationer består udelukkende af tekst.
- I skriftfonte man bruger til kode, **monospace-fonte**, er alle tegn altid samme afstand og bredde på skærmen. Det er i modsætning til de fonte, fx Times New Roman, som vi bruger til at skrive dokumenter i Word, her "fylder" tegnet M mere end fx l.
- Vi kan udnytte brugen af **monospace**-fonte til at lave "grafik" i konsol-applikationer.

1. Lav et nyt Java-projekt du kalder `asciiart` med en klasse kaldet `AsciiArt` med en `main` metode.
2. Prøv vha. `System.out.println` at få konsollen til at printe en kat:
    ```txt
    \    /\
     )  ( ')
    (  /  )
     \(__)|
    ```
3. Prøv at bruge teknikken herunder til at printe katten med eet `System.out.println` statement
    ```java
    String lines = "Første linje" +
                   "Anden linje" +
                   "Tredje linje";
    System.out.println(lines);
5. Prøv at kopiere katten til Word og ændre fonten til Times New Roman.
4. Find selv noget fed **ASCII art** på nettet
    - eller lav dit eget på [https://www.asciiart.eu/ascii-draw-studio/app](https://www.asciiart.eu/ascii-draw-studio/app)
5. Print det til **konsollen**

---

# Øvelse - Værdier

1. Lav et nyt Java-projekt i IntelliJ, som du navngiver `about-me`
2. Under `Project` i venstre sidepanel, højreklik på `src` og vælg `New` -> `Java Class`
3. Giv din klasse navnet `AboutMe`.
4. Tilføj en `main` metode, så det ligner dette:
    ```java
    public class AboutMe {` {
        public static void main(String[] args) {
            String familyName = ???;
            char givenNameInitial = ???;
            boolean isCoffeeDrinker = ???;
            boolean isTeaDrinker = ???;

            System.out.println("Navn: " + givenNameInitial + ". " + familyName);
            System.out.println("Kaffedrikker: " + isCoffeeDrinker);
            System.out.println("Tedrikker: " + isTeaDrinker);
        }
    }
    ```
5. Erstat `???` med værdier, der passer til **dig**, variablene er:
    - `familyName` (efternavn)
    - `givenNameInitial` (første bogstav i dit fornavn)
    - `isCoffeeDrinker`/`isTeaDrinker` (drikker du kaffe/te?)
6. Tilføj et eller flere statements, der udskriver `familyName` og `givenNameInitial` til konsollen vha. `System.out.println`

---

# Øvelse - Typer

1. Lav et nyt Java-projekt i IntelliJ, som du navngiver `types`
2. Under `Project` i venstre sidepanel, højreklik på `src` og vælg `New` -> `Java Class`
3. Giv din klasse navnet `Types`.
4. Ret koden, så den ligner dette:
    ```java
    public class Types {
        public static void main(String[] args) {
            ??? height = 169.5;
            ??? givenName = "Aisha";
            ??? familyName = "Khan";
            ??? age = 30;
            ??? isStudent = true;

            System.out.println("Navn: " + givenName + " " + familyName);
            System.out.println("Højde: " + height + " cm");
            System.out.println("Alder: " + age + " år");
            System.out.println("Er studerende: " + isStudent);
        }
    }
    ```
5. Erstat `???` med de rigtige datatyper for hver variabel
6. Kør programmet og se outputtet
7. Prøv at ændre værdierne så de passer til dig selv
8. Kør programmet igen og se hvordan outputtet ændrer sig

---

# Øvelse - Fødselsårsberegner

Brug din alder til at udregne dit fødselsår

1. Lav et nyt Java-projekt i IntelliJ, som du 
    -   navngiver `birthyear`
    -   som Buildsystem vælger du `IntelliJ`
    -   som JDK vælger du `21`

2. Under `Project` i venstre sidepanel, højreklik på `src` og vælg `New` -> `Java Class`
3. Giv din klasse navnet `BirthYear`.
4. Tilføj en `main` metode, så det ligner dette:
    ```java
    public class BirthYear {
        public static void main(String[] args) {
            
        }
    }
    ```
---

5. Indtast variablen `year` af typen `int` og giv den en værdi `2025` (i år)
6. Indtast variablen `age` af typen `int` og giv den din alder
7. Lav en variabel `birthYear` af typen `int` og sæt den til at være lig med `year - age`
8. Brug `System.out.println("Du er født i " + birthYear);` til at udskrive dit fødselsår til skærmen

Notes:
# Løsning:
```java
public class BirthYear {
    public static void main(String[] args) {
        int year = 2025; // nuværende år
        int age = 20; // din alder
        int birthYear = year - age; // udregner fødselsåret

        System.out.println("Du er født i " + birthYear);
    }
}
```

---

# Øvelse - Hvor meget mel til cookies?

1. Lav et nyt Java-projekt med en klasse med et navn du vælger og en `main` metode
2. Lav en variabel `cookies` af typen `int` og giv den en værdi på 24
3. Lav en variabel `flourPerCookie` af typen `double` og giv den en værdi på 0.045 (dvs. 0.045 kg, som er 45 gram mel per cookie)
4. Lav en `double` variabel `totalFlour` og sæt den til at være lig med `cookies * flourPerCookie`
5. Udskriv `totalFlour` til skærmen med System.out.println
6. Prøv at ændre værdien af `cookies` og se hvordan det påvirker resultatet
7. Ved at ændre på værdien af `cookies` - undersøg hvor mange cookies du lave med 2 kg mel?
8. Kender du en måde at udregne hvor mange cookies du kan lave med 2 kg mel?

---

9. Vores vægt måler ikke mere præcist end 0.001 kg (1 gram), så det er lidt fjollet at vise resultet med 6 decimaler
10. Prøv at ændre `System.out.println(totalFlour);` til `System.out.printf("%.3f kg mel", totalFlour);`
11. Hvad sker der nu?
12. Prøv at ændre `%.3f` til `%.2f` og se hvad der sker

---

# Øvelse - Grupper i klassen
- Lav et nyt Java-projekt `studentgroups` med klassen `StudentGroups` og en `main` metode
- Lad os dele os op i grupper af 4 personer
- Antallet af personer i klassen, `int totalStudents`, er 39
- Antallet af personer i hver gruppe, `int groupSize`, er 4
- Lav en `int` variabel `groups` og sæt den til at være lig med `totalStudents / groupSize`
- Hvor mange grupper kan vi lave?
- Hvor mange studerende har ikke en gruppe?

---

# Øvelse - Grupper i klassen (fortsat)
- Lav en `int` variabel `remainingStudents` og sæt den til at være lig med `totalStudents % groupSize`
- Udskift antal studerende der ikke har en gruppe med `remainingStudents`
- Prøv at ændre `groupSize` og se hvordan det påvirker resultatet
- Kan du finde en gruppe størrelse, hvor alle 39 studerende har en gruppe?

---

# Øvelse - Æbler og pærer
- Lav et nyt Java-projekt `apples-and-pears` med klassen `ApplesAndPears` og en `main` metode
- Jeg har 20 kasser med 3 æbler og 2 pærer i hver
- Jeg har også 5 kasser med 4 æbler og 6 pærer i hver
- Jeg har lavet flg. program for at udregne hvor meget frugt jeg har i alt:
    ```java
    public class ApplesAndPears {
        public static void main(String[] args) {
            int fruits = 20 * 3 + 2 + 5 * 4 + 6;
            System.out.println("Jeg har " + fruits + " styk frugt i alt.");
        }
    }
    ```
- Kør programmet - hvad sker der?
- Det burde være 150 styk frugt i alt
- Hint: Tænk på operatorerne `+` og `*` 
    - hvilken rækkefølge udføres de i 
    - kan du ændre rækkefølgen af beregningerne ved at bruge paranteser?

