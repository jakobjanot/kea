# Så til søs

Vi skal lave et program, der konverterer en afstand i sømil (nautiske mil) til kilometer

1. Lav et nyt Java-projekt i IntelliJ, som du
    -   navngiver `nautical-converter`
    -   som Buildsystem vælger du `IntelliJ`
    -   som JDK vælger du `21`

2. Navngiv klassen `NauticalConverter`
3. Tilføj en `main` metode
4. Og skriv følgende kode i `main` metodens krop:
    ```java
    double nauticalMiles = 10;
    double km = nauticalMilesToKilometers(nauticalMiles);
    System.out.println(nauticalMiles + " nautiske mil er " + kilometers + " kilometer.");
    ```
5. En sømil (nautical mile) er 1,852 meter
6. Tilføj metoden `nauticalMilesToKilometers`
7. Tjek resultatet, en sømil er næsten dobbelt så lang som en kilometer