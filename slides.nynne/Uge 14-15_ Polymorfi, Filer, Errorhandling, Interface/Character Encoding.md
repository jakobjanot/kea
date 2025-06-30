<!-- Slide number: 1 -->
# Character Encoding

<!-- Slide number: 2 -->
# Character Encoding
Det er et stort og komplekst emne – og noget man helst vil undgå, men desværre er vi nødt til at kunne håndtere det.

Filer består af bits – uanset om det er det vi kalder "binære" filer eller "tekst" filer, så er det stadig binære tal der ligger inde i filerne. Hvert bogstav, hvert symbol, tal og tegn, har en værdi, et unicode codepoint. A er 65, B er 66, lille a er 97, og æ er 230.

Men sådan har det ikke altid været!

<!-- Slide number: 3 -->
# UTF-8
For det meste bruger man UTF-8 encoding – det er en standard der "komprimerer" tekst, med det udgangspunkt at de fleste tegn kun bruger 7 bits, og kun sære tegn som æ eller 🥳 kræver flere bits ...

Som regel er man godt sikret bare man bruger UTF-8 – ser man noget der taler om charset eller encoding, så vælger man UTF-8, og så er alt godt.

<!-- Slide number: 4 -->
# ISO-8859-1 og Windows-1252
Men i gamle dage brugte man mange forskellige standarder – hvor samme binære tal kunne betyde et Ø i én standard, og ¥ i en anden.

Og der var et væld af forskellige standarder for sprog der bruger andre bogstaver end de latinske (a-z, æ ø å, etc.)
De standarder findes stadig – men de hyppigst sete er ISO-8859 og Windows-1252, der begge to bruges til vesteuropæiske sprog.

Så virker UTF-8 ikke – så prøv med en af de to ...

<!-- Slide number: 5 -->
# IntelliJ kan detektere filer i andre formater
For eksempel kan man opleve at en csv-fil ikke viser æ, ø og å korrekt

![](Picture3.jpg)

<!-- Slide number: 6 -->
# Normalt bruger IntelliJ UTF-8, men kan skifte!

![](Picture3.jpg)
Vælg "Reload in another encoding"
Og vælg den ønskede encoding – som regel er ISO-8859-1 et godt bud

<!-- Slide number: 7 -->
# Lad være med at converte!
IntelliJ tilbyder også at konvertere filen til det andet format ... men det er IKKE det vi vil (hvis vi ville konvertere den til noget, så skulle det være UTF-8)

![](Picture3.jpg)
Vælg altid "Reload"
Aldrig "Convert"

<!-- Slide number: 8 -->
# Valgte encodings gemmes under preferences
Du kan altid gå ind i "Preferences" under File Encodings, og se hvilke alternative encodings (alternativer til UTF-8) der er valgt.

![](Picture3.jpg)
Man kan altid slette valgte encodings, hvis man er kommet til at gøre forkert

<!-- Slide number: 9 -->
# Scanner skal have den rette encoding
Bare fordi man sætter IntelliJ op til at vise en fil med en anden encoding, så betyder det ikke at ens Java-program automatisk bruger den encoding.

Når man laver en Scanner, bruger den som standard UTF-8

![](Picture3.jpg)
Men hvis filen ikke er UTF-8 – så bliver der ikke læst en eneste linje!

### Notes:
Smider endnu en exception

<!-- Slide number: 10 -->
# Scanner kan sættes op til en ønsket encoding

![](Picture6.jpg)
Når man laver sin Scanner kan man, udover input (File eller InputStream) også angive et Charset

![](Picture3.jpg)

![](Picture4.jpg)

### Notes:
Smider endnu en exception