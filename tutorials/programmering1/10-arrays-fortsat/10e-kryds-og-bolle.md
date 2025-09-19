# Kryds og bolle

- Som vi så i `tic-tac-toe` projektet, kan en kryds og bolle spilleplade repræsenteres som et array med 9 pladser, hvor første række er indeks 0, 1, 2, anden række er indeks 3, 4, 5 og tredje række er indeks 6, 7, 8.
- Et array kan naturligvis også indeholde andre arrays, altså vil vi kunne initialisere spillepladen som et 2D array (et array af arrays).
  ```java
  int[][] board = {
      {0, 0, 0},
      {0, 0, 0},
      {0, 0, 0}
  };
  ```
- Således indholder `board[0]` et array med de første række, `board[0][0]` er den første plads i første række, osv.
- I den tidligere opgave lavede vi 
   - en metode `printBoard` der udskrev spillepladen
   - en metode `makeMove` der sættede en brik på spillepladen
   - en metode `checkWin` der tjekkede om en spiller havde vundet
1. Fortsæt med dit `tic-tac-toe` projekt fra tidligere, hvis du ikke har det, så opret et nyt Intellij-projekt `tic-tac-toe` med en klasse og en `main`-metode.
2. Ændr din spilleplade til at være et 2D array i stedet for et 1D array.
3. Ændr dine metoder `printBoard`, `makeMove` og `checkWin` til at bruge det 2D array.
4. Test dit program og se at det stadig virker som før.