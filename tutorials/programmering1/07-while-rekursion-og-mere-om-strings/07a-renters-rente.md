# Renters rente

- Når vi sætter penge i banken, får vi renter (eng: interest) af dem. Vores saldo (eng: **balance**) vokser derfor hvert år med en vis procentdel (eng: **interest rate**).
- Fordi saldoen vokser hvert år, får vi både renter af det oprindelige beløb og renter af de renter, vi har fået tidligere år. Dette kaldes **renters rente**
- Formlen for at beregne den nye saldo efter et år er:
  ```java
  balance = balance + (balance * interestRate)
  ```
  hvor `interestRate` er renten i decimalform, dvs. `0.05` for 5%.
1. Lav et nyt IntelliJ-projekt `interest` med en klasse `Main` med en `main`-metode.
2. Sæt en startbalance på 10000 kr. og en rente på 5% (`0.05`).
3. Brug en `while`-løkke til at beregne og opdatere saldoen for hvert af de næste 10 år
   ```java
    while (years > 0) {
        // ...
        years = years - 1;
    } 
    ```
4. Print saldoen ud efter 10 år
5. Leg med tanken om at sætte 10000 kr i banken. Hvordan ser afkastet ud efter efter 5 år, 10 år og 30 år, hvis renten er henholdsvis 1% og 5%, eller der er negativ rente på -1%?
6. (Valgfrit) Du må gerne refaktorere din kode og kalde en `calculateBalance`-metode, som tager `startbalance`, `interestRate` og `years` som parametre og returnerer den beregnede saldo efter det givne antal år.