#import "../style.typ": *

= Test og Test-Driven Development

I dette kapitel skal vi lære hvordan vi systematisk kan teste vores kode. Vi starter med simple assertions, går videre til JUnit test framework, og slutter med Test-Driven Development (TDD) - en moderne tilgang til softwareudvikling.

== Hvorfor teste?

Indtil nu har vi testet vores kode ved at køre den manuelt og tjekke output:

```java
public static void main(String[] args) {
    BankAccount account = new BankAccount("12345");
    account.deposit(100);
    System.out.println(account.getBalance()); // Burde være 100
    account.withdraw(50);
    System.out.println(account.getBalance()); // Burde være 50
}
```

Problemet med denne tilgang:
- **Manuelt arbejde** - vi skal visuelt tjekke output hver gang
- **Ikke reproducerbar** - vi skal huske hvad output skulle være
- **Tidskrævende** - især når projektet vokser
- **Fejltilbøjelig** - let at overse fejl

Hvad hvis vi kunne automatisere testene?

== Assert - den simple løsning

Java har et `assert` statement til at tjekke antagelser:

```java
public static void main(String[] args) {
    BankAccount account = new BankAccount("12345");
    account.deposit(100);
    assert account.getBalance() == 100;
    account.withdraw(50);
    assert account.getBalance() == 50;
}
```

Hvis en assertion fejler, får vi en `AssertionError`:

```java
assert account.getBalance() == 9999999;
// Exception in thread "main" java.lang.AssertionError
//     at BankAccount.main(BankAccount.java:10)
```

=== Aktivere assertions

#note[
Assertions er som standard _deaktiveret_ i Java!

Vi skal køre programmet med `-ea` flaget (enable assertions):

```bash
java -ea BankAccount
```

I IntelliJ:
1. Gå til `Run` → `Edit Configurations...`
2. Find `Modify options`
3. Enable `Add VM options`
4. Tilføj `-ea` i feltet "VM options"
]

=== Hvornår bruge assert?

`assert` bruges typisk til at tjekke:
- **Invarianter** - ting der altid skal være sande
- **Pre-conditions** - krav før en metode køres
- **Post-conditions** - garantier efter en metode er kørt

Eksempel:

```java
public void withdraw(double amount) {
    assert amount > 0 : "Beløb skal være positivt";
    assert balance >= amount : "Ikke nok penge på kontoen";
    
    balance -= amount;
    
    assert balance >= 0 : "Balance må ikke være negativ";
}
```

=== Fordele og begrænsninger ved assert

**Fordele:**
- Simpel syntaks
- Kan bruges overalt i koden
- Kan slås til/fra med `-ea` flag

**Begrænsninger:**
- Skal manuelt aktiveres
- Ikke en komplet test-løsning
- Ingen organisering af tests
- Ingen rapportering

For systematisk testning bruger vi i stedet JUnit.

== JUnit - professionel testning

JUnit er Java's mest populære test framework. Det giver os:
- **Organiserede tests** i testklasser
- **Automatisk kørsel** af alle tests
- **Detaljeret rapportering** af resultater
- **Integration** med udviklingsværktøjer

=== Oprettelse af en testklasse

Vi laver en separat testklasse for hver klasse vi vil teste:

```java
public class BankAccountTest {

    @Test
    public void depositChangesBalance() {
        BankAccount account = new BankAccount("12345");
        account.deposit(100);
        assertEquals(100, account.getBalance());
    }
}
```

Konventioner:
- **Testklasse**: Navn på klassen + "Test", fx `BankAccountTest`
- **Testmetoder**: Beskrivende navne der forklarer hvad der testes
- **`@Test` annotation**: Markerer at metoden er en test

=== AAA-mønsteret

En god test følger AAA-mønsteret:

- **Arrange** - forbered de objekter og data vi skal bruge
- **Act** - udfør den handling vi vil teste
- **Assert** - verificer at resultatet er som forventet

```java
@Test
public void depositChangesBalance() {
    // Arrange - opsætning
    BankAccount account = new BankAccount("12345");
    
    // Act - udfør handling
    account.deposit(100);
    
    // Assert - verificer resultat
    assertEquals(100, account.getBalance());
}
```

Dette mønster gør tests lettere at læse og forstå.

=== Assertions i JUnit

JUnit har mange forskellige assertion-metoder:

```java
import static org.junit.jupiter.api.Assertions.*;

@Test
public void testAssertions() {
    // Lige med
    assertEquals(100, account.getBalance());
    
    // Ikke lige med
    assertNotEquals(0, account.getBalance());
    
    // Sand
    assertTrue(account.getBalance() > 0);
    
    // Falsk
    assertFalse(account.getBalance() < 0);
    
    // Null
    assertNull(account.getOwner());
    
    // Ikke null
    assertNotNull(account);
    
    // Samme objekt (reference)
    assertSame(account1, account2);
    
    // Forskellige objekter
    assertNotSame(account1, account2);
}
```

=== Test af fejltilstande

Vi kan også teste at vores kode kaster exceptions når den skal:

```java
@Test
public void withdrawMoreThanBalanceThrowsException() {
    // Arrange
    BankAccount account = new BankAccount("12345");
    account.deposit(100);
    
    // Act & Assert
    assertThrows(IllegalArgumentException.class, () -> {
        account.withdraw(200);
    });
}
```

Dette sikrer at vores fejlhåndtering virker korrekt.

=== Flere testmetoder

En testklasse kan have mange testmetoder:

```java
public class BankAccountTest {

    @Test
    public void depositIncreasesBalance() {
        BankAccount account = new BankAccount("12345");
        account.deposit(100);
        assertEquals(100, account.getBalance());
    }

    @Test
    public void withdrawDecreasesBalance() {
        BankAccount account = new BankAccount("12345");
        account.deposit(100);
        account.withdraw(30);
        assertEquals(70, account.getBalance());
    }

    @Test
    public void negativeDepositDoesNotChangeBalance() {
        BankAccount account = new BankAccount("12345");
        account.deposit(-100);
        assertEquals(0, account.getBalance());
    }

    @Test
    public void withdrawMoreThanBalanceFails() {
        BankAccount account = new BankAccount("12345");
        account.deposit(50);
        assertThrows(IllegalArgumentException.class, () -> {
            account.withdraw(100);
        });
    }
}
```

=== Setup og teardown

Hvis vi skal forberede det samme i flere tests, kan vi bruge `@BeforeEach`:

```java
public class BankAccountTest {
    private BankAccount account;

    @BeforeEach
    public void setUp() {
        account = new BankAccount("12345");
        account.deposit(100);
    }

    @Test
    public void withdrawDecreasesBalance() {
        account.withdraw(30);
        assertEquals(70, account.getBalance());
    }

    @Test
    public void depositIncreasesBalance() {
        account.deposit(50);
        assertEquals(150, account.getBalance());
    }
}
```

`@BeforeEach` metoden køres før _hver_ test, så hver test starter med en frisk konto.

Der findes også:
- `@AfterEach` - køres efter hver test
- `@BeforeAll` - køres én gang før alle tests (skal være `static`)
- `@AfterAll` - køres én gang efter alle tests (skal være `static`)

== Test-Driven Development (TDD)

Test-Driven Development er en udviklingsmetode hvor vi skriver tests _før_ vi skriver koden.

=== Red-Green-Refactor cyklussen

TDD følger denne cyklus:

1. **Red** - Skriv en test der fejler (rød)
2. **Green** - Skriv lige præcis nok kode til at testen virker (grøn)
3. **Refactor** - Forbedre koden uden at ændre funktionalitet

#figure(
  [
    ```
    ┌─────────────────────────────────────┐
    │  1. Skriv en test der FEJLER        │
    │     (RED)                            │
    └────────────┬────────────────────────┘
                 │
                 ▼
    ┌─────────────────────────────────────┐
    │  2. Skriv kode så testen VIRKER     │
    │     (GREEN)                          │
    └────────────┬────────────────────────┘
                 │
                 ▼
    ┌─────────────────────────────────────┐
    │  3. REFACTOR koden                   │
    │     (gør den bedre)                  │
    └────────────┬────────────────────────┘
                 │
                 └──────────────────────────┐
                                            │
                                            ▼
                                    Gentag cyklussen
    ```
  ],
  caption: [TDD Red-Green-Refactor cyklus]
)

=== TDD i praksis

Lad os bygge en `Calculator` klasse med TDD:

**Step 1: Skriv en test (Red)**

```java
public class CalculatorTest {
    @Test
    public void addTwoNumbers() {
        Calculator calc = new Calculator();
        int result = calc.add(2, 3);
        assertEquals(5, result);
    }
}
```

Denne test kompilerer ikke engang - `Calculator` eksisterer ikke! Det er ok, det er en del af processen.

**Step 2: Skriv minimal kode (Green)**

```java
public class Calculator {
    public int add(int a, int b) {
        return a + b;
    }
}
```

Nu virker testen! Vi skrev lige præcis nok kode.

**Step 3: Refactor (hvis nødvendigt)**

I dette simple tilfælde er der ikke noget at refaktorere. Lad os tilføje mere funktionalitet.

**Næste iteration - Subtraktion (Red)**

```java
@Test
public void subtractTwoNumbers() {
    Calculator calc = new Calculator();
    int result = calc.subtract(5, 3);
    assertEquals(2, result);
}
```

**Green:**

```java
public int subtract(int a, int b) {
    return a - b;
}
```

**Refactor:**

Vi ser at vi opretter en ny Calculator i hver test. Lad os refaktorere:

```java
public class CalculatorTest {
    private Calculator calc;

    @BeforeEach
    public void setUp() {
        calc = new Calculator();
    }

    @Test
    public void addTwoNumbers() {
        assertEquals(5, calc.add(2, 3));
    }

    @Test
    public void subtractTwoNumbers() {
        assertEquals(2, calc.subtract(5, 3));
    }
}
```

=== Fordele ved TDD

**1. Bedre design**
- Vi tænker på hvordan koden skal bruges før vi skriver den
- Vi bygger kun det der er nødvendigt

**2. Færre bugs**
- Bugs opdages tidligt
- Vi tester løbende

**3. Dokumentation**
- Tests viser hvordan koden skal bruges
- Eksempler på brug

**4. Tillid til at ændre koden**
- Tests bekræfter at alt stadig virker
- Trygt at refaktorere

**5. Fokus**
- Ét problem ad gangen
- Klar definition af "færdig" (testen virker)

=== TDD eksempel: StringBuilder klasse

Lad os bygge en forenklet `StringBuilder` med TDD:

**Test 1: Opret tom builder**

```java
@Test
public void createEmptyBuilder() {
    MyStringBuilder builder = new MyStringBuilder();
    assertEquals("", builder.toString());
}
```

**Kode:**

```java
public class MyStringBuilder {
    private String text = "";
    
    @Override
    public String toString() {
        return text;
    }
}
```

**Test 2: Append tekst**

```java
@Test
public void appendText() {
    MyStringBuilder builder = new MyStringBuilder();
    builder.append("Hello");
    assertEquals("Hello", builder.toString());
}
```

**Kode:**

```java
public void append(String str) {
    text = text + str;
}
```

**Test 3: Append flere gange**

```java
@Test
public void appendMultipleTimes() {
    MyStringBuilder builder = new MyStringBuilder();
    builder.append("Hello");
    builder.append(" ");
    builder.append("World");
    assertEquals("Hello World", builder.toString());
}
```

Koden virker allerede! Testen bekræfter vores implementation.

**Test 4: Method chaining**

```java
@Test
public void methodChaining() {
    MyStringBuilder builder = new MyStringBuilder();
    String result = builder.append("Hello")
                          .append(" ")
                          .append("World")
                          .toString();
    assertEquals("Hello World", result);
}
```

**Kode:**

```java
public MyStringBuilder append(String str) {
    text = text + str;
    return this; // Returnér objektet selv
}
```

== Testdækning

_Testdækning_ (code coverage) måler hvor meget af vores kode der køres af tests.

```java
public class Calculator {
    public int divide(int a, int b) {
        if (b == 0) {
            throw new IllegalArgumentException("Kan ikke dividere med 0");
        }
        return a / b;
    }
}
```

Vi skal teste både normal brug og fejltilfælde:

```java
@Test
public void divideNormalCase() {
    Calculator calc = new Calculator();
    assertEquals(2, calc.divide(6, 3));
}

@Test
public void divideByZeroThrowsException() {
    Calculator calc = new Calculator();
    assertThrows(IllegalArgumentException.class, () -> {
        calc.divide(5, 0);
    });
}
```

Nu har vi 100% testdækning af `divide()` metoden.

== Best practices for testning

=== 1. Gode testnavne

**Dårligt:**
```java
@Test
public void test1() { ... }
```

**Godt:**
```java
@Test
public void depositIncreasesBalance() { ... }

@Test
public void withdrawWithInsufficientFundsThrowsException() { ... }
```

=== 2. En assertion per test (når muligt)

**Mindre godt:**
```java
@Test
public void testAccount() {
    BankAccount acc = new BankAccount("123");
    assertEquals("123", acc.getAccountNumber());
    acc.deposit(100);
    assertEquals(100, acc.getBalance());
    acc.withdraw(30);
    assertEquals(70, acc.getBalance());
}
```

**Bedre:**
```java
@Test
public void newAccountHasCorrectAccountNumber() {
    BankAccount acc = new BankAccount("123");
    assertEquals("123", acc.getAccountNumber());
}

@Test
public void depositIncreasesBalance() {
    BankAccount acc = new BankAccount("123");
    acc.deposit(100);
    assertEquals(100, acc.getBalance());
}

@Test
public void withdrawDecreasesBalance() {
    BankAccount acc = new BankAccount("123");
    acc.deposit(100);
    acc.withdraw(30);
    assertEquals(70, acc.getBalance());
}
```

=== 3. Test edge cases

Test ikke kun "den glade sti", men også:
- **Grænseværdier**: 0, negative tal, maksimumværdier
- **Tomme inputs**: tomme strings, tomme lister
- **Null-værdier**: hvad sker der med null?
- **Fejltilfælde**: ugyldige inputs, exceptions

```java
@Test
public void depositZeroDoesNotChangeBalance() {
    account.deposit(0);
    assertEquals(0, account.getBalance());
}

@Test
public void depositNegativeAmountThrowsException() {
    assertThrows(IllegalArgumentException.class, () -> {
        account.deposit(-100);
    });
}
```

=== 4. Tests skal være uafhængige

Hver test skal kunne køres alene og i vilkårlig rækkefølge:

**Dårligt:**
```java
private BankAccount account = new BankAccount("123");

@Test
public void test1() {
    account.deposit(100);
}

@Test
public void test2() {
    // Antager at test1 er kørt først!
    assertEquals(100, account.getBalance());
}
```

**Godt:**
```java
@BeforeEach
public void setUp() {
    account = new BankAccount("123");
}

@Test
public void test1() {
    account.deposit(100);
    assertEquals(100, account.getBalance());
}

@Test
public void test2() {
    account.deposit(50);
    assertEquals(50, account.getBalance());
}
```

=== 5. Hurtige tests

Tests skal køre hurtigt så vi kan køre dem ofte:
- Undgå databasekald (brug mock objects)
- Undgå filoperationer når muligt
- Undgå lange `Thread.sleep()` kald

== Øvelser

#exercise[
  === Opgave 1: Simpel lommeregner med TDD
  
  Brug TDD til at bygge en `Calculator` klasse:
  
  1. Start med test for `add(int a, int b)`
  2. Tilføj test og implementation for `subtract(int a, int b)`
  3. Tilføj test og implementation for `multiply(int a, int b)`
  4. Tilføj test og implementation for `divide(int a, int b)`
     - Husk at teste division med 0
  5. Tilføj test og implementation for `power(int base, int exponent)`
  
  Følg Red-Green-Refactor cyklussen for hver metode!
]

#exercise[
  === Opgave 2: Password validator
  
  Brug TDD til at bygge en `PasswordValidator` klasse med metoden:
  ```java
  public boolean isValid(String password)
  ```
  
  En valid password skal:
  - Være mindst 8 tegn lang
  - Indeholde mindst ét stort bogstav
  - Indeholde mindst ét lille bogstav
  - Indeholde mindst ét tal
  - Indeholde mindst ét specialtegn (!@\#$%\^&*)
  
  Skriv en test for hver regel, og implementér derefter.
]

#exercise[
  === Opgave 3: Test eksisterende kode
  
  Du har fået denne `StringUtils` klasse:
  
  ```java
  public class StringUtils {
      public static boolean isPalindrome(String str) {
          String cleaned = str.toLowerCase().replaceAll("[^a-z]", "");
          return cleaned.equals(new StringBuilder(cleaned).reverse().toString());
      }
      
      public static int countVowels(String str) {
          int count = 0;
          for (char c : str.toLowerCase().toCharArray()) {
              if ("aeiouyæøå".indexOf(c) >= 0) {
                  count++;
              }
          }
          return count;
      }
  }
  ```
  
  Skriv omfattende tests for begge metoder. Test:
  - Normal brug
  - Edge cases (tom string, null, specialtegn)
  - Danske bogstaver
]

#exercise[
  === Opgave 4: Shopping cart med TDD
  
  Brug TDD til at bygge:
  
  1. En `Product` klasse med: name, price
  2. En `ShoppingCart` klasse med:
     - `addProduct(Product p)` - tilføj produkt
     - `removeProduct(Product p)` - fjern produkt
     - `getTotalPrice()` - beregn total pris
     - `getProductCount()` - antal produkter
     - `clear()` - tøm kurv
     - `applyDiscount(double percentage)` - giv rabat
  
  Skriv tests først for hver funktion!
]

#exercise[
  === Opgave 5: TDD Kata - FizzBuzz
  
  FizzBuzz er et klassisk programmeringseksempel, perfekt til TDD:
  
  Skriv en metode `String fizzBuzz(int n)` der:
  - Returnerer "Fizz" hvis n er deleligt med 3
  - Returnerer "Buzz" hvis n er deleligt med 5
  - Returnerer "FizzBuzz" hvis n er deleligt med både 3 og 5
  - Returnerer tallet som string ellers
  
  Skriv tests i denne rækkefølge:
  1. Test for tal der ikke er deleligt med 3 eller 5 (fx 1, 2, 4)
  2. Test for tal deleligt med 3 (fx 3, 6, 9)
  3. Test for tal deleligt med 5 (fx 5, 10, 20)
  4. Test for tal deleligt med både 3 og 5 (fx 15, 30)
  
  Implementér kode efter hver test!
]

== Opsummering

I dette kapitel har vi lært:

- **Manuelle tests** er tidskrævende og fejltilbøjelige
- **Assert** giver simple automatiske tests, men er begrænset
- **JUnit** er et komplet test framework med organiserede tests
- **AAA-mønsteret**: Arrange, Act, Assert giver struktur til tests
- **TDD** (Test-Driven Development) betyder at skrive tests først
- **Red-Green-Refactor** er TDD's grundlæggende cyklus
- **Testdækning** måler hvor meget kode der testes
- **Best practices**: gode navne, uafhængige tests, test edge cases

Testning er en fundamental færdighed i moderne softwareudvikling. Med TDD bygger vi bedre kode med færre bugs, og vi kan ændre koden med tillid.

#note[
  **Ny arbejdsgang:**
  
  Fra nu af:
  - **DO**: Skriv tests for al ny kode
  - **DON'T**: Stol på manuel testning i main-metoden
  
  Tests er ikke ekstra arbejde - de _er_ arbejdet!
]
