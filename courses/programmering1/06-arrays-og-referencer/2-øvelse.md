---
title: "06#2 - Arrays og references - Øvelser"
---
<!-- .slide: class="ek-academic-fire" -->
# Arrays

--

---

# To-dimensionelle arrays

I spillet **kryds og bolle** skiftes to spillere med at sætte deres brikker, kryds eller bolle, på et 3x3 felt. Spilleren, der først får tre på stribe, vinder. Vi kan implementere kryds og bolle i Java ved at bruge et to-dimensionelt array til at repræsentere spillebrættet, dvs. som et array med tre rækker, hver række indeholende tre kolonner - i alt 9 felter. Bruger vi et `int[][]` array, kan vi bruge 0 til at repræsentere et tomt felt, 1 for kryds og -1 for bolle. 

```java
int[][] board = new int[3][3];
board[0][0] = 1; // Sætter kryds i øverste venstre hjørne
board[1][1] = -1; // Sætter bolle i midten




```