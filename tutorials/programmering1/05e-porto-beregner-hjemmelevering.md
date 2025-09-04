# Portoberegner - med hjemmelevering

1. Fortsæt på IntelliJ projektet `shipping-cost`
2. De tidligere priser gælder for levering til en pakkeshop. Ved hjemmelevering er prisen højere, dvs.
    - Op til 1 kg: 75 kr
    - Op til 2 kg: 80 kr
    - Op til 5 kg: 85 kr
    - Op til 10 kg: 105 kr
    - Op til 20 kg: 175 kr
6. Udvid `calculateShippingCost` metoden med en ekstra parameter `boolean isHomeDelivery`, der angiver om det er hjemmelevering eller levering til pakkeshop og udvid metoden til at tage højde for dette. Hint:
    ```java
    if (weight <= 1) {
        if (isHomeDelivery) {
            return 75;
        } else {
            return 60;
        }
    } else if (weight <= 2) {
        if (isHomeDelivery) {
            return 80;
        } else {
            return 65;
        }
    } // etc.
    ```
7. Kald metoden fra din `main`-metode med forskellige vægte og både med og uden hjemmelevering for at teste den.
8. Prøv nu at vende logikken om:
    ```java
    if (isHomeDelivery) {
        if (weight <= 1) {
            return 75;
        } else if (weight <= 2) {
            return 80;
        } // etc.
    } else {
        if (weight <= 1) {
            return 60;
        } else if (weight <= 2) {
            return 65;
        } // etc.
    }
    ```
9. Test din metode med forskellige vægte og både med og uden hjemmelevering for at sikre, at den fungerer korrekt.