#import "../style.typ": *

= Arrays

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

== Strings og Character Arrays

Strings i Java er i bund og grund arrays af karakterer, og vi kan arbejde med dem på flere måder:

=== Forskellige måder at oprette Strings

```java
// Standard string literal
String s1 = "H.C. Andersen";

// Eksplicit konstruktør
String s2 = new String("H.C. Andersen");

// Fra character array
char[] chars = {'H', '.', 'C', '.', ' ', 
                'A', 'n', 'd', 'e', 'r', 
                's', 'e', 'n'};
String s3 = new String(chars);

// Text block (til længere tekster)
String s4 = """
    Der var engang en fattig Prinds; 
    han havde et Kongerige, der var 
    ganske lille, men det var da altid 
    stort nok til at gifte sig paa, 
    og gifte sig det vilde han.
    """;
```

=== Konvertering mellem String og char array

```java
String tekst = "Hello World";

// Fra String til char array
char[] karakterer = tekst.toCharArray();

// Fra char array til String
String nyTekst = new String(karakterer);

// Adgang til individuelle karakterer
char førsteBogstav = tekst.charAt(0);  // 'H'
char sidsteBogstav = tekst.charAt(tekst.length() - 1);  // 'd'
```

=== Tekstanalyse med Arrays

Lad os bygge et program der analyserer tekst:

```java
public class TextAnalyzer {
    
    public static int countChar(String text, char c) {
        int count = 0;
        
        // Metode 1: Brug charAt() med indeks
        for (int i = 0; i < text.length(); i++) {
            if (Character.toLowerCase(text.charAt(i)) == Character.toLowerCase(c)) {
                count++;
            }
        }
        
        return count;
    }
    
    public static int countCharAlternative(String text, char c) {
        int count = 0;
        
        // Metode 2: Konverter til char array og brug for-each
        char[] chars = text.toCharArray();
        for (char ch : chars) {
            if (Character.toLowerCase(ch) == Character.toLowerCase(c)) {
                count++;
            }
        }
        
        return count;
    }
    
    public static void analyzeText(String text) {
        System.out.println("Tekstanalyse af: " + text.substring(0, Math.min(50, text.length())) + "...");
        System.out.println("Længde: " + text.length() + " karakterer");
        
        // Analyser bogstavfrekvens
        char[] alphabet = "abcdefghijklmnopqrstuvwxyzæøå".toCharArray();
        
        System.out.println("\nBogstavfrekvens:");
        for (char letter : alphabet) {
            int count = countChar(text, letter);
            if (count > 0) {
                System.out.println(letter + ": " + count + " gange");
            }
        }
    }
    
    public static void main(String[] args) {
        String eventyr = """
            Der var engang en fattig Prinds; han havde et Kongerige, 
            der var ganske lille, men det var da altid stort nok til 
            at gifte sig paa, og gifte sig det vilde han.
            """;
            
        analyzeText(eventyr);
    }
}
```

#exercise(title: "H.C. Andersen eventyr analyse")[
1. Vælg et H.C. Andersen eventyr og brug det som text block
2. Implementer `countChar` metoden to forskellige måder (charAt vs toCharArray)
3. Lav en analyse der viser:
   - Hvilke bogstaver optræder oftest?
   - Hvilke bogstaver optræder slet ikke?
   - Hvor mange vokaler vs konsonanter er der?
4. Lav en metode der finder det længste ord i teksten
]

== Arrays-klassen og Utility Metoder

Java leverer en `Arrays` klasse med mange nyttige metoder til array manipulation. Husk at importere den først!

```java
import java.util.Arrays;
```

=== Udskrivning og Formatering

```java
import java.util.Arrays;

public class ArrayUtilities {
    public static void main(String[] args) {
        int[] numbers = {42, 17, 89, 3, 56};
        String[] names = {"Anna", "Bob", "Charlie"};
        
        // toString() - pæn udskrivning
        System.out.println("Numbers: " + Arrays.toString(numbers));
        // Output: Numbers: [42, 17, 89, 3, 56]
        
        System.out.println("Names: " + Arrays.toString(names));
        // Output: Names: [Anna, Bob, Charlie]
        
        // Uden Arrays.toString() får vi ikke læsbar output
        System.out.println("Numbers direkte: " + numbers);
        // Output: Numbers direkte: [I@6bc7c054 (hash kode)
    }
}
```

=== Sortering

```java
import java.util.Arrays;

public class SortingExample {
    public static void main(String[] args) {
        int[] numbers = {42, 17, 89, 3, 56, 23, 91, 7};
        String[] names = {"Zebra", "Apple", "Banana", "Charlie"};
        
        System.out.println("Før sortering: " + Arrays.toString(numbers));
        
        // Sortér array (ændrer det originale array!)
        Arrays.sort(numbers);
        
        System.out.println("Efter sortering: " + Arrays.toString(numbers));
        // Output: [3, 7, 17, 23, 42, 56, 89, 91]
        
        // Strings sorteres alfabetisk
        Arrays.sort(names);
        System.out.println("Sorterede navne: " + Arrays.toString(names));
        // Output: [Apple, Banana, Charlie, Zebra]
    }
}
```

=== Array Kopiering

```java
import java.util.Arrays;

public class ArrayCopying {
    public static void main(String[] args) {
        int[] original = {1, 2, 3, 4, 5};
        
        // copyOf() - kopierer til ny længde
        int[] copy1 = Arrays.copyOf(original, original.length);
        int[] copy2 = Arrays.copyOf(original, 3);  // Kun første 3 elementer
        int[] copy3 = Arrays.copyOf(original, 8);  // Udvider med 0'er
        
        System.out.println("Original: " + Arrays.toString(original));
        System.out.println("Fuld kopi: " + Arrays.toString(copy1));
        System.out.println("Kort kopi: " + Arrays.toString(copy2));
        System.out.println("Lang kopi: " + Arrays.toString(copy3));
        
        // copyOfRange() - kopierer et udsnit
        int[] range = Arrays.copyOfRange(original, 1, 4);  // Fra indeks 1 til 3
        System.out.println("Range kopi: " + Arrays.toString(range));
        
        // Test at kopierne er uafhængige
        copy1[0] = 999;
        System.out.println("Efter ændring af kopi:");
        System.out.println("Original: " + Arrays.toString(original));  // Uændret
        System.out.println("Kopi: " + Arrays.toString(copy1));         // Ændret
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

=== Shallow Copy vs Deep Copy

```java
// Primitive datatyper - kopiering af værdi
int a = 10;
int b = a;    // b får en kopi af værdien 10
a = 20;       // Ændrer ikke b
System.out.println(b);  // Udskriver stadig 10

// Reference datatyper - kopiering af reference (SHALLOW COPY)
int[] array1 = {1, 2, 3};
int[] array2 = array1;  // array2 peger på samme array som array1
array1[0] = 99;         // Ændrer arrayet
System.out.println(array2[0]);  // Udskriver 99 (samme array!)

// Deep copy - lav en rigtig kopi
int[] array3 = Arrays.copyOf(array1, array1.length);
array1[0] = 999;
System.out.println(array3[0]);  // Udskriver 99 (uændret!)
```

#note[
Når vi arbejder med arrays, skal vi være opmærksomme på at de er reference typer. Det betyder at hvis vi tildeler et array til en anden variabel, får vi ikke en kopi - begge variable peger på det samme array i hukommelsen.

Brug altid `Arrays.copyOf()` eller manual kopiering når du har brug for en uafhængig kopi!
]

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

== Array Algoritmer

Her er nogle nyttige og klassiske algoritmer til arrays:

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
// Lineær søgning - virker på usorterede arrays
public static int linearSearch(int[] array, int target) {
    for (int i = 0; i < array.length; i++) {
        if (array[i] == target) {
            return i;  // Returnér indeks
        }
    }
    return -1;  // Ikke fundet
}

// Binær søgning - kun på sorterede arrays
public static int binarySearch(int[] array, int target) {
    int left = 0;
    int right = array.length - 1;
    
    while (left <= right) {
        int mid = left + (right - left) / 2;
        
        if (array[mid] == target) {
            return mid;
        } else if (array[mid] < target) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    
    return -1;  // Ikke fundet
}

// Eller brug Arrays.binarySearch()
public static int builtInBinarySearch(int[] array, int target) {
    return Arrays.binarySearch(array, target);
}
```

=== Statistik

```java
public static double calculateAverage(int[] array) {
    if (array.length == 0) return 0.0;
    
    long sum = 0;  // Brug long for at undgå overflow
    for (int value : array) {
        sum += value;
    }
    
    return (double) sum / array.length;
}

public static int[] getMinMax(int[] array) {
    if (array.length == 0) return new int[]{0, 0};
    
    int min = array[0];
    int max = array[0];
    
    for (int i = 1; i < array.length; i++) {
        if (array[i] < min) min = array[i];
        if (array[i] > max) max = array[i];
    }
    
    return new int[]{min, max};
}
```

=== Array Rotation

```java
// Rotér array til højre med n positioner
public static void rotateRight(int[] array, int n) {
    if (array.length == 0) return;
    
    n = n % array.length;  // Håndter n > array.length
    
    // Reverser hele array
    reverse(array, 0, array.length - 1);
    
    // Reverser første n elementer
    reverse(array, 0, n - 1);
    
    // Reverser resten
    reverse(array, n, array.length - 1);
}

private static void reverse(int[] array, int start, int end) {
    while (start < end) {
        int temp = array[start];
        array[start] = array[end];
        array[end] = temp;
        start++;
        end--;
    }
}
```

=== Array Merge

```java
// Merge to arrays til ét array
public static int[] merge(int[] array1, int[] array2) {
    int[] merged = new int[array1.length + array2.length];
    
    // Kopiér array1
    System.arraycopy(array1, 0, merged, 0, array1.length);
    
    // Kopiér array2
    System.arraycopy(array2, 0, merged, array1.length, array2.length);
    
    return merged;
}

// Merge to sorterede arrays til et sorteret array
public static int[] mergeSorted(int[] array1, int[] array2) {
    int[] merged = new int[array1.length + array2.length];
    int i = 0, j = 0, k = 0;
    
    // Merge indtil en array er udtømt
    while (i < array1.length && j < array2.length) {
        if (array1[i] <= array2[j]) {
            merged[k++] = array1[i++];
        } else {
            merged[k++] = array2[j++];
        }
    }
    
    // Kopiér resterende elementer
    while (i < array1.length) {
        merged[k++] = array1[i++];
    }
    while (j < array2.length) {
        merged[k++] = array2[j++];
    }
    
    return merged;
}
```

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

// Vorsigtig med internationale karakterer!
System.out.println("\nFra A til Å:");
for (char c = 'A'; c <= 'Å'; c++) {
    System.out.print(c);
    if (c == 'Z') System.out.print(" -> ");  // Marker skiftet
}

// Bedre måde: Eksplicit array med danske karakterer
char[] danishAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZÆØÅ".toCharArray();
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

== Øvelser

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

#exercise(title: "Array Utilities Bibliotek")[
Lav dit eget bibliotek af array utilities:

1. `public static void printArray(int[] array)` - pæn udskrivning
2. `public static boolean contains(int[] array, int value)` - tjek om værdi findes
3. `public static int[] removeElement(int[] array, int index)` - fjern element på indeks
4. `public static int[] insertElement(int[] array, int index, int value)` - indsæt element
5. `public static int[] removeDuplicates(int[] array)` - fjern dubletter
6. `public static boolean areEqual(int[] array1, int[] array2)` - sammenlign arrays
7. Test alle metoder grundigt
]

#exercise(title: "Tilfældig Pizza Generator")[
Lav en tilfældig pizza generator:

1. Opret arrays med forskellige bunde, saucer og toppings
2. Brug `Random` til at vælge tilfældige ingredienser
3. Sørg for at toppings ikke gentages
4. Udskriv en komplet pizza opskrift
]

== Sammenfatning

Arrays er kraftfulde datastrukturer der gør det muligt at:

- **Gemme multiple værdier** af samme type i én variabel
- **Effektiv adgang** til elementer via indeks
- **Systematisk gennemløb** med løkker
- **Organisere data** i strukturer som tabeller og matricer

Vi har lært:
- Array deklaration og initialisering
- Indeksering (starter ved 0)
- Gennemløb med for-løkker og for-each
- String manipulation og char arrays
- `Arrays`-klassen med `toString()`, `sort()`, `copyOf()`, `binarySearch()`
- Forskellen mellem primitive og reference datatyper
- Shallow copy vs deep copy
- To-dimensionelle arrays
- Klassiske array algoritmer (søgning, sortering, statistik)
- ASCII/Unicode og karaktermanipulation
- Almindelige fejl og hvordan man undgår dem

Arrays danner grundlaget for mange avancerede datastrukturer og algoritmer. Forståelse af references og kopiering er særligt vigtig når vi kommer til objektorienteret programmering.

I næste kapitel lærer vi om klasser som værktøjskasser, hvor vi organiserer vores kode i static metoder for bedre struktur og genbrugelighed.
