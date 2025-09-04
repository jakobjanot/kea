# Fodbold resultater

1. Opret et nyt projekt `football-result-scanner` i IntelliJ og en klasse `FootballResultScanner` med en `main` metode.
2. Tilføj `import java.util.Scanner;` øverst i filen.
3. Tidligere har vi set at vi kan udlæse flere tal fra en tekst ved at bruge `Scanner` klassen. For eksempel:
   ```java
   String text = "1 2 3";
   Scanner sc = new Scanner(text);
   
    int a = sc.nextInt(); // a er 1
    int b = sc.nextInt(); // b er 2
    int c = sc.nextInt(); // c er 3
   ```
4. `Scanner` giver mulighed for at bruge andre adskillelsestegn (eng: delimiters) end mellemrum, dvs.
    ```java
    String text = "1 og 2 og 3";
    Scanner sc = new Scanner(text);
    sc.useDelimiter(" og ");
    int a = sc.nextInt(); // a er 1
    int b = sc.nextInt(); // b er 2
    int c = sc.nextInt(); // c er 3
    ```
5. Prøv at scanne resultatet resultatet af en kamp, der endte "3-1" og skriv til konsollen:
    ```txt
    Resultat: 3-1
    Hjemmehold: 3 mål
    Udehold: 1 mål
    ```