---
title: 18 - Set, HashMap og JUnit
---



<!-- .slide: class="cover-6" -->
# Test først

--

a.k.a TDD - Test Driven Development

--

1. Skriv en test der fejler
2. Skriv kode der får testen til at bestå
3. Refactor koden^*

<small>(*) gør den mere læsbar og vedligeholdelsesvenlig</small>

--
<!-- .slide: class="o-sunlit-energy" -->
DEMO Test først
Notes:
- nyt projekt med BankAccountTest og BankAccount
- skriv test af deposit() der fejler
- skriv kode i deposit() der får testen til at bestå
- skriv test af negative deposit() der fejler
- skriv kode i deposit() der får testen til at bestå
- skriv test af getBalance() der fejler
- skriv kode i getBalance() der får testen til at bestå
- ret test så deposit() returnere en boolean
- ret kode i deposit() så den returnere en boolean

--