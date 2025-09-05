# System.in

- Vi har brugt `System.out` til at skrive til konsollen
- Nu skal vi bruge `System.in` og `Scanner` klassen til at læse fra tastaturet
- Tag udgangspunkt i `fodbold-resultat-scanner` projektet
- Erstat det "hardcodede" fodbold-resultatet med koden herunder, der læser input fra brugeren
   ```java
   Scanner sc = new Scanner(System.in);
   // osv.
   ```
- Tilføj også gerne denne linje nedenunder, der giver en besked til brugeren, fx
   ```java
   System.out.print("Indtast resultatet af kampen: ");
   ```
- Når du starter programmet, vil du se, at programmet venter på din indtastning
- Indtast fx **3 1** og tryk **Enter**. Programmet vil nu fortsætte og printe resultatet
- Virker det som forventet?
- Kan du få programmet til at fejle ved at indtaste noget uventet?