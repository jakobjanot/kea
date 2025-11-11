# Hengemt mad

Vi har netop lavet en metode, hvormed vi kan læse pizza-data fra en fil og oprette `Pizza`-objekter ud fra dem. Nu vil vi gerne forsøge at gemme pizza-data tilbage til en fil.

1. Fortsæt i dit `pizza-data`-projekt fra forrige øvelse.
2. Opret en metode `public static void writePizzaToFile(Pizza pizza, String filePath)`, der skriver pizza-data til en fil givet ved `filePath`. Metoden skal:
   - Åbne (eller oprette) filen givet ved `filePath` til skrivning.
   - Skriv pizzaens navn på første linje, prisen på anden linje, og ingredienserne (kommasepareret) på tredje linje.
   - Luk filen efter skrivning.
3. Test din metode i `main` ved at oprette en række `Pizza`-objekter manuelt (uden at læse fra fil) og skrive dem til forskellige filer ved hjælp af `writePizzaToFile`-metoden.