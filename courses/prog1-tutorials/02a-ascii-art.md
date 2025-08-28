---
title: 02a - ASCII art
---

# ASCII art
- De programmer vi laver, som skriver til konsollen, kalder vi **konsol-applikationer**. 
- Konsol-applikationer består udelukkende af tekst.
- I skriftfonte man bruger til kode, **monospace-fonte**, er alle tegn altid samme afstand og bredde på skærmen. Det er i modsætning til de fonte, fx Times New Roman, som vi bruger til at skrive dokumenter i Word, her "fylder" tegnet M mere end fx l.
- Vi kan udnytte brugen af **monospace**-fonte til at lave "grafik" i konsol-applikationer.

1. Lav et nyt Java-projekt du kalder `asciiart` med en klasse kaldet `AsciiArt` med en `main` metode.
2. Prøv vha. `System.out.println` at få konsollen til at printe en kat:
    ```txt
    \    /\
     )  ( ')
    (  /  )
     \(__)|
    ```
3. Prøv at bruge teknikken herunder til at printe katten med eet `System.out.println` statement
    ```java
    String lines = "Første linje" +
                   "Anden linje" +
                   "Tredje linje";
    System.out.println(lines);
5. Prøv at kopiere katten til Word og ændre fonten til Times New Roman.
4. Find selv noget fed **ASCII art** på nettet
    - eller lav dit eget på [https://www.asciiart.eu/ascii-draw-studio/app](https://www.asciiart.eu/ascii-draw-studio/app)
5. Print det til **konsollen**
