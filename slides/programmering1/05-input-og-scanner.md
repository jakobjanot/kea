---
title: 04 - Input og Scanner
---
<!-- .slide: class="cover-10" -->

# Input og Scanner

---
<!-- .slide: class="k-sunlit-energy" -->

## Program

- Metoder
- Øvelser
- Opsamling  

---
<!-- .slide: class="cover-11" -->
# Casting

--

```java
int x = 4;
double y = x; // går godt, y er nu 4.0
```

--

... men ikke den modsatte vej

```java
double x = 2.7;
int y = x; // fejl
```

--

... vi kan dog _eksplicit_ konvertere

```java
double x = 2.7;
int y = (int) x; // går godt, - men...
```

Spørgsmål: Hvad er x?

--

```java
char x = 'A'
int y = (int) x; // går godt, c er nu 65
```

--

Hvad med `String`s?

```java
String x = "4";
int y = s; // fejl
```

Notes:
- Fejl. Selvom "4" er et tal står tallet i en tekststreng, og Java kan ikke implicit konvertere en tekststreng til et tal.

--

Nyt ord: **Parsing**.  
at fortolke en tekststreng (eller data)

--

```java
String x = "4";
int y = Integer.parseInt(s); // går godt, x er nu 4

--


```java
int x     = Integer.parseInt("4");
double y  = Double.parseDouble("2.7");
boolean z = Boolean.parseBoolean("true");
```

--

```java
int x = Integer.parseInt("4 121 33 14"); // fejl
```
Notes:
- Når vi forsøger at parse en streng med flere tal adskilt af mellemrum, vil det fejle, fordi `Integer.parseInt` kun kan håndtere én enkelt værdi ad gangen.
- Vi kan dog bruge `Scanner` klassen til at læse flere værdier fra en streng.

```java
String s = "4 121 33 14";

Scanner scanner = new Scanner(s);

int x = scanner.nextInt(); // læser 4
int y = scanner.nextInt(); // læser 121
int z = scanner.nextInt(); // læser 33
int w = scanner.nextInt(); // læser 14
```

--
<!-- .slide: class="o-sunlit-energy" -->

# Demo: Klassen `Scanner`

Notes:
- Vis hvordan next, nextLine, nextInt, nextDouble osv. fungerer.

--

`Scanner.java`:
```java
import java.util.Scanner;
public class Scanner {
    public String nextLine() {
        // ...
    }

    public int nextInt() {
        // ...
    }

    public double nextDouble() {
        // ...
    }
}
```

---
<!-- .slide: class="cover-3" -->
# System.out og System.in

--

# System.out

--
- Vi har brugt `System.out.println` til at udskrive tekst til skærmen en del gange.

- Hvad er `System.out`?

```java
System.out.println(System.out); // java.io.PrintStream@15db9742
```

--

`HelloWorld.java`:
```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

`System.java`:
```java
public class System {
    public static final PrintStream out = new PrintStream(...);
    // ...
}
```

`PrintStream.java`:
```java
public class PrintStream {
    public void println(String s) {
        // ...
    }

    public void print(String s) {
        // ...
    }

    // ...
}
```

Notes:
- Her ser vi et kaldehierarki, øverst vores `HelloWorld` klasse, som I allerede kender.
- `System` er en klasse, der findes i Java's standardbibliotek, der giver adgang til fx at skrive til konsollen og læse fra input.
- `out` er en variabel af typen `PrintStream`, der bruges til at udskrive tekst til konsollen.
- `println` er en metode i `PrintStream`, der udskriver en linje tekst til konsollen.

--

# System.in

--

`System.java`:
```java
public class System {
    public static final InputStream in = new InputStream(...);
    // ...
}
```

`InputStream.java`:
```java
public class InputStream {
    public int read() {
        // ...
    }
}
```

En `int`? GYS!

--
<!-- .slide: class="o-sunlit-energy" -->
# Demo af `System.in`s `read` metode

Notes:
- ```java
    public class HelloWorld {
        public static void main(String[] args) {
            InputStream input = System.in;
            int data = input.read();
            System.out.println("Data read: " + data);
        }
    }
    ```
- InputStream's `read` returnerer `int`, dvs. tal?
- Det er ikke så nemt at arbejde med. Vi har brug for en klasse, der giver os nogle datatyper vi kan bruge direkte, som `String`, `int`, `double` osv.

--

`Scanner`-klassen **to the rescue!**

--
<!-- .slide: class="o-sunlit-energy" -->
# Demo af `Scanner` og `System.in`

---
<!-- .slide: class="cover-2" -->
# Sneak-peak: `if` og `else`
Notes:
- Næste gang skal vi se på betingelser i Java

--
![Blue pill or red pill](img/blue-pill-red-pill.png)

Notes:
- I filmen "The Matrix" præsenteres hovedpersonen, Neo, for et valg mellem to piller: den blå og den røde.
- Vælger han den blå pille, forbliver han i sin trygge, men falske virkelighed. Vælger han den røde pille, konfronteres han med sandheden om sin verden.

--

```java
String pill = "blue";

if (pill.equals("blue")) {
    System.out.println("Stay in the Matrix");
} else if (pill.equals("red")) {
    System.out.println("Confront the truth");
} else {
    System.out.println("Come on, Neo, choose a pill!");
}
```