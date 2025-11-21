# Tilskrivning af renter med interfaces

Fortsæt på IntelliJ-projektet `banking`, som du lavede i den forrige øvelse.

1. Tilføj en `Bank`-klasse, som har en liste af konti (af typen `BankAccount`).
2. Tilføj en `addAccount(BankAccount account)`-metode til `Bank`-klassen, som tilføjer en konto til listen.
3. Tilføj nu en `getInterestBearingAccounts()`-metode til `Bank`-klassen, som returnerer en liste af alle konti, der implementerer `InterestBearing`-interfacet. Hint: brug `instanceof` til at tjekke, om en konto implementerer interfacet.
4. Vi kunne nu teste det i vores `main`-metode, men lad os øve os i at skrive JUnit tests istedet. Opret en JUnit-test for `Bank`-klassen. Du gør det ved at 
   - højreklikke på `Bank`-klassen i projektstrukturen og 
   - vælge `Generate` -> `Test`. 
   - Vælg JUnit5 som testframework og 
   - tryk `OK`.
   Testen skal 
   Arrange: 
   - oprette et `Bank`-objekt, 
   - tilføje nogle konti til den 
   Act: 
   - kalde `getInterestBearingAccounts()`
   Assert: 
   - tjekke at den returnerede liste kun indeholder de forventede konti.
5. Kør din test og tjek at den er grøn.
6. Lav et commit og push til GitHub.
7. Vi vil gerne have en metode i `Bank`-klassen, som tilskriver renter til alle konti, der implementerer `InterestBearing`-interfacet, dvs. er en rentebærende konto. Nu prøver vi at vende opgaven rundt:
   - Skriv først en testmetode `testApplyInterest()` i din `Bank`-testklasse.
   - I testen skal du 
     Arrange: 
     - oprette et `Bank`-objekt, 
     - tilføje nogle konti til den (både rentebærende og ikke-rentebærende)
     Act: 
     - kalde `applyInterest()`-metoden (som du endnu ikke har skrevet)
     Assert: 
     - tjekke at saldoen på de rentebærende konti er blevet opdateret korrekt, mens saldoen på de ikke-rentebærende konti er uændret.
   - Kør testen, som nu skal fejle, fordi `applyInterest()`-metoden ikke findes endnu.
8. Lav en `applyInterest()`-metode i `Bank`-klassen, som tilskriver renter til alle konti, der implementerer `InterestBearing`-interfacet. Kan du genbruge `getInterestBearingAccounts()`-metoden her?
9. Kør din test igen, som nu skal være grøn.
10. Lav et commit og push til GitHub.
