---
title: "07 - Arrays og references"
---
<!-- .slide: class="ek-academic-fire" -->
# Arrays

---

Ovelse 1: Array basics
1. Hvilken af folgende er korrekt syntaks for at deklarere et array af 10 heltal
    ```java
        int a[10] = new int[10]; // A
        int[10] a = new int[10]; // B
        []int a = [10]int;       // C
        int a = new int[10];     // D
        int[] a = new int[10];   // E
    ```
--

2. Hvordan tilgår man forste element i et array af int's kaldet
numbers? Hvordan tilgår man det sidste element af numbers givet at der er 10 elementer? Hvordan tilgår man sidste element uden at vide hvor stor arrayet er?
3. Skriv kode der opretter et array af int's kaldet data med fem elementer, og folgende indhold: 27,51,33, -1,101
4. Hvilke elementer har arrayet numbers , efter at folgende kode er kort:
```java
int[] numbers = new int[8];
numbers [1] = 4;
numbers [4] = 99;
numbers [7] = 2;
int x = numbers[1];
numbers [x] = 44;
numbers[numbers[7]] = 11;
```
---

# Øvelse: Parkeringshus

1. Lav et array, der indeholder 10 pladser i et parkeringshus.
2. På hver plads er der en sensor, der kan registrere om en bil holder på pladsen eller ej. Brug `boolean` til at repræsentere om en plads er optaget (`true`) eller ledig (`false`).
   - Start med at sætte alle pladser til `false`, dvs. ledige
3. Skriv en metode, der simulerer at en bil kører ind i parkeringshuset og optager en plads.
4. Skriv en metode, der simulerer at en bil kører ud af parkeringshuset og frigiver en plads.
5. Skriv en metode, der udskriver status for parkeringshuset, så det ser sådan ud:
```txt
Plads 1: Ledig
Plads 2: Optaget
Plads 3: Ledig
...
Plads 10: Optaget
```
6. Skriv en metode, der tæller antallet af ledige pladser og udskriver det, så parkeringshuset, kan vise hvor mange pladser der er ledige.

---

# Øvelse: Parkeringhus (fortsat)

Parkeringshuset tilbyder 2 timers parkering. Derefter kan man få en bøde. P-vagten ønsker en liste over de pladser, der har været optaget i mere end 2 timer.
1. Lav et array, der indeholder tidspunkter for hvornår hver plads blev optaget. Brug `long` til at repræsentere tidspunkter i millisekunder siden 1. januar 1970 ([Unix-tid](https://da.wikipedia.org/wiki/Unix-tid)). Brug [https://www.epochconverter.com/](https://www.epochconverter.com/) til at finde tidspunkter i millisekunder.
   - Start med at sætte alle pladser til 0, dvs. ingen pladser er optaget
2. Skriv en metode, der tjekker om en plads har været optaget i mere end 2 timer og udskriver pladserne, der har været optaget i mere end 2 timer.

---

# Øvelse: Oh-lay, oh-lay, oh-lay, oh-lay...

Den danske landsholdstræner skal sætte et hold til den næste landskamp. Han har 23 spillere i sin bruttotrup, men kun 11 udvælges til startopstillingen.
1. Lav et array, der indeholder bruttotrupens spillere - blot deres navn.
2. Lav et array, der indeholder startopstillingens - uden at indtaste spillernes navne igen. 
3. Se billedet herunder, hvordan målmanden er spiller 1, forsvarsspillere er 2-5, midtbanespillere er 6-8 og angribere er 9-11. Kender du spillerne, så vælg en position, der passer til spilleren.
4. Udskriv startopstillingen, så det ser sådan ud:

[Opstilling](img/4-3-3.png)

| Trøje nr. | Spiller                  | Klub                   |
|---------------|--------------------------|------------------------|
| 1             | Filip Jørgensen          | Chelsea FC             |
| 2             | Kasper Schmeichel        | Celtic FC              |
| 3             | Oliver Christensen       | US Salernitana 1919    |
| 4             | Anton Gaaei              | AFC Ajax               |
| 5             | Jannik Vestergaard       | Leicester City FC      |
| 6             | Joachim Andersen         | Fulham FC              |
| 7             | Joakim Mæhle             | VfL Wolfsburg          |
| 8             | Lucas Høgsberg           | FC Nordsjælland        |
| 9             | Patrick Dorgu            | Manchester United      |
| 10            | Rasmus Nissen Kristensen | Eintracht Frankfurt    |
| 11            | Christian Eriksen        | Manchester United      |
| 12            | Christian Nørgaard       | Arsenal FC             |
| 13            | Matthew O'Riley          | Brighton HAFC          |
| 14            | Mikkel Damsgaard         | Brentford FC           |
| 15            | Morten Hjulmand          | Sporting Lissabon      |
| 16            | Pierre Emile Højbjerg    | Olympique de Marseille |
| 17            | Victor Froholdt          | FC København           |
| 18            | Anders Dreyer            | San Diego FC           |
| 19            | Carlo Holse              | Samsunspor             |
| 20            | Gustav Isaksen           | S.S. Lazio             |
| 21            | Kasper Dolberg           | RSC Anderlecht         |
| 22            | Mika Biereth             | AS Monaco              |
| 23            | Rasmus Højlund           | Manchester United      |

---

# Øvelse: Oh-lay, oh-lay, oh-lay, oh-lay... (fortsat)
1. 

---

# To-dimensionelle arrays

I spillet **kryds og bolle** skiftes to spillere med at sætte deres brikker, kryds eller bolle, på et 3x3 felt. Spilleren, der først får tre på stribe, vinder. Vi kan implementere kryds og bolle i Java ved at bruge et to-dimensionelt array til at repræsentere spillebrættet, dvs. som et array med tre rækker, hver række indeholende tre kolonner - i alt 9 felter. Bruger vi et `int[][]` array, kan vi bruge 0 til at repræsentere et tomt felt, 1 for kryds og -1 for bolle. 

```java
int[][] board = new int[3][3];
board[0][0] = 1; // Sætter kryds i øverste venstre hjørne
board[1][1] = -1; // Sætter bolle i midten




```