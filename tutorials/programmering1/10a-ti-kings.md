# Ti kings, tak
- Tidligere har vi lavet vores egen metode til at kopiere et array. Det lærte vi meget af, men fremover vil vi blot gøre brug af `Arrays.copyOf(...)`-metoden. `Arrays.copyOf(...)` er bare en af flere anvendelige metoder i `Arrays`-klassen, som vi skal prøve at få lidt erfaring med her.
1. Lav et nyt project `arrays-methods` i IntelliJ med en klasse og `main` metode. Husk at importere `java.util.Arrays` i toppen af din fil.
2. Lav et `String[]` array med 10 elementer og fyld det med 10 navne, fx
    ```java
    String[] royalNames = {"Gorm", "Harald", "Svend", "Knud", 
                           "Valdemar", "Christian", "Frederik", 
                           "Margrethe", "Erik", "Oluf"};
    ```
3. `Arrays.toString(...)`-metoden er en nem måde at udskrive et array på. Prøv at bruge den til at udskrive dit array med navne.
4. `Arrays.sort(...)`-metoden kan sortere et array i alfabetisk rækkefølge. Prøv at bruge den til at sortere dit array med navne og udskriv det sorterede array.
5. `Arrays.copyOf(...)`-metoden kan lave et kopi af et array. Prøv at bruge den til at lave en kopi af dit array med navne, og udskriv kopien. Prøv at rette i kopien og se om det påvirker originalen.
6. `Arrays.equals(...)`-metoden kan sammenligne to arrays og returnere `true` hvis de er ens, ellers `false`. Prøv at bruge den til at sammenligne dit originale array med kopien, både før og efter du har rettet i kopien. Har rækkefølgen af elementerne betydning? Sammenlign det originale array med en sorteret version.

