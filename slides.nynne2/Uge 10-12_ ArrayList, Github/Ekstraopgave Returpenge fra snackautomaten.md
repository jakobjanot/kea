**Returpenge fra snackautomaten**

**Del 1**

Skriv en klasse der hedder SnackAutomat.

Skriv en metode kaldet køb der tager to heltal (int), der repræsenterer hhv. en vares pris og det betalte beløb.

Metoden skal returnere hvor mange byttepenge, der skal gives tilbage.

Hverken beløbet eller prisen må være negative tal – hvis det er tilfældet kastes en exception.

Såfremt det betalte beløb er for lille i forhold til prisen, skal der ligeledes kastes en exception.

Skriv test til metoden.

**Del 2**

Skriv en metode kaldet byttepenge der returnerer præcis hvilke mønter, der skal gives tilbage i byttepenge, sådan at der gives færrest muligt antal mønter tilbage. Denne metode tager det samlede beløb af byttepenge som parameter, og har som returtype et array der angiver hvor mange mønter af hver slags der skal gives tilbage (beregn først hvor mange af hver type mønt, og sæt derefter antallet ind i arrayet, sådan at antallet af de største mønter står på plads 0, de næststørste på plads 1 osv., og de mindste mønter på sidste plads i arrayet. HINT: brug integer division og  % til at lave beregningen.

Det antages, at der findes følgende værdier af mønter som automaten kan give tilbage med: 20 kr, 10 kr, 5 kr, 2 kr og 1 kr. Automaten kan både tage mønter, 50kr\-, 100kr\- og 200kr\-sedler når man betaler.

Skriv test til metoden.

**Del 3**

Inde fra main\-klassen skal det være muligt at skrive resultatet ud så det kommer til at stå sådan her, for eksempel:

Beløb 93 kr

Antal 20 kr: 4

Antal 10 kr: 1

Antal 5 kr: 0

Antal 2 kr: 1

Antal 1 kr: 1