---
title: "Udskriv din egen besked"
---

# Udskriv din egen besked

1. Lav et nyt Java-projekt i IntelliJ, som du 
    -   navngiver `helloagainworld`
    -   som Buildsystem vælger du `IntelliJ`
    -   som JDK vælger du `21`

2. Under `Project` i venstre sidepanel, højreklik på `src` og vælg `New` → `Java Class`
3. Navngiv klassen `HelloAgainWorld`
4. Tilføj en `main` metode så det ligner dette:
    ```java
    public class HelloAgainWorld {
        public static void main(String[] args) {
            
        }
    }
    ```
5. Indtast følgende kode i `main` metoden:
    ```java
    System.out.println("Hello Again, World!");
    ```
6. Tjek at din kode ligner dette:
    ```java
    public class HelloAgainWorld {
        public static void main(String[] args) {
            System.out.println("Hello Again, World!");
        }
    }
    ```
5. Kør programmet for at se outputtet - skriver programmet "Hello Again, World!" i konsollen?

--

6. Skriv en ny linje i `main` metoden, der bruger `System.out.println` til at udskrive en besked - vælg selv en besked. 
    ```java
    public class HelloAgainWorld {
        public static void main(String[] args) {
            System.out.println("Hello Again, World!");
            System.out.println("I am learning Java!");
        }
    }
    ```
7. Kør programmet igen - hvad sker der?

---

# Øvelse - Indrykning og mellemrum (whitespaces)
- Når vi programmerer bruger vi indrykning for at gøre vores kode mere læsbar
- Indrykning hjælper os med at se hvilke linjer der hører sammen
- Er Java ligeglad med indrykning? - lad os undersøge det!

1. Fortsæt med at arbejde i dit `helloagainworld` projekt
2. Prøv at fjerne indrykningen i din kode, så den ligner dette:
    ```java
    public class HelloAgainWorld {
    public static void main(String[] args) {
    System.out.println("Hello Again, World!");
    System.out.println("I am learning Java!");
    }
    }
    ```
3. Kør programmet - hvad sker der?
4. Hvorfor er det vigtigt at have indrykning i din kode?
5. Brug **tabulator**-tasten (⇥) for at indrykke koden igen, så den ligner dette:
    ```java
    public class HelloAgainWorld {
        public static void main(String[] args) {
            System.out.println("Hello Again, World!");
            System.out.println("I am learning Java!");
        }
    }
    ```
6. Kør programmet igen - alt ok?
7. Ok, så indrykning er ikke vigtigt for at Java kan forstå koden
---

# Øvelse - andre mellemrum (whitespaces)
- Vi har set at indrykning ikke er vigtigt for at Java kan forstå vores kode
- Hvad med andre mellemrum (whitespaces) - er de vigtige? - lad os undersøge det!

1. Fortsæt med at arbejde i dit `helloagainworld` projekt
2. Prøv nu at eksperimentere fjerne andre mellemrum, fx alle mellemrum omkring `{` og `}` og efter `;`, så det ligner dette:
    ```java
    public class HelloAgainWorld{public static void main(String[] args){System.out.println("Hello Again, World!");...}}
    ```
3. Ok, så Java er tilsyneladede også ligeglad med de mellemrum og linjeskift vi lige har fjernet.
4. Hvorfor synes du ikke vi skal have hele vores kode på en linje?
5. Sæt din **markør** (cursor) på linjen og tryk på 
    - **Ctrl + Alt + L** hvis du er på **Windows** (først Ctrl, så Alt, så L)
    - **Cmd + Option + L** hvis du er på **Mac** for at formattere koden (først Cmd, så Option, så L)
6. Snedigt ikke? - IntelliJ formatterer din kode automatisk, så den bliver mere læsbar
7. Kør programmet igen - alt ok?
8. Prøv at fjerne **alle** mellemrum i din kode, så den ligner dette:
    ```java
    publicclassHelloAgainWorld{publicstaticvoidmain(String[]args){System.out.println("HelloAgain,World!");System.out.println("IamlearningJava!");}}
    ```
8. Kør programmet - hvad sker der? 
9. Læg mærke til at IntelliJ ikke lægere tilføjer syntax highlighting - det er fordi det ikke længere følger Java's syntaksregler,  og IntelliJ kan derfor ikke forstå koden.
10. Ok, så Java er ikke _helt_ ligeglad med mellemrum - hvordan skulle den - hvordan skal man kende forskel på `public`, `class` og `publicclass` hvis de ikke er adskilt af mellemrum?
11. Prøv at formattere koden igen med **Ctrl + Alt + L** (Windows) eller **Cmd + Option + L** (Mac) - hvad sker der?
12. Ok, så IntelliJ kan kun formattere koden, hvis den kan forstå den - og det kan den ikke når vi har "ødelagt" den ved at fjerne alle mellemrum
13. Tilføj mellemrum indtil du igen kan formattere koden igen, så den ligner dette:
    ```java
    public class HelloAgainWorld {
        public static void main(String[] args) {
            System.out.println("Hello Again, World!");
            System.out.println("I am learning Java!");
        }
    }
    ```
---

# Øvelse - Fuld af fejl

1. Fortsæt med at arbejde i dit `helloagainworld` projekt
2. Prøv at fjerne `;` fra slutningen af linjen `System.out.println("Hello, World!");`
3. Kør programmet - hvilken fejl får du fra compileren i IntelliJ?
4. Hvad betyder fejlen?
5. Ret fejlen (tilføj `;` igen) og tjek at programmet kører igen

På samme måde som før, prøv at 

- lave følgende ændringer i din kode, 
- compiler/kør - hvilken fejl får du?
- diskuter evt. med din makker hvad fejlen betyder
- ret fejlen og compiler/kør programmet igen

for hver af de følgende ændringer:

1. Fjern en af `{`'erne i din kode
2. Fjern en af `}`'erne i din kode
3. Skriv `mian` i stedet for `main`
4. Fjern ordet `static`
5. Fjern ordet `public` før `static`
6. Fjern ordet `System.`
7. Udskift `prinln` med `Println`
8. Udskift `println` med `print`