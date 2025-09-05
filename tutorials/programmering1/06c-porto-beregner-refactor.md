# Refaktorering af porto-beregner

1. Tag udgangspunkt i dit tidligere projekt `shipping-cost`.
2. Vi skal nu prøve at simplificere den `calculateShippingCost` metode du lavede sidst. Istedet for:
   ```java
   int shippingCost = 0;
   if (weight <= 1.0) {
       shippingCost = 50;
   } else if (weight <= 2.0) {
       shippingCost = 65;
   } // etc.
   return shippingCost;
   ```
   prøv nu at returnere værdien direkte i stedet for at bruge en variabel, eks.
   ```java
   if (weight <= 1.0) {
       return 50;
   } else if (weight <= 2.0) {
       return 65;
   } // etc.
   ```
3. Det er simplere end før. Test din metode med forskellige vægte for at sikre, at den stadig fungerer korrekt.
4. Prøv nu at ændre rækkefølgen af betingelserne, dvs.
    ```java
    if (weight <= 20.0) {
        return 160;
    } else if (weight <= 10.0) {
        return 90;
    } // etc.
    ```
6. Test din metode med forskellige vægte for at sikre, at den stadig fungerer korrekt. (Hvorfor virker den ikke?)