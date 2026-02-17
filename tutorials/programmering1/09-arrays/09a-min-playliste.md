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
- Udskriv hele playlisten ved at iterere over array'et med en `for`-løkke, så den skriver "1. Bohemian Rhapsody", "2. Imagine", osv.
  ```java
  for (int i = 0; i < songs.length; i++) {
      // Forsæt koden her
  }
  ```
- Prøv nu at ændre i løkken, så den afspiller sangene i omvendt rækkefølge, altså starter med sang sidste sang i playlisten og slutter med den første
- Prøv nu istedet at bruge en `foreach`-løkke, og udfyld `???` i koden herunder - der spiller sangene i den normale rækkefølge:
  ```java
  for (???) {
      System.out.println("Spiller nu: " + song);
  }
  ```
- Test dit program og se at din playliste bliver udskrevet korrekt
- Flyt `foreach`-løkken til en metode `public static void play(String[] songs)`, der tager et `String` array som parameter
- Test det ved at kalde `play(songs)` fra `main` for at afspille din playliste