# Enten eller... med ternary operator
I Java har vi en "en-linjes" måde at skrive en if-else betingelse på, som kaldes en **ternary operator**. Den har følgende syntax:

Her er en metode, der bruger if/else til at bestemme om man må komme ind i en bar
```java
public static void checkAge(int age) {
    if (age >= 18) {
        System.out.println("Velkommen!");
    } else {
        System.out.println("Ud, du er for ung!");
    }
}
```
kan omskrives til:
```java
public static void checkAge(int age) {
    System.out.println(age >= 18 ? "Velkommen!" : "Ud, du er for ung!");
}
```
- Det første udtryk `age >= 18` er betingelsen, der evalueres til enten `true` eller `false`.
- Hvis betingelsen er `true`, returneres det første udtryk efter `?`, i dette tilfælde "Velkommen!".
- Hvis betingelsen er `false`, returneres det andet udtryk efter `:`, i dette tilfælde "Ud, du er for ung!".

Prøv nu selv:

1. Lad os lave et projekt `ternary-operator`
2. Omskriv flg. metode til at bruge en ternary operator i stedet for if/else:
   ```java
   public static double applyDiscount(double price, 
                                      boolean isMember) {
       double discountPrice;
       if (isMember) {
              discountPrice = price * 0.9; // 10% rabat for medlemmer
         } else {
              discountPrice = price; // Ingen rabat for ikke-medlemmer
       }
       return discountPrice;
   }
   ```
3. Lav en `main` metode, hvor du tester din `applyDiscount` metode ved at kalde den med forskellige priser og medlemsstatus og printe resultaterne.