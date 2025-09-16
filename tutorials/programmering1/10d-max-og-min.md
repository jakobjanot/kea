# Min og max

1. Lav et Intellij-projekt `array-min-max` med en klasse og en `main`-metode.
2. Du skal lave en metode `public static int findMax(int[] arr)` der finder det største tal i et array af `int` og returnerer det.
3. Find inspiration i dit tidligere projekt `copycat` til at lave metoden.
4. Du skal have en variabel `int max` der holder styr på det største tal du har fundet indtil videre. Til at starte med kan du sætte `max` til det første element i arrayet.
5. Du skal iterere gennem arrayet et element ad gangen. Hver gang du finder et element der er større end `max`, skal du opdatere `max` til at være det nye tal.
6. Når du har gennemgået hele arrayet, skal du returnere `max`.
7. Test din metode i `main` ved at oprette et array med nogle tal og kalde `findMax` og udskrive resultatet.
8. Lav nu en tilsvarende metode `public static int findMin(int[] arr)` der finder det mindste tal i et array af `int`.
9. Test også denne metode i `main` ved at oprette et array med nogle tal og kalde `findMin` og udskrive resultatet.