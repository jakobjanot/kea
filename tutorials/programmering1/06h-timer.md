# En timer (med rekursion)

- Vi har vores brød i ovenen og har brug for at sætte en timer. En timer er et program, der **tæller ned** fra et givet tal til 0. En måde at løse det på er **rekursion**. Rekursion er en teknik, hvor **metodem kalder sig selv**.

1. Lav et nyt IntelliJ projekt med en `Timer` klasse med en `main` metode.
3. I `main` metoden, tilføj følgende kode:
    ```java
    int startNumber = 10; // Startnummer for nedtælling
    countDown(startNumber);
    ```
4. Tilføj en metode `countDown` der tager et heltal som parameter og udskriver tallet og kalder sig selv med tallet minus 1.
```java
public static void countDown(int number) {
    System.out.println(number);

    countDown(number - 1);
}
```
5. Kør programmet og se nedtællingen i konsollen.
6. Hov. Der er et problem. Programmet stopper ikke, når det når 0. Ret metoden, så den stopper ved 0.
7. Hint: Det er en betingelse for at metoden må kalde sig selv, at `number` er større end 0.
