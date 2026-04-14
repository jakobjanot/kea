---
title: 22 - Fejl og undtagelser
---

<!-- .slide: class="cover-7" -->

#### Fejl og undtagelser

--

# Fejl i programmer

- **Fejl under kompilering**
- **Fejl under kørsel**
- **Logiske fejl**

--

### Fejl under kompilering

- Eng.: **compile-time errors**
- Syntaksfejl - når koden ikke overholder sprogets regler
- Eksempel:
  ```java
  public calculateBmi(double weight, double height) {
    return weight / (height * height);
  }
  ```
  
--

### Fejl under kørsel - undtagelser

- Eng.: **runtime errors**
- Opstår mens programmet kører
- Eksempel (division med nul):
  ```java
  public double calculateBmi(int weight, int height) {
    return weight / (height * height);
  }

  public static void main(String[] args) {
    System.out.println("Carsten's BMI: " + 
      calculateBmi(80, 0)); // ArithmeticException
  }
  ```
- Eksempel (array out of bounds):
  ```java
  int[] numbers = {1, 2, 3};
  System.out.println(numbers[3]); // ArrayIndexOutOfBoundsException
  ```

--

### Logiske fejl

- Når programmet kører uden fejl, men giver forkerte resultater
- Svære at opdage, da der ikke er nogen fejlmeddelelser
- Eksempel:
  ```java
  public double calculateBmi(int weight, int height) {
    return weight / height; // Forkert formel
  }
  ```

--

| Fejltype     | Opstår under | Hvordan opdages den?     | Håndtering            |
| ------------ | ------------ | ------------------------ | --------------------- |
| Compile-time | kompilering  | IDE fejlmeddelelser      | Ret syntaksfejl       |
| Runtime      | kørsel       | Undtagelser (Exceptions) | Brug try-catch blokke |
| Logiske      | kørsel       | Forkerte resultater      | Debugging og testning |

---

<!-- .slide: class="cover-8" -->
## Undtagelser (Exceptions)

--

- Når et program støder på en fejl under kørsel (runtime), 
kan den ikke fortsætte normalt, eksempel:

```java
public double calculateBmi(int weight, int height) {
  return weight / (height * height);
}

public String classifyBmi(double bmi) {
  if (bmi < 18.5) return "Underweight";
  else if (bmi < 24.9) return "Normal weight";
  else if (bmi < 29.9) return "Overweight";
  else return "Obesity";
}

System.out.println("Yamal's BMI: " + classifyBmi(calculateBmi(70, 170)));
System.out.println("Carsten's BMI: " + classifyBmi(calculateBmi(80, 0))); // Fejl, program stopper her
System.out.println("Anna's BMI: " + classifyBmi(calculateBmi(60, 160)));
```

--

Du tænker måske: Så ret dog bare fejlen

Ok, men hvad så med:
```java
   Scanner scanner = new Scanner(System.in);
   System.out.print("Enter height in cm: ");
   int height = scanner.nextInt(); // Bruger indtaster 0
   System.out.print("Enter weight in kg: ");
   int weight = scanner.nextInt();
   System.out.println("BMI: " + calculateBmi(weight, height)); // Fejler her
```

Her har vi ingen kontrol over brugerens input

--

- Undtagelser - eksempler
  - division med nul (`ArithmeticException`)
  - ugyldig array-indeks (`ArrayIndexOutOfBoundsException`)
  - forsøg på at åbne en fil, der ikke findes (`FileNotFoundException`)
  - scanner input fejl (`InputMismatchException`)
  - netværksforbindelsesfejl (`SocketException`)

---
<!-- .slide: class="cover-1" -->

# try/catch/finally blokke

--

Når en undtagelse opstår, "kastes" den op gennem kaldestakken, indtil den "fanges"

--

Kaldsestak???

```java
public void main() {
  System.out.println("Carsten er " + classifyBmi(calculateBmi(80, 0)));
}

public String classifyBmi(double bmi) {
  if (bmi < 18.5) return "Underweight";
  else if (bmi < 24.9) return "Normal weight";
  else if (bmi < 29.9) return "Overweight";
  else return "Obesity";
}

public double calculateBmi(int weight, int height) {
  return weight / (height * height);
}
```

`main() -> classifyBmi() -> calculateBmi()`

--

## Exception propagation

- En undtagelse propageres (kastes) op gennem kaldestakken, indtil den fanges

--

## try/catch blokke

```java
try {
  // Kode der kan forårsage en undtagelse, fx division med nul
} catch (ExceptionType e) {
  // Håndtering af undtagelsen
}
```

--

Eksempel:

```java
try {
  System.out.println("Carsten's BMI: " + calculateBmi(80, 0));
} catch (ArithmeticException e) {
  System.out.println("Højde skal være større end 0 m.");
}
```

--

Hvor skal try/catch blokken placeres?

--

Her?

```java
public double calculateBmi(int weight, int height) {
    try {
        return weight / (height * height);
    } catch (ArithmeticException e) {
        return -1.0;
    }
}
```

Hvorfor er dette ikke optimalt?

--

Fordi `calculateBmi()`
1. ikke ved, hvordan fejlen skal håndteres.
2. skjuler fejlen for den, der kalder metoden.


--

- *Regel*: Skjul ikke undtagelser for den, der kalder metoden
- *Regel*: Håndter undtagelser så tæt på brugeren af metoden som muligt

--

```java
public double calculateBmi(int weight, int height) {
    return weight / (height * height);
}

public String classifyBmi(double bmi) {
    // ...
}

public static void main(String[] args) {
    // ...
    System.out.print("Indtast højde i m: ");
    double height = scanner.nextDouble();
    System.out.println("Carsten er " + classifyBmi(calculateBmi(weight, height)));
}
```

MEN ...hvad nu hvis brugeren af calculateBmi() glemmer at håndtere undtagelsen? Programmet vil så crashe...

--
<!-- .slide: class="ek-patrick-star" -->
Prøv: `try/catch` med `calculateBmi`

- lav `calculateBmi`
- kald den i `main`
- fremprovoker en `ArithmeticException` ved at kalde med højde 0
- håndter undtagelsen i main med `try/catch`
- prøv evt at lave en classifyBmi metode også, og kald `classifyBmi(calculateBmi(...))` i main

---

<!-- .slide: class="cover-14" -->
### checked vs unchecked exceptions

--

- **Checked exceptions**: skal håndteres eller deklarere
- **Unchecked exceptions**: skal **ikke** håndteres eller deklareres

--

#### Unchecked exceptions
- Valgfrit at håndtere
- Er ofte programmeringsfejl, som bør rettes i koden

--

#### Unchecked - håndtering med try/catch

```java
Scanner scanner = new Scanner(System.in);
System.out.print("Indtast højde i m: ");
double height = scanner.nextDouble();
try {
    System.out.println("Carsten er " + classifyBmi(calculateBmi(weight, height)));
} catch (ArithmeticException e) {
    System.out.println("Højde skal være større end 0 m.");
}
```

Hmmm...

--

#### Unchecked - håndtering med if-else

```java
  Scanner scanner = new Scanner(System.in);
  System.out.print("Indtast højde i m: ");
  int height = scanner.nextInt();
  if (height <= 0) {
    System.out.println("Højde skal være større end 0 m.");
  } else {
    System.out.println("Carsten er " + classifyBmi(calculateBmi(weight, height)));
  }
```

Nice!

--

#### Checked - deklaration
- Skal håndteres med `try/catch` eller deklareres med `throws`

--

#### Checked - deklaration
```java
public String readFile(String filename) throws IOException {
    BufferedReader reader = new BufferedReader(new FileReader(filename));
    String line = reader.readLine();
    reader.close();
    return line;
}
```

Bemærk `throws IOException`

--

#### Checked - håndtering

```java
try {
    String content = readFile("data.txt");
    System.out.println("File content: " + content);
} catch (IOException e) {
    System.out.println("Fejl ved læsning af fil: " + e.getMessage());
}
```

Bemærk `try/catch` for at håndtere `IOException`

--

<!-- .slide: class="cover-12" -->
#### Standard undtagelsesklasser

--

Java's exception klasse-hierarki:

```txt
- Exception
  (...) 
  - IOException 
    - FileNotFoundException
    (...)                          
  - Runtime­Exception                      <-- unchecked
    (...)
    - Arithmetic­Exception
    - Class­Cast­Exception
    - Illegal­Argument­Exception
      - Number­Format­Exception
      (...)
    - Index­Out­Of­Bounds­Exception
      - Array­Index­Out­Of­Bounds­Exception
      - String­Index­Out­Of­Bounds­Exception
    - Null­Pointer­Exception
    (...)
- Error
  (...)
  - Assertion­Error
  - Linkage­Error
    (...)    
  (...)
```

--

Nogen der har mødt en `ArrayIndexOutOfBoundsException` før?

--

`NullPointerException`?

--

`NumberFormatException`?

--

`StackOverflowError`?

--

`AssertionError`?

--

*Regel*: Kan du bruge en af Javas standard undtagelsesklasser? Så gør det!

--

```txt
- Exception
  (...)
  - IOException
    - FileNotFoundException <-- arver fra IOException
    (...)                          
  - Runtime­Exception
```

--

```java
public String readFile(String filename) {
  try {
    BufferedReader reader = new BufferedReader(new FileReader(filename));
    String line = reader.readLine();
    reader.close();
    return line;
  } catch (IOException e) {
    System.out.println("Fejl ved læsning af fil: " + e.getMessage());
    return null;
  } catch (FileNotFoundException e) {
    System.out.println("Filen " + filename + " blev ikke fundet.");
    return null;
  }
}
```

fejler, fordi `FileNotFoundException` er en subklasse af `IOException`, og vil derfor aldrig blive nået, da `IOException` catch-blokken allerede fanger den.

--

```java
public String readFile(String filename) {
  try {
    BufferedReader reader = new BufferedReader(new FileReader(filename));
    String line = reader.readLine();
    reader.close();
    return line;
  } catch (FileNotFoundException e) {
    System.out.println("Filen " + filename + " blev ikke fundet.");
    return null;
  } catch (IOException e) {
    System.out.println("Fejl ved læsning af fil: " + e.getMessage());
    return null;
  }
}
```
... bedre

--

... eller måske bare

```java
public String readFile(String filename) {
  try {
    BufferedReader reader = new BufferedReader(new FileReader(filename));
    String line = reader.readLine();
    reader.close();
    return line;
  } catch (IOException e) {
    System.out.println("Fejl ved læsning af fil: " + e.getMessage());
    return null;
  }
}
```

---

<!-- .slide: class="cover-11" -->

## Egen undtagelsesklasser

--

- Nogle gange er det nødvendigt at lave sine egne undtagelsesklasser
- Skal **arve** fra (eller en subklasse af)
  - `Exception` --> checked exceptions
  - `RuntimeException` --> unchecked exceptions

--

Eksempel:
```java
public class InvalidHeightException extends IllegalArgumentException {
    public InvalidHeightException(String message) {
        super(message);
    }
}
```

```java
public double calculateBmi(int weight, int height) throws InvalidHeightException {
    if (height <= 0) {
        throw new InvalidHeightException("Højde skal være større end 0 m.");
    }
    return weight / (height * height);
}
```

--

eller bare

```java
public class InvalidHeightException extends IllegalArgumentException {
    public InvalidHeightException() {
        super("Højde skal være større end 0 m.");
    }
}
```

```java
public double calculateBmi(int weight, int height) throws InvalidHeightException {
    if (height <= 0) {
        throw new InvalidHeightException();
    }
    return weight / (height * height);
}
```

--

## Undtagelse - do's and don'ts

--

*Regel*: Brug undtagelser til at håndtere **usædvanlige** situationer, *ikke* almindelig kontrolflow (brug if-else i stedet)


--

Eksempel: null-pointer exception

```java
public boolean hasBirthdayToday(Person person) {
    return person.getBirthday() == LocalDate.now();
}
```

```java
public boolean hasBirthdayToday(Person person) {
    if (person == null) {
        return false;
    }
    return person.getBirthday() == LocalDate.now();
}
```
 
--

Eksempel på forkert brug af undtagelser:

```java
public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    double height = 0;
    try {
        height = scanner.nextDouble();
    } catch (InputMismatchException e) {
        System.out.println("Ugyldigt input for højde.");
    }
    System.out.println("BMI: " + calculateBmi(80, height));
}
```

--

... vi kan helt undgå undtagelsen ved at tjekke input først:

```java
public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    if (scanner.hasNextDouble()) {
        double height = scanner.nextDouble();
        System.out.println("BMI: " + calculateBmi(80, height));
    } else {
        System.out.println("Ugyldigt input for højde.");
    }
}
```

---

<!-- .slide: class="cover-1" -->
#### Logiske fejl og debugging

--

### Printdebugging

```java
public double calculateBmi(int weight, int height) {
    System.out.println("Debug: weight = " + weight + ", height = " + height);
    return weight / (height * height);
}
```

--

### Demo: Brug af IntelliJ debugger og breakpoints