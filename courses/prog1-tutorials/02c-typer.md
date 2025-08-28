---
title: Typer
---

# Typer

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