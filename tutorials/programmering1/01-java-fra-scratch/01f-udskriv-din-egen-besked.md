# Udskriv din egen besked

1. Lav et nyt Java-projekt i IntelliJ, som du 
    -   navngiver `myfirstprogram`
    -   som Buildsystem vælger du `IntelliJ`
    -   som JDK vælger du `21`

2. Under `Project` i venstre sidepanel, højreklik på `src` og vælg `New` → `Java Class`
3. Navngiv klassen `MyFirstProgram`
4. Tilføj en `main` metode så det ligner dette:
    ```java
    public class MyFirstProgram {
        public static void main(String[] args) {
            
        }
    }
    ```
5. Indtast følgende kode i `main` metoden:
    ```java
    System.out.println("Hey there!");
    ```
6. Tjek at din kode ligner dette:
    ```java
    public class MyFirstProgram {
        public static void main(String[] args) {
            System.out.println("Hey there!");
        }
    }
    ```
5. Kør programmet for at se outputtet - skriver programmet "Hey there!" i konsollen?

--

6. Skriv en ny linje i `main` metoden, der bruger `System.out.println` til at udskrive en besked - vælg selv en besked. 
    ```java
    public class MyFirstProgram {
        public static void main(String[] args) {
            System.out.println("Hey there!");
            System.out.println("I am learning Java!");
        }
    }
    ```
7. Kør programmet igen - hvad sker der?