# Prøveeksamen 1
1. Lav en klasse Tekst med attributten tekstLinjer (det skal være en liste der kan indeholde tekststrenge).
2. Tilføj en metode ”tilføj”, der kan tilføje en tekststreng til listen af tekstlinjer.
3. Tilføj en metode ”findAntalUnikke”, der returnerer antallet af unikke tekstlinjer i listen.

---

# Prøveeksamen 2
1. Lav en klasse Film med attributter for filmtitel og udgivelsesår.
2. Tilføj en konstruktør der modtager en filmtitel og et udgivelsesår og en anden konstruktør der kun modtager filmtitel og selv sætter udgivelsesåret til det aktuelle år.
3. Tilføj en klasse Producer, og giv Film klassen mulighed for at ”koble” en producer til en film.

---

# Prøveeksamen 3
1. Lav en klasse Raflebæger med en attribut for et antal terninger i bægeret og en konstruktør der angiver antallet af terninger.
2. Tilføj en metode ”ryst” der ryster bægeret, og returnerer det samlede antal øjne.
3. Tilføj en metode ”se” der returnerer listen af terningernes øjne uden at ryste igen.

---

# Prøveeksamen 4
1. Lav en klasse Keyword med to attributter: word og definition.
2. Tilføj en metode ”matches” der returnerer hvorvidt ordet matcher et søgeord
3. Tilføj en ”see also” attribut der henviser til andre keywords

---

# Prøveeksamen 5
1. Lav en klasse ”Card” med to attributter ”suit” og ”value”. Suit kan være ”hearts”, ”diamonds”, ”clubs” eller ”spades” – value kan være 1-13
2. Tilføj en metode ”beats” der modtager et andet Card og fortæller om dette korts værdi slår det andets værdi (ignorer suit)
3. Ret metoden så den også tager højde for suit – hearts slår diamonds, som slår clubs som slår spades.

---

# Prøveeksamen 6
1. Lav to klasser: Bil og Trailer – og en attribut på Bil så den (eventuelt) kan have en trailer tilkoblet. (et trailer objekt)
2. Tilføj en vægt attribut til begge klasser – og en metode på Bil der returnerer totalVægten (bilen selv og dens eventuelle trailer)
3. Ret i Bil så den kun kan tilkobles en trailer hvis den samlede totalvægt ikke overskrider 3500kg. (dvs metoden skal ikke sætte traileren på, hvis vægten dermed vil blive for høj)

---

# Prøveeksamen 7
1. Lav en klasse BMI der har to attributter: height og weight
2. Lav en metode calculate, der beregner BMI ud fra de to værdier
$$BMI = \frac{vægt (kg)}{højde (m)^2}$$
3. Lav tre metoder: isUnderWeight, isOverWeight og isNormalWeight der returnerer true hvis BMI er henholdsvis under 18,5 over 25 eller derimellem.

---

# Prøveeksamen 8
1. Lav en klasse Article der har tre attributter: heading, body og author. 1. Lav test-kode der sætter alle tre attributter, og sørg for at body er en "lang" tekst.
2. Tilføj en metode getLongestWord, der returnerer det længste ord (længste sekvens af bogstaver uden tegn) fra body.
3. Tilføj en metode getWords, der returnerer en liste af alle ord fra body, men hvor hvert ord kun forekommer en enkelt gang.

---

# Prøveeksamen 9
1. Lav en klasse User der har to attributter: fullName og userID
2. Tilføj en metode validUserID der returnerer true hvis userID har det rette format: fire (små) bogstaver efterfulgt af fire cifre
3. Tilføj en metode createUserID der sætter userID ud fra fullName, så de første to bogstaver er fra fornavnet, de næste to fra efternavnet, og de fire cifre er tilfældigt genereret.

---

# Prøveeksamen 10
1. Lav en klasse HogwartsStudent med attributterne: firstName, lastName og house.
2. Tilføj en setHouse metode der kun accepterer enten ‘Gryffindor’, ‘Hufflepuff’, ‘Ravenclaw’ eller ‘Slytherin’, og smider en exception hvis den modtager et hvilket som helst andet husnavn.
3. Implementér funktionalitet, så HogwartsStudent objekter kan sorteres efter deres efternavn (lastName).

---

# Prøveeksamen 11
1. Lav en klasse  Beer med attributterne: name, alcoholPercentage og price.
2. Tilføj set metoder for alcoholPercentage og price, og sikr at værdierne ikke kan være negative, og alcoholPercentage ikke kan være mere end 100. Smid en exception hvis det er tilfældet.
3. Skriv kode (i main) til at beregne gennemsnitsprisen af en liste af øl.

---

# Prøveeksamen 12
1. Lav en klasse User med attributterne: username, userid og role. Role skal være an enum med værdierne: Admin, Editor, eller Reader.
2. Lav en anden klasse Users, der har en liste af user-objekter, og en metode der opretter en ny bruger. Sørg for at den metode automatisk tildeler et nyt (tidligere ubrugt) userid til den nye bruger.
3. Tilføj en metode til Users, til at få en liste af alle brugere med en specifik rolle.

---

# Prøveeksamen 13
1. Lav en klasse JuleGave med disse boolske attributter: isSoft, isRectangular og doesRattle.
2. Tilføj en konstruktør der sætter de tre attributter til random enten true eller false
3. Tilføj en metode couldBeLego der returnerer true hvis JuleGaven måske er LEGO (altså den er hård, rektangulær OG rasler)

---

# Prøveeksamen 14
1. Lav en klasse Image med attributterne: fileName, width og height.
2. Tilføj en metode isKnownFileType der returnerer true hvis filnavnet slutter på enten .gif, .jpg, .jpeg, .png, .webp eller .bmp
3. Tilføj to metoder: isPortrait og isLandscape, hvor den første returnerer true hvis billedet er højere end det er bredt, og den anden returnerer true hvis det omvendte er tilfældet.

---

# Prøveeksamen 15
1. Lav en klasse: ExamQuestion med attributterne number og grade
2. Tilføj en metode der sætter grade random til enten A, B, C, D, E eller F.
3. Implementer funktionalitet til at oprette en liste af 14 nummererede (fra 1 til 14) examquestions – hver med en tilfældig karakter.
4. Udskriv listen til skærmen og til en fil “questions.txt”

---

# Prøveeksamen 16
1. Lav en klasse Candidate med attributterne: name, party og numberOfvotes.
2. Lav en anden klasse Election til at indeholde en liste af kandidater. Tilføj en metode getTotalVotes der returnerer det totale antal stemmer for alle kandidater.
3. Tilføj en metode getCandidatesFromParty der returner en liste af alle kandidater fra et bestemt parti