# Money, money, money

Hvis vi tidligere har skrevet en pengebeløb, har vi nok brugt en `double`, fx
```java
double amount = 19.95; // kr
```
Der er flere grunde til at dette ikke er optimalt, bl.a. at vi ikke kan håndtere valutaer.

1. Opret et Intellij-projekt `money`.
2. Opret en klasse kaldet `Money`, så vi kan repræsentere et pengebeløb med en valuta, fx
   ```java
   Money coffeePriceKroner = new Money(19.50, "DKK");
   Money mealPriceEuro = new Money(19.50, "EUR");

   System.out.println(coffeePriceKroner); // 19.50 DKK
   System.out.println(mealPriceEuro);   // 19.50 EUR
   ```
2. Gør gerne klassen `Money` uforanderlig (immutable) - altså felterne `final`.
3. Vi skal kunne sammenligne to `Money`-objekter, fx
   ```java
   Money coffeePriceKroner = new Money(19.50, "DKK");
   Money mealPriceEuro = new Money(19.50, "EUR");
   Money anotherCoffeePriceInKroner = new Money(19.50, "DKK");

   System.out.println(coffeePriceKroner.equals(mealPriceEuro));
   System.out.println(coffeePriceKroner.equals(anotherCoffeePriceInKroner));
   ```
   Hvad er resultatet? Og hvad bør det være? Hvis du ikke er tilfreds med resultatet, skriv da en `equals`-metode i `Money`-klassen.
4. Test at det virker.
5. Det var lidt omstændigt. En lettere måde ville være, at implementere klassen med en `record`.
    ```java
    public record Money(double amount, String currency) {}
    ```
6. Prøv at ændre `Money`-klassen til en `record` og se om det stadig virker som forventet.
7. Hvad er forskellen på en `class` og en `record`? Hvornår kan man bruge en `record`?
8. Test om `Money`-objekterne `coffeePriceKroner` og `anotherCoffeePriceInKroner` stadig er ens.
9. Hvad sker der hvis du prøver at ændre et af felterne i et `Money`-objekt, fx `coffeePriceKroner.amount = 20.0;`? Forklar hvorfor.
10. (Valgfrit) Vi kunne godt tænke os at begrænse valutaen til kun at være "DKK", "EUR" og "USD". Hvordan kunne vi gøre det? Implementer gerne løsningen. Hint: Vi kunne bruge en `enum` til at repræsentere valutaer, fx
    ```java
    public enum Currency {
        DKK, EUR, USD
    }
    ```
    og så bruge `Currency` i stedet for `String` i `Money`-klassen.