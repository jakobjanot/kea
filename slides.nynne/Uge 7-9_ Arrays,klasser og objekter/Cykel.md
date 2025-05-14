**Cykel**

1. Lav en klasse der repræsenterer en cykel, og kald den for LadCykel. En ladcykel har en farve, antal hjul, antal passagerer og en nypris.
2. Definér metoderne således:

public double newPrice()  //giver ladcyklens nypris

public String toString()  //giver en beskrivelse af ladcyklen

1. Lav en meget simpel klasse der hedder Cyklist. En Cyklist har et navn som bliver sat i konstruktøren.
2. Udbyg Ladcykel\-klassen så den kan have en cyklist der kører ladcyklen lige nu. Definér følgende metoder på Ladcykel\-klassen og afprøv klassen (lav en anden klasse med en main\-metode).

public boolean enCyklistSaetterSig(Cyklist c) //en cyklist sætter sig i ladcyklen hvis der ikke sidder én i forvejen. Returnerer om det kunne lade sig gøre at sætte sig ind.

public Cyklist hvemKoererLadcyklen() //returnerer et cyklist\-objekt eller null hvis der ikke er nogen cyklist på ladcyklen.

 public cyklistenStigerUd() //cyklisten forlader ladcyklen, og metoden returnerer cyklisten eller null hvis der ikke er nogen cyklist.

1. Lav en Cykel superclass der også har en farve, et antal kørte kilometer, antal hjul og en nypris. Flyt disse funktionaliteter ud af din Ladcykel class og sørg for at Ladcykel nedarver dem fra klassen Cykel.
2. Lav nu ny klasse der hedder Unibike og lad den også nedarve fra Cykel superclass.