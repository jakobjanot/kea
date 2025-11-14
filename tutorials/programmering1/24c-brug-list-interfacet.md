# Brug List interfacet

Fortsæt på IntelliJ-projektet `banking`, som du lavede i den forrige øvelse.

Vi vil nu ændre `Bank`-klassen, så den bruger `List<BankAccount>` i stedet for en konkret liste-implementering som `ArrayList<BankAccount>`, som du måske har brugt.

1. Ændr `Bank`-klassens felt, som holder styr på kontiene, så det er af typen `List<BankAccount>` i stedet for `ArrayList<BankAccount>`.
2. Forklar hvorfor vi ikke lave en `new List<BankAccount>()`?
3. Ændre `Bank`-klassens metoder til at bruge `List<BankAccount>` i stedet for `ArrayList<BankAccount>`.
4. Hvad er fordelen ved at bruge `List<BankAccount>` i stedet for en konkret liste-implementering som `ArrayList<BankAccount>`?
5. Lav et commit og push til GitHub.