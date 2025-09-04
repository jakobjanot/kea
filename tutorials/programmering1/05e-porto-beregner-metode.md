# Portoberegner-metode

3. Vha. `if-else` - implementer en metode kaldet `calculateShippingCost`, der tager vægten af pakken som parameter og returnerer prisen baseret på ovenstående priser.  Eksempel:
    ```java
    public static int calculateShippingCost(int weight) {
        if (weight <= 1) {
            return 60;
        } else if (weight <= 2) {
            return 65;
        } // ...
    }
    ```
4. Test metoden med forskellige vægte for at sikre, at den returnerer de korrekte priser, fx
```java
    public static void main(String[] args) {
        System.out.println(calculateShippingCost(1));
        System.out.println(calculateShippingCost(2));
        // etc.
    }
```
5. Prøv nu at ændre rækkefølgen af betingelserne, dvs.
    ```java
    if (weight <= 20) {
        return 160;
    } else if (weight <= 10) {
        return 90;
    } // etc.
    ```
6. Test din metode med forskellige vægte for at sikre, at den stadig fungerer korrekt. (Hvorfor virker den ikke?)