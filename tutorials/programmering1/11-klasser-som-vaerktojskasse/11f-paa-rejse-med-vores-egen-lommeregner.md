# På rejse med vores egen lommeregner

Vi har lavet en frygtelig god lommeregner, der kan udføre matematiske operationer som at lægge sammen, trække fra, gange og dividere. Fordi de fire operationer er så fundamentale, så er de indbyggede i alle programmeringssprog, så vi kan bruge dem direkte i vores kode, fx `a + b` for at lægge `a` og `b` sammen. Men lad os nu alligevel prøve at reimplementere vores rejse-konvertings-app med vores egen lommeregner.

1. Fortsæt på Intellij-projekt `travelconverter`.
2. Opret nu en pakke `travel.math` og flyt din `Math`-klasse fra `pocketcalculator` projektet herover i.
3. Ret nu din `TemperatureConverter`-klasse til at bruge din egen `Math`-klasse i stedet for `+`, `-`, `*` og `/`, fx:
    ```java
    package travel.conversion;
    import travel.math.Math;

    public class TemperatureConverter {
        public static double toCelsius(double fahrenheit) {
            return Math.divide(
                    Math.multiply(
                            Math.subtract(fahrenheit, 32), 5
                    ), 9);
        }

        public static double toFahrenheit(double celsius) {
            return Math.add(
                    Math.multiply(
                            celsius,
                            Math.divide(9, 5)
                    ), 32);
        }
    }
    ```
4. Test at dit program stadig virker, fx ved at konvertere 212 fahrenheit til celsius.
5. Prøv nu at ændre `DistanceConverter`-klassen til også at bruge din egen `Math`-klasse.
6. Test at dit program stadig virker, fx ved at konvertere 100 kilometer til miles.
7. (Ekspert opgave) Kunne man have undgået at skulle kopiere `Math`-klassen til `travel.math` pakken? Kunne vi have `pocketcalculator.math` pakken og så importere den i `travelconverter` projektet? Prøv at undersøge hvordan man kan gøre det og se om du kan få det til at virke.