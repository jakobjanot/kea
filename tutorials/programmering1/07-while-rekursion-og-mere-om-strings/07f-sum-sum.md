# Sum-sum
- Lav et nyt IntelliJ-projekt kaldet `sum-sum`, hvori du har en klasse og en `main` metode
- Skriv et program, der beder brugeren om at indtaste tal igen og igen, indtil brugeren indtaster -1 for at stoppe.
- Når brugeren trykker Enter, skal programmet printe summen af alle de tal, brugeren har indtastet.
- Hint: Brug denne kode-bide til at komme i gang. OBS der mangler stadig noget.
  ```java
  int sum = 0;
  while (true) {
      System.out.println("Indtast et tal (-1 for at stoppe)");
      int number = scanner.nextInt();
      if (number == -1) {
          // ...
      }
      sum = // ...
  }
  ```
- Test programmet og se om det virker