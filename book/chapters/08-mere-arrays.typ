#import "../style.typ": *

= Mere om Arrays

I det forrige kapitel lærte vi grundlæggende array teknikker. Nu skal vi dykke dybere ned i avancerede array operationer, arbejde med strings som arrays, lære om Arrays-klassen, og forstå bedre hvordan references og kopiering fungerer.

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

Java leverer en `Arrays` klasse med mange nyttige metoder til array manipulation:

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

== Reference vs Værdi - Dyb Forståelse

Det er kritisk at forstå forskellen mellem at kopiere references og at kopiere værdier:

=== Shallow Copy (Reference Kopiering)

```java
public class ReferenceExample {
    public static void main(String[] args) {
        int[] array1 = {1, 2, 3, 4, 5};
        int[] array2 = array1;  // IKKE en kopi - samme reference!
        
        System.out.println("Før ændring:");
        System.out.println("Array1: " + Arrays.toString(array1));
        System.out.println("Array2: " + Arrays.toString(array2));
        
        // Ændrer array2, men det påvirker også array1!
        array2[0] = 999;
        
        System.out.println("Efter ændring af array2[0]:");
        System.out.println("Array1: " + Arrays.toString(array1));  // Også ændret!
        System.out.println("Array2: " + Arrays.toString(array2));
        
        // Test om de er samme objekt
        System.out.println("Er det samme objekt? " + (array1 == array2));  // true
    }
}
```

=== Deep Copy (Værdi Kopiering)

```java
public class ValueCopyExample {
    public static void main(String[] args) {
        int[] array1 = {1, 2, 3, 4, 5};
        
        // Måde 1: Arrays.copyOf()
        int[] array2 = Arrays.copyOf(array1, array1.length);
        
        // Måde 2: Manual kopiering
        int[] array3 = new int[array1.length];
        for (int i = 0; i < array1.length; i++) {
            array3[i] = array1[i];
        }
        
        // Måde 3: System.arraycopy()
        int[] array4 = new int[array1.length];
        System.arraycopy(array1, 0, array4, 0, array1.length);
        
        // Test uafhængighed
        array2[0] = 888;
        array3[1] = 777;
        array4[2] = 666;
        
        System.out.println("Original: " + Arrays.toString(array1));
        System.out.println("Copy 1:   " + Arrays.toString(array2));
        System.out.println("Copy 2:   " + Arrays.toString(array3));
        System.out.println("Copy 3:   " + Arrays.toString(array4));
    }
}
```

== Array Algoritmer

Her er nogle klassiske algoritmer implementeret med arrays:

=== Søgning

```java
public class SearchAlgorithms {
    
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
}
```

=== Statistik

```java
public class ArrayStatistics {
    
    public static int findMin(int[] array) {
        if (array.length == 0) throw new IllegalArgumentException("Tom array");
        
        int min = array[0];
        for (int i = 1; i < array.length; i++) {
            if (array[i] < min) {
                min = array[i];
            }
        }
        return min;
    }
    
    public static int findMax(int[] array) {
        if (array.length == 0) throw new IllegalArgumentException("Tom array");
        
        int max = array[0];
        for (int value : array) {
            if (value > max) {
                max = value;
            }
        }
        return max;
    }
    
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
}
```

== Avanceret Array Manipulation

=== Array Rotation

```java
public class ArrayRotation {
    
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
    
    public static void main(String[] args) {
        int[] numbers = {1, 2, 3, 4, 5, 6, 7};
        System.out.println("Original: " + Arrays.toString(numbers));
        
        rotateRight(numbers, 3);
        System.out.println("Roteret 3 til højre: " + Arrays.toString(numbers));
        // Output: [5, 6, 7, 1, 2, 3, 4]
    }
}
```

=== Array Merge

```java
public class ArrayMerge {
    
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
}
```

== ASCII og Unicode Revisited

Nu hvor vi forstår arrays bedre, kan vi udforske karakterer mere dybdegående:

```java
public class CharacterExploration {
    public static void main(String[] args) {
        // ASCII værdi til karakter
        char c1 = 74;   // 'J'
        char c2 = 65;   // 'A'
        char c3 = 86;   // 'V'
        char c4 = 65;   // 'A'
        
        System.out.println("Jeg elsker " + c1 + c2 + c3 + c4);  // "Jeg elsker JAVA"
        
        // Iterér gennem alfabetet
        System.out.println("Alfabetet:");
        for (char c = 'A'; c <= 'Z'; c++) {
            System.out.print(c + " ");
        }
        System.out.println();
        
        // Vorsigtig med internationale karakterer!
        System.out.println("Fra A til Å:");
        for (char c = 'A'; c <= 'Å'; c++) {
            System.out.print(c);
            if (c == 'Z') System.out.print(" -> ");  // Marker skiftet
        }
        System.out.println();
        
        // Bedre måde: Eksplicit array med danske karakterer
        char[] danishAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZÆØÅ".toCharArray();
        
        System.out.println("Dansk alfabet:");
        for (char letter : danishAlphabet) {
            System.out.print(letter + " ");
        }
        System.out.println();
    }
}
```

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

== Performance Overvejelser

=== Array Access Patterns

```java
public class PerformanceExample {
    
    // Effektiv: Sekventiel adgang
    public static long sumSequential(int[] array) {
        long sum = 0;
        for (int i = 0; i < array.length; i++) {
            sum += array[i];
        }
        return sum;
    }
    
    // Mindre effektiv: Random adgang
    public static long sumRandom(int[] array, int[] indices) {
        long sum = 0;
        for (int index : indices) {
            sum += array[index];
        }
        return sum;
    }
    
    // Cache-friendly vs cache-unfriendly patterns matter for store arrays
}
```

=== Memory Considerations

```java
public class MemoryExample {
    public static void main(String[] args) {
        // Små arrays: Stack allocation for references
        int[] small = new int[10];
        
        // Store arrays: Heap allocation
        int[] large = new int[1_000_000];
        
        // Multidimensionelle arrays bruger mere memory
        int[][] matrix = new int[1000][1000];  // 1M integers = ~4MB
        
        // Pas på memory leaks med store arrays
        large = null;  // Gør array tilgængeligt for garbage collection
    }
}
```

== Sammenfatning

I dette kapitel har vi lært:

/ String manipulation: Konvertering mellem strings og char arrays, tekstanalyse
/ Arrays-klassen: toString(), sort(), copyOf(), binarySearch()
/ Reference vs værdi: Forskellen mellem shallow og deep copy
/ Algoritmer: Søgning (lineær, binær), statistik, rotation, merge
/ ASCII/Unicode: Karaktermanipulation og internationale karakterer
/ Performance: Memory overvejelser og access patterns

Arrays er fundamentale datastrukturer der danner grundlag for mere avancerede collections som ArrayList, som vi møder senere. Forståelse af references og kopiering er særligt vigtig for objektorienteret programmering.

I næste kapitel lærer vi om klasser som værktøjskasser, hvor vi organiserer vores kode i static metoder for bedre struktur og genbrugelighed.