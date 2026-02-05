# Find fejlen

- Når der er syntax fejl i din Java kildekode vil Java-compiler'en vise en fejlmeddelelse.
- Opret en projekt `lots-of-errors` og en klasse `Main`.
- Copy-paste de følgende kode-bidder ind i din `Main` klasse.
- Prøv at rette koden, så den ikke længere giver fejl.
- Hvis du mister overblikket, så slet det og copy-paste koden ind på ny.
- Når du har rettet koden, så brug IntelliJ's "Reformat Code" funktion for at sikre korrekt indrykning.
    - Ctrl + Alt + L på Windows
    - Cmd + Option + L på Mac

1. ```txt
   import java.lang.Math;
   
   public class Main {
       public static void main(String[] args) {
           diameter double = 12742.0; // km
           double circumfer = Math.PI * diameter;

           System.out.println("Jordens omkreds " + 
                              circumfer);
       }
   }
   ```
2. ```txt
   import java.lang.Math;
   
   public class Main {
   }
   public static void main(String[] args) {
       int momsAge = 40;
       int dadsAge = 42;
   
       int oldestAge = Math.max(momsAge, dadsAge);
       
       System.out.println("Den ældste forælder er " + 
                          oldestAge + " år gammel.");
   }
   ```
3. ```txt
   public class Main {
       public static void main(String[] args) {
           boolean hasRedEye = true;
           boolean hasPush = false;
           boolean needsAntibiotica;

           System.out.println("Skal behandles: " +
                              needsAntibiotica);
           needsAntibiotica = hasRedEye || hasPush;
       }
   }
   ```
4. ```txt
   public class Main {
       public static void main(String[] args) {
           double speed = calcSpeed(100, 2);
           System.out.println("Hastighed: " + 
                               speed + " km/t");
       }
   
       public static double calcSpeed(double distance, 
                                      double time) {
           distance / time;
       }
   }
   ```
5. ```txt
   import java.lang.Math;
   
   public class Main {
       public static void main(String[] args) {
           double diameter = 12742.0;
           System.out.println("Jordens omkreds er " + 
                              calcCircumfer(diameter));
       }
   
       public static String calcCircumfer(double d) {
           return Math.PI * d;
       }
   }
   ```