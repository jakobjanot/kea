# Navneopråb med efternavn

I den forrige opgave fik vi så styr på at sortere navne efter danske regler, så "Øyvind" kom før "Åge".

Men der er kommet en ny "Åge Hansen" i klassen og den gamle "Åge" - der også hedder "Åge Nielsen" må altså vige pladsen i rækkefølgen, fordi "Hansen" kommer før "Nielsen".

Vi beslutter os for at introducere en ny klasse kaldet `Student`, som indeholder både fornavn og efternavn.

1. Opret en ny klasse i dit IntelliJ-projekt kaldet `Student`.
2. Tilføj to `String` felter til klassen: `firstName` og `lastName`, en konstruktør der tager begge som parametre, og getters for begge felter.
3. I din `Main`-klasse, opret et array af `Student` objekter med følgende data:

   | Fornavn | Efternavn    |
   |---------|--------------|
   | Zoe     | Andersen     |
   | Asraf   | Bakshi       |
   | Mia     | Christensen  |
   | Kevin   | Dahl         |
   | Lina    | Eriksen      |
   | Alva    | Frederiksen  |
   | Ahmed   | Hansen       |
   | Muhammed| Iversen      |
   | Åge     | Hansen       |
   | Øyvind  | Johansen     |
   | Emil    | Kristensen   |
   | Sofie   | Larsen       |
   | Åge     | Nielsen      |
4. Prøv at sortere listen med `Collections.sort()` som før med danske regler. Hvad sker der?
5. Det gik rigtigt godt med `String` listen, men ikke med `Student` listen. Det er fordi Java ikke ved hvordan den skal sammenligne to `Student` objekter. I IntelliJ er det muligt at se, hvordan en klasse er defineret ved at klikke `Ctrl` + `B` (Windows) eller `Cmd` + `B` (Mac) mens markøren er på klassens navn. Ved at sætte markøren på `String` og trykke `Ctrl` + `B` (Windows) eller `Cmd` + `B` (Mac) kan du se at `String` klassen implementerer et interface der hedder `Comparable<String>`, som har en metode der hedder `compareTo()`. Lad os implementere det samme interface i vores `Student` klasse.
6. Når du har tilføjet `implements Comparable<Student>` til din `Student` klassedefinition, tilføj så en `compareTo()` metode til klassen:
   ```java
   @Override
   public int compareTo(Student other) {
       // Først sammenligner vi efternavnene
       int lastNameComparison = this.lastName.compareTo(other.lastName);
       if (lastNameComparison != 0) {
           return lastNameComparison; // Hvis efternavnene er forskellige, returner resultatet
       }
       // Hvis efternavnene er ens, sammenlign fornavnene
       return this.firstName.compareTo(other.firstName);
   }
   ```
   Bemærk at compareTo() metoden skal returnere et heltal:
   - Et negativt tal hvis `this` objektet skal komme før `other` objektet.
   - Nul hvis de er ens.
   - Et positivt tal hvis `this` objektet skal komme efter `other` objektet.
7. Nu kan du prøve at sortere `Student` listen igen med `Collections.sort()`.
8. Brug igen et for-loop til at printe alle studerendes fulde navne i det nu sorterede array