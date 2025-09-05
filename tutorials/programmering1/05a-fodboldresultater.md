# Fodboldresultater

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
   (Du undrer dig måske over `new`. `new` bruges til at oprette en ny instans af en klasse, i dette tilfælde `Scanner` klassen. Det behøver du ikke at forstå lige nu, da vi kommer tilbage til det senere i semesteret.)
4. `Scanner` giver mulighed for at bruge andre adskillelsestegn (eng: delimiters) end mellemrum, dvs.
    ```java
    String text = "1 og 2 og 3";
    Scanner sc = new Scanner(text);
    sc.useDelimiter(" og ");
    int a = sc.nextInt(); // a er 1
    int b = sc.nextInt(); // b er 2
    int c = sc.nextInt(); // c er 3
    ```
5. Med det du lige har lært, prøv at scanne resultatet resultatet af en kamp, der endte "3-1" og skriv til konsollen:
    ```txt
    Resultat: 3-1
    Hjemmehold: 3 mål
    Udehold: 1 mål
    ```
    Hint: Du kan kalde variablerne `home` og `away` for at repræsentere hjemmeholdet og udeholdet.