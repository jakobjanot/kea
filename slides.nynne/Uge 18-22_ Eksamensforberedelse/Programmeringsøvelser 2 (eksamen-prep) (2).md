<!-- Slide number: 1 -->
# Programmeringsøvelser 2
som til eksamen ...

<!-- Slide number: 2 -->
# Øvelse 4 - originalen
Lav en klasse Keyword med to attributter: word og definition.

Tilføj en metode ”matches” der returnerer hvorvidt word matcher et søgeord der kan være en del af ordet, og have anderledes store og små bogstaver.

Tilføj en ”see also” attribut der henviser til andre keywordsLav en udskriftsmetode der udskriver word, definition og en eventuel liste af andre keywords.

<!-- Slide number: 3 -->
# Øvelse 4 - revideret
Lav en klasse Keyword med to attributter: name og description.

Tilføj en "see also" attribut, så et Keyword eventuelt kan henvise til flere andre keywords. Tilføj også en metode til at tilføje disse henvisninger.
Lav en udskriftsmetode der udskriver word og definition, og hvis der er andre keywords, skriv "see also" og en kort liste af disse keywords.

<!-- Slide number: 4 -->
# Øvelse 5
Lav en klasse ”Card” med to attributter ”suit” og ”value”
Suit kan være ”hearts”, ”diamonds”, ”clubs” eller ”spades” – value kan være 1-13
Tilføj en metode ”beats” der modtager et andet Card og fortæller om dette korts værdi slår det andets værdi (ignorer suit)
Ret metoden så den også tager højde for suit – spades slår hearts, som slår diamonds som slår clubs.

<!-- Slide number: 5 -->
# Øvelse 6
Lav to klasser: Bil og Trailer – og en attribut på Bil så den (eventuelt) kan have en trailer tilkoblet. (et trailer objekt)

Tilføj en vægt attribut til begge klasser – og en metode på Bil der returnerer totalVægten (bilen selv og dens eventuelle trailer)

Ret i Bil så den kun kan tilkobles en trailer hvis den samlede totalvægt ikke overskrider 3500kg. (dvs metoden skal ikke sætte traileren på, hvis vægten dermed vil blive for høj)