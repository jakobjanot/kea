# Portoberegner-metode

1. Tag udgangspunkt i dit tidligere projekt `shipping-cost`.
2. Prøv nu flytte din `if-else if-else` logik til en ny metode kaldet `calculateShippingCost`, som tager `double weight` som parameter og returnerer et `int` der repræsenterer forsendelsesomkostningerne.
3. Få det til at fungere og test ved at kalde `calculateShippingCost` med forskellige vægte for at sikre, at den returnerer de korrekte priser, fx
```java
    public static void main(String[] args) {
        System.out.println(calculateShippingCost(0.8));
        System.out.println(calculateShippingCost(18.0));
        // etc.
    }
```