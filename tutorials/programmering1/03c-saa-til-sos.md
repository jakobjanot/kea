# Så til søs

Vi skal lave et program, der konverterer en afstand i sømil (nautiske mil) til kilometer

1. Lav et nyt Java-projekt i IntelliJ, som du
    -   navngiver `nautical-miles-converter`
    -   som Buildsystem vælger du `IntelliJ`
    -   som JDK vælger du `21`

2. Navngiv klassen `NauticalMilesConverter`
3. Tilføj en `main` metode
4. Og skriv følgende kode i `main` metodens krop:
    ```java
    double nmi = 10;
    double km = convertNmiToKm(nmi);
    System.out.println(nmi + " nmi er " + km + " km.");
    ```
5. En sømil (nautical mile) er 1,852 meter
6. Tilføj metoden `convertNmiToKm`
7. Tjek resultatet, en sømil er næsten dobbelt så lang som en kilometer
8. Er `convertNmiToKm`, `nmi`, etc. gode navne eller for indforstået? Er `convert` overflødigt? Kom gerne op med et mere beskrivende navn.