# Gæt et tal
- Lav et nyt IntelliJ-projekt kaldet `secret-number`, hvori du har en klasse og en `main` metode
- Lav et program, der lader brugeren gætte et tal mellem 1 og 10.
- Hvis brugeren gætter rigtigt, skal programmet sige "Du gættede rigtigt!" og afslutte.
- Hvis brugeren gætter forkert, skal programmet sige "Forkert gæt, prøv igen!" og lade brugeren gætte igen.
- Med en `while`-løkke kan vi blive ved med at spørge brugeren om et gæt, indtil det er rigtigt:
  ```java
  while (guess != secretNumber) {
      System.out.println("Gæt et tal mellem 1 og 10");
      guess = scanner.nextInt();
  }
  ```
- Prøv at skrive hele programmet og test det med `secretNumber` sat til forskellige værdier
