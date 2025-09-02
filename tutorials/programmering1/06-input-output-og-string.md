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
2. Spørg brugeren, hvor mange gram mel der skal bruges til en cookie (find på et tal eller googl det!)
3. Beregn mængden af mel der skal til og print det til brugeren.

