# Lommeregner++

Vi skal udvide vores lommeregner til også at kunne gange og dividere og endnu vigtigere, så skal den kunne håndtere decimaltal, altså `double` i stedet for `int`. Vi beholder de metoder der tager `int` som parametre og udnytter at man i Java kan have flere metoder med samme navn, så længe de har forskellige parametre (**overloading**), fx:
```java
public static int add(int a, int b) { ... }
public static double add(double a, double b) { ... }
```

1. Fortsæt på Intellij-projekt `pocketcalculator` og ret nu din `Main`-klasse til også at bruge `double`, fx:
    ```java
    public class Main {
        public static void main(String[] args) {
            int a = 5;
            int b = 3;

            System.out.println(a + " + " + b + " = " + 
                               math.Math.add(a, b));
            System.out.println(a + " - " + b + " = " + 
                               math.Math.subtract(a, b));
            System.out.println(a + " * " + b + " = " + 
                               math.Math.multiply(a, b));
            System.out.println(a + " / " + b + " = " + 
                               math.Math.divide(a, b));
            
            
            /*
            double x = 5.0;
            double y = 3.0;
            
            System.out.println(x + " + " + y + " = " + 
                               math.Math.add(x, y));
            System.out.println(x + " - " + y + " = " + 
                               math.Math.subtract(x, y));
            System.out.println(x + " * " + y + " = " + 
                               math.Math.multiply(x, y));
            System.out.println(x + " / " + y + " = " + 
                               math.Math.divide(x, y));
            */
        }
    }
    ```
2. Ret din `Math`-klasse til også at have `multiply` og `divide` metoder, der tager `int` som parametre
3. Test at dit program virker
4. Fjern kommentarerne i `Main`-klassen, så vi nu kalder `add`, `subtract`, `multiply` og `divide` med både `int` og `double` parametre
5. Tilføj nu metoder `add`, `subtract`, `multiply` og `divide` i `Math`-klassen, der tager `double` som parametre
6. Test at dit program virker