# Julefrokost

Vi skal lave en klasse, der kan repræsentere en dato. Vi har brug for felterne `day`, `month` og `year`, og en konstruktør der tager alle felterne som parametre, så vi kan oprette en dato med f.eks. `new Date(24, 12, 2025)`, der repræsenterer juleaften 2025.
1. Opret et Intellij-projekt `christmas-party` med 
   - en klasse kaldet `Main` med en `main`-metode, og
   - en klasse kaldet `Date` med felterne `day`, `month` og `year`, og en konstruktør der tager alle felterne som parametre.
2. Vi vil gerne kunne udskrive datoen i et pænt format. iso-formatet er `YYYY-MM-DD`, så juleaften 2025 skal udskrives som `2025-12-25`. Skriv en `toString`-metode i `Date`-klassen der returnerer datoen i dette format. Du kan bruge `String.format` til at formatere strengen, f.eks.:
   ```java
   String.format("%04d-%02d-%02d", year, month, day);
   ```
   hvor `%04d` betyder et heltal (`d`) med mindst 4 cifre, og `%02d` betyder et heltal med mindst 2 cifre.
3. Der er blevet sendt en Doodle-afstemning om hvornår årets julefrokost skal holdes
   - 5. december
   - 12. december
   - 19. december
   - 24. december
   - 9. januar næste år

   Opret i `main` et array `partyDates` med disse datoer som `Date`-objekter, og udskriv dem alle.

4. Jeg "har en aftale" den 24. december, så jeg opretter en ny dato `christmasEve` med denne dato.
5. Undersøg om hver dato i `partyDates` er lig med `christmasEve`, fx
   ```java
   partyDates[i] == christmasEve
   ```
6. Forklar hvorfor det ikke virker som forventet. Hint: Prøv at udskrive `partyDates[3]` og `christmasEve` med `System.out.println` og se hvad der sker.
7. Skriv en `equals`-metode i din `Date`-klasse der sammenligner to datoer og returnerer `true` hvis de er ens, ellers `false`. Den kunne starte sådan her:
   ```java
   @Override
   public boolean equals(Date other) {
       return this.day == other.day && 
              // fortsæt selv 
   }
   ```
8. Prøv nu igen at sammenligne datoerne. Virker det nu bedre?