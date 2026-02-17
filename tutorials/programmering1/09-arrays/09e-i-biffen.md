# I biffen

I den lokale biograf er der 5 rækker med 8 sæder i hver række, det kunne se sådan ud, ascii-art:
```txt
 ----------- (lærred) --------------

 |_| |_| |_| |_| |_| |_| |_| |_| |_| (række 1)

 |_| |_| |_| |_| |_| |_| |_| |_| |_| (række 2)

 |_| |_| |_| |_| |_| |_| |_| |_| |_| (række 3)

 |_| |_| |_| |_| |_| |_| |_| |_| |_| (række 4)

 |_| |_| |_| |_| |_| |_| |_| |_| |_| (række 5)
```

En almindelig billet koster 100 kr. Man får den bedste oplevelse fra de forreste sæder, så de første 2 rækker koster 120 kr. Dog er lyden på de sidste sæder ikke optimal, så de sidste 2 rækker koster kun 80 kr. Biografen har lavet et system til at holde styr på hvilke sæder der er ledige og hvilke der er solgt.
1. Opret et Intellij-projekt `cinema-seating` med en klasse og en `main`-metode.
2. Opret et array der repræsenterer sæderne i biografen. Hvert element i array'et skal være et `int` der repræsenterer prisen på sædet, eller 0 hvis sædet er solgt. Initialiser array'et med de korrekte priser for hver række. Her er et eksempel på en lille biograf med 3 rækker og 4 sæder i hver række, hvor den første række koster 120 kr og de sidste rækker koster 80 kr:
```java
int[] seats = {
    120, 120, 120, 120, // række 1
    80,   80,  80,  80, // række 2
    80,   80,  80,  80  // række 3
};
```
1. Skriv en metode `printSeating` der udskriver en oversigt over sæderne i biografen. Ledige sæder (O), solgte sæder (X), eksempelvis:
```txt
- lærred -
X   O   X   O
O   O   X   O
O   O   O   O
```
2. Skriv en metode `buySeat` der tager to parametre: række og sæde. Metoden skal tjekke om sædet er ledigt (dvs. prisen er ikke 0). Hvis sædet er ledigt, skal metoden sætte prisen til 0 (for at markere det som solgt) og returnere prisen på sædet. Hvis sædet ikke er ledigt, skal metoden returnere -1 for at indikere at købet mislykkedes.