# Kryds og bolle - interaktiv

- Fortsæt med dit `tic-tac-toe` projekt fra tidligere. Du bestemmer selv om du vil bruge et 1D eller 2D array til spillepladen.
- Kryds og bolle spilles af to spillere, der skiftes til at sætte deres tegn (X eller O) på pladen. Den første spiller der får tre på stribe vinder. Når alle pladser er fyldte og ingen har vundet er der uafgjort.
1. Tilføj en metode `checkDraw`, der tjekker om der er uafgjort (dvs. alle pladser er fyldte og ingen har vundet)
2. Lav en `while`-løkke i `main`, der kører spillet indtil en spiller vinder (`checkWin`) eller der er uafgjort (`checkDraw`)
3. I hver iteration af løkken skal du
   - Udskrive spillepladen
   - Bede brugeren indtaste en brik (X eller O) og i hvilken position den sættes
   - Kalde `makeMove` med brugerens input
4. Når løkken er færdig, skal du udskrive spillepladen en sidste gang og fortælle om der er en vinder eller uafgjort