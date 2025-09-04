# Portoberegner

- Når du skal have leveret en pakke med PostNord betaler du for vægten af pakken:
    - Op til 1 kg: 60 kr
    - Op til 2 kg: 65 kr
    - Op til 5 kg: 70 kr
    - Op til 10 kg: 90 kr
    - Op til 20 kg: 160 kr

1. Fortsæt på IntelliJ projektet `shipping-cost`
2. Flyt `if-else` logikken til en ny metode kaldet `calculateShippingCost`
3. Test metoden med forskellige vægte for at sikre, at den returnerer de korrekte priser, fx
```java
    public static void main(String[] args) {
        System.out.println(calculateShippingCost(1));
        System.out.println(calculateShippingCost(2));
        // etc.
    }
```