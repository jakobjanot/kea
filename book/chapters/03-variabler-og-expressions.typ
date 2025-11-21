#import "../style.typ": *

= Variabler og expressions

== Programmer som opskrifter

Et program er ligesom en *opskrift* - en liste af trin der skal følges i rækkefølge. Computeren læser opskriften og udfører hvert trin efter hinanden.

Lad os se på et eksempel med en omelet-opskrift:

```java
public class OmeletOpskrift {
    // Opskrift på omelet til 1 person
    public static void main(String[] args) {
        System.out.println("2 æg slås ud i en skål");
        System.out.println("2 æg piskes sammen");
        System.out.println("Mælk tilsættes");
        System.out.println("Salt tilsættes");
        // System.out.println("Chili tilsættes");
        System.out.println("Steg omeletten på panden");
    }
}
```

=== Statements og kommentarer

Et *statement* er en instruktion som computeren skal udføre. I Java slutter alle statements med semikolon (`;`):

```java
System.out.println("Steg på en pande");
```

En *kommentar* er tekst som bliver ignoreret af computeren. Kommentarer starter med `//` og fortsætter til slutningen af linjen:

```java
// Dette er en kommentar
System.out.println("Dette er et statement");
```

Kommentarer er nyttige til:
- At forklare hvad koden gør
- At "slå en linje fra" så den ikke bliver udført

#exercise(title: "ASCII Art")[
Konsol-applikationer består udelukkende af tekst. I monospace-fonte (kode-fonte) er alle tegn samme bredde, hvilket gør det muligt at lave "grafik" med tekst.

1. Lav et nyt Java-projekt kaldet `asciiart`
2. Opret en klasse kaldet `AsciiArt` med en `main` metode
3. Brug `System.out.println` til at printe følgende ASCII art:

```txt
#     #                            
#     # ###### #      #       #### 
#     # #      #      #      #    #
####### #####  #      #      #    #
#     # #      #      #      #    #
#     # #      #      #      #    #
#     # ###### ###### ######  ####
```

4. Prøv at sammensætte flere linjer til én streng:
```java
String lines = "Første linje\n" +
               "Anden linje\n" +
               "Tredje linje";
System.out.println(lines);
```
]

== Variabler - opbevaring af data

En variabel er som en "boks" i computerens hukommelse, hvor du kan gemme data. Dette gør det muligt at genbruge værdier og gøre programmer mere fleksible.

Forestil dig at vi skal lave omelet til flere personer. I stedet for at skrive "2 æg" igen og igen, kan vi gemme antallet i en variabel:

```java
public class FlexibelOmelet {
    public static void main(String[] args) {
        int eggs = 2;  // Antal æg til 1 person
        
        System.out.println("Ingredienser:");
        System.out.println("Æg (stk): " + eggs);
        
        System.out.println(eggs + " æg slås ud i en skål");
        System.out.println(eggs + " æg piskes sammen");
        System.out.println("Mælk tilsættes");
        System.out.println("Salt tilsættes");
        System.out.println("Steg omeletten på panden");
    }
}
```

=== Datatyper

Java har forskellige typer af data, som hver har deres egen datatype:

==== Heltal (int)
```java
int age = 25;
int numberOfStudents = 30;
```

==== Decimaltal (double)
```java
double price = 19.95;
double temperature = 23.5;
```

==== Tegn (char)
```java
char grade = 'A';
char firstLetter = 'J';
```

==== Tekst (String)
```java
String name = "Anders";
String city = "København";
```

==== Sand/falsk (boolean)
```java
boolean isStudent = true;
boolean hasPassed = false;
```

=== Variabel-erklæring

For at oprette en variabel skal du:
1. Angive datatypen
2. Give variablen et navn
3. Tildele en værdi (valgfrit)

```java
// Erklæring med tildeling
int numberOfCars = 5;

// Erklæring uden tildeling
int numberOfBikes;
numberOfBikes = 3;  // Tildeling senere
```

#exercise(title: "Om mig")[
1. Lav et nyt Java-projekt kaldet `about-me`
2. Opret en klasse kaldet `AboutMe` med en `main` metode
3. Erstat `???` med værdier der passer til dig:

```java
public class AboutMe {
    public static void main(String[] args) {
        String familyName = ???;           // Dit efternavn
        char givenNameInitial = ???;       // Første bogstav i dit fornavn
        boolean isCoffeeDrinker = ???;     // Drikker du kaffe?
        boolean isTeaDrinker = ???;        // Drikker du te?

        System.out.println("Navn: " + givenNameInitial + ". " + familyName);
        System.out.println("Kaffe? " + isCoffeeDrinker);
        System.out.println("Te? " + isTeaDrinker);
    }
}
```
]

== Expressions - beregninger og sammensætninger

Et *expression* er noget der evalueres til en værdi. Dette kan være:

=== Aritmetiske expressions
```java
int sum = 5 + 3;        // Addition
int difference = 10 - 4; // Subtraktion
int product = 6 * 7;     // Multiplikation
int quotient = 15 / 3;   // Division
int remainder = 17 % 5;  // Modulo (rest)
```

=== String sammensætning
```java
String firstName = "Anders";
String lastName = "Jensen";
String fullName = firstName + " " + lastName;  // "Anders Jensen"
```

=== Blanding af typer
```java
String message = "Jeg er " + 25 + " år gammel";  // "Jeg er 25 år gammel"
```

#exercise(title: "Fødselsdags-beregner")[
1. Lav et nyt Java-projekt kaldet `birthyear-calculator`
2. Opret en klasse med en `main` metode
3. Brug variabler til at beregne dit fødselsår baseret på din alder:

```java
int currentYear = 2024;
int myAge = ???;  // Din alder
int birthYear = currentYear - myAge;

System.out.println("Jeg er " + myAge + " år gammel");
System.out.println("Jeg blev født i " + birthYear);
```
]

== Navngivning af variabler

Gode variabelnavne er vigtige for læsbar kode:

=== Regler for variabelnavne
- Må ikke starte med et tal
- Må ikke indeholde mellemrum
- Må ikke være reserverede ord (fx `int`, `class`)
- Skelner mellem store og små bogstaver

=== Konventioner
```java
// Brug camelCase for variabelnavne
int numberOfStudents;
String firstName;
boolean isCompleted;

// Vær beskrivende
int n;              // Dårligt - hvad er n?
int studentCount;   // Godt - klart hvad det er
```

#exercise(title: "Cookies beregning")[
1. Lav et program der beregner hvor mange cookies der skal laves
2. Brug følgende variabler:
   - Antal gæster
   - Cookies per person
   - Total antal cookies

```java
int guests = 8;
int cookiesPerPerson = 3;
int totalCookies = guests * cookiesPerPerson;

System.out.println("Vi har " + guests + " gæster");
System.out.println("Hver skal have " + cookiesPerPerson + " cookies");
System.out.println("Vi skal bage " + totalCookies + " cookies i alt");
```
]

== Ændring af variabel-værdier

Når en variabel er oprettet, kan dens værdi ændres:

```java
int score = 0;
System.out.println("Start score: " + score);  // 0

score = 10;
System.out.println("Ny score: " + score);     // 10

score = score + 5;
System.out.println("Final score: " + score);  // 15
```

#note[
En variabel kan kun indeholde én værdi ad gangen. Når du tildeler en ny værdi, forsvinder den gamle værdi.
]

== Opsummering

I dette kapitel har vi lært:
- Programmer er som opskrifter med trin der udføres i rækkefølge
- Statements er instruktioner til computeren
- Kommentarer forklarer koden og ignoreres af computeren
- Variabler gemmer data i computerens hukommelse
- Java har forskellige datatyper: `int`, `double`, `char`, `String`, `boolean`
- Expressions evalueres til værdier og kan indeholde beregninger
- Gode variabelnavne gør koden lettere at læse og forstå

Med variabler kan vi skrive mere fleksible programmer der kan arbejde med forskellige værdier uden at skulle ændre hele koden.