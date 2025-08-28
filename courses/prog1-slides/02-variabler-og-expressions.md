---
title: 02 - Variable og expressions
---
<!-- .slide: class="cover-15" -->

# Variable og expressions

---
<!-- .slide: class="k-sunlit-energy" -->

# Program

- 08:30 Variable og expressions
- 09:30 Igang med øvelser
- 10:00 Pause
- 10:15 Øvelser fortsat
- 11:15 Opsamling

---

Et program er en **opskrift**

--

#### Omelet

1. 2 æg slås ud i en skål
2. 2 æg piskes sammen
3. Mælk tilsættes
4. Salt tilsættes
5. Steg omeletten på panden

Notes:

- En opskrift er en liste af **trin** der skal følges i rækkefølge
- Computeren læser opskriften og udfører den trin for trin

--
<!-- .slide: class="k-daylight" -->
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
<!-- .slide: class="x-large" -->
Et **statement**
```java
System.out.println("Steg på en pande");
```

--

Et statement er en **instruktion** som computeren skal udføre

--

I Java slutter statements med et `;`

--
<!-- .slide: class="x-large" -->

En **kommentar**:
```java
// System.out.println("Chili tilsættes");
```

Notes:
- De starter med `//` og slutter ved slutningen af linjen

--

En kommentar er bliver **ignoreret** af computeren


Notes:

- Kommentarer er ikke statements, de bliver ikke udført af computeren
--

<!-- .slide: class="x-large" -->
Kommentarer er gode til at forklare hvad koden gør, fx

```java
// Opskrift på omelet til 1 person
```

--

<!-- .slide: class="x-large" -->
Vi kan også bruge kommentarer til at **"slå" en linje fra**, så den **ikke bliver udført**

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
<!-- .slide: class="k-daylight" -->
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

**Navngivning** er vigtigt

--
<!-- .slide: class="x-large" -->

Hvad betyder
```java
int e = 2;
```

--
<!-- .slide: class="x-large" -->
Bedre: 
```java
int numberOfEggs = 2;
```

--

Java er **case-sensitive**

dvs. `numberofeggs` og `numberOfEggs` er to forsk. variable

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
| `double`  | 0.5              |
| `boolean`   | true             |
| `char`   | 'a'              |
| `String` | "Salt tilsættes" |


Notes:
- `int` for heltal
- `double` for decimaltal
- `char` for bogstaver
- `boolean` for sand/falsk
- `String` for tekst

--
<!-- .slide: class="x-large" -->

```java
int eggs;
```
kalder vi, at **deklarere** en variabel `eggs` af typen `int`

Notes:

- Læg mærke til at vi ikke har givet den en værdi endnu

--
<!-- .slide: class="x-large" -->

```java
eggs = 2;
```
kalder vi, at **tildele** værdien `2` til variablen `eggs`

Notes:
- eggs er nu en boks i hukommelsen, der indeholder værdien 2


--
<!-- .slide: class="x-large" -->

Vi kan også gøre det under et 
```java
int eggs = 2;
```

--
<!-- .slide: class="x-large" -->

Vi kan bruge variablen igen og igen i vores program
```java
System.out.println(eggs + " æg slås ud i en skål");
System.out.println(eggs + " æg piskes sammen");
```

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
<!-- .slide: class="x-large" -->
## Heltal

engelsk: `int`eger

```java
int age = 25;
```

--
<!-- .slide: class="x-large" -->
## Decimaltal

engelsk: `double` precision floating points

```java
double height = 178.2;
```

Notes:
Bemærk engelsk decimal er '.' og ikke ',' som på dansk.

--
<!-- .slide: class="x-large" -->
## Sand/falsk

engelsk: `boolean`

```java
boolean hasBirthdayToday = false;
```

Notes:
- Opkaldt efter engelsk matematiker George Boole

--
<!-- .slide: class="x-large" -->
## Bogstav

engelsk: `char`acter

```java
char initial = 'J';
```

--
<!-- .slide: class="x-large" -->
## Tekst
engelsk: `string`

```java
String name = "Jens";
```

Notes:
- `int`, `double`, `char` og `String` er primitive data typer og skrives med små bogstaver
- `String` er dermiod en klasse (også kaldet reference type) og skrives med stort S
- Faktisk er `String` er en sekvens af bogstaver af primitivtypen `char`

---

# Operators og expressions

--
<!-- .slide: class="x-large" -->

```java
int eggsPerPerson = 2;
int persons = 4;

int totalEggs = eggsPerPerson * persons;
```

`*` er en **operator**

`eggsPerPerson` og `persons` er **operander**

`eggsPerPerson * persons` er en **expression**

--

## Matematiske operatorer

| operator | betydning      |
|----------|----------------|
| `+`      | addition       |
| `-`      | subtraktion    |
| `*`      | multiplikation |
| `/`      | division       |
| `%`      | modulus        |

--
<!-- .slide: class="x-large" -->
`+` bruges til at lægge tal sammen, fx

```java
int a = 5;
int b = 3;
int sum = a + b; // 8
````

--

Men `+` bruges også til at **sammenkæde** tekst, fx

```java
String firstName = "Beate";
System.out.println("Mit navn er " + firstName); // Mit navn er Beate
```

--

Vi kunne også skrive

```java
String firstName = "Beate's alder er ";
int age = 55;
String text = firstName + age;
System.out.println(text); // Beate's alder er 55
```

Det virker selvom `age` er et heltal

--

**operand** `+` **operand**

- Hvis **den ene side er tekst** &rarr; **sammenkædning af tekst**
- Hvis **begge sider er tal** &rarr; **addition af tal**

Notes: 
- I Java er `+`-operatoren **overloaded**
- Den opfører sig forskelligt afhængig af typen af de værdier den arbejder med.

--

Er `-` også overloaded?

```java
String firstName = "Beate";
String lastName = "Hansen";
String fullName = firstName - lastName; // Fejl!
```

**Nej!**

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

```java
int eggsInFridge = 6;
int eggsPerPerson = 2;
int persons = 4;
int totalEggs = eggsPerPerson * persons;
boolean enoughEggs = eggsInFridge >= totalEggs;
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
```java
...
boolean groceryStoreOpen = true;
boolean shopEggs = groceryStoreOpen && !enoughEggs;
System.out.println("Skal jeg købe ind? " + shopEggs);
```

--
<!-- .slide: class="k-daylight" -->
## Demo: Variablen kan ændres

Notes: 
- Du kan ændre værdien af en variabel når som helst i programmet
- Du kan også ændre værdien af en variabel flere gange
- Vis med print statements og breakpoints

```java
int eggs = 2;
System.out.println(eggs); // 2
eggs = 4;
System.out.println(eggs); // 4
eggs = eggs + 2;
System.out.println(eggs); // 6
```

```java
// tildelingsoperatorer
int eggs = 2;
System.out.println(eggs); // 2
eggs += 2;
System.out.println(eggs); // 4
eggs -= 1;
System.out.println(eggs); // 3
```

```java
// unære operatorer
int eggs = 2;
System.out.println(eggs); // 2
eggs++;
System.out.println(eggs); // 3
eggs--;
System.out.println(eggs); // 2
```
--

## Tildelingsoperator

| operator | betydning          |
|----------|--------------------|
| `=`      | tildel             |
| `+=`     | tilføj og tildel   |
| `-=`     | træk fra og tildel |

(osv.)

--

## Unære operatorer

| operator | betydning                                |
|----------|------------------------------------------|
| `++`     | `eggs = eggs + 1`                        |
| `--`     | `eggs = eggs - 1`                        |
| `!`      | `groceryStoreClosed = !groceryStoreOpen` |

Notes:

- det er en forkortelse for at tilføje eller trække fra 1
- det er praktisk når vi skal tælle op eller ned, fx i en løkke (næste gang)

--
<!-- .slide: class="large" -->
## Konstanter

`final` betyder at en variabel ikke kan ændres

```java
final int EGGS_PER_PERSON = 2;
EGGS_PER_PERSON = 20; // Fejl!
```

Notes:
- En konstant er en variabel, der ikke kan ændres efter den er blevet tildelt en værdi
- final betyder at den ikke kan ændres
- Det er en god idé at bruge konstanter til værdier, der ikke skal ændres, fx pi osv.
- Konstanter skrives med store bogstaver, og ord adskilt med `_` (underscore)

```java
final int MAX_AGE = 100;
final double PI = 3.14;
```

--
<!-- .slide: class="x-large" -->
## Rækkefølge på operationer

```java
double result1 = 3 + 4 / 2 + 5;
double result2 = (3 + 4) / (2 + 5);
```

Notes:
Nogen der ved hvad resultatet er på `result` og `result2`?
Svar: `result` er 10.0 og `result2` er 1.0
--

## Rækkefølge på operationer

- **parenteser** (), {}, []
- **eksponenter** x², x³ og **kvadratrødder** √x 
- **multiplikation** * og **division** /  
- **addition** \+ og **subtraktion** −

Notes:
- Rækkefølgen er den samme som i matematik
- Parentheser har højeste prioritet
- Multiplikation og division har højere prioritet end addition og subtraktion

---
<!-- .slide: class="k-sunlit-energy" -->
# Opsamling

- Nævn tre ting du tager med fra i dag