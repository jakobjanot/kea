# Kortspillet Whist - melding: Sol

I kortspillet whist kan en spiller melde "sol", hvilket betyder at spilleren tror de helt kan undgå at tage stik i en runde. Hvis spilleren lykkes med dette, vinder spilleren runden. En yderligere regel er, at "es" nu ikke længere er de højeste kort i spillet, men de laveste. Det betyder at når en spiller melder "sol", skal alle spillere flytte deres esser til bunden af deres hånd, så de er de sidste kort når hånden sorteres.

Ulempen ved den nuværende implementering er, at vores sortering er hardkodet til at sortere efter kulør først (spar, hjerter, ruder, klør) og derefter efter værdi (2-10, knægt, dame, konge, es). Såldes passer implementeringen ikke til "sol" meldingen - eller for den sags skyld andre kortspil med andre regler for kortværdier.

Vi skal nu lave en mere fleksibel løsning, hvor implementering af sorteringsreglerne "ligger udenfor" `Card` klassen - altså kan vi have forskellige måder at sortere kort på.

1. Forstæt med dit IntelliJ-projekt og `whist` pakken fra den forrige opgave.
2. Opret en ny klasse i `whist` pakken kaldet `WhistComparator` der implementerer `Comparator<Card>` interfacet.
3. I `WhistComparator` klassen, implementer `compare()` metoden til at sortere kortene efter de normale regler (kulør først, derefter værdi med es som højeste kort) - du kan genbruge koden fra `compareTo()` metoden i `Card` klassen fra den forrige opgave, fx
    ```java
    import java.util.Comparator;

    public class WhistComparator implements Comparator<Card> {
        @Override
        public int compare(Card card1, Card card2) {
            // Sammenlign kulør først
            int suitComparison = card1
                .getSuit()
                .compareTo(card2.getSuit());
            if (suitComparison != 0) {
                return suitComparison;
            }
            // Hvis kulør er ens, sammenlign værdi
            return card1
                .getRank()
                .compareTo(card2.getRank());
        }
    }
    ```
4. Fjern `implements Comparable<Card>` og `compareTo()` metoden fra `Card` klassen, så `Card` klassen ikke længere implementerer `Comparable<Card>`.
5. Test `WhistComparator` klassen ved at oprette et array af 13 kort dvs. `Card` objekter i `Main` klassen, og brug `Arrays.sort()` som her:
   ```java
   Cards[] cards = { 
        new Card(Suit.SPADES, Rank.ACE), 
        new Card(Suit.HEARTS, Rank.TEN), 
        new Card(Suit.DIAMONDS, Rank.THREE),
        // 13 tilfældige kort
        }; 
   Arrays.sort(cards, new WhistComparator());
   ```
   Udskriv de sorterede kort for at bekræfte at de er sorteret rigtigt.
6. (Svær opgave) Lav en ny `WhistSolVariantComparator` klasse, der implementer `compare()` metoden til at sortere kortene efter de specielle regler for "sol" meldingen (kulør først, derefter værdi med es som laveste kort). Du kan genbruge noget af koden fra `WhistComparator`, men du skal ændre måden kortenes værdi sammenlignes på, så esser behandles som de laveste kort.
7. Kender du andre kortspil med specielle regler for kortværdier? Prøv at lave en ny `Comparator` klasse til et sådant spil!
   