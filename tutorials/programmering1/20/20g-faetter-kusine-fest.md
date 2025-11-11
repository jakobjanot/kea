# Fætter/kusine fest

Vi fortsætter med vores Person-klasse, som nu har køn, forældre, børn og en metode til at finde søskende.
Vi skal snart have fætter/kusine fest og skal have inviteret. Hvem er dine fætre og kusiner? Det er vel dine forældres søskendes børn. Vi kender dine forældre, vi har en metode til at finde søskende af en person, og vi kender børnenes relation til deres forældre. Så det burde være muligt at finde fætre og kusiner.

1. Tilføj en metode `getCousins()` til Person-klassen, der returnerer et array af Person-objekter, som er fætre og kusiner til den pågældende person. Du kan gøre det ved at finde personens forældres søskende, og så samle alle deres børn.
2. Prøv at bruge `getCousins()` til at finde dine egne fætre og kusiner, hvis du har nogen.
3. Evt. kan du forsøge dig med at tilføje en eller flere test-metoder til `PersonTest`, der tester at metoden virker som forventet.