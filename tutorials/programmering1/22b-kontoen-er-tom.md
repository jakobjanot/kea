# Kontoen er tom

Fortsæt med bankkonto-eksemplet fra forrige tutorial, hvor vi tilføjede undtagelseshåndtering til `setBalance`-metoden.
Vi vil gerne sikre os at brugeren af `BankAccount`-klassen får en fejlmeddelelse, hvis de prøver at hæve et beløb, der er større end saldoen på kontoen - altså hvis `amount > balance` i `withdraw`-metoden.

1. Inspireret af hvordan vi håndterede negative beløb i `setBalance`-metoden, så tilføj kode i `withdraw`-metoden, der kaster en undtagelse, hvis brugeren prøver at hæve mere end saldoen.
2. Test din kode i `main`-metoden ved at oprette en `BankAccount` med en saldo på fx 1000, og prøv at hæve 1500. Hvad sker der?
3. Håndter undtagelsen i `main`-metoden med en `try-catch`-blok, så programmet ikke crasher, men skriver en fejlmeddelelse til brugeren i stedet.
4. Commit og push dit arbejde til GitHub.