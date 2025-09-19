# På rejse

- Vi skal rejse til et mærkeligt land, hvor de bl.a. ikke bruger det metriske system.
1. Opret klasserne 
  - `App` med en `main`-metode i en pakke `travel.app` til at teste dine værktøjskasser
  - `DistanceConverter` med metoderne `convertToMiles` og `convertToKilometers` i en pakke `travel.conversion` til at konvertere mellem forskellige enheder.
  - `TemperatureConverter` med metoderne `convertToFahrenheit` og `convertToCelsius` i en pakke `travel.conversion` til at konvertere mellem forskellige enheder.
2. Implementer metoderne i `DistanceConverter`:
   - `public static double convertToMiles(double kilometers)` der konverterer kilometer til miles (1 mile = 1,61 kilometer)
   - `public static double convertToKilometers(double miles)` der konverterer miles til kilometer (1 kilometer = 0,62 miles)
3. Implementer metoderne i `TemperatureConverter`:
   - `public static double convertToFahrenheit(double celsius)` der konverterer celsius til fahrenheit (F = (C * 9/5) + 32)
   - `public static double convertToCelsius(double fahrenheit)` der konverterer fahrenheit til celsius (C = (F - 32) * 5/9)
4. Kald dine metoder i `App` og udskriv resultaterne, fx:
   ```java
   double miles = DistanceConverter.convertToMiles(10);
   System.out.println("10 kilometers is " + miles + " miles.");
   ```
5. Hvad skal der til for at `main`-metoden i `App` kan bruge `DistanceConverter` og `TemperatureConverter`?
6. Test dit program og se at konverteringerne virker korrekt
7. Prøv nu at fjerne `static` fra en af de kaldte metoder i `DistanceConverter` eller `TemperatureConverter`. Hvad sker der? Ret det tilbage igen.
7. (Valgfrit) Har du lavet alle andre opgaver kan du hygge dig med at lave en simpel brugergrænseflade i konsollen, hvor brugeren kan vælge hvilken konvertering de vil lave og indtaste værdien der skal konverteres. Brug `Scanner`-klassen til at læse input fra brugeren.
8. (Valgfrit) Lav en ny klasse `CurrencyConverter` i pakken `travel.conversion` med metoderne `convertToUSD` og `convertToDKK` til at konvertere mellem danske kroner og amerikanske dollars (1 USD = 6,5 DKK).
9. (Valgfrit) Lav en ny klasse `WeightConverter` i pakken `travel.conversion` med metoderne `convertToPounds` og `convertToKilograms` til at konvertere mellem kilogram og pounds (1 pound = 0,45 kilogram).
10. (Valgfrit) Lav en ny klasse `VolumeConverter` i pakken `travel.conversion` med metoderne `convertToGallons` og `convertToLiters` til at konvertere mellem liter og gallons (1 gallon = 3,785 liter).