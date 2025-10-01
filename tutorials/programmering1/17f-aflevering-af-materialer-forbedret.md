# Aflevering af materialer - forbedret

Vi har nu en `Library`-klasse, der kan håndtere lån og aflevering af forskellige materialer på et bibliotek. For at gøre systemet lettere at bruge, skal vi forbedre metoderne `borrow` og `returnLoan`, så de tager et id på en ressource (fx ISBN-nummeret på en bog), tilsvarende et medlems-id, i stedet for at tage hele `Resource`- og `Member`-objekter som parametre. Dette gør det nemmere at bruge systemet, da vi ikke længere behøver at oprette eller finde hele objekter for at låne eller returnere materialer.

1. Fortsæt med projektet `library-management-system` fra forrige tutorial og/eller bring dig ajour med det.
2. Ret metoden `borrow` til `public boolean borrow(String resourceId, String memberId, LocalDate borrowedDate)`, så den
   - får et en ressource `identifier` i stedet for et `Resource`-objekt som parameter
   - får et `memberId` i stedet for et `Member`-objekt som parameter
   - søger i `resources`-arrayet efter en ressource med det givne `identifier`. Hint: Lav en hjælpe-metode (fx `private Resource findResourceById(String id)`) med en løkke til at iterere over `resources` og find den rigtige ressource.
   - søger i `members`-arrayet efter et medlem med det givne `memberId`. Hint: Lav en hjælpe-metode (fx `private Member findMemberById(String id)`) med en løkke til at iterere over `members` og find det rigtige medlem.
   - hvis enten ressourcen eller medlemmet ikke findes (dvs. `findResourceById` eller `findMemberById` returnerer `null`), returneres `false`
   - hvis ressourcen allerede er udlånt (dvs. der findes et lån i `loans`-arrayet med den pågældende ressource og `returnDate` er `null`), returneres `false`. Hint: Lav en hjælpe-metode (fx `private boolean isResourceLoaned(Resource resource)`) med en løkke til at iterere over `loans` og tjekke om ressourcen er udlånt. Du kan desuden overveje at lave en hjælpe-metode `private Loan[] activeLoans()` der returnerer et array med alle aktive lån (dvs. lån hvor `returnDate` er `null`), som bruges i `isResourceLoaned`.
   - hvis alt er i orden, oprettes et nyt lån og der returneres `true`
3. Ret metoden `returnLoan` til `public boolean returnLoan(String resourceId, LocalDate returnDate)`, så den
   - får et en ressource `identifier` i stedet for et `Resource`-objekt som parameter
   - søger i `resources`-arrayet efter en ressource med det givne `identifier`. Hint: Genbrug `findResourceById`.
   - hvis ressourcen ikke findes (dvs. `findResourceById` returnerer `null`), returneres `false`
   - hvis der ikke findes et aktivt lån for den pågældende ressource (dvs. der ikke findes et lån i `activeLoans()` med den pågældende ressource), returneres `false`
   - hvis alt er i orden, sættes lånets `returnDate` til den givne `returnDate` og der returneres `true`