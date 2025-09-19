# I biffen

I den lokale biograf er der 5 rækker med 8 sæder i hver række. En almindelig billet koster 100 kr. Man får den bedste oplevelse fra de forreste sæder, så de første 2 rækker koster 120 kr. Dog er lyden i de yderste sæder ikke optimal, så de sidste 2 rækker koster kun 80 kr. Biografen har lavet et system til at holde styr på hvilke sæder der er ledige og hvilke der er solgt.
1. Opret et Intellij-projekt `cinema-seating` med en klasse og en `main`-metode.
2. Opret et array der repræsenterer sæderne i biografen. Hvert element i array'et skal være et `int` der repræsenterer prisen på sædet, eller 0 hvis sædet er solgt. Initialiser array'et med de korrekte priser for hver række.
3. Skriv en metode `printSeats` der udskriver en oversigt over sæderne, hvor ledige sæder vises med deres pris og solgte sæder vises som "X".
4. Skriv en metode `buySeat` der tager to parametre: række (0-4) og sæde (0-7). Metoden skal tjekke om sædet er ledigt (dvs. prisen er ikke 0). Hvis sædet er ledigt, skal metoden sætte prisen til 0 (for at markere det som solgt) og returnere prisen på sædet. Hvis sædet ikke er ledigt, skal metoden returnere -1 for at indikere at købet mislykkedes.