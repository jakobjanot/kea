# Meget gennemsnitligt

- Når du skal lægge tal i et array sammen, kan du bruge en `for`-løkke til at iterere gennem arrayet og lægge hvert element sammen i en variabel `sum`

1. Opret et nyt Intellij-projekt `average` med en klasse og en `main`-metode.
2. Erstat `???` i koden herunder, så den lægger alle tallene i arrayet `numbers` sammen.
  ```java
  double[] numbers = {1, 2, 3, 4, 5};
  double sum = 0;
  
  for (double number : numbers) {
      ???
  }
  
  System.out.println("Summen er: " + sum);
  ```
3. Afprøv dit program og se at det udskriver den korrekte sum.
4. Et gennemsnit kan findes ved at dividere summen af tallene med antallet af tal
5. Udvid dit program, så det også udregner og udskriver gennemsnittet af tallene i arrayet.