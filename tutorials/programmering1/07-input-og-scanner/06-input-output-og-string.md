# Input og output

---

# Cookie opskrift

Lav et Java program der kan beregne den mængde mel der skal bruges i en cookie opskrift, afhængigt af hvor mange cookies der skal laves. Du kan tage udgangspunkt i flg. kode:

```java
import java.util.Scanner;
public class CookieRecipe {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Hvor mange cookies vil du bage? ");
        
        int numberOfCookies = scanner.nextInt();
        
        // Fortsæt her...
        
        scanner.close();
    }
}
```
1. Bed brugeren om, hvor mange cookies de ønsker at bage.
2. Find en opskrift på cookies på nettet. Beregn mængden af mel, osv. der skal til og print ingredienslisten ud til brugeren, så den passer til det antal cookies der skal bages.
3. Prøv at ændre koden ved at bruge `if` og `hasNext`-metoderne i `Scanner`-klassen til at håndtere fejlindtastning, så programmet ikke crasher, hvis brugeren indtaster noget forkert.

