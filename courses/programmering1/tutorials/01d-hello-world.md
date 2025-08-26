---
title: "01d - Hello World"
---

# Hello World

1. Lav et nyt Java-projekt i IntelliJ, som du 
    -   navngiver `helloworld`
    -   som Buildsystem vælger du `IntelliJ`
    -   som JDK vælger du `21`
    -   fjern fluebenet i **Add sample code**
2. Under `Project` i venstre sidepanel, højreklik på `src` og vælg `New` → `Java Class`
3. Navngiv klassen `HelloWorld`
4. Udfyld klassen, så den ligner dette:
    ```java
    public class HelloWorld {
        public static void main(String[] args) {
            System.out.println("Hello, World!");
        }
    }
    ```
5. Kør programmet for at se outputtet - skriver programmet "Hello, World!" i konsollen?
6. Sæt `//` foran `System.out.println("Hello, World!");` - så den bliver til en kommentar, så det ligner dette:
    ```java
    public class HelloWorld {
        public static void main(String[] args) {
            // System.out.println("Hello, World!");
        }
    }
    ```
7. Kør programmet igen - hvad sker der?
8. Fjern kommentaren og kør programmet igen - hvad sker der nu?
