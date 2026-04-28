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

---
<!-- .slide: class="cover-2" -->
# Læsning fra filer

--

Pakken java.io indeholder klasser til filhåndtering, fx

```java
import java.io.File;
import java.io.FileReader;
import java.io.FileNotFoundException;
...
```

--

```java
File file = new File("kontaker.txt");
```

`File` ved om filen 
- om den er læsbar `canRead()`, 
- om den er skrivbar `canWrite()`, 
- hvad dens path er `getPath()`
- men kan *ikke* bruges til at læse/skrive

--

Vi har brug for en `FileReader`

--

```java
try {
  File file = new File("kontaker.txt");
  FileReader reader = new FileReader(file);

  int nextChar;
  while ((nextChar = reader.read()) != -1) {
    System.out.print((char) nextChar);
  }
  reader.close();
  file.close();
} catch (FileNotFoundException e) {
    System.out.println("Filen blev ikke fundet.");
    e.printStackTrace();
} catch (IOException e) {
    System.out.println("Der opstod en fejl under læsning af filen.");
    e.printStackTrace();
}
```

--

`FileReader` bruges til både tekst filer og binære filer:
- `.read()` (læser et enkelt tegn ad gangen)
- `.read(char[] cbuf)` (læser et antal tegn ind i et char-array)
- `.readLine()` (læser en hel linje ad gangen)
- `skip(long n)` (springer n tegn over)
- `reset()` (nulstiller læsepositionen til starten af filen)

--

Til tekstfiler er det dog nemmere at bruge en `BufferedReader` sammen med `FileReader`,
da vi bl.a. får metoden `readLine()` til at læse en hel linje ad gangen:

```java
try {
  File file = new File("kontakter.txt");
  BufferedReader reader = new BufferedReader(new FileReader(file));

  String line;
  while ((line = reader.readLine()) != null) {
      System.out.println(line);
  }
  reader.close();
  file.close();
} catch (FileNotFoundException e) {
    System.out.println("Filen blev ikke fundet.");
    e.printStackTrace();
} catch (IOException e) {
    System.out.println("Der opstod en fejl under læsning af filen.");
    e.printStackTrace();
}
```

--


Men man kan også bruge en `Scanner` til at læse filer:

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

```java
Scanner scanner = new Scanner(System.in);
```

er da næsten det samme som

```java
File file = new File("C:/Users/Jakob/Documents/kontakter.txt");
Scanner scanner = new Scanner(file);
```

--

Bemærk at vi skal håndtere undtagelsen `FileNotFoundException`, når vi åbner en fil:

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

---
<!-- .slide: class="cover-4" -->

# Skrivning til filer

--

Vi har brug for:

```java
import java.io.FileWriter;
import java.io.IOException;
```



--

Vi skriver nogle linjer til en fil:

```java
try {
    FileWriter writer = new FileWriter("kontaker.txt");
    writer.write("Bob, 12345678\n");
    writer.write("Alice, 87654321\n");
    writer.close(); // Lukker filen
} catch (FileNotFoundException e) {
    System.out.println("Filen blev ikke fundet.");
    e.printStackTrace();
} catch (IOException e) {
    System.out.println("Der opstod en fejl under skrivning til filen.");
    e.printStackTrace();
}
```

--

```java
try {
    FileWriter writer = new FileWriter("kontaker.txt");
    // ...
    writer.close(); // Lukker filen
} catch (IOException e) {
    System.out.println("Der opstod en fejl under skrivning til filen.");
    e.printStackTrace();
}
```

--

Vi kan bruge en `PrintWriter` til at skrive tekstfiler på en nemmere måde:

```java
try {
    PrintWriter writer = new PrintWriter(new FileWriter("kontakter.txt"));

    writer.println("Bob, 12345678");
    writer.print("Alice, "); 
    writer.println("87654321");
    writer.close(); // Lukker filen
} catch (IOException e) {
    System.out.println("Der opstod en fejl under skrivning til filen.");
    e.printStackTrace();
}
```

---
<!-- .slide: class="cover-2" -->

# Filformater

--

### To slags filer

- **Tekstfiler** - filer der kan læses i en teksteditor (f.eks. .txt, .csv, .json, .xml)
- **Binære filer** - fx billeder, Word-dokumenter, lydfiler (f.eks. .jpg, .docx, .mp3)

... i dag fokuserer vi på tekstfiler.

--

### Hvad fortæller filnavnet os?

- `{name}.{extension}`
- `kontakter.csv`
- kontakter (jeg har gemt mine kontakter i denne fil)
- csv (jeg har gemt mine kontakter i CSV-format, dvs. adskilt af kommaer)

--

# Tekstformater

`tekst.csv` - en tekstfil hvor data adskilles af kommaer (Comma-Separated Values)
--
`tekst.tsv` - en tekstfil hvor data adskilles af tabulatorer (Tab-Separated Values)
--
`tekst.json` - en tekstfil hvor data er struktureret i JSON-format
--
`tekst.xml` - en tekstfil hvor data er struktureret i XML-format, eksempelvis:
--
`billede.jpg` - en binær fil der indeholder et billede i JPEG-format
--
`dokument.docx` - en binær fil der indeholder et Word-dokument
--
`musik.mp3` - en binær fil der indeholder en lydoptagelse i MP3-format
--
`video.mp4` - en binær fil der indeholder en videooptagelse i MP4-format
--
`arkiv.zip` - en binær fil der indeholder et komprimeret arkiv af filer i ZIP-format
--
`program.exe` - en binær fil der indeholder et eksekverbart program i Windows-format
--
`app.java` - en tekstfil der indeholder kildekoden til et Java-program

--

#### Struktureret vs. ustruktureret data

--

**Ustruktureret** tekstfil - `faktura.txt`:

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

**Struktureret** tekstfil - `kontakter.csv`:

```txt
Navn,Telefon,E-mail
Thorkild Hansen,39485732,thorkild@hotmail.com
Kirsten Jensen,29384756,kisser-kisser-kisser@gmail.com
Lars Larsen,98765432,lars@larsen-international.dk
```

--

**Struktureret** tekstfil - `kontakter.tsv`:

```txt
Navn  Telefon	E-mail
Thorkild Hansen	39485732	thorkild@hotmail.com
Kirsten Jensen	29384756  kisser-kisser-kisser@gmail.com
Lars Larsen	98765432  lars@larsen-internation.dk
```
