# Det er ganske vist!

- Opret et Intellij-projekt `fairytale-again` med en klasse og en `main`-metode.
- Vi lærte i projektet `fairytale` at tælle hvor mange gange et bogstav optræder i et eventyr.
- Vi vil gerne undgå at skulle gennemgå hele teksten for hvert bogstav vi vil tælle. Det er tidskrævende, hvis eventyret er langt.
- I denne implementering vil vi bruge et array `int[] counts` til at tælle forekomster af hvert bogstav. Der er 29 bogstaver i det danske alfabet, så vi laver et array med 29 pladser.
Du kan tage udgangspunkt i flg:
  ```java
  char[] alphabet = "abcdefghijklmnopqrstuvwxyzæøå".toCharArray();    
  int[] counts = new int[29];
  for (char c : text.toLowerCase().toCharArray()) {
      for (int i = 0; i < alphabet.length; i++) {
          // TILFØJ KODE HER
          // Hvis bogstavet matcher, 
          // så øg tælleren for det bogstav
      }
  }    
  for (int i = 0; i < alphabet.length; i++) {
      System.out.println(alphabet[i] + ": " + counts[i]);
  }
  ```
- Prøv at færdiggøre programmet, så det virker