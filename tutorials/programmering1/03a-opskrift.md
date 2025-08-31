# Øvelse - Brød-opskrift

Vi skal lave et program, der udskriver en brød-opskrift.

1. Lav et nyt Java-projekt i IntelliJ, som 
    - du navngiver `bread-recipe`
    - som Buildsystem vælger du `IntelliJ`
    - som JDK vælger du `21`
    - fjern fluebenet ved `Add sample code`
2. Under `Project` i venstre sidepanel, højreklik på `src` og vælg `New` -> `Java Class`
3. Giv din klasse navnet `BreadRecipe`.
4. Tilføj en `main` metode, så det ligner dette:
    ```java
    public class BreadRecipe {
        public static void main(String[] args) {
            
        }
    }
    ```
5. Skriv opskriften i `main` metoden, så den udskriver fremgangsmåden for at lave cookies. Brug `System.out.println` til at udskrive hver linje af opskriften.
    ```txt
    Tilsæt 300 ml. vand til skålen
    Tilsæt 10 g. gær til skålen
    Tilsæt 500 g. hvedemel til skålen
    Ælt dejen i 5 minutter
    Lad dejen hæve i 1 time
    Ælt dejen i 5 minutter
    Lad dejen hæve i 1 time
    Ælt dejen i 5 minutter
    Lad dejen hæve i 1 time
    Tilsæt 10 g. salt til skålen
    Ælt dejen i 5 minutter
    Lad dejen hæve i 1 time
    Form dejen til et brød
    Bag brødet i ovnen ved 220 grader i 30 minutter
    ```
7. Kør programmet og se resultatet i konsollen.
8. Prøv nu at ændre æltetiden til 7 minutter og hævetiden til 1,5 time. Kør programmet igen.
9. Er der nogle dele af opskriften, der gentager sig selv?
   - Hvis ja, så overvej at lave en metode, for hver del af opskriften, der gentager sig selv.
10. Virker det stadig? Så prøv at ændre æltetiden til 8 minutter og hævetiden til 2 timer. Var det lettere at ændre opskriften nu?
