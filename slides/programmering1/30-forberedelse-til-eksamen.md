---
title: Forberedelse til eksamen
---

<!-- .slide: class="cover-2" -->
# Forberedelse til eksamen

---

<!-- .slide: class="cover-3" -->

# Studieordningen

--

Studieordningen er altid det der gælder — uanset hvad I har hørt:

- [Studieordning](https://studieordninger.kea.dk/2025/36/225)
- [Programmering 1](https://katalog.kea.dk/course/3050191/2025-2026) - se under "Prøve"

--

### Eksamensbeskrivelse

- **15 ECTS-point**, dvs. 
- 25% af den samlede karakter for 1. studieår

--

### Eksamensform

- Mundtlig
- Individuel
- 20 minutter
- Ekstern censor
- Karakter på 7-trinsskalaen

--

**20 min.** = 15 min. eksamination + 5 min. votering og karakter

---
<!-- .slide: class="cover-4" -->
# Hjælpemidler

--

Alle hjælpemidler er tilladt, MEN ...

--

eksamen er en **test af jeres programmeringsfærdigheder**, og vi kan ikke evaluere jeres færdigheder, hvis I bruger hjælpemidler der gør arbejdet for jer, så derfor:

--

AI værktøjer skal være **slået fra** i IntelliJ

-- 

Kodegererring med **Generate** er ikke tilladt, fx Generate af 
- `toString`, 
- `get`ters/`set`ters, 
- konstruktør
- implementering af interface eller abstrakte metoder

--

Undtagelser:
- Du må **gerne** anvende shortcuts som fx `psvm` og `sout`
- Code completion må kun bruges til at finde metode- og variabelnavne

--

I får **ikke** tid til at kigge i jeres noter, opgaver eller projekter under eksamen

--
<!-- .slide: class="o-sunlit" -->
Spørgsmål til hjælpemidler?

---
<!-- .slide: class="cover-12" -->
# Eksamensforløb

--

#### Før eksamen starter

- Vær klar udenfor eksamenslokalet i god tid før eksamen starter
- Lav et tomt projekt i IntelliJ (uden klasser)

--

#### Når du bliver kaldt ind

- Kom ind i lokalet
- Hils på censor og eksaminator (med et nik)
- Tilslut din computer til projekter og sikre dig at det virker!

--

#### Selve eksaminationen

- Du trækker en tilfældig opgave
- Læs opgaven grundigt igennem
- Stil spørgsmål, hvis du ikke forstår opgaven
- Tal højt mens du koder, så censor og eksaminator forstår din tankegang
- Du kan få uddybende spørgsmål undervejs
- Prioritér at få løst så meget af opgaven som muligt
- Efter 15 minutter bliver du sendt ud 
- Eksaminator og censor voterer
- Du bliver kaldt ind igen til karaktergivning

---
<!-- .slide: class="cover-14" -->
# Tips til eksamen

--

Hvis opgaven beder dig om at lave en klasse, så lav også konstruktør og attributter, samt `get`ters, `set`ters og `toString` metoder **efter behov**.

--

Brug *ikke* tid på ting som ikke står i opgaven, fx user interface eller filhåndtering, medmindre det står i opgaven

--

Der står sjældent i opgaven hvilken datatype du skal bruge – forklar hvorfor du vælger f.eks. **int**, **String**, **ArrayList**, etc.

--

Der står heller ikke om metoder og attributter skal være **public** eller **private** – sørg for at vælge en passende access modifier og forklar hvorfor.

-- 

En væsentlig del af eksamen er at vælge og bruge datatyper for parametre og returværdier — så der står aldrig hvilken type du skal bruge, forklar dine valg!

--

Sørg så vidt muligt for at en metode altid returnerer noget, i stedet for at skrive det ud — skriv det i `main` metoden

```java
public int sum(int a, int b) {
    return a + b; // Do
}

public void sum(int a, int b) {
    System.out.println(a + b); // Don't
}
```

--

Du må selvfølgelig gerne have test-udskrifter undervejs i din kode — bare husk at sige at du gør det for at afprøve om den virker. Og hvis du er fiks, tester du koden, og udkommenterer så test-udskriften straks bagefter.

---

<!-- .slide: class="cover-12" -->
# Emner til eksamen

--

#### Variabler og datatyper

- Primitive datatyper, fx `int`, `double`, `boolean`, `char`
- Referenstyper, fx `String`, `Array`, `ArrayList`, `Random`, `Scanner`

--

#### Casting og parsing
- casting mellem `int` og `double`, fx
  ```java
  int numberAsInt = 5;
  double numberAsDouble = (double) numberAsInt;
  ```
- parsing fra `String` til `int`, fx
  ```java
  String numberAsString = "34";
  int numberAsInt = Integer.parseInt(numberAsString);
  ```

--

#### Enum
- Kan oprette og bruge en enum, fx
  ```java
  public enum Day {
      MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY
  }
  ```
--

#### Metoder
- Parametre
- Returværdier og -typer
- Scope (lokale variabler)
- `void` metoder
- Metode overloading
- Kald af metoder

--

#### Matematiske og logiske operatorer
  - `%`, `+`, `-`, `*`, `/`
  - `++`, `--`, `+=`, `-=`
  - `||`, `&&`, `!`, `==`, `!=`

--

#### Betingelser
    - `if`, `else if`, `else`
    - `switch`
--

#### Input og Output

- Input
  - Læsning fra `Scanner`
- Output
  - Sammenkædning, fx `System.out.println("Tallet er: " + tal);`
  - Formatere output med `System.out.printf()`, fx
    ```java
    System.out.printf("Tallet er: %.2f", tal); // to decimaler
    ```

--

#### `String`s metoder

- `length()`
- `charAt()`
- `toUpperCase()`
- `toLowerCase()`
- `split()`
- `contains()`
- `substring()`
- `equals()` og `==`

--

#### Generering af tilfældige tal

```java
Random random = new Random();
int tal = random.nextInt(10); // tilfældigt tal mellem 0 og 9
```

--

#### Løkker

- `while`, herunder brug af
  - `break`
  - `continue`
- `for`, fx
  ```java
  for (int i = 0; i < 10; i++) {
      System.out.println(i);
  }
  ```
- `enhanced for loop` (for-each loop), fx
  ```java
  for (Student student : navneArray) {
      System.out.println(student.getName());
  }
  ```

--

#### Arrays

- Længde
- Oprettelse og brug af arrays
  ```java
  int[] numbers = new int[5]; // array med plads til 5 heltal
  String[] names = {"Alice", "Bob", "Charlie"}; // array med 3 navne
- Læsning og tildeling af værdier i et array
    ```java
    numbers[0] = 10; // tildel 10 til første element
    int firstNumber = numbers[0]; // læs første element
    ```
- Loop igennem et array, fx med for loop eller enhanced for loop
- Find et bestemt element i et array
- Find max, min, total og gennemsnit af elementer vha loop
- Udskrivning af et array

--

#### ArrayList
- Forskellen på array og `ArrayList`
- Kunne oprette og bruge `ArrayList`, fx
  ```java
  ArrayList<String> names = new ArrayList<>();
  names.add("Alice");
  names.add("Bob");
  ```
- Længde, `names.size()`

--

#### ArrayList fortsat
s
- Læsning og tildeling af værdier i en `ArrayList`
  ```java
  names.get(0); // læs første element
  names.set(0, "Charlie"); // tildel "Charlie" til første element
  ```
- Loop igennem en `ArrayList`, fx med for loop eller enhanced for loop
- Tilføj, søg, fjern elementer fra en `ArrayList`
- Find max, min, total og gennemsnit af elementer vha loop
- Udskrivning af en `ArrayList`
--

#### Objekt orienteret programmering
  - Klasser og objekter
  - Felter (instansvariabler)
  - Konstruktører
  - `get`ter og `set`ter metoder
  - `toString()` metode
  - access modifiers: `private`, `public`, `protected`
  - Indkapsling, med private felter og public metoder

--

  - Metoder i klasser
  - Overloading af metoder
  - Objekt referencer
  - `this`

--
#### Arv
  - Lav og brug en nedarvet klasse
  - `extends`, `super`, `this`
  - Overriding af metoder
  - `protected` vs `private`
  - `instanceof`
  
--

#### Arv

  - Casting fx
  ```java
  Animal animal = new Dog(); // upcasting
  Dog dog = (Dog) animal; // downcasting
  ```
  - Abstrakte klasser

--

#### Polymorfi
  - Forstå og anvende polymorfi med arv og interfaces, fx
  ```java
  class Animal {
      public void makeSound() {
          System.out.println("Some generic animal sound");
      }
  }   
  class Dog extends Animal {
      public void wagTail() {
          System.out.println("The dog is wagging its tail");
      }
  }
  

  Animal animal = new Dog();
  animal.makeSound(); // kalder Dog's makeSound metode
  ```
--

#### Filer
  - Skrive til en tekstfil vha PrintStream
  - Læse fra en tekstfil vha. Scanner

--

#### Exceptions
- Håndtere exceptions med
  - `throws` i metode signatur
  - `try` og `catch`
- kaste ny exception med throw

--

#### Interface
- Kan skrive og implementere et interface

--

#### Sortering
  - Implementere Comparable
  - Oprette en Comparator klasse
  - Forstå elementers naturlige orden
  - Sortere et array eller en ArrayList


Emner der ikke kommer til denne eksamen
1. semesters eksamen er kun i Programmering, så de emner der handler mere om Systemudvikling eller It-
og forretningsudvikling er ikke en del af eksamen. I bliver heller ikke eksamineret i værktøjer som Git,
Github, etc. men det forventes at I kan bruge udviklingsværktøjet (IntelliJ) til 1. semester eksamen.
Følgende emner, kommer derfor ikke til 1. semestereksamen:
- Git + GitHub
- Designprincipper som f.eks. Single Responsibility, Controller, Userinterface
- Scrum
- Unittest








