# En god bog

Det lokale bibliotek har brug for et nyt system til at holde styr på udlån af bøger.
I første omgang skal vi kunne oprette bøger, hver med en titel, en forfatter og et ISBN-nummer

1. Opret et Intellij-projekt `library-management-system`.
2. Lav en klasse `Main` med en `main`-metode, hvori du opretter en række bøger, dvs. `Book`-objekter.
   ```java
   Book book1 = new Book("Allan B. Downey", "Think Java", 9781492072508);
   Book book2 = new Book("Rachel Cusk", "Omrids", 9788763851664);
   Book book3 = new Book("Yuval Noah Harari", "Sapiens", 9780062316097);
2. Lav nu en klasse `Book`, med en konstruktor, der tager tre parametre: `author`, `title` og `isbn`, som herover og gemmer dem i felter af samme navn.
3. Gør de tre felter `final`, det bør ikke være muligt at ændre en bogs forfatter, titel eller ISBN efter den er oprettet.
4. Tilføj også en `toString`-metode, så vi kan udskrive en bog på en pæn måde, fx
   ```java
   System.out.println(book1); // Allan B. Downey: Think Java (9781492072508)
   ```
5. Test at det virker.