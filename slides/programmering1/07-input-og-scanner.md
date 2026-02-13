---
title: 04 - Input og Scanner
---
<!-- .slide: class="cover-10" -->

# Input og Scanner

---
<!-- .slide: class="k-sunlit-energy" -->

## Program

- Casting
- Parsing
- Scanner
- System.out og System.in
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

---
<!-- .slide: class="cover-2" -->

Nyt ord: **Parsing**.  
at fortolke en tekststreng (eller data)

--

```java
String x = "4";
int y = Integer.parseInt(s); // går godt, x er nu 4
```

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

... `parseInt` kan kun håndtere én enkelt værdi ad gangen.

--

Løsning: Brug `Scanner` klassen!

```java
String s = "4 121 33 14";

Scanner scanner = new Scanner(s);

int x = scanner.nextInt(); // læser 4
int y = scanner.nextInt(); // læser 121
int z = scanner.nextInt(); // læser 33
int w = scanner.nextInt(); // læser 14
```

---
<!-- .slide: class="cover-9" -->

`Scanner`

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

--

<!-- .slide: class="o-sunlit-energy" -->

# Demo: Klassen `Scanner`

Notes:
- Vis hvordan next, nextLine, nextInt, nextDouble osv. fungerer.

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
<!-- .slide: class="cover-3" -->
# `Scanner`s `hasNext`-metoder

--

Vi kan ikke forvente at brugeren altid indtaster det rigtige.
Hvordan undgår vi fejl, når vi bruger `Scanner`?

--
<!-- .slide: class="o-sunlit-energy" -->

# Demo - fejlindtastning

--

En måde er at bruge `hasNext`-metoderne:

```java
Scanner scanner = new Scanner(System.in);
int x = 0;
if (scanner.hasNextInt()) {
    x = scanner.nextInt();
    System.out.println("Du indtastede: " + x);
} else {
    System.out.println("Fejl: Det indtastede er ikke et tal.");
}
```

--

Er der flere tal i inputtet?

```java
Scanner scanner = new Scanner(System.in);
while (scanner.hasNextInt()) {
    int x = scanner.nextInt();
    System.out.println("Du indtastede: " + x);
}
```

--

Er der flere ord i inputtet?

```java
Scanner scanner = new Scanner(System.in);
while (scanner.hasNext()) {
    String word = scanner.next();
    System.out.println("Du indtastede: " + word);
}
```

--

Er der flere linjer i inputtet?

```java
Scanner scanner = new Scanner(System.in);
while (scanner.hasNextLine()) {
    String line = scanner.nextLine();
    System.out.println("Du indtastede: " + line);
}
```

---
<!-- .slide: class="o-sunlit-energy" -->
# Demo - `hasNext`...

---

<!-- .slide: class="cover-8" -->

# Refaktorisering af kode

---

# De to faser i kodning

1. **Løs problemet** - få noget kode til at virke - **slamkode**
2. **Ryd op** - gør den mere læsbar og vedligeholdelsesvenlig - **refaktorisering**

--

**Slamkode**

Notes:
- Når man koder, handler det ofte om at komme hurtigt ud af startblokken og få noget kode til at virke.
- Det handler nemlig ofte om at få testet nogle ideer eller hypoteser af.
- Måske viser det sig, at ideen ikke virker som forventet, og så er det ærgeligt at have brugt for lang tid på at gøre koden pæn.
- I værste fald, har vi svært ved at skille os af med en dårlig løsning, fordi vi har brugt så lang tid på at gøre den pæn.
- I har sikkert hørt om "kill your darlings" - det gælder også for kode.

--

Refaktorisering - **Don't Repeat Yourself - DRY**

Notes:
- Men når koden virker og løser problemet - skal man minde sig selv om, at man kun er halvt færdig
- Nu er opgaven, at rydde op og gøre koden mere læsbar
- En af de mest basale måder at rydde op i sin kode er, at 
- Don't Repeat Yourself - DRY er en af de fundamentale principper i programmering
- Kode der gentager sig selv, er et oplagt sted at forbedre koden.
- Er der dele af koden, der gentages, og som kan flyttes til en metode?
- Koder der gentager sig selv, er sværere at vedligeholde.
- Der er flere steder som du skal vedligeholde, hvis du skal ændre noget og det kan føre til fejl, hvis du glemmer at ændre et sted.