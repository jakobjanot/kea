# Navneopråb på dansk

I den forrige opgave så vi at en sortering af navne bl.a. "Øyvind" og "Åge" ikke gav det forventede resultat, altså at "Åge" skulle komme efter "Øyvind".

Heldigvis tilbyder Java en måde at lave brugerdefinerede sorteringer på, ved at bruge en såkaldt `Comparator`. En `Comparator` er en klasse der fortæller Java hvordan to objekter skal sammenlignes med hinanden. Vi kan lave vores egen `Comparator`, men heldigvis findes der allerede en i Java's standard bibliotek, som hedder `Collator`, som kan håndtere danske bogstaver korrekt.

1. Fortsæt med dit IntelliJ-projekt og `Main`-klasse fra den forrige opgave.
2. Importer `Collator` og `Locale` klasserne fra `java.text` og `java.util` pakkerne.
3. Opret en `Collator` instance ved at kalde `Collator.getInstance()` metoden med en `Locale` parameter sat til `Locale.forLanguageTag("da-DK")`, som dette:
   ```java
   Collator danishCollator = Collator.getInstance(
    Locale.forLanguageTag("da-DK"));
   ```
4. Brug nu istedet `Collections.sort()` metoden med to parametre:
   ```java
   Collections.sort(names, danishCollator);
   ```
5. Kør programmet og se at navnene nu er sorteret korrekt som du forventede.