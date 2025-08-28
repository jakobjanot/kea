# Æbler og pærer
- Lav et nyt Java-projekt `apples-and-pears` med klassen `ApplesAndPears` og en `main` metode
- Jeg har 20 kasser med 3 æbler og 2 pærer i hver
- Jeg har også 5 kasser med 4 æbler og 6 pærer i hver
- Jeg har lavet flg. program for at udregne hvor meget frugt jeg har i alt:
    ```java
    public class ApplesAndPears {
        public static void main(String[] args) {
            int fruits = 20 * 3 + 2 + 5 * 4 + 6;
            System.out.println("Frugt: " + fruits + " stk");
        }
    }
    ```
- Kør programmet - hvad sker der?
- Det burde være 150 styk frugt i alt
- Hint: Tænk på operatorerne `+` og `*` 
    - hvilken rækkefølge udføres de i 
    - kan du ændre rækkefølgen af beregningerne ved at bruge paranteser?