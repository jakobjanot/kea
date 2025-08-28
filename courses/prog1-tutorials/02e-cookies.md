# Hvor meget mel til cookies?

1. Lav et nyt Java-projekt med en klasse med et navn du vælger og en `main` metode
2. Lav en variabel `cookies` af typen `int` og giv den en værdi på 24
3. Lav en variabel `flourPerCookie` af typen `double` og giv den en værdi på 0.045 (dvs. 0.045 kg, som er 45 gram mel per cookie)
4. Lav en `double` variabel `totalFlour` og sæt den til at være lig med `cookies * flourPerCookie`
5. Udskriv `totalFlour` til skærmen med System.out.println
6. Prøv at ændre værdien af `cookies` og se hvordan det påvirker resultatet
7. Ved at ændre på værdien af `cookies` - undersøg hvor mange cookies du lave med 2 kg mel?
8. Kender du en måde at udregne hvor mange cookies du kan lave med 2 kg mel?

---

9. Vores vægt måler ikke mere præcist end 0.001 kg (1 gram), så det er lidt fjollet at vise resultet med 6 decimaler
10. Prøv at ændre `System.out.println(totalFlour);` til `System.out.printf("%.3f kg mel", totalFlour);`
11. Hvad sker der nu?
12. Prøv at ændre `%.3f` til `%.2f` og se hvad der sker
