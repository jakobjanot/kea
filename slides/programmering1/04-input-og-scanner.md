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

# Konvertering af værdier (eng.: Casting)

--

```java
int x = 4;
double y = x; // går godt, y er nu 4.0
```

--

... men ikke den modsatte vej

```java
double x = 2.7;
int x = x; // fejl
```

--

... vi kan dog _eksplicit_ konvertere

```java
int x;
x = (int) 2.7; // går godt, - men...
```

Spørgsmål: Hvad er x?

--

```java
int c;
c = (int) 'A'; // går godt, c er nu 65
```

--

```java
char c;
c = 65; // går godt, c er nu 'A'
c++;    // c er nu 'B'
c--;    // c er nu 'A' igen
```

---

Hvad med en `String`?

```java
String s = "4";
int x;
x = s; // fejl
```

Notes:
- Fejl. Selvom "4" er et tal står tallet i en tekststreng, og Java kan ikke implicit konvertere en tekststreng til et tal.

--

Parsing: at fortolke en tekststreng (eller data)

--

```java
String s = "4";
int x;
x = Integer.parseInt(s); // går godt, x er nu 4

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

## Klassen `Scanner`

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

- Vi har brugt `System.out.println` til at udskrive tekst til skærmen en del gange.

- Hvad er `System.out`?

Notes:

- DEMO 

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

Notes:

- DEMO:
    `HelloWorld.java`:
    ```java
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


---

# Karaktersæt - ASCII og Unicode

Nogle bud på hvad der bliver udskrevet:

```java
char c1 = 74;
char c2 = 65;
char c3 = 86;
System.out.println("Jeg elsker " + c1 + c2 + c3 + c2);
```

--

Derfor kan vi også printe fra `'A'` til `'Z'`:

```java
for (char c = 'A'; c <= 'Z'; c++) {
    System.out.print(c);
}
```

giver 

"**A**BCDEFGHIJKLMNOPQRSTUVXYABCDEFGHIJKLMNOPQRSTUVWXY**Z**"

--

... og fra `'A'` til `'Å'`, men:

```java
for (char c = 'A'; c <= 'Å'; c++) {
    System.out.print(c);
}
```

giver derimod

"**A**BCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~ ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄ**Å**"

# 🤔

--

## I gamle dage 



Notes:
I gamle var det ikke helt ualmindeligt at få en mail der 
