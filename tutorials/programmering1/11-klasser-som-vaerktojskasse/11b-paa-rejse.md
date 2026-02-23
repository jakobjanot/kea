# På rejse

- Vi skal rejse til et mærkeligt land, hvor de bl.a. ikke bruger det metriske system.
1. Opret klasserne 
   - `Main` med en `main`-metode i en pakke `travel.app` til at teste dine værktøjskasser
   - `DistanceConverter` med metoderne `toMiles` og `toKilometers` i en pakke `travel.conversion` til at konvertere mellem    forskellige enheder.
   - `TemperatureConverter` med metoderne `toFahrenheit` og `toCelsius` i en pakke `travel.conversion` til at konvertere mellem forskellige enheder.
2. Implementer flg. metoder i klassen `DistanceConverter`:
   - `public static double toMiles(double kilometers)` der konverterer kilometer til miles (1&nbsp;mile&nbsp;=&nbsp;1,61&nbsp;kilometer)
   - `public static double toKilometers(double miles)` der konverterer miles til kilometer (1&nbsp;kilometer&nbsp;=&nbsp;0,62&nbsp;miles)
3. Implementer flg. metoder i klassen `TemperatureConverter`:
   - `public static double toFahrenheit(double celsius)` der konverterer celsius til fahrenheit (F&nbsp;=&nbsp;(C&nbsp;*&nbsp;9/5)&nbsp;+&nbsp;32)
   - `public static double toCelsius(double fahrenheit)` der konverterer fahrenheit til celsius (C&nbsp;=&nbsp;(F&nbsp;-&nbsp;32)&nbsp;*&nbsp;5/9)
4. Kald dine metoder i `Main` og udskriv resultaterne, fx:
   ```java
   double miles = DistanceConverter.toMiles(10);
   System.out.println("10 kilometers is " + miles + " miles.");
   ```
5. Hvad skal der til for at `main`-metoden i `Main` kan bruge `DistanceConverter` og `TemperatureConverter`?
6. Test dit program og se at konverteringerne virker korrekt
7. Prøv nu at fjerne `static` fra en af de kaldte metoder i `DistanceConverter` eller `TemperatureConverter`. Hvad sker der? Ret det tilbage igen.
7. (Valgfrit) Har du lavet alle andre opgaver kan du hygge dig med at lave en simpel brugergrænseflade i konsollen, hvor brugeren kan vælge hvilken konvertering de vil lave og indtaste værdien der skal konverteres. Brug `Scanner`-klassen til at læse input fra brugeren.
8. (Valgfrit) Lav en ny klasse `CurrencyConverter` i pakken `travel.conversion` med metoderne `toUSD` og `toDKK` til at konvertere mellem danske kroner og amerikanske dollars (1&nbsp;USD&nbsp;=&nbsp;6,5&nbsp;DKK).
9. (Valgfrit) Lav en ny klasse `WeightConverter` i pakken `travel.conversion` med metoderne `toPounds` og `toKilograms` til at konvertere mellem kilogram og pounds (1&nbsp;pound&nbsp;=&nbsp;0,45&nbsp;kilogram).
10. (Valgfrit) Lav en ny klasse `VolumeConverter` i pakken `travel.conversion` med metoderne `toGallons` og `toLiters` til at konvertere mellem liter og gallons (1&nbsp;gallon&nbsp;=&nbsp;3,785&nbsp;liter).