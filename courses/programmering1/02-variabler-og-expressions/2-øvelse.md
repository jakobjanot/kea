---
title: 02#2 - Variabler og expressions - Øvelser
---

# Øvelse - Hello World

- Lav et nyt Java-projekt i IntelliJ, som du 
    -   navngiver `helloworld`
    -   som Buildsystem vælger du `IntelliJ`
    -   som JDK vælger du `21`

- Under `Project` i venstre sidepanel, højreklik på `src` og vælg `New` -> `Java Class`
2. Navngiv klassen `HelloWorld`
3. Tilføj en `main` metode
4. Indtast følgende kode i `main` metoden:
    ```java
    System.out.println("Hello, World!");
    ```
5. Kør programmet for at se outputtet
6. Sæt `//` foran `System.out.println("Hello, World!");` for at kommentere linjen ud
7. Kør programmet igen - hvad sker der?
8. Fjern kommentaren og kør programmet igen - hvad sker der nu?
9. Forklar hvad forskellen er på på et statement og en kommentar i Java

---

# Øvelse - Fuld af fejl

- Fortsæt med at arbejde i dit `helloworld` projekt
- Prøv at fjerne `;` fra slutningen af linjen `System.out.println("Hello, World!");`
- Kør programmet - hvilken fejl får du fra compileren i IntelliJ?
- Hvad betyder fejlen?
- Ret fejlen (tilføj `;` igen) og tjek at programmet kører igen

--

På samme måde som før, prøv at 

- lave følgende ændringer i din kode, 
- compiler/kør - hvilken fejl får du?
- diskuter med din sidemakker hvad fejlen betyder
- ret fejlen og kør programmet igen

for hver af de følgende ændringer:

1. Fjern en af `{`'erne i din kode
2. Fjern en af `}`'erne i din kode
3. Skriv `mian` i stedet for `main`
4. Fjern ordet `static`
5. Fjern ordet `public` før `static`
6. Fjern ordet `System.`
7. Udskift `prinln` med `Println`
8. Udskift `println` med `print`

---

# Øvelse - Typer

- Lav et nyt Java-projekt i IntelliJ, som du navngiver `variables`
- Under `Project` i venstre sidepanel, højreklik på `src` og vælg `New` -> `Java Class`
- Giv din klasse navnet `Variables`.
- Ret koden, så den ligner dette:
    ```java
    public class Variables {
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
- Hint: Tænk på operatorerne `+` og `*` - hvilken rækkefølge udføres de i?