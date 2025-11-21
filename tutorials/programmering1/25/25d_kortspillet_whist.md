# Kortspillet Whist

I kortspillet whist spiller fordeles alle kortene mellem spillerne, så hver spiller får 13 kort - en hånd. Det er vigtigt at kunne overskue sine kort og derfor er det en god idé at sortere dem. Der sorteres efter kulør først (spar, hjerter, ruder, klør) og derefter efter værdi (2-10, knægt, dame, konge, es).

1. Opret en ny klasse i dit IntelliJ-projekt kaldet `whist` med klasserne `Main`, og `Card` - samt to enum typer `Suit` og `Rank`.

   ```java
   public enum Suit {
       SPADES, HEARTS, DIAMONDS, CLUBS
   }
   ```

   ```java
   public enum Rank {
       TWO, THREE, FOUR, FIVE, 
       SIX, SEVEN, EIGHT, NINE, 
       TEN, JACK, QUEEN, KING, ACE
   }
   ```
2. I `Card` klassen, tilføj to felter af typerne `Suit` og `Rank`, en konstruktør der tager begge som parametre, og getters for begge felter og en `toString()` metode der f.eks. returnerer "ACE of SPADES".
3. I `Main` klassen, opret et array af 13 `Card` objekter med tilfældige kort.
4. Implementer `Comparable<Card>` interfacet i `Card` klassen, og tilføj en `compareTo()` metode der sorterer kortene først efter kulør og derefter efter værdi. Bemærk at `enum` typer i Java har en indbygget rækkefølge baseret på den rækkefølge de er defineret i - og at du derfor ikke behøver at ændre `Suit` og `Rank` enum definitionerne for at få den ønskede sortering.
5. Da vi anvender et array og ikke en ArrayList (Collection), skal du sorteres arrayet med `Arrays.sort()`.
6. Brug et for-loop til at printe alle kortene i det nu sorterede array. Det skulle gerne vise kortene sorteret efter kulør og værdi, fx
   ```
   TWO of SPADES
   THREE of SPADES
   ...
   ACE of SPADES
   TWO of HEARTS
   ...
   ACE of CLUBS
   ```