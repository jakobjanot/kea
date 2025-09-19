# Lommeregner

(en lommeregner som skal bruge en Math-klasse i en pakke math, hvor eleven skal rette i Math-klassen og Main-klassen for at få det til at virke, med package og import)

- Opret et nyt Intellij-projekt `pocketcalculator` med en klasse `Main` og en `main`-metode med flg.
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
- Klik på `src`-mappen i Intellij og vælg `New > Package` og navngiv den `math`
- Højreklik på pakken `math` og vælg `New > Java Class` og navngiv den `Math`
- Tilføj flg. til din nye `Math`-klasse
  ```java
  public class Math {
      public static int add(int a, int b) {
          return a + b;
      }  
      public static int subtract(int a, int b) {
          return a - b;
      }
  }
  ```
- Virker det? Hvis ikke, hvad mangler der i din `Math`-klasse?
- Test dit program og se at det virker
- Overvej i øvrigt at putte din `Main`-klasse i en pakke også, fx `app`.
