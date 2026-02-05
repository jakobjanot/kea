# Børnesangsgenerator

- Du skal fortsætte arbejdet med sanggeneratoren fra tidligere, projektet `song-generator`.
- Anvend nu din nye viden om `System.out.printf()` til at forbedre din sanggenerator, så den bliver lettere at læse og vedligehold. Som eksempel:
  ```java
  System.out.printf(
    "Der var %s-%s her, %s-%s der, ...", 
    sound, sound, sound, sound);
  ```
  er meget nemmere at læse end:
  ```java
  System.out.println(
    "Der var " + sound + "-" + sound + " her, " +
    sound + "-" + sound + " der, ...");
  ```
- I Java kan du printe flere linjer ad gangen ved at bruge omslutte tekst med `"""`, fx
  ```java
  System.out.printf("""
    Der var %s-%s her, %s-%s der,
    %s her, %s der, alle vegne %s
    """, sound, sound, sound, sound,
         sound, sound, sound);
  ```
- Prøv at ændre dit program til at bruge denne teknik til at printe versene