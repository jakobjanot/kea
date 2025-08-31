# Email brevfletning

- Vi skal lave et program, der laver en simpel brevfletning, så du kan generere en masse mails. Der er flg. krav:
    - Navn på modtager
    - Email-addresse på modtager
    - Navn på afsender
    - Email-adresse på afsender
    - Tidspunkt for afsendelse
    - Besked
    - Du skal tjekke at email-adresserne ender på `.dk`
    - Programmet skal udskrive emails som eksempelvis:
        ```txt
        From: Flemming <flemse@hotmail.com>
        To: Kirsten <kisser@gmail.com>
        Subject: Invitation til fest

        Hej Kirsten
        Du er inviteret til fest på fredag kl. 19.
        Hilsen Flemming
        ```
- Tænk over hvordan du kan 
    - bruge flere metoder til at gøre koden mere læselig 
    - bruge gode navne på metoder
    - genbruge metoder du allerede har lavet i en tidligere øvelse?
- Generer en masse emails
---

# Øvelse - En timer (med rekursion)

- Vi har vores brød i ovenen og har brug for at sætte en timer. En timer er et program, der **tæller ned** fra et givet tal til 0. En måde at løse det på er **rekursion**. Rekursion er en teknik, hvor **metodem kalder sig selv**.

***

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

---

# Øvelse - Stopur
Det modsatte af en timer er vel et **stopur**. Det tæller op fra 0 til vi stopper det. Her vælger vi dog at stoppe det når vi når 10. 

***

1. Lav et nyt projekt med navnet `stopwatch`.
2. Prøv at bruge **rekursion** som i `Countdown`-øvelsen, men **tæl op fra 0 til 10**.
3. Virker det?
4. Prøv at give din tælle-op-metode to parametre isteden for én, dvs. `countup(int number, int maxNumber)`, hvor `maxNumber` er det tal du vil tælle op til. Ret metoden, så den bruger `maxNumber` til at stoppe tællingen.
5. Kald metoden i `main` med `countup(0, 10);`.
6. Kør programmet med forskellige start og slut værdier og se resultatet i konsollen.

---

# Øvelse - C02 udledning

En dansker udleder 6,7 ton CO2 om året.
Et ton C02 har et rumfang på 1,96 kubikmeter.

1. Lav et program, der beregner, hvor stor siden er på den kasse (kube) vi skal bruge for at rumme den mængde CO2 vi udleder på et år.

Hint: Kig på `Math`-klassens `cbrt` (cube root).