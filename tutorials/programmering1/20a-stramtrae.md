# Stamtræ

Objekter kan have relationer til andre objekter, ofte til objekter af andre typer. I et bibliotekssystemet vi besøgte tidligere, havde et objekt af typen "Loan" en relation til et objekt af typen "Book" og et objekt af typen "Member". Andre gange kan objekter have relationer til andre objekter af samme type som sig selv. I et stamtræ kan vi forestille os objekter af typen "Person", som har relationer til andre objekter af typen "Person", fx forældre.
Træstrukturer er meget almindelige i programmering, og de bruges til at repræsentere hierarkiske data, udover stamtræer kan de fx bruges til at repræsentere dokumenter (tænk kapitler og underkapitler), filsystemer (mapper med undermapper og filer), organisationsdiagrammer og taksonomier (fx dyrearter og deres underarter).

1. Opret et nyt IntelliJ-projekt. Lav en klasse Person med følgende felter:
   - String name
   - Gender gender, hvor Gender er en enum med værdierne MALE og FEMALE
   - Person father
   - Person mother
2. Lav en konstruktør, der initialiserer **name** og sætter **father** og **mother** til null.
3. Tilføj getter og setter metoder for alle felterne, så du kan tilføje forældre til en Person efter at den er oprettet.
4. Tilføj en metode `toString()`, der returnerer fx "Beate ♀" eller "Allan ♂".
5. Prøv at lave et simpelt stamtræ for dig selv og din familie (eller det danske kongehus) ved at oprette Person-objekter og forbinde dem via parents-feltet. Hvis vi ikke kender en forælder, kan vi lade pladsen i arrayet være null.
