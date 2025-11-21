# Navneopråb

Når man skal lave navneopråb i en klasse, kan det være en fordel at de studerendes navne bliver råbt op i rækkefølge efter fornavn.

Vi har en liste med navne i tilfældig rækkefølge:

```java
List<String> names = new ArrayList<>(Arrays.asList(
    "Zoe", "Asraf", "Mia", 
    "Kevin", "Lina", "Alva", 
    "Ahmed", "Muhammed", "Åge", 
    "Øyvind", "Emil", "Sofie"));
```

Til at sortere lister i Java kan vi bruge en metode der hedder `Collections.sort()`. Den tager en liste som parameter og sorterer den i stigende rækkefølge, altså alfabetisk for tekst.

1. Lav et IntelliJ-projekt og en `Main`-klasse som du plejer.
2. Lav en `ArrayList<String>` som ovenfor med de studerendes fornavne.
3. Sorter listen med `Collections.sort()` fra `java.util`-pakken.
4. Brug et for-loop til at printe alle navnene i den nu sorterede ArrayList, f.eks.:
   ```java
    for (String name : names) {
        System.out.println(name);
    }
   ```
Er der nogen navne der ikke er sorteret som du forventede? Vi havde nok forventet Øyvind før Åge. Det skyldes at Javas naturlige sortering på tekst er baseret tal-værdierne af hvert bogstav i navnet. 

I Java (og andre programmeringssprog) er bogstaver i bund og grund repræsenteret som tal. Når vi skal printe teksten til skærmen slår vi så op i en slags tabel over hvilke tal der er hvilke bogstaver - et karakter-sæt kaldet Unicode. 

Du har måske hørt om ASCII fra en tidligere øvelse, hvor 'A' er karakter nr. 65, 'B' er 66 osv. indtil vi når til 'Z' som er 90. Derefter kommer de små bogstaver, fra 'a' som er 97, 'b' som er 98 indtil 'z' som er 122. 

I Unicode karakter-sættet er der ikke kun bogstaverne A-Z og a-z, men bogstaver og tegn fra alle verdens sprog herunder emojis, og de er alle tildelt et nummer. 

Vi kunne have ønsket os, at 'Æ', 'Ø' og 'Å' kom efter 'Z' og i det mindste, at Ø kom før Å. MEN i Unicode er 'Å' 197, 'Æ' er 198 og 'Ø' er 216 - altså 'Ø' kommer EFTER 'Å'. 

Hvis vi ikke gør noget særligt, så vil Java sortere efter *natural order* altså efter disse numre. Og da 'Å' kommer før 'Ø' kommer 'Åge' før 'Øyvind'.