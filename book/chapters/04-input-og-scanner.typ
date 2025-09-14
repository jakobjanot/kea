#import "../style.typ": *

= Input og Scanner

Indtil nu har vores programmer kun kunne udskrive information. Men for at lave virkelig interaktive programmer har vi brug for at kunne læse input fra brugeren. I dette kapitel lærer vi om Scanner-klassen og hvordan vi konverterer mellem forskellige datatyper.

== Casting - konvertering mellem datatyper

Før vi dykker ned i input, er det vigtigt at forstå hvordan Java håndterer konvertering mellem forskellige datatyper.

=== Implicit casting (automatisk)

Nogle konverteringer sker automatisk uden tab af information:

```java
int x = 4;
double y = x;  // y er nu 4.0 - går godt
System.out.println(y);  // 4.0
```

Dette virker fordi en `double` kan indeholde alle værdier som en `int` kan, plus decimaler.

=== Eksplicit casting (manuel)

Andre konverteringer kan resultere i tab af information og skal gøres eksplicit:

```java
double x = 2.7;
int y = (int) x;  // y er nu 2 - decimaldelen forsvinder
System.out.println(y);  // 2
```

#exercise(title: "Casting quiz")[
Gæt hvad følgende kode udskriver, eller om den giver en fejl:

1. ```java
   int a = 5;
   double b = a;
   System.out.println(b);
   ```

2. ```java
   double a = 5.5;
   int b = (int) a;
   System.out.println(b);
   ```

3. ```java
   char a = 'A';
   int b = a;
   System.out.println(b);  // Hint: ASCII værdi
   ```

4. ```java
   int a = 66;
   char b = (char) a;
   System.out.println(b);  // Hvad er ASCII 66?
   ```
]

=== Parsing - konvertering fra String

Strings kan ikke castes direkte til tal. I stedet bruger vi parsing:

```java
String x = "4";
int y = Integer.parseInt(x);     // y er nu 4
double z = Double.parseDouble("2.7");  // z er nu 2.7
boolean w = Boolean.parseBoolean("true");  // w er nu true
```

Hvis strengen ikke kan konverteres, får vi en fejl:
```java
int x = Integer.parseInt("hello");  // Fejl!
```

== System.out og System.in

Vi har brugt `System.out.println` mange gange, men hvad er `System.out` egentlig?

```java
System.out.println(System.out);  // java.io.PrintStream@15db9742
```

`System` er en klasse i Java's standardbibliotek:
- `System.out` er et `PrintStream` objekt til at skrive til konsollen
- `System.in` er et `InputStream` objekt til at læse fra tastaturet

Men `System.in` er besværligt at bruge direkte, da det kun læser bytes. Derfor bruger vi Scanner-klassen.

== Scanner-klassen

Scanner-klassen gør det nemt at læse forskellige datatyper fra input:

```java
import java.util.Scanner;

public class ScannerExample {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Indtast dit navn: ");
        String name = scanner.nextLine();
        
        System.out.print("Indtast din alder: ");
        int age = scanner.nextInt();
        
        System.out.println("Hej " + name + ", du er " + age + " år gammel!");
    }
}
```

#note[
Husk at importere Scanner-klassen med `import java.util.Scanner;` øverst i din fil.
]

=== Scanner metoder

Scanner har mange nyttige metoder:

```java
Scanner scanner = new Scanner(System.in);

String line = scanner.nextLine();    // Læser hele linje
String word = scanner.next();        // Læser næste ord
int number = scanner.nextInt();      // Læser heltal
double decimal = scanner.nextDouble(); // Læser decimaltal
boolean bool = scanner.nextBoolean(); // Læser true/false
```

=== Scanner med strings

Scanner kan også læse fra strings i stedet for tastaturet:

```java
String data = "4 121 33 14";
Scanner scanner = new Scanner(data);

int a = scanner.nextInt();  // 4
int b = scanner.nextInt();  // 121
int c = scanner.nextInt();  // 33
int d = scanner.nextInt();  // 14
```

Dette er nyttigt til at parse data fra filer eller andre kilder.

#exercise(title: "Fodboldresultater")[
Lav et program der læser fodboldresultater:

1. Opret en Scanner der læser fra strengen "3 1"
2. Læs hjemmeholdets og udeholdets mål
3. Udskriv resultatet pænt:
   ```
   Hjemmehold: 3 mål
   Udehold: 1 mål
   ```
4. Udvid programmet til at læse fra `System.in` i stedet
5. Bed brugeren om at indtaste resultatet og vis det pænt formateret
]

== Betingelser med input

Input bliver særligt kraftfuldt når vi kombinerer det med betingelser (som vi lærer mere om i næste kapitel):

```java
Scanner scanner = new Scanner(System.in);

System.out.print("Indtast resultatet af kampen (hjemme udehold): ");
int home = scanner.nextInt();
int away = scanner.nextInt();

System.out.println("Hjemmehold: " + home + " mål");
System.out.println("Udehold: " + away + " mål");

if (home > away) {
    System.out.println("Hjemmeholdet vandt!");
} else if (away > home) {
    System.out.println("Udeholdet vandt!");
} else {
    System.out.println("Det blev uafgjort!");
}
```

#exercise(title: "Hvem vandt?")[
Udvid dit fodboldresultat-program:

1. Læs hjemme- og udeholdets mål fra brugeren
2. Bestem og udskriv hvem der vandt kampen
3. Test med forskellige resultater

Forklar: Hvorfor behøver vi ikke tjekke `away == home` under `else`?
]

== Interaktive programmer

Med Scanner kan vi lave programmer der reagerer på brugerens input:

```java
import java.util.Scanner;

public class PersonInfo {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Hvad hedder du? ");
        String name = scanner.nextLine();
        
        System.out.print("Hvor gammel er du? ");
        int age = scanner.nextInt();
        
        System.out.print("Hvor høj er du (i meter)? ");
        double height = scanner.nextDouble();
        
        System.out.println("\nDine oplysninger:");
        System.out.println("Navn: " + name);
        System.out.println("Alder: " + age + " år");
        System.out.printf("Højde: %.2f meter%n", height);
        
        if (age >= 18) {
            System.out.println("Du er myndig!");
        } else {
            System.out.println("Du er under 18 år.");
        }
    }
}
```

=== Fejlhåndtering

Pas på at brugeren indtaster den rigtige type data:

```java
Scanner scanner = new Scanner(System.in);
System.out.print("Indtast et tal: ");

// Dette vil fejle hvis brugeren skriver "hello"
int number = scanner.nextInt();
```

I begyndelsen kan du bede brugeren om at indtaste det rigtige format. Senere lærer du om try-catch til at håndtere fejl.

#exercise(title: "Prinsessen skal giftes")[
Prinsessen skal giftes og har specifikke krav til sin prins. Implementer følgende metode:

```java
public static boolean canMarry(int age, boolean isHandsome, 
                              boolean isBrave, boolean isRich) {
    if (age < 18) {
        return false;
    }
    if (isHandsome) {
        if (isBrave || isRich) {
            return true;
        }
    }
    return false;
}
```

Test med disse kandidater:
- Prins Charming (20 år, flot, ikke modig, ikke rig)
- Prins Ib (22 år, ikke flot, modig, ikke rig)  
- Prins Bieber (31 år, flot, ikke modig, rig)
- Prins Blop (17 år, flot, modig, rig)

Hvem kan prinsessen gifte sig med?
]

== Calculator eksempel

Lad os lave en simpel lommeregner:

```java
import java.util.Scanner;

public class Calculator {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Indtast første tal: ");
        double a = scanner.nextDouble();
        
        System.out.print("Indtast operation (+, -, *, /): ");
        String operator = scanner.next();
        
        System.out.print("Indtast andet tal: ");
        double b = scanner.nextDouble();
        
        double result = 0;
        
        if (operator.equals("+")) {
            result = a + b;
        } else if (operator.equals("-")) {
            result = a - b;
        } else if (operator.equals("*")) {
            result = a * b;
        } else if (operator.equals("/")) {
            if (b != 0) {
                result = a / b;
            } else {
                System.out.println("Fejl: Division med nul!");
                return;
            }
        } else {
            System.out.println("Ukendt operation: " + operator);
            return;
        }
        
        System.out.printf("%.2f %s %.2f = %.2f%n", a, operator, b, result);
    }
}
```

== Integer division og modulo

Når du arbejder med heltal, skal du være opmærksom på integer division:

```java
int a = 7;
int b = 3;

int result1 = a / b;          // 2 (ikke 2.33...)
double result2 = (double) a / b;  // 2.33...

int remainder = a % b;        // 1 (rest ved division)
```

Modulo-operatoren (`%`) giver resten ved division og er nyttig til mange ting:
- Tjekke om et tal er lige: `number % 2 == 0`
- Få sidste ciffer: `number % 10`
- Cyklisk gentagelse: `index % arrayLength`

#exercise(title: "Mængderabat")[
Lav et program der beregner mængderabat:

1. Læs antal varer og pris per vare
2. Beregn totalprisen
3. Giv rabat baseret på antal:
   - 10+ varer: 10% rabat
   - 50+ varer: 20% rabat
   - 100+ varer: 25% rabat
4. Vis både original pris, rabat og slutpris
]

== nextLine() vs next()

Vær opmærksom på forskellen mellem `nextLine()` og `next()`:

```java
Scanner scanner = new Scanner(System.in);

// nextLine() læser hele linjen inkl. mellemrum
System.out.print("Indtast dit fulde navn: ");
String fullName = scanner.nextLine();  // "Anna Marie Hansen"

// next() læser kun næste ord
System.out.print("Indtast dit fornavn: ");
String firstName = scanner.next();     // "Anna" (stopper ved mellemrum)
```

=== Blanding af nextInt() og nextLine()

Pas på når du blander `nextInt()` og `nextLine()`:

```java
Scanner scanner = new Scanner(System.in);

System.out.print("Indtast din alder: ");
int age = scanner.nextInt();

// PROBLEM: nextInt() efterlader newline i bufferen
System.out.print("Indtast dit navn: ");
String name = scanner.nextLine();  // Læser tom streng!

// LØSNING: Tilføj ekstra nextLine()
scanner.nextLine();  // "Spis" den resterende newline
System.out.print("Indtast dit navn: ");
String name = scanner.nextLine();
```

== Sammenfatning

I dette kapitel har vi lært:

- *Casting*: Konvertering mellem datatyper (implicit og eksplicit)
- *Parsing*: Konvertering fra String til andre typer
- *Scanner-klassen*: Læsning af input fra brugeren eller strings
- *System.in og System.out*: Javas input/output streams
- *Interaktive programmer*: Kombination af input, beregninger og output
- *Fejlhåndtering*: Hvad der kan gå galt med input

Med disse værktøjer kan du nu lave programmer der interagerer med brugeren og reagerer på deres input. I næste kapitel lærer vi mere om betingelser (`if`/`else`), som gør det muligt at lave endnu mere intelligente programmer der træffer beslutninger baseret på input.

#note[
Husk altid at lukke din Scanner når du er færdig: `scanner.close()`. I simple programmer er det ikke kritisk, men det er god praksis.
]