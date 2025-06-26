---
title: 02#2 - Variabler og expressions - Øvelser
---

# Øvelse - Værdier

- Lav et nyt Java-projekt i IntelliJ, som du navngiver `about-me`
- Under `Project` i venstre sidepanel, højreklik på `src` og vælg `New` -> `Java Class`
- Giv din klasse navnet `AboutMe`.
- Tilføj en `main` metode, så det ligner dette:
    ```java
    public class AboutMe {` {
        public static void main(String[] args) {
            String familyName = ???;
            char givenNameInitial = ???;
            boolean isCoffeeDrinker = ???;
            boolean isTeaDrinker = ???;

            System.out.println("Kaffedrikker: " + isCoffeeDrinker);
            System.out.println("Tedrikker: " + isTeaDrinker);
        }
    }
    ```
- Erstat `???` med værdier, der passer til **dig**, variablene er:
    - `familyName` (efternavn)
    - `givenNameInitial` (første bogstav i dit fornavn)
    - `isCoffeeDrinker`/`isTeaDrinker` (drikker du kaffe/te?)
- Tilføj et eller flere statements, der udskriver `familyName` og `givenNameInitial` til konsollen vha. `System.out.println`

---

# Øvelse - Typer

- Lav et nyt Java-projekt i IntelliJ, som du navngiver `types`
- Under `Project` i venstre sidepanel, højreklik på `src` og vælg `New` -> `Java Class`
- Giv din klasse navnet `Types`.
- Ret koden, så den ligner dette:
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
- Erstat `???` med de rigtige datatyper for hver variabel
- Kør programmet og se outputtet
- Prøv at ændre værdierne så de passer til dig selv
- Kør programmet igen og se hvordan outputtet ændrer sig

---

# Øvelse - Fødselsårsberegner

Brug din alder til at udregne dit fødselsår

- Lav et nyt Java-projekt i IntelliJ, som du 
    -   navngiver `birthyear`
    -   som Buildsystem vælger du `IntelliJ`
    -   som JDK vælger du `21`

- Under `Project` i venstre sidepanel, højreklik på `src` og vælg `New` -> `Java Class`
- Giv din klasse navnet `BirthYear`.
- Tilføj en `main` metode, så det ligner dette:
    ```java
    public class BirthYear {
        public static void main(String[] args) {
            
        }
    }
    ```
--

- Indtast variablen `year` af typen `int` og giv den en værdi `2025` (i år)
- Indtast variablen `age` af typen `int` og giv den din alder
- Lav en variabel `birthYear` af typen `int` og sæt den til at være lig med `year - age`
- Brug `System.out.println("Du er født i " + birthYear);` til at udskrive dit fødselsår til skærmen

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

- Lav et nyt Java-projekt med en klasse med et navn du vælger og en `main` metode
- Lav en variabel `cookies` af typen `int` og giv den en værdi på 24
- Lav en variabel `flourPerCookie` af typen `double` og giv den en værdi på 0.045 (dvs. 0.045 kg, som er 45 gram mel per cookie)
- Lav en `double` variabel `totalFlour` og sæt den til at være lig med `cookies * flourPerCookie`
- Udskriv `totalFlour` til skærmen med System.out.println
- Prøv at ændre værdien af `cookies` og se hvordan det påvirker resultatet
- Ved at ændre på værdien af `cookies` - undersøg hvor mange cookies du lave med 2 kg mel?
- Kender du en måde at udregne hvor mange cookies du kan lave med 2 kg mel?

--

- Vores vægt måler ikke mere præcist end 0.001 kg (1 gram), så det er lidt fjollet at vise resultet med 6 decimaler
- Prøv at ændre `System.out.println(totalFlour);` til `System.out.printf("%.3f kg mel", totalFlour);`
- Hvad sker der nu?
- Prøv at ændre `%.3f` til `%.2f` og se hvad der sker

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
