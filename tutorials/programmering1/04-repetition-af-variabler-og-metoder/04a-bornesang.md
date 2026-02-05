# Børnesangsgenerator

- Lav et nyt Java-projekt i IntelliJ, som du navngiver `song-generator`.
- Lav en Java-klasse `SongGenerator` med en `main` metode.
- Mange børnesange har vers der gentager sig - med få ændringer. Et godt eksempel er Jens Hansens bondegård, hvor hvert vers er et dyr og dets lyde, "hest" og "prr-prr", "ko" og "muh-muh", osv.
- Lav først en metode, der kan printe et vers, fortsæt fx på:xs
  ```java
  public static void printVerse(String animal, 
                                String sound) {
    System.out.println("Jens Hansen havde en bondegård, 
                        ih ah ih ah oh.");
    System.out.println("Og på den gård " +
                       "der var en " + animal + 
                       ", ih ah ih ah oh.");
    }
  ```
- Lav en sanggenerator, der kan generere en hel sang ved at kalde vers-metoden flere gange med forskellige dyr og deres lyde.