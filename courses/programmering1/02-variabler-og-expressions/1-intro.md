---
title: 02-1 - Variabler og expressions
---
<!-- .slide: class="kea-red" -->

# Variabler og expressions

---
<!-- .slide: class="kea-dark" -->

# Program

- 08:30 Velkomst praktisk, slides
- 09:00 Igang med øvelser i grupper
- 10:00 Pause
- 10:15 Øvelser fortsat
- 11:30 Opsamling, forberedelse til næste gang


---

# Et program er en **opskrift**

--

## Omelet

1. 2 æg slås ud i en skål
2. 2 æg piskes sammen
3. Mælk tilsættes
4. Salt tilsættes
5. Steg omeletten på panden

Notes:

- En opskrift er en liste af **trin** der skal følges i rækkefølge
- Computeren læser opskriften og udfører den trin for trin

--
<!-- .slide: class="kea-rose" -->
## Demo - Omelet opskrift

Notes:

```java
public class Main {
    // Opskrift på omelet til 1 person
    public static void main(String[] args) {
        System.out.println("2 æg slås ud i en skål");
        System.out.println("2 æg piskes sammen");
        System.out.println("Mælk tilsættes");
        System.out.println("Salt tilsættes");
        // System.out.println("Chili tilsættes");
        System.out.println("Steg på en pande"); // evt. i smør
    }
}
```

- Lad os lave et program, der skriver hvert trin i opskriften ud på skærmen.
- Hver linje bliver udført i rækkefølge
- `System.out.println()` er en metode, der skriver tekst ud på skærmen
- Linjerne der starter med `//` eller `/*` er kommentarer, som ikke bliver udført af programmet
- Kommentarer er gode til at forklare hvad koden gør

---

## Statements og kommentarer

--

Linjen `System.out.println("Steg på en pande");` er et **statement**

--

Et statement er en **instruktion** som computeren skal udføre

--

I Java slutter statements med et `;`

--

`// System.out.println("Chili tilsættes");` er en **kommentar**

--

En kommentar er bliver **ignoreret** af computeren

--

Kommentarer er gode til at forklare hvad koden gør, fx

```java
// Opskrift på omelet til 1 person
```

--

Vi kan også bruge kommentarer til at "slå" en linje fra, så den ikke bliver udført

```java
// System.out.println("Chili tilsættes");
```

--  

Hvis vi vil have chili i omeletten, kan vi bare fjerne `//` fra linjen

```java
public class Main {
    // Opskrift på omelet til 1 person
    public static void main(String[] args) {
        System.out.println("2 æg slås ud i en skål");
        System.out.println("2 æg piskes sammen");
        System.out.println("Mælk tilsættes");
        System.out.println("Salt tilsættes");
        System.out.println("Chili tilsættes");
        System.out.println("Steg på en pande"); // evt. i smør
    }
}
```

---

# Variabler og expressions

--
<!-- .slide: class="kea-rose" -->
## Demo - Omelet til et antal personer

Notes:
```java
public class Main {
    public static void main(String[] args) {
        // Ingredienser til omelet til 1 person
        System.out.println("Ingredienser:");
        System.out.println("æg (stk): 2");
        System.out.println("mælk");
        System.out.println("salt");
        // Opskrift på omelet til 1 person
        System.out.println("2 æg slås ud i en skål");
        System.out.println("2 æg piskes sammen");
        System.out.println("Mælk tilsættes");
        System.out.println("Salt tilsættes");
        System.out.println("Steg omeletten på panden");
    }
}
```

- Lad os lave en ingrediensliste til omeletten
- Til en omelet til 1 person skal vi bruge 2 æg, mælk og 0.5 teskefuld salt
- Skal jeg gentage det for at 2 personer? 3 personer? 4 personer?
- Det er kedeligt at skrive det igen og igen
- DRY (Don't Repeat Yourself)
- Vi kan bruge **variabler** til at gemme værdierne, så vi kan bruge dem flere gange

```java
public class Main {
    public static void main(String[] args) {
        // Ingredienser til omelet til 1 person
        int eggs = 2;
        System.out.println("Ingredienser:");
        System.out.println("æg (stk): " + eggs);
        System.out.println("mælk");
        System.out.println("salt");
        // Opskrift på omelet til 1 person
        System.out.println(eggs + " æg slås ud i en skål");
        System.out.println(eggs + " æg piskes sammen");
        System.out.println("Mælk tilsættes");
        System.out.println("Salt tilsættes");
        System.out.println("Steg omeletten på panden");
    }
}
```

--

En variabel er...

--

**en "boks"** i computerens hukommelse, hvor du kan **gemme data**


--

Du kan give boksen et **navn** fx `eggs`, så du kan bruge den senere

--

Navngivning er vigtigt

--
| navn             | ok? |
|------------------|----|
| `eggs`           | ✅  |
| `numberOfEggs`   | ✅  |
| `Eggs`           | ❌  |
| `numberofeggs`   | ❌  |
| `number of eggs` | ❌  |
| `number-of-eggs` | ❌  |
| `e`              | ❌  |
| `hest`           | ❌  |
| `eggs2`          | ❌  |
| `intEggs`        | ❌  |
| `public`         | ❌  |

Notes:

- Er `e` et godt navn til en variabel der indeholder antallet af æg?
- variabelnavne skal ikke indeholde typeinformationer
- `public` er et **reservet ord** i Java, og kan ikke bruges som variabelnavn

--

Variablens **type** skal passe til den **værdi** du vil gemme i den, fx 

| type     | værdi            |
|----------|------------------|
| `int`    | 2                |
| `float`  | 0.5              |
| `bool`   | true             |
| `char`   | 'a'              |
| `String` | "Salt tilsættes" |


Notes:
- `int` for heltal
- `float` for decimaltal
- `char` for bogstaver
- `bool` for sand/falsk
- `String` for tekst

--

### Deklarering af variabel

`int eggs;` kalder vi, at **deklarere** en variabel `eggs` af typen `int`

Notes:

- Læg mærke til at vi ikke har givet den en værdi endnu

--

### Tildeling af værdi

`eggs = 2;` kalder vi, at **tildele** værdien `2` til variablen `eggs`

Notes:
- eggs er nu en boks i hukommelsen, der indeholder værdien 2


--

### Deklarering og tildeling

Vi kan også gøre det under et `int eggs = 2;`

--

Så vores program kan se sådan ud:

```java
public class Main {
    public static void main(String[] args) {
        // Ingredienser til omelet til 1 person
        int eggs = 2;
        System.out.println("Ingredienser:");
        System.out.println("æg (stk): " + eggs);
        System.out.println("mælk");
        System.out.println("salt");
        // Opskrift på omelet til 1 person
        System.out.println(eggs + " æg slås ud i en skål");
        System.out.println(eggs + " æg piskes sammen");
        System.out.println("Mælk tilsættes");
        System.out.println("Salt tilsættes");
        System.out.println("Steg omeletten på panden");
    }
}
```

--

# Heltal

engelsk: `int`eger

```java
int age = 25;
```

--

# Decimaltal

engelsk: `float`ing points

```java
float height = 178.2;
```

Notes:
Bemærk engelsk decimal er '.' og ikke ',' som på dansk.

--

# Sand/falsk

engelsk: `bool`ean

```java
bool hasBirthdayToday = false;
```

Notes:
- Opkaldt efter engelsk matematiker George Boole

--

# Bogstav

engelsk: `char`acter

```java
char initial = 'J';
```

--

# Tekst
engelsk: `string`

```java
String name = "Jens";
```

Notes:
- `int`, `float`, `char` og `String` er primitive data typer og skrives med små bogstaver
- `String` er dermiod en klasse (også kaldet reference type) og skrives med stort S
- Faktisk er `String` er en sekvens af bogstaver af primitivtypen `char`

---

# Operators og expressions

--

```java
int eggsPerPerson = 2;
int persons = 4;
int totalEggs = eggsPerPerson * persons;
```

`*` er en **operator**

`eggsPerPerson * persons` er en expression

--

## Alm. matematik

| operator | betydning      |
|----------|----------------|
| `+`      | addition       |
| `-`      | subtraktion    |
| `*`      | multiplikation |
| `/`      | division       |
| `%`      | modulus        |

--

## Sammenligningsoperatorer

| operator | betydning      |
|----------|----------------|
| `==`     | er lig med     |
| `!=`     | er ikke lig med |
| `>`      | større end     |
| `<`      | mindre end     |
| `>=`     | større eller lig med |
| `<=`     | mindre eller lig med |

Notes:

- `==` er ikke det samme som `=` (tildelingsoperatoren)
- `==` bruges til at sammenligne værdier
- `=` bruges til at tildele værdier
- `!=` bruges til at tjekke om værdierne ikke er ens
- `>` bruges til at tjekke om værdien til venstre er større end værdien til højre (osv.)

--
<!-- .slide: class="kea-rose" -->
## Demo -  Sammenligningsoperatorer

Notes:

```java
int eggs = 2;
int persons = 4;
bool enoughEggs = (eggs >= persons * 2);
System.out.println("Er der nok æg? " + enoughEggs);
```

- `enoughEggs` er en boolsk variabel, der indeholder sand/falsk
- `enoughEggs` er sand hvis der er nok æg til alle personer

--

## Matematik med sand/falsk-værdier

| operator | betydning      |
|----------|----------------|
| `&&`     | og             |
| `\|\|`     | eller          |
| `!`      | ikke           |

(osv.)

Notes:
- `&&` bruges til at tjekke om begge betingelser er sande
- `||` bruges til at tjekke om en af betingelserne er sand
- `!` bruges til at tjekke om betingelsen er falsk

--
<!-- .slide: class="kea-rose" -->
## Demo - Matematik med sand/falsk-værdier

Notes:

```java
...
bool groceryStoreOpen = true;
bool shopEggs = groceryStoreOpen && !enoughEggs;
System.out.println("Skal jeg købe ind? " + shopEggs);
```

--
<!-- .slide: class="kea-rose" -->
## Demo: Variablen kan ændres

Notes: 
- Du kan ændre værdien af en variabel når som helst i programmet
- Du kan også ændre værdien af en variabel flere gange

```java
int eggs = 2;
System.out.println(eggs);

eggs = 4;
System.out.println(eggs);

eggs = eggs + 2;
System.out.println(eggs);
```

## Tildelingsoperator

| operator | betydning          |
|----------|--------------------|
| `=`      | tildel             |
| `+=`     | tilføj og tildel   |
| `-=`     | træk fra og tildel |

(osv.)

--

## Demo: Tildelingsoperator

```java
int eggs = 2;
System.out.println(eggs);

eggs += 2;
System.out.println(eggs);

eggs -= 1;
System.out.println(eggs);
```

--

## Unære operatorer

| operator | betydning         |
|----------|-------------------|
| `++`     | `eggs = eggs + 1` |
| `--`     | `eggs = eggs - 1` |

Notes:

- det er en forkortelse for at tilføje eller trække fra 1
- det er praktisk når vi skal tælle op eller ned, fx i en løkke (næste gang)

--

## Demo - Unære operatorer

Notes:

```java
int eggs = 2;
System.out.println(eggs);
eggs++;
System.out.println(eggs);
eggs--;
System.out.println(eggs);
```

--

## Konstanter

```java
final String name = "Nynne";
name = "Dorte"; // Java throws an error!!         
```

Notes:
- En konstant er en variabel, der ikke kan ændres efter den er blevet tildelt en værdi
- final betyder at den ikke kan ændres
- Det er en god idé at bruge konstanter til værdier, der ikke skal ændres, fx pi osv.
- Konstanter skrives med store bogstaver, og ord adskilt med `_` (underscore)

```java
final int MAX_AGE = 100;
final float PI = 3.14;
```

--

## Mere komplekse expressions

```java
result = 3 * 5 / 5 + 1 
// will this java code run??                    
```
--

## Rækkefølge på operations

- **parenteser** (), {}, []
- **eksponenter** x², x³ og **kvadratrødder** √x 
- **multiplikation** * og **division** /  
- **addition** \+ og **subtraktion** −

Notes:
- Rækkefølgen er den samme som i matematik
- Parentheser har højeste prioritet
- Multiplikation og division har højere prioritet end addition og subtraktion

---

# Shortcuts i IntelliJ

--

![IntelliJ Shortcuts](images/shortcut1.png)

**main** giver public static void main()

--

![IntelliJ Shortcuts](images/shortcut2.png)

**sout** giver System.out.println();

---
<!-- .slide: class="kea-dark" -->
# Opsamling

- Nævn tre ting du tager med fra i dag