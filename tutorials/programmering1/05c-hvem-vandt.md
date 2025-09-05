# Hvem vandt?

- Tag igen udgangspunkt i `fodbold-resultat-scanner` projektet
- Nu vil vi gerne udvide programmet, så det også viser, hvilket hold der vandt
- Tilføj følgende kode til programmet:
   ```java
   if (home > away) {
       System.out.println("Hjemmeholdet vandt!");
   } else if (away > home) {
       System.out.println("Udeholdet vandt!");
   } else {
       System.out.println("Det blev uafgjort!");
   }
   ```
- Test programmet med forskellige input for at sikre, at det fungerer korrekt.
- Forklar hvordan koden fungerer og hvordan den bestemmer vinderen af kampen.
- Under `else`, hvorfor behøver vi ikke at tjekke uafgjort, altså om `away == home`?