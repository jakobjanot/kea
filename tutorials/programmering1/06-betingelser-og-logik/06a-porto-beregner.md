# Portoberegner

- Når du skal have leveret en pakke med PostNord betaler du for vægten af pakken:
    - Op til 1 kg: 60 kr
    - Op til 2 kg: 65 kr
    - Op til 5 kg: 70 kr
    - Op til 10 kg: 90 kr
    - Op til 20 kg: 160 kr

1. Lav et nyt IntelliJ projekt kaldet `shipping-cost` med en klasse `ShippingCostCalculator` der har en `main` metode.
2. Vi kan bruge `if`, `else if` og `else` til at bestemme prisen baseret på vægten. Du kan tage udgangspunkt i følgende kode:
   ```java
   int shippingCost = 0;
   if (weight <= 1.0) {
       shippingCost = 60;
   } else if (weight <= 2.0) {
       shippingCost = 65;
   } // ...
   System.out.println("Porto: " + shippingCost + " kr");
   ```
3. Test metoden med forskellige vægte for at sikre, at den returnerer de korrekte priser
4. Ekstra: Hvordan kan vi håndtere vægte over 20 kg?
5. Udvid dit program, så du kan indtaste vægten via tastaturet, dvs. brug `System.in` og `Scanner` ligesom i tidligere opgaver.