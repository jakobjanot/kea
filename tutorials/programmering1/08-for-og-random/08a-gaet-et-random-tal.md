# Gæt et random tal
- Fortsæt på projektet `secret-number` - hvis du ikke har det, så kig på øvelsen "Gæt et tal" fra tidligere.
- Det er lidt kedeligt at gætte et tal som du selv har sat i koden. Lad os i stedet få computeren til at vælge et tilfældigt tal mellem 1 og 10 - mellem 1 og 100, hvis du har implementeret koden, der hjælper i øvelsen "Gæt et tal - med hjælp".
- Du genererer tilfældige tal vha. `Random` klassen (husk at importere den med `import java.util.Random;`) på følgende måde:
  ```java
  Random random = new Random();
  int secretNumber = random.nextInt(100) + 1; // random tal mellem 1 og 100
  ```
- Resten af programmet kan forblive det samme.
- Test programmet og se om det virker.
- Prøv nu at sætte en seed-værdi på din Random generator, fx `new Random(123);`. Kør programmet flere gange, hvad sker der?