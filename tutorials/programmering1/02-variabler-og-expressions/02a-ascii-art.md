# ASCII art
- De programmer vi laver, som skriver til konsollen, kalder vi **konsol-applikationer**. 
- Konsol-applikationer består udelukkende af tekst.
- I skriftfonte man bruger til kode, **monospace-fonte**, er alle tegn altid samme afstand og bredde på skærmen. Det er i modsætning til de fonte, fx Times New Roman, som vi bruger til at skrive dokumenter i Word, her "fylder" tegnet M mere end fx l.
- Vi kan udnytte brugen af **monospace**-fonte til at lave "grafik" i konsol-applikationer.

1. Lav et nyt Java-projekt du kalder `asciiart` med en klasse kaldet `AsciiArt` med en `main` metode.
2. Prøv vha. `System.out.println` at få konsollen til at printe flg. ascii art piece:
    ```txt
    #     #                            
    #     # ###### #      #       #### 
    #     # #      #      #      #    #
    ####### #####  #      #      #    #
    #     # #      #      #      #    #
    #     # #      #      #      #    #
    #     # ###### ###### ######  ####

    #     #                            
    #  #  #  ####  #####  #      ##### 
    #  #  # #    # #    # #      #    #
    #  #  # #    # #    # #      #    #
    #  #  # #    # #####  #      #    #
    #  #  # #    # #   #  #      #    #
    ## ##   ####  #    # ###### #####
    ```
3. Prøv at bruge teknikken herunder til at printe dit art med eet `System.out.println` statement
    ```java
    String lines = "Første linje" +
                   "Anden linje" +
                   "Tredje linje";
    System.out.println(lines);
5. Prøv at kopiere dit art til Word og ændre fonten til Times New Roman.
6. Hvad sker der med vores kat, når du ændrer fonten?
