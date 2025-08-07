![clear glass bottle pouring water on clear glass bowl](data:image/jpeg;base64...)MINIPROJEKT
Fish Tank

I denne opgave træner vi grundlæggende OOP med klasser, attributter, dataindkapsling og objektreferencer, men ikke arv/polymorfi. I skal også bruge de kontrolstrukturer m.v., som vi har trænet indtil nu.

Din veninde, Diana, har et akvarium derhjemme. Akvariet skal have skiftet vand hver 4\. uge. Fiskene skal fodres i tre dage, hvorefter de har en fastedag uden mad. Du har foreslået, at du kan lave et program til at holde styr på disse ting, og det vil hun gerne prøve.

Husk: LocalDateTime.now() returnerer aktuel tid. Prøv metoderne i den ved at taste punktum efter now().

**Krav**

Dianas ønsker til programmet er:

1. Lige nu har hun kun et akvarium, men hun overvejer at købe et eller to mere engang i fremtiden.

Dette behøver I ikke at tage højde for i begyndelsen, men måske er det rart at have det med i jeres tanker, hvis I kan overskue det fra starten. Ellers bare lav opgaven med ét akvarium.
2. I sit nuværende akvarium har Diana to fisk – Bella og Belinda. De er begge hunner, så der kommer ingen unger. Cirka en gang om ugen kigger hun nøje på hver fisk og registrerer om den ser sund og glad ud – bare som en dato og en enkelt linje med højst 30 karakterer i en notesbog for hver fisk.

Historikken er altså ikke vigtig for Diana, men hvis I har tid til det, kan I tilføje dette i version 2 – det vil hun helt sikkert blive glad for.
3. Når Diana skifter vand, vil hun gerne registrere datoen for vandskiftet samt en kort bemærkning (højst 60 karakterer), hvor hun fx skriver ”30 % vand skiftet” eller ”50 ml algedræber tilsat”. Hun vil bare gerne kunne se det seneste vandskifte med dato og bemærkning. Hun vil også gerne kunne ”sætte kryds” i om vandet inden vandskifte var ”perfekt”, ”godt”, ”okay” eller ”dårligt” (hint: enum!)

Her er historikken heller ikke vigtig for Diana, men dette vil hun også blive glad for i en senere version.
4. Diana vil gerne have at programmet åbner med en menu, hvor hun kan se sine muligheder i programmet. Det omfatter også at afslutte programmet.

I bestemmer selv om I vil lave menuen først eller senere i projektet.