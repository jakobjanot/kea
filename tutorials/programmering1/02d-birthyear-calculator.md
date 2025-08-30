# Fødselsårsberegner

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