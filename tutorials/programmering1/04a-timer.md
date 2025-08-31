# En timer (med rekursion)

- Vi har vores brød i ovenen og har brug for at sætte en timer. En timer er et program, der **tæller ned** fra et givet tal til 0. En måde at løse det på er **rekursion**. Rekursion er en teknik, hvor **metodem kalder sig selv**.

1. Lav et nyt IntelliJ projekt med en `Countdown` klasse med en `main` metode.
3. I `main` metoden, tilføj følgende kode:
    ```java
    int startNumber = 10; // Startnummer for nedtælling
    countdown(startNumber);
    ```
4. Tilføj en metode `countdown` der tager et heltal som parameter og udskriver tallet og kalder sig selv med tallet minus 1, indtil tallet når 0. (`if` kommer vi til senere på semesteret, så det er ok at du ikke forstår det)
```java
public static void countdown(int number) {
    System.out.println(number);

    if (number > 0) countdown(number - 1);
}
```
5. Kør programmet og se nedtællingen i konsollen.
6. Prøv at ændre `startNumber` til et `100` og se hvordan nedtællingen ændrer sig.
7. Prøv at fjerne `if (number > 0)` og se hvad der sker.
8. Prøv at ændre `countdown(number - 1)` til `countdown(number + 1)` og se hvad der sker.
