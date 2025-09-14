# Palindromer

- Et palindrom er et ord, der staves ens forfra og bagfra, fx. `racecar`, `madam` og `otto`.
- Lav et nyt IntelliJ-projekt kaldet `palindrome`, hvori du har en klasse og en `main` metode
- En måde at tjekke om et ord er et palindrom er at sammenligne det første og sidste bogstav, derefter det næstførste og næstsidste bogstav osv. 
- Med rekursion kan vi løse dette problem ved at 
  - sammenligne det første og sidste bogstav, og 
  - hvis de er ens, kalde funktionen igen med den del af teksten der er tilbage (dvs. uden det første og sidste bogstav).
  - Når strenger har længden 1 eller mindre ved vi, at teksten er ens og kan stoppe
- Hint: Du kan bruge `substring(start, end)` metoden, du tidligere har mødt, til at afkorte teksten.
- Test dit palindrom-tester program med forskellige ord, der er palindromer og ikke er.