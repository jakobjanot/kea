---
title: 17 - ArrayList og Test
---
<!-- .slide: class="cover-14" -->
#### ArrayLists og Test

---
<!-- .slide: class="o-sunlit-energy" -->

## Program:

- ArrayList
- assert
- Unit Testing
- Øvelser

---

<!-- .slide: class="cover-4" -->
# ArrayList

--

Hvilken udforringer har vi mødt når vi bruger arrays?

--

Problem: Kender ikke størrelsen på forhånd

```java
String[] makes = new String[3];
makes[0] = "Volvo";
makes[1] = "BMW";
makes[2] = "Ford";
makes[3] = "Mazda"; // ArrayIndexOutOfBoundsException
```

--

En løsning: Vi kan lave en ny array og kopiere værdierne.

```java
makes = Arrays.copyOf(makes, 4);
makes[3] = "Mazda"; // OK
```

--

Problem: Vi skal holde styr på hvor mange vi har

```java
BankAccount[] accounts = new BankAccount[1000];
int count = 0;

accounts[count] = new BankAccount("12345");
count++;
accounts[count] = new BankAccount("67890");
count++;
// ...
```

--

Alle de ting løser vi med `java.util.ArrayList`

--

Husk!

```java
import java.util.ArrayList;
````

--

```java
ArrayList<String> makes = new ArrayList<>();
makes.add("Volvo");
makes.add("BMW");
makes.add("Ford");
makes.add("Mazda"); // OK
```

--

```java
ArrayList<BankAccount> accounts = new ArrayList<>();
accounts.add(new BankAccount("12345"));
accounts.add(new BankAccount("67890"));
// ...
```

--

```java
ArrayList<String> makes = new ArrayList<>();
```

i stedet for
```java
String[] makes = new String[3];
```

--

Hvorfor nu en ny slags paranteser `<>` i

```java
ArrayList<String> makes = new ArrayList<>();
```

--

`ArrayList` er en klasse, der kan bruges på alle mulige typer (den er generisk), fx

```java
ArrayList<String> makes = new ArrayList<>();
ArrayList<BankAccount> accounts = new ArrayList<>();
ArrayList<Integer> numbers = new ArrayList<>();

ArrayList<int> nums = new ArrayList<>(); // FEJL
```

--

Vi kunne lave en selv, `T` er denne type parameter

```java
class Pair<T> {
    private T first;
    private T second;

    public Pair(T first, T second) {
        this.first = first;
        this.second = second;
    }

    public T getFirst() { return first; }
    public T getSecond() { return second; }
}
```

--

```java
Pair<String> p = new Pair<>("Hund", "Kat");
String first = p.getFirst(); // "Hund"
```

--

```java
BankAccount acc1 = new BankAccount("123");
BankAccount acc2 = new BankAccount("321");
Pair<BankAccount> p = new Pair<>(acc1, acc2);

BankAccount first = p.getFirst();
```

---

Hvad kan vi gøre med en ArrayList?

--

Tilføje elementer

```java
makes.add("Volvo");
makes.add("BMW");
makes.add("Ford");
```
--

Tilgå elementer
```java
makes.get(0); // "Volvo"
```

--

Fjerne elementer
```java
makes.remove(1); // Fjerner "BMW"
```

--

Størrelsen på listen
```java
makes.size(); // 2
```
--

Iterere over elementer

```java
for (String make : makes) {
    System.out.println(make);
}
```

--

Tjekke om listen indeholder et element

```java
makes.contains("Volvo"); // true
```
--

Tømme listen
```java
makes.clear();
```
--

Tjekke om listen er tom
```java
makes.isEmpty(); // true
```

--

Hvad tror i data gemmes i en ArrayList?

--

...en array - sådan lidt a la

```java
class ArrayList<E> {
    private Object[] elements;
    private int size;

    public ArrayList() {
        elements = new Object[10];
        size = 0;
    }

    public void add(E element) {
        if (size == elements.length) {
            // resize array
            elements = Arrays.copyOf(elements, elements.length * 2);
        }
        elements[size] = element;
        size++;
    }

    // ...
}
```

---

<!-- .slide: class="cover-4" -->
# Assert

--

Vi har tidligere "testet" vores kode ved at køre den vha. main metoden, fx

```java
public static void main(String[] args) {
    BankAccount account = new BankAccount("12345");
    account.deposit(100);
    System.out.println(account.getBalance()); // 100
    account.withdraw(50);
    System.out.println(account.getBalance()); // 50
}
```

--

... så vi skal visuelt tjekke at output er som forventet.

--

Det kunne være smart hvis vi kunne automatisere det.

```java
public static void main(String[] args) {
    BankAccount account = new BankAccount("12345");
    account.deposit(100);
    if (account.getBalance() == 100) {
        System.out.println("OK");
    } else {
        System.out.println("FAIL");
    }
    account.withdraw(50);
    if (account.getBalance() == 50) {
        System.out.println("OK");
    } else {
        System.out.println("FAIL");
    }
}
```

--

Pyh, det er omstændigt ... og vi skal stadig tjekke output visuelt.

--

Derfor findes `assert` i Java

```java
public static void main(String[] args) {
    BankAccount account = new BankAccount("12345");
    account.deposit(100);
    assert(account.getBalance() == 100);
    account.withdraw(50);
    assert(account.getBalance() == 50);
}
```

--




Hvis en assert fejler, fx
```java
assert(account.getBalance() == 9999999);
```

kan vi få en AssertionError:

```java
Exception in thread "main" java.lang.AssertionError
    at BankAccount.main(BankAccount.java:10)
```

... altså behøver vi ikke tjekke output visuelt ...smart!

--

MEN vi skal aktivere assertions når vi kører programmet

```bash
java -ea BankAccount
Exception in thread "main" java.lang.AssertionError
    at BankAccount.main(BankAccount.java:10)
```

```bash
java BankAccount
(no output)
```

--

I IntelliJ skal man  
- under `Run > Edit Configurations...` 
- finde `Modify options`, 
- enable `Add VM options` og 
- tilføje `-ea` i feltet VM options

--
<!-- .slide: class="o-sunlit-energy" -->

DEMO `assert` i Java
Notes:
- `assert` bruges til at teste antagelser (true/false) i koden, fx
  - Forventet resultat af en beregning
  - At et objekt ikke er null
  - At en liste indeholder et bestemt element
- Hvis en antagelse er falsk, kastes en AssertionError
- Kan hjælpe med at finde fejl tidligt i udviklingsprocessen

--

`assert` er en lidt overset teknik i dag. Den er smart, fordi:
- du kan sætte `assert`s **overalt** i din kode
- enable/disable dem alle med `-ea` flaget

--

... men der er en bedre måde at lave tests på i Java

---
<!-- .slide: class="cover-5" -->

# JUnit

--

Vi laver en testklasse, en testmetode og bruger assertions

```java
public class BankAccountTest {

    @Test
    public void depositChangesBalance() {
        BankAccount account = new BankAccount("12345");
        account.deposit(100);
        assert(100 == account.getBalance());
    }

    // (more tests...)
}
```

--

Vi laver en testklasse, testmetoder og bruger `assert` som før

```java
public class BankAccountTest { // Test klasse der tester BankAccount

    @Test
    public void depositChangesBalance() { // Test metode der tester deposit
        BankAccount account = new BankAccount("12345");
        account.deposit(100);
        assert(100 == account.getBalance());
    }
}
```

--

**** Test*klasser* = organisering af tests

Testklassen `BankAccountTest` *tester* `BankAccount`

--

**** Test*metoder* = tester hver især én ting

Testmetoden `depositChangesBalance()` *tester* `deposit(...)` i `BankAccount`

--

Hvordan skal vi skrive test-metoder?

--

Nu skal I høre om AAA - ikke **A**nonyme **A**lkolikere

--

AAA står for **A**ct, **A**rrange, **A**ssert

--

```java
@Test
public void depositChangesBalance() {
    // Arrange
    BankAccount account = new BankAccount("12345");
    // Act
    account.deposit(100);
    // Assert
    assertEquals(100, account.getBalance());
}
```

--

**Arrange** - vi opsætter de objekter vi skal bruge

```java
BankAccount account = new BankAccount("12345");
```
--

**Act** - vi udfører den handling (metode) vi vil teste

```java
account.deposit(100);
```

--

**Assert** - vi tjekker at resultatet er som forventet

```java
assertEquals(100, account.getBalance());
``` 

--
<!-- .slide: class="o-sunlit-energy" -->
DEMO JUnit test i IntelliJ

Notes:
```java
public class BankAccountTest {

    @Test
    public void depositChangesBalance() {
        // Arrange
        BankAccount account = new BankAccount("12345");
        // Act
        account.deposit(100);
        // Assert
        assertEquals(100, account.getBalance());
    }

    @Test
    public void testNegativeDepositShouldNotChangeBalance() {
        // Arrange
        BankAccount account = new BankAccount("12345");
        account.deposit(-100);
        // Assert
        assertEquals(0, account.getBalance());
    }
}
```

---
<!-- .slide: class="cover-6" -->
# Test først

--

a.k.a TDD - Test Driven Development

--

1. Skriv først testen - den <span class="color: red">fejler</span>
2. Skriv kode der får testen til at blive <span class="color: green">ok</span>
3. Refactor koden^*

<small>(*) gør den mere læsbar og vedligeholdelsesvenlig</small>

--
<!-- .slide: class="o-sunlit-energy" -->
DEMO Test først
Notes:
- nyt projekt med BankAccountTest og BankAccount
- skriv test af deposit() der fejler
- skriv kode i deposit() der får testen til at bestå
- skriv test af negative deposit() der fejler
- skriv kode i deposit() der får testen til at bestå
- skriv test af getBalance() der fejler
- skriv kode i getBalance() der får testen til at bestå
- ret test så deposit() returnere en boolean
- ret kode i deposit() så den returnere en boolean

--

Ny arbejsgang:

**DO** tests
**DON'T** køre main metoden

---

<!-- .slide: class="sunlit-energy" -->

Nævn tre ting du tager med fra i dag?