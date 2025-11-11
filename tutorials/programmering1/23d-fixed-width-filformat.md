# Fixed-width filer

Nogle gamle systemer bruger ikke delimiterede filer som CSV, men fixed-width filer.
Eksempel på en fixed-width fil, hvor hver linje repræsenterer en fakturalinje (varenr, beskrivelse, antal, pris):
```txt
0001      Pizza Margherita         1         99.00
0024      Spaghetti Carbonara      2        129.50
0150      Tiramisu                 1         59.00
0200      Fanta 0.5L               3         19.00
```
Altså, data er justeret i kolonner med faste bredder (som vi er nødt til at kende på forhånd for at kunne læse filen korrekt).
1. Prøv at lave et program, der læser en fakturalinjer  og opretter `InvoiceLine`s ud fra dem. Du må gerne genbruge `InvoiceLine`, `Invoice` osv. fra tidligere øvelser.
   Hint! I Følgende kodeeksempel kan du se, hvordan du kan udtrække data fra en linje i en fixed-width fil:
   ```java
   String line = "Thorkild Hansen     39485732   thorkild@hotmail.com ";
   String navn = line.substring(0, 20).trim();
   String telefon = line.substring(20, 30).trim();
   String email = line.substring(30).trim();
   ```

