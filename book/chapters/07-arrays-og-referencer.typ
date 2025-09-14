#import "../style.typ": *

= Arrays og Referencer

Indtil nu har vi arbejdet med variable der gemmer en enkelt værdi ad gangen. Men ofte har vi brug for at håndtere mange værdier af samme type - for eksempel temperature for alle ugens dage, navne på alle elever i klassen, eller point for alle spillere på et hold.

Arrays giver os mulighed for at gemme flere værdier af samme type i én enkelt variabel, og får dermed kraftfulde værktøjer til at organisere og manipulere data.

== Hvad er et Array?

Et array er en samling af værdier af samme datatype, arrangeret i en fast rækkefølge. Tænk på det som en række af kasser, hvor hver kasse kan rumme en værdi:

```java
// En enkelt værdi
int coins = 50;

// Et array med flere værdier
int[] chests = new int[4];  // Fire skattekister
```

Hvert element i arrayet har et unikt *indeks* (position), som starter fra 0. Det første element er ved indeks 0, det andet ved indeks 1, og så videre.

== Array Deklaration og Initialisering

Der er flere måder at oprette arrays på:

=== Deklaration med `new`

```java
// Opretter et array med 4 pladser (alle med default værdi 0)
int[] numbers = new int[4];

// Opretter et array med 10 pladser til strings (alle med default værdi null)
String[] names = new String[10];

// Opretter et array med 5 pladser til booleans (alle med default værdi false)
boolean[] flags = new boolean[5];
```

=== Initialisering med værdier

```java
// Opretter og initialiserer direkte
int[] scores = {85, 92, 78, 94, 88};

// Alternativ syntaks
int[] temperatures = new int[]{20, 22, 19, 25, 23, 21, 18};

// Array med strings
String[] weekdays = {"Mandag", "Tirsdag", "Onsdag", "Torsdag", "Fredag"};
```

#note[
Når vi bruger `{}` til initialisering, bestemmer Java automatisk størrelsen baseret på antallet af elementer.
]

== Adgang til Array Elementer

Vi bruger indekset i firkantede parenteser til at få adgang til elementer:

```java
int[] chests = {50, 0, 0, 10};

// Læs værdier
int firstChest = chests[0];   // 50
int lastChest = chests[3];    // 10

// Ændre værdier
chests[1] = 25;               // Sætter anden kasse til 25
chests[0] -= 20;              // Fjerner 20 fra første kasse (nu 30)

System.out.println("Første kasse: " + chests[0]);  // 30
System.out.println("Anden kasse: " + chests[1]);   // 25
```

=== Array længde

Hvert array har en `length` egenskab der fortæller hvor mange elementer det indeholder:

```java
int[] numbers = {10, 20, 30, 40, 50};
int size = numbers.length;  // 5

// Adgang til sidste element (uden at kende størrelsen på forhånd)
int lastElement = numbers[numbers.length - 1];  // 50
```

#exercise(title: "Array basics")[
1. Hvilken af følgende er korrekt syntaks for at deklarere et array af 10 heltal?
   ```java
   int a[10] = new int[10];     // A
   int[10] a = new int[10];     // B
   []int a = [10]int;           // C
   int a = new int[10];         // D
   int[] a = new int[10];       // E
   ```

2. Opret et array kaldet `data` med fem elementer og følgende indhold: 27, 51, 33, -1, 101

3. Hvad indeholder arrayet `numbers` efter følgende kode?
   ```java
   int[] numbers = new int[8];
   numbers[1] = 4;
   numbers[4] = 99;
   numbers[7] = 2;
   int x = numbers[1];
   numbers[x] = 44;
   numbers[numbers[7]] = 11;
   ```
]

== Hvorfor starter indekset ved 0?

Det kan virke underligt at det første element er ved indeks 0 i stedet for 1. Årsagen er at indekset faktisk repræsenterer en *forskydning* (offset) fra starten af arrayet:

- Indeks 0: 0 positioner fra start (det første element)
- Indeks 1: 1 position fra start (det andet element)
- Indeks 2: 2 positioner fra start (det tredje element)

Denne konvention kommer fra ældre programmeringssprog og er blevet standard i de fleste moderne sprog.

== Array Gennemløb med Løkker

Arrays og løkker passer perfekt sammen. Her er forskellige måder at gennemgå alle elementer:

=== For-løkke med indeks

```java
int[] scores = {85, 92, 78, 94, 88};

// Udskriv alle scores
for (int i = 0; i < scores.length; i++) {
    System.out.println("Score " + (i + 1) + ": " + scores[i]);
}

// Beregn gennemsnit
int sum = 0;
for (int i = 0; i < scores.length; i++) {
    sum += scores[i];
}
double average = (double) sum / scores.length;
System.out.println("Gennemsnit: " + average);
```

=== Enhanced for-løkke (for-each)

Når vi ikke behøver indekset, kan vi bruge den mere læselige for-each løkke:

```java
int[] scores = {85, 92, 78, 94, 88};

// Udskriv alle scores
for (int score : scores) {
    System.out.println("Score: " + score);
}

// Find højeste score
int highest = scores[0];
for (int score : scores) {
    if (score > highest) {
        highest = score;
    }
}
System.out.println("Højeste score: " + highest);
```

== Praktisk Eksempel: Parkeringshus

Lad os bygge et system til at håndtere et parkeringshus med 10 pladser:

```java
public class ParkingHouse {
    private boolean[] spots;  // true = optaget, false = ledig
    private long[] timeOccupied;  // Tidspunkt for hvornår plads blev optaget
    
    public ParkingHouse(int numberOfSpots) {
        spots = new boolean[numberOfSpots];
        timeOccupied = new long[numberOfSpots];
        
        // Alle pladser starter som ledige
        for (int i = 0; i < spots.length; i++) {
            spots[i] = false;
            timeOccupied[i] = 0;
        }
    }
    
    public boolean parkCar(int spotNumber) {
        if (spotNumber < 0 || spotNumber >= spots.length) {
            System.out.println("Ugyldig plads nummer!");
            return false;
        }
        
        if (spots[spotNumber]) {
            System.out.println("Plads " + (spotNumber + 1) + " er allerede optaget!");
            return false;
        }
        
        spots[spotNumber] = true;
        timeOccupied[spotNumber] = System.currentTimeMillis();
        System.out.println("Bil parkeret på plads " + (spotNumber + 1));
        return true;
    }
    
    public boolean leaveParkingSpot(int spotNumber) {
        if (spotNumber < 0 || spotNumber >= spots.length) {
            System.out.println("Ugyldig plads nummer!");
            return false;
        }
        
        if (!spots[spotNumber]) {
            System.out.println("Plads " + (spotNumber + 1) + " er allerede ledig!");
            return false;
        }
        
        spots[spotNumber] = false;
        timeOccupied[spotNumber] = 0;
        System.out.println("Bil forlod plads " + (spotNumber + 1));
        return true;
    }
    
    public void printStatus() {
        System.out.println("Parkeringshus status:");
        for (int i = 0; i < spots.length; i++) {
            String status = spots[i] ? "Optaget" : "Ledig";
            System.out.println("Plads " + (i + 1) + ": " + status);
        }
    }
    
    public int countAvailableSpots() {
        int available = 0;
        for (boolean spot : spots) {
            if (!spot) {
                available++;
            }
        }
        return available;
    }
    
    public void checkOvertime() {
        long currentTime = System.currentTimeMillis();
        long twoHoursInMillis = 2 * 60 * 60 * 1000;  // 2 timer
        
        System.out.println("Pladser optaget i over 2 timer:");
        for (int i = 0; i < spots.length; i++) {
            if (spots[i] && (currentTime - timeOccupied[i]) > twoHoursInMillis) {
                System.out.println("Plads " + (i + 1) + " - Bøde påkrævet!");
            }
        }
    }
}
```

#exercise(title: "Parkeringshus simulation")[
Brug `ParkingHouse` klassen til at:

1. Opret et parkeringshus med 10 pladser
2. Parker biler på plads 2, 5, og 8
3. Udskriv status for parkeringshuset
4. Udskriv antallet af ledige pladser
5. Prøv at parkere på en allerede optaget plads
6. Lad en bil forlade plads 5
7. Udskriv status igen
]

== String Arrays og Tekstbehandling

Arrays af strings er meget nyttige til at håndtere tekstdata:

```java
public class TextAnalyzer {
    public static void main(String[] args) {
        String[] weekdays = {"Mandag", "Tirsdag", "Onsdag", "Torsdag", "Fredag"};
        
        // Find den længste ugedag
        String longest = weekdays[0];
        for (String day : weekdays) {
            if (day.length() > longest.length()) {
                longest = day;
            }
        }
        System.out.println("Længste ugedag: " + longest);
        
        // Tæl hvor mange dage der indeholder bogstavet 'a'
        int countWithA = 0;
        for (String day : weekdays) {
            if (day.toLowerCase().contains("a")) {
                countWithA++;
            }
        }
        System.out.println("Antal dage med 'a': " + countWithA);
    }
}
```

== Tilfældig Pizza Generator

Lad os bruge arrays til at bygge en tilfældig pizza generator:

```java
import java.util.Random;

public class PizzaGenerator {
    public static void main(String[] args) {
        String[] bases = {"tynd", "tyk", "fuldkorn"};
        String[] toppings = {"ost", "pepperoni", "ananas", "champignon", "løg", "paprika"};
        String[] sauces = {"tomat", "hvidløg", "BBQ", "pesto"};
        
        Random random = new Random();
        
        // Generer tilfældig pizza
        String base = bases[random.nextInt(bases.length)];
        String sauce = sauces[random.nextInt(sauces.length)];
        
        // Vælg 2-4 tilfældige toppings
        int numToppings = 2 + random.nextInt(3);  // 2, 3 eller 4
        String[] selectedToppings = new String[numToppings];
        
        for (int i = 0; i < numToppings; i++) {
            String topping;
            boolean alreadySelected;
            
            // Sørg for at vi ikke vælger samme topping to gange
            do {
                topping = toppings[random.nextInt(toppings.length)];
                alreadySelected = false;
                
                for (int j = 0; j < i; j++) {
                    if (selectedToppings[j].equals(topping)) {
                        alreadySelected = true;
                        break;
                    }
                }
            } while (alreadySelected);
            
            selectedToppings[i] = topping;
        }
        
        // Udskriv opskrift
        System.out.println("=== Tilfældig Pizza Opskrift ===");
        System.out.println("Bund: " + base);
        System.out.println("Sovs: " + sauce);
        System.out.print("Toppings: ");
        for (int i = 0; i < selectedToppings.length; i++) {
            System.out.print(selectedToppings[i]);
            if (i < selectedToppings.length - 1) {
                System.out.print(", ");
            }
        }
        System.out.println();
    }
}
```

== To-dimensionelle Arrays

Nogle gange har vi brug for at organisere data i både rækker og kolonner, som en tabel eller et gitter. Til det bruger vi to-dimensionelle arrays:

```java
// Opret et 3x3 gitter (3 rækker, 3 kolonner)
int[][] grid = new int[3][3];

// Alternativt med værdier
int[][] matrix = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9}
};

// Adgang til elementer
grid[0][0] = 10;      // Øverste venstre hjørne
grid[2][2] = 99;      // Nederste højre hjørne
int value = matrix[1][2];  // Værdi 6 (række 1, kolonne 2)
```

=== Kryds og Bolle Spil

Lad os implementere et simpelt kryds og bolle spil:

```java
public class TicTacToe {
    private int[][] board;
    private static final int EMPTY = 0;
    private static final int CROSS = 1;
    private static final int CIRCLE = -1;
    
    public TicTacToe() {
        board = new int[3][3];
        // Alle felter starter som tomme (0)
    }
    
    public boolean makeMove(int row, int col, int player) {
        if (row < 0 || row >= 3 || col < 0 || col >= 3) {
            return false;  // Ugyldigt felt
        }
        
        if (board[row][col] != EMPTY) {
            return false;  // Feltet er allerede optaget
        }
        
        board[row][col] = player;
        return true;
    }
    
    public void printBoard() {
        System.out.println("Spillebræt:");
        for (int row = 0; row < 3; row++) {
            for (int col = 0; col < 3; col++) {
                char symbol;
                switch (board[row][col]) {
                    case CROSS:
                        symbol = 'X';
                        break;
                    case CIRCLE:
                        symbol = 'O';
                        break;
                    default:
                        symbol = '-';
                }
                System.out.print(symbol + " ");
            }
            System.out.println();
        }
    }
    
    public boolean checkWinner(int player) {
        // Tjek rækker
        for (int row = 0; row < 3; row++) {
            if (board[row][0] == player && 
                board[row][1] == player && 
                board[row][2] == player) {
                return true;
            }
        }
        
        // Tjek kolonner
        for (int col = 0; col < 3; col++) {
            if (board[0][col] == player && 
                board[1][col] == player && 
                board[2][col] == player) {
                return true;
            }
        }
        
        // Tjek diagonaler
        if (board[0][0] == player && board[1][1] == player && board[2][2] == player) {
            return true;
        }
        if (board[0][2] == player && board[1][1] == player && board[2][0] == player) {
            return true;
        }
        
        return false;
    }
}
```

== Primitive vs Reference Datatyper

Nu hvor vi har lært om arrays, er det vigtigt at forstå forskellen mellem primitive og reference datatyper:

=== Primitive Datatyper
```java
int age = 34;          // Gemmer værdien 34 direkte
double height = 1.75;  // Gemmer værdien 1.75 direkte
boolean isStudent = true;  // Gemmer værdien true direkte
```

Primitive datatyper gemmer selve værdien direkte i variablen.

=== Reference Datatyper
```java
String name = "Alice";           // Gemmer reference til String objektet
int[] numbers = {1, 2, 3, 4, 5}; // Gemmer reference til array objektet
```

Reference datatyper gemmer ikke selve værdien, men en *reference* (adresse) til hvor værdien er gemt i hukommelsen.

=== Praktisk forskel
```java
// Primitive datatyper - kopiering af værdi
int a = 10;
int b = a;    // b får en kopi af værdien 10
a = 20;       // Ændrer ikke b
System.out.println(b);  // Udskriver stadig 10

// Reference datatyper - kopiering af reference
int[] array1 = {1, 2, 3};
int[] array2 = array1;  // array2 peger på samme array som array1
array1[0] = 99;         // Ændrer arrayet
System.out.println(array2[0]);  // Udskriver 99 (samme array!)
```

#note[
Når vi arbejder med arrays, skal vi være opmærksomme på at de er reference typer. Det betyder at hvis vi tildeler et array til en anden variabel, får vi ikke en kopi - begge variable peger på det samme array i hukommelsen.
]

== ASCII og Unicode

Karakterer i Java repræsenteres som tal ifølge ASCII og Unicode standarder:

```java
char c1 = 74;   // ASCII værdi for 'J'
char c2 = 65;   // ASCII værdi for 'A'
char c3 = 86;   // ASCII værdi for 'V'
char c4 = 65;   // ASCII værdi for 'A'

System.out.println("Jeg elsker " + c1 + c2 + c3 + c4);  // "Jeg elsker JAVA"

// Vi kan også iterere gennem alfabetet
for (char c = 'A'; c <= 'Z'; c++) {
    System.out.print(c);  // ABCDEFGHIJKLMNOPQRSTUVWXYZ
}
```

#exercise(title: "Football holdet")[
Implementer et system til Danmarks fodboldlandshold:

1. Opret et array med bruttotruppen (23 spillere)
2. Opret et array med startopstillingen (11 spillere) ved at vælge fra bruttotruppen
3. Organiser startopstillingen i en 4-3-3 formation:
   - Målmand (1 spiller)
   - Forsvar (4 spillere)
   - Midtbane (3 spillere)  
   - Angreb (3 spillere)
4. Udskriv startopstillingen formateret som en tabel med trøje nummer, navn og position
]

== Array Algoritmer

Her er nogle nyttige algoritmer til arrays:

=== Find minimum og maksimum
```java
public static int findMin(int[] array) {
    if (array.length == 0) return Integer.MAX_VALUE;
    
    int min = array[0];
    for (int i = 1; i < array.length; i++) {
        if (array[i] < min) {
            min = array[i];
        }
    }
    return min;
}

public static int findMax(int[] array) {
    if (array.length == 0) return Integer.MIN_VALUE;
    
    int max = array[0];
    for (int value : array) {
        if (value > max) {
            max = value;
        }
    }
    return max;
}
```

=== Søgning
```java
public static int findFirst(int[] array, int target) {
    for (int i = 0; i < array.length; i++) {
        if (array[i] == target) {
            return i;  // Returnér indeks
        }
    }
    return -1;  // Ikke fundet
}

public static boolean contains(int[] array, int target) {
    return findFirst(array, target) != -1;
}
```

=== Kopiering
```java
public static int[] copyArray(int[] original) {
    int[] copy = new int[original.length];
    for (int i = 0; i < original.length; i++) {
        copy[i] = original[i];
    }
    return copy;
}
```

== Almindelige Fejl og Faldgruber

=== Array Index Out of Bounds
```java
int[] numbers = {1, 2, 3, 4, 5};

// FARLIGT - kan give ArrayIndexOutOfBoundsException
int value = numbers[5];  // Indeks 5 eksisterer ikke!

// SIKKERT - tjek grænser
if (index >= 0 && index < numbers.length) {
    int value = numbers[index];
}
```

=== Null Pointer Exception
```java
int[] numbers = null;

// FARLIGT - giver NullPointerException
int length = numbers.length;

// SIKKERT - tjek for null først
if (numbers != null) {
    int length = numbers.length;
}
```

=== Reference vs Værdi forvirring
```java
// Pas på med arrays som parametre!
public static void modifyArray(int[] arr) {
    arr[0] = 999;  // Ændrer det originale array!
}

int[] myNumbers = {1, 2, 3};
modifyArray(myNumbers);
System.out.println(myNumbers[0]);  // Udskriver 999, ikke 1!
```

== Sammenfatning

Arrays er kraftfulde datastrukturer der gør det muligt at:

- *Gemme multiple værdier* af samme type i én variabel
- *Effektiv adgang* til elementer via indeks
- *Systematisk gennemløb* med løkker
- *Organisere data* i strukturer som tabeller og matricer

Vi har lært:
- Array deklaration og initialisering
- Indeksering (starter ved 0)
- Gennemløb med for-løkker og for-each
- To-dimensionelle arrays
- Forskellen mellem primitive og reference datatyper
- Praktiske eksempler og algoritmer
- Almindelige fejl og hvordan man undgår dem

Arrays danner grundlaget for mange avancerede datastrukturer og algoritmer, som vi vil møde senere i vores programmeringsrejse. I næste kapitel vil vi lære om objektorienteret programmering og hvordan vi kan skabe vores egne datatyper med klasser og objekter.