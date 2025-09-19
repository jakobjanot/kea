# Lommeregner

- Til en lommeregner app skal vi bruge en værktøjskasse med matematiske funktioner til at udføre beregningerne. Vi har allerede en sådan værktøjskasse i Java, nemlig klassen `Math`, som vi har brugt tidligere, MEN vi kan også lave vores egen.
- I denne simple lommeregner (den skal jo kunne være i lommen) skal vi kun kunne lægge sammen og trække fra på heltal.
1. Opret et nyt Intellij-projekt `pocketcalculator` med en klasse `Main` og en `main`-metode med flg.
    ```java
    public class Main {
        public static void main(String[] args) {
            int a = 5;
            int b = 3;
            System.out.println(a + " + " + b + " = " + 
                               math.Math.add(a, b));
            System.out.println(a + " - " + b + " = " + 
                               math.Math.subtract(a, b));
        }
    }
    ```
2. Klik på `src`-mappen i Intellij og vælg `New > Package` og navngiv den `math`
3. Højreklik på pakken `math` og vælg `New > Java Class` og navngiv den `Math`
4. Tilføj flg. til din nye `Math`-klasse
  ```java
  public class Math {
      public static int add(int a, int b) {
          return a + b;
      }  
      public static int subtract(int a, int b) {
          return a - b;
      }
      public static int multiply(int a, int b) {
          return a * b;
      }
      public static int divide(int a, int b) {
          return a / b;
      }
  }
  ```
5. Virker det? Hvis ikke, hvad mangler der i din `Math`-klasse?
6. Test dit program og se at det virker
7. Overvej i øvrigt at putte din `Main`-klasse i en pakke også, fx `app`.
