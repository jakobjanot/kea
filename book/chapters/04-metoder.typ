#import "../style.typ": *

= Metoder

Indtil nu har alle vores programmer bestået af en enkelt `main`-metode, hvor vi har skrevet al vores kode. Men efterhånden som programmerne bliver større og mere komplekse, bliver det vigtigt at kunne organisere koden i mindre, genbrugelige dele. Det er her metoder kommer ind i billedet.

En metode er en navngiven blok af kode, der udfører en specifik opgave. Metoder gør det muligt at:
- Organisere koden i logiske enheder
- Genbruge kode i stedet for at skrive den samme kode flere gange
- Gøre programmer lettere at læse og vedligeholde
- Opdele komplekse problemer i mindre, håndterbare dele

== Hvad er en metode?

Tænk på en metode som en mini-program inden i dit program. Ligesom en opskrift har et navn og beskriver en række trin, har en metode et navn og indeholder kode, der udfører en specifik opgave.

```java
public class CakeRecipe {
    public static void main(String[] args) {
        System.out.println("Afmål 300 g smør");
        System.out.println("Put det i skålen");
        System.out.println("Afmål 200 g sukker");
        System.out.println("Put det i skålen");
        System.out.println("Afmål 100 g mel");
        System.out.println("Put det i skålen");
        System.out.println("Pisk æggehvider fra 3 æg");
        System.out.println("Put det i skålen");
        System.out.println("Put dejen i en bageform");
        System.out.println("Bag i ovnen i 30 minutter");
    }
}
```

I eksemplet ovenfor gentager vi konstant "Put det i skålen". Dette kunne vi gøre mere effektivt med metoder.

== Oprettelse af metoder

En metode i Java har følgende struktur:

```java
public static returtype metodenavn(parametertype parameternavn) {
    // kode der skal udføres
    return værdi; // kun hvis returtype ikke er void
}
```

Lad os se på et simpelt eksempel:

```java
public static void sayHello() {
    System.out.println("Hej!");
}
```

- `public static` - nøgleord der fortæller Java hvordan metoden kan bruges
- `void` - betyder at metoden ikke returnerer en værdi
- `sayHello` - navnet på metoden
- `()` - parenteser til parametre (tomme i dette tilfælde)

#exercise(title: "Brød-opskrift")[
  Lav et program der udskriver en brød-opskrift. Start med at skrive hele opskriften i `main`-metoden:

  ```
  Tilsæt 300 ml. vand til skålen
  Tilsæt 10 g. gær til skålen
  Tilsæt 500 g. hvedemel til skålen
  Ælt dejen i 5 minutter
  Lad dejen hæve i 1 time
  Ælt dejen i 5 minutter
  Lad dejen hæve i 1 time
  Ælt dejen i 5 minutter
  Lad dejen hæve i 1 time
  Tilsæt 10 g. salt til skålen
  Ælt dejen i 5 minutter
  Lad dejen hæve i 1 time
  Form dejen til et brød
  Bag brødet i ovnen ved 220 grader i 30 minutter
  ```

  Læg mærke til de gentagne trin. Lav metoder for de dele der gentager sig, f.eks. `eltDejen()` og `ladDejenHaeve()`.
]

== Parametre og argumenter

Metoder bliver endnu mere nyttige når de kan modtage input i form af parametre:

```java
public static void greet(String name) {
    System.out.println("Hej, " + name + "!");
}

public static void main(String[] args) {
    greet("Anna");
    greet("Peter");
}
```

Her har metoden `greet` en parameter `name` af typen `String`. Når vi kalder metoden, sender vi et argument (f.eks. "Anna") som bliver tildelt til parameteren.

== Returværdier

Metoder kan returnere en værdi ved hjælp af `return`-nøgleordet:

```java
public static int add(int a, int b) {
    return a + b;
}

public static void main(String[] args) {
    int result = add(5, 3);
    System.out.println("Resultatet er: " + result);
}
```

Når en metode returnerer en værdi, skal vi specificere returtypen (i dette tilfælde `int`) i stedet for `void`.

#exercise(title: "Returtyper")[
  Udfyld de manglende returtyper i følgende metoder:

  ```java
  public static ??? add(int a, int b) {
      return a + b;
  }

  public static ??? add(double a, double b) {
      return a + b;
  }

  public static ??? isWeekend(int dayOfWeek) {
      return dayOfWeek == 6 || dayOfWeek == 7;
  }

  public static ??? fullName(String firstName, String lastName) {
      return firstName + " " + lastName;
  }

  public static ??? greet(String name) {
      System.out.println("Hello, " + name + "!");
  }
  ```
]

== Forskellige typer af metoder

=== Void-metoder
Metoder der ikke returnerer en værdi bruger `void` som returtype:

```java
public static void printWelcome() {
    System.out.println("Velkommen til programmet!");
}
```

=== Metoder med returværdi
Metoder der beregner og returnerer en værdi:

```java
public static double calculateBMI(double weight, double height) {
    return weight / (height * height);
}
```

=== Metoder med flere parametre
Metoder kan have mange parametre:

```java
public static void printPersonInfo(String name, int age, String city) {
    System.out.println(name + " er " + age + " år og bor i " + city);
}
```

== Formateret udskrift med printf

Indtil nu har vi brugt `System.out.println` til at udskrive tekst. For mere præcis formatering kan vi bruge `System.out.printf`:

```java
String name = "Benny";
int age = 25;
double height = 1.75455;
System.out.printf("%s på %d år er %.2f m høj%n", name, age, height);
```

Dette udskriver: "Benny på 25 år er 1.75 m høj"

Formatstrenge:
- `%s` - String
- `%d` - heltal (int)
- `%.2f` - decimal med 2 decimaler
- `%10.2f` - decimal med 2 decimaler i et felt på 10 tegn
- `%n` - ny linje

#exercise(title: "Formateret prisudskrift")[
  Brug `printf` til at udskrive følgende formateret:
  ```
  Pizza Margherita:  89,00 kr
  Pizza Pepperoni:   99,00 kr
  Pizza Portobello:  69,50 kr
  ```
]

== Børnesangsgenerator

Mange børnesange har vers der gentager sig med få ændringer. "Jens Hansens bondegård" er et godt eksempel, hvor hvert vers har et dyr og dets lyde.

```java
public static void generateVerse(String animal, String sound) {
    System.out.println("På Jens Hansens bondegård");
    System.out.println("Er der en " + animal);
    System.out.println("Som laver " + sound + ", " + sound);
    System.out.println("Hele dagen lang");
    System.out.println();
}

public static void main(String[] args) {
    generateVerse("hest", "prr-prr");
    generateVerse("ko", "muh-muh");
    generateVerse("gris", "øf-øf");
}
```

== Math-klassen

Java har en indbygget `Math`-klasse med mange nyttige matematiske metoder:

```java
double result1 = Math.sqrt(16);      // Kvadratrod: 4.0
double result2 = Math.pow(2, 3);     // 2 i 3. potens: 8.0
double result3 = Math.abs(-5);       // Absolut værdi: 5.0
double result4 = Math.max(10, 20);   // Største værdi: 20.0
double result5 = Math.min(10, 20);   // Mindste værdi: 10.0
```

== Escape-tegn i strings

Nogle gange skal vi bruge specielle tegn i strings:

```java
System.out.println("Han sagde \"Hej!\"");           // Anførselstegn
System.out.println("Første linje\nAnden linje");     // Ny linje
System.out.println("Tab\tmellemrum");               // Tabulator
System.out.println("Backslash: \\");               // Backslash
```

#exercise(title: "Email-brevfletning")[
  Lav en metode der kan generere personlige emails:

  ```java
  public static void generateEmail(String name, String product, double price) {
      // Generer en email der hilser på personen og fortæller om produktet
  }
  ```

  Metoden skal udskrive en email som:
  ```
  Kære [navn],

  Vi har et særligt tilbud på [produkt] til kun [pris] kr.

  Venlig hilsen,
  Webshop Team
  ```
]

== Metoders fordele

Metoder giver os flere fordele:

1. *Genbrugelighed*: Vi kan kalde den samme metode mange steder
2. *Læsbarhed*: Koden bliver lettere at forstå når den er opdelt i logiske dele
3. *Vedligeholdelse*: Ændringer skal kun laves ét sted
4. *Testing*: Hver metode kan testes separat
5. *Abstraktion*: Vi kan skjule komplekse detaljer bag simple metodekald

#note[
  Når du nævner en metode, skal du altid inkludere parenteserne, selv hvis den ikke har parametre. Skriv `sayHello()` i stedet for bare `sayHello`.
]

== Sammenfatning

Metoder er fundamentale byggeklodser i Java-programmering. De gør det muligt at:
- Organisere kode i genbrugelige blokke
- Modtage input gennem parametre
- Returnere resultater
- Formatere output præcist med printf
- Arbejde med matematiske funktioner gennem Math-klassen

I næste kapitel vil vi lære om input og hvordan vi kan læse data fra brugeren for at gøre vores programmer mere interaktive.