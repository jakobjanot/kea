# Tre for tos pris

- Når du er ude at handle har du sikkert set tilbuddet "3 for 2" på forskellige varer. Det betyder, at hvis du køber tre varer, **får du den billigste vare gratis**.
- For at beregne prisen for tre varer med "3 for 2" tilbuddet, kan du lave en metode kaldet `calculateThreeForTwoPrice`, der tager prisen på de tre varer som parametre og returnerer den samlede pris.
- Test metoden med forskellige priser for at sikre, at den returnerer den korrekte samlede pris, fx
  ```java
  public static void main(String[] args) {
      System.out.println(calculateThreeForTwoPrice(100, 200, 300));
      System.out.println(calculateThreeForTwoPrice(150, 150, 150));
      // etc.
  }
  ```
- Hint: Du skal finde den billigste vare og trække dens pris fra den samlede pris. Husk at `Math`-klassen har nogle nyttige metoder til at finde minimum og maksimum.