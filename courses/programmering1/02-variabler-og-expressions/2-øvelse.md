---
title: 02#2 - Variabler og expressions - Øvelser
---
<!-- .slide: class="kea-red" -->

# Øvelse 1 - Klargøring
--



# Øvelse 2 - fødselsår

Brug din alder til at udregne dit fødselsår

1. Lav et nyt Java-projekt i IntelliJ, som du 
    -   kalder `birthyear`
    -   som Buildsystem vælger du `IntelliJ``
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

4. Indtast variablen `year` af typen `int` og giv den en værdi `2025` (i år)
5. Indtast variablen `age` af typen `int` og giv den din alder
6. Lav en variabel `birthYear` af typen `int` og sæt den til at være lig med `year - age`
7. Brug `System.out.println("Du er født i " + birthYear);` til at udskrive dit fødselsår til skærmen

--

# Øvelse 3 - Hvor mange datamatiker studerende er der?

1. Lav et nyt Java-projekt og opret en klasse med et passende navn
2. Opret en `main` metode i din klasse, så det ligner dette:

```java
public class StudentCount {
    public static void main(String[] args) {
        // Indtast din kode her
    }
}
```

