---
title: 03#1 - Input og Output
---
<!-- .slide: class="kea-red" -->

# Input og Output

--
## Håndtering af logik med `if`

--

# I/O  
![Input og Output visualisering](images/input-output-visualisering.png)

--

![Flybillet](images/io-flybillet.png)

--

![Process](images/io-process.png)

--

## System Class

- Interaktion med OS  
- System class indeholder bl.a.
- ```java
  InputStream in; (input.nextInt());
  ```
- ```java
  PrintStream out; (System.out.println)
  ```
- Filer  
- Input fra brugeren  

--

## System Class

Among the facilities provided by the **System class** are standard input, standard output, and error output streams; access to externally defined properties and environment variables; a means of loading files and libraries; and a utility method for quickly copying a portion of an array.

_Oracle documentation_

--

## Scanner Class

Du skal også **initialize** et instans af din Scanner, før du kan bruge den:

```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in)
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

--

## Comments

```java
public class Example {
    public static void main(String[] args) {
        // Her er en linje kode kommentar

        /*
        Her er der
        flere linjer
        med kode kommentarer!
        */
        int myNumber = 1;
        // String myString = "hej!";
    }
}
```

--

## If else struktur:

Betinget udførelse med to muligheder:

```java
if(color.equals("rød")){
    System.out.println("Rødt lys");
}
else{
    System.out.println("Grønt lys");
}
```

![Lys](images/to-lys.png)

--

## If – else if – chaining

Betinget udførelse med flere muligheder:

```java
if(color.equals("rød")){
    System.out.println("Rødt lys");
}
else if (color.equals("gul")){
    System.out.println("Gult lys");
} else {
    System.out.println("Grønt lys");
}
```

![Lys](images/tre-lys.png)
