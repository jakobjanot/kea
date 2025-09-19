# Min playliste

- Opret et nyt Intellij-projekt `my-playlist` med en klasse og en `main`-metode.
- Kom i tanke om 10 musiknumre du godt kan lide
- Opret et `String` array kaldet `songs` med 10 elementer, der nu er tomme, men senere skal indeholde navnene på dine musiknumre
  ```java
  String[] songs = new String[10];
- Tilføj nu dine 10 musiknumre til din playliste `songs` en ad gangen, f.eks. 
  ```
  ```java
  songs[0] = "Bohemian Rhapsody";
  songs[1] = "Imagine";
  // osv.
  ```
- Udskriv hele din playliste ved at iterere over array'et med en `foreach`-løkke, f.eks.
  ```java
  for (String song : songs) {
      System.out.println("Spiller nu: " + song);
  }
  ```
- Test dit program og se at din playliste bliver udskrevet korrekt
- Flyt `foreach`-løkken til en metode `public static void play(String[] songs)`, der tager et `String` array som parameter
- Test det ved at kalde `play(songs)` fra `main` for at afspille din playliste