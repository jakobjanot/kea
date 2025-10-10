# Faktura - refaktorer

1. Fortsæt med IntelliJ-projekt `invoice`
2. Du bør nu have en klasse `Product`, en klasse `InvoiceLine` og en klasse `Invoice` med tilhørende test-klasser `ProductTest`, `InvoiceLineTest` og `InvoiceTest`.
3. Tilføj en klasse `Address` med felterne:
   - String name
   - String street
   - String city
   Lav en constructor, getters og en `toString()` metode der returnere en tekst som fx:
   ```
   Torkild Jensen
   Østerbrogade 15
   2100 København Ø
   ```
4. Tilføj et felt `Address address` i `Invoice` og tilret constructoren så den tager en `Address` som parameter.
5. Tilføj en fakutradato og et fakturanummer i `Invoice`
5. Ret `toString()` metoden i `Invoice` så den printer en "ægte" faktura med adresse, F A K T U R A overskrift, lange linjer, hvor der udfyldes med ... og total, fx:
   ```
   
   F A K T U R A

   Torkild Jensen
   Østerbrogade 15
   2100 København Ø

   Faktura nr: 1142          
   Dato: 2024-06-01

   2 x Bread 25,00 kr
   1 x Milk: 10,00 kr
   -------------------
   Total: 35,00 kr
   ```