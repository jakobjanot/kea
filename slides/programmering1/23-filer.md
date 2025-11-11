---
title: 23 - Filer
---

<!-- .slide: class="cover-1" -->

#### Filer i Java

--

Agenda

- Hvorfor bruge filer?
- Åbne og læse filer
- Skrive til filer
- Strukturere data i filer
- CSV-filer
- Serialisering af objekter

--

Hvad kan man bruge filer til?

--

# Gemme data

- RAM (hukommelse) er midlertidig lagring.
- Filer bruges til at gemme data permanent.

--

# Stier til filer

- Windows: `C:\Users\Jakob\Documents\kontakter.txt`
- Mac/Linux: `/Users/Jakob/Documents/kontakter.txt`


--

# Relative stier og absolutte stier
- Absolut sti: `C:\Users\Jakob\Documents\kontakter.txt`
- Relativ sti: `Documents/kontakter.txt` (i forhold til `C:\Users\Jakob\`)

--

# Læsning fra filer

--

Vi har brug for:

```java
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
```

--

Vi printer alle linjer i en fil - en linje ad gangen:

```java
public static void printLines() {
  try {
      File file = new File("C:/Users/Jakob/Documents/kontakter.txt");
      Scanner scanner = new Scanner(file);

      while (scanner.hasNextLine()) {
          System.out.println(scanner.nextLine());
      }

      scanner.close(); // Lukker scanneren
      file.close();    // Lukker filen
  } catch (FileNotFoundException e) {
      System.out.println("Filen blev ikke fundet.");
      e.printStackTrace();
  }
}
```

--

Så hvad er nyt i fht. tidligere?

```java
File file = new File("C:/Users/Jakob/Documents/kontakter.txt");
```

--

og at vi skal håndtere undtagelsen

```java
} catch (FileNotFoundException e) {
    System.out.println("Filen blev ikke fundet.");
    e.printStackTrace();
}
```

--

Scanneren fungerer på samme måde som vi kender den fra konsolinput:

```java
Scanner scanner = new Scanner(file);

while (scanner.hasNextLine()) {
    System.out.println(scanner.nextLine());
}
```

--

og hvorfor skal vi håndtere undtagelsen `FileNotFoundException`?

```java
try {
    File file = new File("kontakter.txt");
    // etc.
} catch (FileNotFoundException e) {
    System.out.println("Filen blev ikke fundet.");
    e.printStackTrace();
}
```

--

Fordi `FileNotFoundException` er en **checked exception**.

Checked exceptions skal håndteres med try-catch *eller* throws i metodesignaturen, dvs. vi skal gøre noget ved det.

--

Checked exception - enten... (try-catch)

```java
public static void readLines() {
    try {
        File file = new File("kontakter.txt");
        Scanner scanner = new Scanner(file);
        // etc.
    } catch (FileNotFoundException e) {
        System.out.println("Filen blev ikke fundet.");
    e.printStackTrace();
}
```

eller... (throws)

```java
public static void readLines() throws FileNotFoundException {
    File file = new File("kontakter.txt");
    // etc.
}
```

--

# Skrivning til filer

Vi har brug for:

```java
import java.io.FileWriter;
import java.io.IOException;
```

--

Vi skriver nogle linjer til en fil:

```java
public static void writeLines() {
    try {
        FileWriter writer = new FileWriter("telefonbog.txt");
        writer.write("Bob, 12345678\n");
        writer.write("Alice, 87654321\n");
        writer.close(); // Lukker filen
    } catch (IOException e) {
        System.out.println("Der opstod en fejl under skrivning til filen.");
        e.printStackTrace();
    }
}
```

--

# To slags filer

- Tekstfiler - filer du kan åbne og læse i en teksteditor (f.eks. .txt, .csv, .json, .xml)
- Binære filer - fx billeder, Word-dokumenter, lydfiler (f.eks. .jpg, .docx, .mp3)

... i dag fokuserer vi på tekstfiler.

--

Eksempel på ustruktureret tekstfil (`faktura.txt`):

```
Faktura #12345
Dato: 2024-06-15
Kunde: Jakob Hansen

Varenr      Produktnavn              Antal    Pris     Total

003721      Skjorte, blå, str. L     1        399.00    399.00
002343      Sokker, str. 41-44       3        99.00     297.00
100456      Bælte, sort, str. M      1        150.00    150.00

Subtotal:                                               846.00
Moms (25%):                                             211.50
Total:                                                 1057.50
```

--

Struktureret tekstfil - CSV (`kontakter.csv`):

```txt
Navn,Telefon,E-mail
Thorkild Hansen,39485732,thorkild@hotmail.com
Kirsten Jensen,29384756,kisser-kisser-kisser@gmail.com
Lars Larsen,98765432,lars@larsen-international.dk
```

--

Men `kontakter.tsv` er det samme, bare med tabulatorer (`\t`) som separator:

```txt
Navn  Telefon	E-mail
Thorkild Hansen	39485732	thorkild@hotmail.com
Kirsten Jensen	29384756  kisser-kisser-kisser@gmail.com
Lars Larsen	98765432  lars@larsen-internation.dk
```
