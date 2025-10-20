# Faktura - et produkt

Vi skal implementere en klasse til at bygge en faktura. En faktura (eng: Invoice) består af en række linjer med produkter, deres pris. I bunden er der en linje, hvor der står Total, hvor summen af de købte produkter er beregnet. Det er det beløb kunden forventes at betale.
I øvelsen skal vi udnytte at IntelliJ kan generere test-klasser for os, og vi skal bruge JUnit til at skrive tests.

1. Opret et IntelliJ-projekt `invoice`
2. Lav en klasse `Product`, som har felterne:
   - String name
   - double price
   Lav en constructor, getters `getName()` og `getPrice()` og en `toString()` metode der returnere en tekst som fx `Bread: 12,50 kr`
3. Vær sikker på at du har din cursor stående i klassen `Product`. Klik nu `Generate` og vælg `Test...`. 
   - IntelliJ spørger nu om du vil oprette en test-klasse for dig, og du skal sige ja til det. 
   - IntelliJ foreslår at kalde den `ProductTest` - det skal du sige ja til.
   - IntelliJ spørger nu hvilke metoder du vil have med i testen. Vælg fx `Constructor`, `getName` og `getPrice`.
   - IntelliJ vil spørge dig om du vil tilføje JUnit5 til projektet - det skal du sige ja til. Da JUnit5 IKKE er en del af Javas standard-bibliotek skal vi have det med som en dependency i projektet, det sørger IntelliJ for.
4. Tilret test-metoderne i `ProductTest` så de tester at constructoren (`new Product(...)`) og getters (`getName()` og `getPrice()`) virker som forventet.
   - Fx kan du teste at `getName()` returnerer det navn du gav produktet i constructoren.
     Du kan bruge `assertEquals(expected, actual)` til at teste at det forventede resultat er lig med det faktiske resultat, eksempelvis:
     ```java
     @Test
     void getName() {
         Product product = new Product("Bread", 12.50);
         assertEquals("Bread", product.getName());
     }
     ```
     - Prøv selv at skrive tilsvarende test for `getPrice()` og for constructoren.
5. Højreklik i `ProductTest` og vælg `Run 'ProductTest'` for at køre dine tests. Ret evt. fejl i `Product` indtil alle tests består.