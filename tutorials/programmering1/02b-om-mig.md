# Om mig

1. Lav et nyt Java-projekt i IntelliJ, som du navngiver `about-me`
2. Under `Project` i venstre sidepanel, højreklik på `src` og vælg `New` -> `Java Class`
3. Giv din klasse navnet `AboutMe`.
4. Tilføj en `main` metode, så det ligner dette:
    ```java
    public class AboutMe {
        public static void main(String[] args) {
            String familyName = ???;
            char givenNameInitial = ???;
            boolean isCoffeeDrinker = ???;
            boolean isTeaDrinker = ???;

            System.out.println("Navn: " + givenNameInitial + 
                               ". " + familyName);
            System.out.println("Kaffe? " + isCoffeeDrinker);
            System.out.println("Te? " +  isTeaDrinker);
        }
    }
    ```
5. Erstat `???` med værdier, der passer til **dig**, variablene er:
    - `familyName` (efternavn)
    - `givenNameInitial` (første bogstav i dit fornavn)
    - `isCoffeeDrinker`/`isTeaDrinker` (drikker du kaffe/te?)
