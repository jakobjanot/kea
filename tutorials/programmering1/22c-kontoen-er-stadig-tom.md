# Kontoen er stadig tom

Fortsæt med bankkonto-eksemplet fra forrige tutorial, hvor vi håndterede hvis det beløb, der forsøges hævet, er større end saldoen på kontoen.
Det er ikke optimalt at bruge en generel undtagelse som `IllegalArgumentException` til at signalere denne specifikke fejl, da det argumentet i sig selv ikke er ugyldigt - det er blot større end saldoen.
1. Opret istedet en ny undtagelsesklasse `InsufficientFundsException`, der arver fra `RuntimeException`.
2. Ændr `withdraw`-metoden i `BankAccount`-klassen, så den kaster en `InsufficientFundsException`, hvis brugeren prøver at hæve mere end saldoen.
3. Vi kræver pt ikke at `main`-metoden håndterer denne undtagelse. Test din kode i `main`-metoden ved at oprette en `BankAccount` med en saldo på fx 1000, og prøv at hæve 1500. Hvad sker der?
4. Hvordan kan vi tvinge brugeren af `withdraw`-metoden til at håndtere undtagelsen? (Hint: `throws`)
5. Uden at ændre i main-metoden, så test din kode igen. Hvad sker der nu?
6. Prøv at håndtere undtagelsen i `main`-metoden ved at tilføje endnu en `catch`-blok. Hvad sker der nu?
7. Commit og push dit arbejde til GitHub.