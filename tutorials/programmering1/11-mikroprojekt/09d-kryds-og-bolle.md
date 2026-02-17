# Kryds og bolle - spillepladen

I kryds og bolle spilles der på en 3x3 spilleplade. Hver spiller skiftes til at sætte deres tegn (X eller O) på pladen. Den første spiller der får tre på stribe vinder. Vi kan repræsentere spillepladen som et array med 9 pladser - med indeks 0 til 8, således:

```
 0 | 1 | 2
---+---+---
 3 | 4 | 5
---+---+---
 6 | 7 | 8
```
Du kan bruge et array af `int` således at 0 betyder tom plads, 1 betyder X og -1 betyder O.
1. Opret et Intellij-projekt `tic-tac-toe` med en klasse og en `main`-metode.
2. Opret spillepladen.
3. Skriv en metode `printBoard` der udskriver spillepladen i et pænt format.
4. Skriv en metode `makeMove` der tager to parametre: position (0-8) og spiller (1 eller -1). Metoden skal sætte spillerens tegn på den angivne position
5. Skriv en metode `checkWin` der tjekker om en spiller har vundet. Metoden skal tage en parameter: spiller (1 eller -1). Metoden skal returnere `true` hvis spilleren har tre på stribe, ellers `false`.
6. Prøv at spille et "forsimplet" spil, hvor den ene spiller vinder efter tre træk. F.eks:
   - Spiller 1 sætter X på position 0
   - Spiller -1 sætter O på position 4
   - Spiller 1 sætter X på position 1
   - Spiller -1 sætter O på position 5
   - Spiller 1 sætter X på position 2 (vinder)
