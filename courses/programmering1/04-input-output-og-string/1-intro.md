---
title: 03#1 - Input og Output
---
<!-- .slide: class="ek-academic-fire" -->

# Input og Output

---
<!-- .slide: class="k-sunlit-energy" -->

## Program

- 08:30 Input og Output 
- 09:00 Øvelser  
- 10:00 Pause  
- 10:15 Vi fortsætter med øvelser  
- 11:30 Opsamling  

---

# Konvertering af værdier (eng.: Casting)

--

## Implicit konvertering

```java
double y;
y = 4; // går godt
```

## Eksplicit konvertering

```java
int x;
x = 2.7; // fejl 
```

--

```java
int x;
x = (int) 2.7; // går godt, x er nu 2
```

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

--


---


Hvad med en `String`?

```java
int x;
x = "4"; // fejl
```

Notes:
- Fejl. Selvom "4" er et tal står tallet i en tekststreng, og Java kan ikke implicit konvertere en tekststreng til et tal.
--

```java
int x;
x = (int) "4"; // også fejl
```

Notes:
- Også fejl. Vi kan heller ikke eksplicit konvertere en tekststreng til et tal på denne måde.

--

# Konvertering af tekst til tal

--

```java
double y;
y = Double.parseDouble("2.7"); // går godt, y er nu 2.7
```

--

```java
int x;
x = Integer.parseInt("4");
```

går godt, `x` er nu **4**

--

Men også 
```java
int x;
x = Integer.parseInt("0004"); // går godt, x er nu 4
```
går også godt, `x` er nu **4**.

--

Derimod kan vi ikke
```java
int x;
x = Integer.parseInt("4.0"); // fejl
```

---

# Klassen `System` 

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


--

## Scanner Class

Du kan tilgå brugerens input med metoden **nextLine** og gemme input i et variabelnavn:

```java
myVariableName = input.nextLine();
```

--

## Scanner Types

```java
String myVariableName = input.nextLine();
input.nextInt();
input.nextDouble();
```

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
