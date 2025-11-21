#import "../style.typ": *

= Klasser som Værktøjskasser

Indtil nu har vi skrevet al vores kode i én fil. Men når programmer bliver større, bliver det hurtigt uoverskueligt og svært at vedligeholde. Det er her organisering kommer ind i billedet.

I objektorienterede sprog som Java organiserer vi kode i *klasser*. I dette kapitel lærer vi om en særlig type klasser: *hjælpeklasser* eller *utility klasser*, der fungerer som værktøjskasser med nyttige metoder.

== Hvad er en Hjælpeklasse?

En hjælpeklasse er en klasse der indeholder relaterede static metoder, som fungerer som værktøjer vi kan bruge i vores programmer. Det er som en værktøjskasse hvor hver metode er et specialværktøj til en bestemt opgave.

=== Eksempel: Java's Math Klasse

Du har allerede brugt en hjælpeklasse - `java.lang.Math`:

```java
import java.lang.Math;

public class MathExample {
    public static void main(String[] args) {
        double result1 = Math.sqrt(16);        // 4.0
        double result2 = Math.pow(2, 3);       // 8.0
        int result3 = Math.max(3, 7);          // 7
        double result4 = Math.PI;              // 3.141592653589793
        
        System.out.println("Kvadratrod af 16: " + result1);
        System.out.println("2 i 3. potens: " + result2);
        System.out.println("Max af 3 og 7: " + result3);
        System.out.println("Pi: " + result4);
    }
}
```

Læg mærke til:
- Vi skriver altid `Math.` foran metoderne
- Vi behøver ikke at oprette et objekt af Math klassen
- Alle metoder er `static`

== Static Metoder vs Instance Metoder

=== Static Metoder

Static metoder tilhører *klassen*, ikke et specifikt objekt:

```java
public class Calculator {
    public static int add(int a, int b) {
        return a + b;
    }
    
    public static int multiply(int a, int b) {
        return a * b;
    }
}

// Brugs:
int sum = Calculator.add(5, 3);        // 8
int product = Calculator.multiply(4, 7); // 28
```

=== Instance Metoder (til sammenligning)

Instance metoder tilhører et *objekt*:

```java
String text = new String("Hello");
Scanner input = new Scanner(System.in);
Random random = new Random(342);

// Kald metoder på objektet
String upperText = text.toUpperCase();
String line = input.nextLine();
int randomNumber = random.nextInt(10);
```

=== Hvorfor Static i Main?

Alle vores metoder indtil nu har været static fordi vi kaldte dem fra `main`, som selv er static:

```java
public class Main {
    public static void main(String[] args) {
        sayHello();        // Virker - begge er static
        Main.sayHello();   // Alternativ syntaks (valgfri)
    }

    public static void sayHello() {
        System.out.println("Hello!");
    }
}
```

== Lav Din Egen Lommeregner

Lad os bygge vores egen lommeregner som hjælpeklasse:

=== Grundlæggende Lommeregner

```java
public class Calculator {
    
    public static int add(int a, int b) {
        return a + b;
    }
    
    public static int subtract(int a, int b) {
        return a - b;
    }
    
    public static int multiply(int a, int b) {
        return a * b;
    }
    
    public static int divide(int a, int b) {
        if (b == 0) {
            throw new IllegalArgumentException("Division med nul er ikke tilladt");
        }
        return a / b;
    }
    
    public static int modulo(int a, int b) {
        if (b == 0) {
            throw new IllegalArgumentException("Modulo med nul er ikke tilladt");
        }
        return a % b;
    }
}
```

=== Brug af Lommeregneren

```java
public class Main {
    public static void main(String[] args) {
        int a = 15;
        int b = 4;
        
        System.out.println(a + " + " + b + " = " + Calculator.add(a, b));
        System.out.println(a + " - " + b + " = " + Calculator.subtract(a, b));
        System.out.println(a + " * " + b + " = " + Calculator.multiply(a, b));
        System.out.println(a + " / " + b + " = " + Calculator.divide(a, b));
        System.out.println(a + " % " + b + " = " + Calculator.modulo(a, b));
    }
}
```

#exercise(title: "Udvidet lommeregner")[
Udvid `Calculator` klassen med følgende metoder:

1. `power(int base, int exponent)` - beregn potensopløftning
2. `factorial(int n)` - beregn fakultet (n!)
3. `gcd(int a, int b)` - største fælles divisor
4. `isPrime(int n)` - tjek om tal er primtal
5. `fibonacci(int n)` - n'te Fibonacci tal

Test alle metoder grundigt!
]

== Avanceret Lommeregner med Floating Point

```java
public class AdvancedCalculator {
    
    // Konstanter
    public static final double PI = 3.141592653589793;
    public static final double E = 2.718281828459045;
    
    // Grundlæggende operationer
    public static double add(double a, double b) {
        return a + b;
    }
    
    public static double subtract(double a, double b) {
        return a - b;
    }
    
    public static double multiply(double a, double b) {
        return a * b;
    }
    
    public static double divide(double a, double b) {
        if (Math.abs(b) < 1e-10) {  // Floating point sammenligning
            throw new IllegalArgumentException("Division med nul");
        }
        return a / b;
    }
    
    // Avancerede operationer
    public static double sqrt(double a) {
        if (a < 0) {
            throw new IllegalArgumentException("Kvadratrod af negativ tal");
        }
        return Math.sqrt(a);
    }
    
    public static double power(double base, double exponent) {
        return Math.pow(base, exponent);
    }
    
    // Trigonometriske funktioner (input i grader)
    public static double sin(double degrees) {
        return Math.sin(Math.toRadians(degrees));
    }
    
    public static double cos(double degrees) {
        return Math.cos(Math.toRadians(degrees));
    }
    
    public static double tan(double degrees) {
        return Math.tan(Math.toRadians(degrees));
    }
    
    // Utility metoder
    public static double round(double value, int decimals) {
        double multiplier = Math.pow(10, decimals);
        return Math.round(value * multiplier) / multiplier;
    }
    
    public static boolean isEven(int number) {
        return number % 2 == 0;
    }
    
    public static boolean isOdd(int number) {
        return number % 2 != 0;
    }
}
```

== Packages og Namespaces

Når vi laver mange klasser, kan vi få navnekonflikter. Hvad hvis Java også havde en klasse der hed `Calculator`? Her kommer *packages* til undsætning.

=== Hvad er et Package?

Et package er et *navnerum* (namespace) der grupperer relaterede klasser og forhindrer navnekonflikter.

=== Package Konventioner

```java
// Pakke-navne er altid små bogstaver
package calculator;

// Flere niveauer adskilles med punktum
package dk.kea.calculator;

// Store virksomheder bruger ofte domænenavne bagfra
package com.google.gson;
package org.springframework.boot;
```

=== Mappestruktur

Packages skal matche mappestrukturen:

```
src/
  dk/
    kea/
      calculator/
        Calculator.java
        AdvancedCalculator.java
  app/
    Main.java
```

=== Package Declaration og Import

*Calculator.java:*
```java
package dk.kea.calculator;

public class Calculator {
    public static int add(int a, int b) {
        return a + b;
    }
    
    public static int subtract(int a, int b) {
        return a - b;
    }
}
```

*Main.java:*
```java
package app;

import dk.kea.calculator.Calculator;

public class Main {
    public static void main(String[] args) {
        int result = Calculator.add(5, 3);
        System.out.println("5 + 3 = " + result);
    }
}
```

=== Alternativ uden Import

```java
package app;

public class Main {
    public static void main(String[] args) {
        // Brug fuldt kvalificeret navn
        int result = dk.kea.calculator.Calculator.add(5, 3);
        System.out.println("5 + 3 = " + result);
    }
}
```

== Praktisk Eksempel: Distance Converter

Lad os bygge en hjælpeklasse til at konvertere afstande:

```java
package dk.kea.utilities;

/**
 * Utility klasse til konvertering af afstande mellem forskellige enheder.
 */
public class DistanceConverter {
    
    // Konstanter for konvertering
    private static final double METERS_PER_KILOMETER = 1000.0;
    private static final double METERS_PER_MILE = 1609.344;
    private static final double METERS_PER_YARD = 0.9144;
    private static final double METERS_PER_FOOT = 0.3048;
    private static final double METERS_PER_INCH = 0.0254;
    
    // Til meter konverteringer
    public static double kilometersToMeters(double kilometers) {
        return kilometers * METERS_PER_KILOMETER;
    }
    
    public static double milesToMeters(double miles) {
        return miles * METERS_PER_MILE;
    }
    
    public static double yardsToMeters(double yards) {
        return yards * METERS_PER_YARD;
    }
    
    public static double feetToMeters(double feet) {
        return feet * METERS_PER_FOOT;
    }
    
    public static double inchesToMeters(double inches) {
        return inches * METERS_PER_INCH;
    }
    
    // Fra meter konverteringer
    public static double metersToKilometers(double meters) {
        return meters / METERS_PER_KILOMETER;
    }
    
    public static double metersToMiles(double meters) {
        return meters / METERS_PER_MILE;
    }
    
    public static double metersToYards(double meters) {
        return meters / METERS_PER_YARD;
    }
    
    public static double metersToFeet(double meters) {
        return meters / METERS_PER_FOOT;
    }
    
    public static double metersToInches(double meters) {
        return meters / METERS_PER_INCH;
    }
    
    // Direkte konverteringer
    public static double milesToKilometers(double miles) {
        return metersToKilometers(milesToMeters(miles));
    }
    
    public static double kilometersToMiles(double kilometers) {
        return metersToMiles(kilometersToMeters(kilometers));
    }
}
```

=== Brug af Distance Converter

```java
package app;

import dk.kea.utilities.DistanceConverter;

public class DistanceDemo {
    public static void main(String[] args) {
        double distanceInMiles = 26.2;  // Marathon distance
        
        System.out.println("Marathon distance:");
        System.out.println(distanceInMiles + " miles");
        System.out.println(DistanceConverter.milesToKilometers(distanceInMiles) + " km");
        System.out.println(DistanceConverter.milesToMeters(distanceInMiles) + " meters");
        System.out.println(DistanceConverter.metersToFeet(
            DistanceConverter.milesToMeters(distanceInMiles)) + " feet");
        
        // Test konvertering frem og tilbage
        double originalKm = 10.0;
        double miles = DistanceConverter.kilometersToMiles(originalKm);
        double backToKm = DistanceConverter.milesToKilometers(miles);
        
        System.out.println("\nTest konvertering:");
        System.out.println("Original: " + originalKm + " km");
        System.out.println("Til miles: " + miles);
        System.out.println("Tilbage til km: " + backToKm);
        System.out.println("Forskel: " + Math.abs(originalKm - backToKm));
    }
}
```

== StringUtils - En Tekst Værktøjskasse

```java
package dk.kea.utilities;

/**
 * Utility klasse med nyttige string operationer.
 */
public class StringUtils {
    
    /**
     * Tjekker om en string er null eller tom.
     */
    public static boolean isEmpty(String str) {
        return str == null || str.length() == 0;
    }
    
    /**
     * Tjekker om en string er null, tom eller kun indeholder whitespace.
     */
    public static boolean isBlank(String str) {
        return str == null || str.trim().length() == 0;
    }
    
    /**
     * Reverser en string.
     */
    public static String reverse(String str) {
        if (isEmpty(str)) {
            return str;
        }
        
        char[] chars = str.toCharArray();
        int left = 0;
        int right = chars.length - 1;
        
        while (left < right) {
            char temp = chars[left];
            chars[left] = chars[right];
            chars[right] = temp;
            left++;
            right--;
        }
        
        return new String(chars);
    }
    
    /**
     * Tæl antal forekomster af en karakter i en string.
     */
    public static int countChar(String str, char c) {
        if (isEmpty(str)) {
            return 0;
        }
        
        int count = 0;
        for (int i = 0; i < str.length(); i++) {
            if (str.charAt(i) == c) {
                count++;
            }
        }
        return count;
    }
    
    /**
     * Fjern alle whitespace karakterer fra en string.
     */
    public static String removeWhitespace(String str) {
        if (isEmpty(str)) {
            return str;
        }
        
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            if (!Character.isWhitespace(c)) {
                result.append(c);
            }
        }
        return result.toString();
    }
    
    /**
     * Tjek om en string er et palindrom (læses ens forfra og bagfra).
     */
    public static boolean isPalindrome(String str) {
        if (isEmpty(str)) {
            return true;
        }
        
        String cleaned = removeWhitespace(str.toLowerCase());
        return cleaned.equals(reverse(cleaned));
    }
    
    /**
     * Kapitalisér første bogstav i hvert ord.
     */
    public static String capitalize(String str) {
        if (isEmpty(str)) {
            return str;
        }
        
        StringBuilder result = new StringBuilder();
        boolean capitalizeNext = true;
        
        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            
            if (Character.isWhitespace(c)) {
                capitalizeNext = true;
                result.append(c);
            } else if (capitalizeNext) {
                result.append(Character.toUpperCase(c));
                capitalizeNext = false;
            } else {
                result.append(Character.toLowerCase(c));
            }
        }
        
        return result.toString();
    }
}
```

#exercise(title: "String Utilities Test")[
Lav en test klasse der grundigt tester alle metoder i `StringUtils`:

1. Test med normale strings
2. Test med null og tomme strings  
3. Test med strings der kun indeholder whitespace
4. Test edge cases (meget korte/lange strings)
5. Test palindromer: "aba", "Able was I ere I saw Elba", "race car"
6. Test kapitalisering med forskellige formater

Lav en metode der kører alle tests og rapporterer resultater.
]

== ArrayUtils - Array Hjælpemetoder

```java
package dk.kea.utilities;

import java.util.Arrays;

/**
 * Utility klasse med nyttige array operationer.
 */
public class ArrayUtils {
    
    /**
     * Find det mindste element i et array.
     */
    public static int min(int[] array) {
        if (array == null || array.length == 0) {
            throw new IllegalArgumentException("Array kan ikke være null eller tom");
        }
        
        int min = array[0];
        for (int i = 1; i < array.length; i++) {
            if (array[i] < min) {
                min = array[i];
            }
        }
        return min;
    }
    
    /**
     * Find det største element i et array.
     */
    public static int max(int[] array) {
        if (array == null || array.length == 0) {
            throw new IllegalArgumentException("Array kan ikke være null eller tom");
        }
        
        int max = array[0];
        for (int value : array) {
            if (value > max) {
                max = value;
            }
        }
        return max;
    }
    
    /**
     * Beregn summen af alle elementer.
     */
    public static long sum(int[] array) {
        if (array == null) {
            return 0;
        }
        
        long sum = 0;
        for (int value : array) {
            sum += value;
        }
        return sum;
    }
    
    /**
     * Beregn gennemsnittet.
     */
    public static double average(int[] array) {
        if (array == null || array.length == 0) {
            return 0.0;
        }
        
        return (double) sum(array) / array.length;
    }
    
    /**
     * Tjek om et array indeholder en værdi.
     */
    public static boolean contains(int[] array, int value) {
        if (array == null) {
            return false;
        }
        
        for (int element : array) {
            if (element == value) {
                return true;
            }
        }
        return false;
    }
    
    /**
     * Find indeks for første forekomst af værdi.
     */
    public static int indexOf(int[] array, int value) {
        if (array == null) {
            return -1;
        }
        
        for (int i = 0; i < array.length; i++) {
            if (array[i] == value) {
                return i;
            }
        }
        return -1;
    }
    
    /**
     * Lav en deep copy af array.
     */
    public static int[] copy(int[] array) {
        if (array == null) {
            return null;
        }
        
        return Arrays.copyOf(array, array.length);
    }
    
    /**
     * Fjern dubletter fra array (bevarer rækkefølge).
     */
    public static int[] removeDuplicates(int[] array) {
        if (array == null || array.length <= 1) {
            return copy(array);
        }
        
        // Count unique elements
        int uniqueCount = 0;
        for (int i = 0; i < array.length; i++) {
            boolean isDuplicate = false;
            for (int j = 0; j < i; j++) {
                if (array[i] == array[j]) {
                    isDuplicate = true;
                    break;
                }
            }
            if (!isDuplicate) {
                uniqueCount++;
            }
        }
        
        // Build result array
        int[] result = new int[uniqueCount];
        int resultIndex = 0;
        
        for (int i = 0; i < array.length; i++) {
            boolean isDuplicate = false;
            for (int j = 0; j < i; j++) {
                if (array[i] == array[j]) {
                    isDuplicate = true;
                    break;
                }
            }
            if (!isDuplicate) {
                result[resultIndex++] = array[i];
            }
        }
        
        return result;
    }
}
```

== Best Practices for Hjælpeklasser

=== Design Principper

1. *Single Responsibility*: Hver klasse skal have ét ansvar
2. *Static Metoder*: Alle metoder bør være static
3. *Immutable*: Påvirk ikke input parametre
4. *Null Safety*: Håndter null input gracefully
5. *Documentation*: Skriv JavaDoc kommentarer

=== Eksempel på God Design

```java
package dk.kea.utilities;

/**
 * Mathematical utility functions.
 * 
 * All methods are static and do not modify input parameters.
 * This class cannot be instantiated.
 */
public final class MathUtils {
    
    // Forhindre instantiering
    private MathUtils() {
        throw new UnsupportedOperationException("Utility class cannot be instantiated");
    }
    
    /**
     * Calculates the greatest common divisor of two integers.
     * 
     * @param a first integer (must be positive)
     * @param b second integer (must be positive)
     * @return the greatest common divisor
     * @throws IllegalArgumentException if either parameter is not positive
     */
    public static int gcd(int a, int b) {
        if (a <= 0 || b <= 0) {
            throw new IllegalArgumentException("Both parameters must be positive");
        }
        
        while (b != 0) {
            int temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }
    
    /**
     * Checks if a number is prime.
     * 
     * @param n the number to check (must be positive)
     * @return true if the number is prime, false otherwise
     * @throws IllegalArgumentException if n is not positive
     */
    public static boolean isPrime(int n) {
        if (n <= 0) {
            throw new IllegalArgumentException("Number must be positive");
        }
        
        if (n <= 1) return false;
        if (n <= 3) return true;
        if (n % 2 == 0 || n % 3 == 0) return false;
        
        for (int i = 5; i * i <= n; i += 6) {
            if (n % i == 0 || n % (i + 2) == 0) {
                return false;
            }
        }
        
        return true;
    }
}
```

== Fejlhåndtering i Hjælpeklasser

```java
public class SafeCalculator {
    
    public static class CalculationResult {
        private final boolean success;
        private final double value;
        private final String errorMessage;
        
        private CalculationResult(boolean success, double value, String errorMessage) {
            this.success = success;
            this.value = value;
            this.errorMessage = errorMessage;
        }
        
        public static CalculationResult success(double value) {
            return new CalculationResult(true, value, null);
        }
        
        public static CalculationResult failure(String errorMessage) {
            return new CalculationResult(false, 0.0, errorMessage);
        }
        
        public boolean isSuccess() { return success; }
        public double getValue() { return value; }
        public String getErrorMessage() { return errorMessage; }
    }
    
    public static CalculationResult safeDivide(double a, double b) {
        if (Math.abs(b) < 1e-10) {
            return CalculationResult.failure("Division by zero");
        }
        return CalculationResult.success(a / b);
    }
    
    public static CalculationResult safeSqrt(double a) {
        if (a < 0) {
            return CalculationResult.failure("Square root of negative number");
        }
        return CalculationResult.success(Math.sqrt(a));
    }
}
```

== Sammenfatning

I dette kapitel har vi lært:

- *Hjælpeklasser*: Klasser med static metoder der fungerer som værktøjskasser
- *Static vs Instance*: Forskellen mellem metoder der tilhører klassen vs objekter
- *Packages*: Organisering af kode i navnerum for at undgå konflikter  
- *Import statements*: Hvordan man bruger klasser fra andre pakker
- *Best practices*: Design principper for gode hjælpeklasser
- *Praktiske eksempler*: Calculator, DistanceConverter, StringUtils, ArrayUtils

Hjælpeklasser er fundamentale for at organisere kode på en ren og genbrugelig måde. De danner grundlag for at bygge større og mere komplekse systemer.

I næste kapitel lærer vi om brugerdefinerede typer, hvor vi begynder at lave vores egne datatyper med klasser og objekter.