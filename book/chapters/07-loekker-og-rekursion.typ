#import "../style.typ": *

= Løkker og Rekursion

Indtil nu har vi skrevet programmer hvor hver linje kode bliver udført præcis én gang. Men ofte har vi brug for at gentage den samme kode flere gange. Det er her løkker kommer ind i billedet.

En løkke er en programmeringsstruktur, der gør det muligt at gentage en blok af kode flere gange. Dette sparer os for at skrive den samme kode igen og igen, og gør det muligt at håndtere opgaver der kræver gentagelse.

== Hvorfor løkker?

Forestil dig at du skal lave en vejrtrækningsøvelse, hvor hver cyklus består af fire trin:

```java
public class BreathingExercise {
    public static void main(String[] args) {
        System.out.println("1. Træk vejret langsomt ind");
        System.out.println("2. Hold vejret");
        System.out.println("3. Pust langsomt ud");
        System.out.println("4. Hold vejret");
        
        System.out.println("1. Træk vejret langsomt ind");
        System.out.println("2. Hold vejret");
        System.out.println("3. Pust langsomt ud");
        System.out.println("4. Hold vejret");
        
        // ... gentag 8 gange mere?
    }
}
```

Som du kan se, bliver dette hurtigt kedeligt og upraktisk. Hvad hvis vi skal gentage det 100 gange?

Med metoder kan vi gøre det lidt bedre:

```java
public static void breathCycle() {
    System.out.println("1. Træk vejret langsomt ind");
    System.out.println("2. Hold vejret");
    System.out.println("3. Pust langsomt ud");
    System.out.println("4. Hold vejret");
}

public static void main(String[] args) {
    breathCycle();
    breathCycle();
    breathCycle();
    // ... stadig meget kedeligt
}
```

Men med løkker kan vi gøre det meget nemmere!

== While-løkker

En `while`-løkke gentager en blok af kode så længe en betingelse er sand.

```java
while (betingelse) {
    // kode der skal gentages
}
```

Lad os bruge dette til vejrtrækningsøvelsen:

```java
public static void main(String[] args) {
    int repetitions = 10;
    
    while (repetitions > 0) {
        breathCycle();
        repetitions = repetitions - 1;
    }
}
```

#note[
Husk at ændre variablen der bruges i betingelsen (her `repetitions`) inde i løkken, ellers får du en uendelig løkke!
]

=== While-løkke struktur

En while-løkke har tre vigtige dele:

1. *Initialisering* - sæt startværdier før løkken
2. *Betingelse* - tjek om løkken skal fortsætte
3. *Opdatering* - ændr variabler inde i løkken

```java
int counter = 0;                    // 1. Initialisering
while (counter < 5) {               // 2. Betingelse
    System.out.println(counter);
    counter++;                      // 3. Opdatering
}
```

#exercise(title: "Gæt et tal")[
Lav et program hvor brugeren skal gætte et hemmeligt tal:

1. Sæt et hemmeligt tal (f.eks. 42)
2. Bed brugeren om at gætte
3. Hvis gættet er forkert, bed dem prøve igen
4. Fortsæt indtil de gætter rigtigt
5. Udskriv hvor mange forsøg det tog

Brug Scanner til at læse input fra brugeren.
]

== For-løkker

Når vi ved præcis hvor mange gange noget skal gentages, er `for`-løkker ofte mere praktiske:

```java
for (int i = 0; i < 10; i++) {
    breathCycle();
}
```

En for-løkke har tre dele adskilt af semikolon:

1. *Initialisering* (`int i = 0`) - udføres én gang før løkken starter
2. *Betingelse* (`i < 10`) - tjekkes før hver iteration
3. *Opdatering* (`i++`) - udføres efter hver iteration

=== For-løkke variationer

Du kan tælle på mange måder:

```java
// Tæl op fra 0 til 9
for (int i = 0; i < 10; i++) {
    System.out.println(i);
}

// Tæl ned fra 10 til 1
for (int i = 10; i > 0; i--) {
    System.out.println(i);
}
System.out.println("Lift off!");

// Tæl med andre intervaller (lige tal)
for (int i = 0; i < 20; i += 2) {
    System.out.println(i);
}

// Tæl gennem bogstaver
for (char c = 'A'; c <= 'Z'; c++) {
    System.out.print(c + " ");
}
```

#exercise(title: "7-tabellen")[
Lav et program der udskriver 7-tabellen:

1. Udskriv tallene 7, 14, 21, ..., 70
2. Formatér det som "1 * 7 = 7", "2 * 7 = 14", osv.
3. Brug `printf` til at få kolonnerne til at stå pænt:
   ```
    1 * 7 =  7
    2 * 7 = 14
    3 * 7 = 21
   ...
   10 * 7 = 70
   ```
4. Udvid til at vise alle tabeller fra 1 til 10
]

== Tilfældige tal med Random

Java's `Random` klasse gør det muligt at generere tilfældige tal:

```java
import java.util.Random;

public class RandomExample {
    public static void main(String[] args) {
        Random random = new Random();
        
        int randomNumber = random.nextInt(100);     // 0-99
        int diceRoll = random.nextInt(6) + 1;       // 1-6
        double randomDouble = random.nextDouble();   // 0.0-1.0
        boolean coinFlip = random.nextBoolean();    // true/false
    }
}
```

#exercise(title: "Gæt et random tal")[
Udvid dit "gæt et tal" program:

1. Lad computeren vælge et tilfældigt tal mellem 1 og 100
2. Giv brugeren hints ("for højt" eller "for lavt")
3. Tæl antallet af forsøg
4. Eksperimenter med seeds: `new Random(123)` - hvad sker der?
]

== Indlejrede løkker

Du kan have løkker inden i andre løkker. Dette er nyttigt til at arbejde med todimensionale strukturer:

```java
// Udskriv en multiplikationstabel
for (int row = 1; row <= 10; row++) {
    for (int col = 1; col <= 10; col++) {
        System.out.printf("%4d", row * col);
    }
    System.out.println(); // Ny linje efter hver række
}
```

#exercise(title: "Sten-saks-papir")[
Lav et sten-saks-papir spil:

1. Brugeren vælger sten (1), saks (2) eller papir (3)
2. Computeren vælger tilfældigt
3. Bestem vinderen
4. Spørg om brugeren vil spille igen
5. Tæl hvor mange gange hver spiller vinder
]

== Løkker med Strings

Løkker er særligt nyttige til at arbejde med strings:

```java
String text = "Hello, World!";

// Udskriv hvert tegn på en separat linje
for (int i = 0; i < text.length(); i++) {
    char c = text.charAt(i);
    System.out.println(c);
}

// Tæl hvor mange gange hvert bogstav forekommer
for (char letter = 'a'; letter <= 'z'; letter++) {
    int count = 0;
    for (int i = 0; i < text.length(); i++) {
        if (Character.toLowerCase(text.charAt(i)) == letter) {
            count++;
        }
    }
    if (count > 0) {
        System.out.println(letter + ": " + count);
    }
}
```

=== String metoder til løkker

```java
String text = "Hello World";

// Længde af string
int length = text.length();

// Få tegn på position i
char c = text.charAt(i);

// Del af string (substring)
String part = text.substring(0, 5); // "Hello"

// Find position af tegn/string
int pos = text.indexOf('o');        // 4

// Konverter til store/små bogstaver
String upper = text.toUpperCase();
String lower = text.toLowerCase();
```

#exercise(title: "Palindrom checker")[
Lav et program der tjekker om et ord er et palindrom (læses ens forfra og bagfra):

1. Læs et ord fra brugeren
2. Sammenlign første bogstav med sidste, andet med næstsidste, osv.
3. Udskriv om ordet er et palindrom
4. Test med ord som "racecar", "hello", "radar"
]

== Sum og gennemsnit med løkker

Løkker er perfekte til beregninger over flere værdier:

```java
// Beregn sum af tal fra 1 til 100
int sum = 0;
for (int i = 1; i <= 100; i++) {
    sum += i;
}
System.out.println("Sum: " + sum);

// Beregn gennemsnit af karakterer
double[] grades = {7, 4, 10, 12, 2, 7, 10};
double sum = 0;
for (int i = 0; i < grades.length; i++) {
    sum += grades[i];
}
double average = sum / grades.length;
System.out.println("Gennemsnit: " + average);
```

#exercise(title: "Diplomberegning")[
Lav et program der beregner et uddannelsesdiplom:

1. Definer karakterer for forskellige fag
2. Beregn gennemsnittet
3. Bestem om den studerende består (gennemsnit >= 2.0)
4. Udskriv et pænt diplom

Bonus: Beregn vægtet gennemsnit hvor forskellige fag har forskellige ECTS point.
]

== Hvornår bruger man hvilken løkke?

- *For-løkker*: Når du ved præcis hvor mange gange noget skal gentages
  - Tælle fra 1 til 10
  - Gå gennem hvert tegn i en string
  - Bearbejde alle elementer i et array

- *While-løkker*: Når du ikke ved hvor mange gange det skal gentages
  - Læs input indtil brugeren skriver "quit"
  - Gæt et tal indtil det er rigtigt
  - Fortsæt indtil en betingelse er opfyldt

== Uendelige løkker og fejlsøgning

Pas på uendelige løkker! Disse opstår når betingelsen aldrig bliver falsk:

```java
// FARLIGT - uendelig løkke!
int i = 0;
while (i < 10) {
    System.out.println(i);
    // Glemte at øge i!
}

// OGSÅ FARLIGT
for (int i = 0; i < 10; i--) {  // Tæller nedad i stedet for op!
    System.out.println(i);
}
```

Hvis dit program "hænger", er det sandsynligvis en uendelig løkke. Du kan stoppe programmet med Ctrl+C i terminalen.

== Rekursion - en alternativ tilgang

Rekursion er når en metode kalder sig selv. Det kan nogle gange erstatte løkker:

```java
public static void countdown(int n) {
    if (n <= 0) {
        System.out.println("Lift off!");
    } else {
        System.out.println(n);
        countdown(n - 1);  // Metoden kalder sig selv
    }
}
```

Rekursion kræver altid:
1. En *base case* - betingelse for hvornår rekursionen stopper
2. Et *recursive call* - metoden kalder sig selv med ændrede parametre

#note[
Rekursion er kraftfuld, men kan være svær at forstå i begyndelsen. Start med løkker og kom tilbage til rekursion senere.
]

== Sammenfatning

Løkker er et af de vigtigste værktøjer i programmering. De gør det muligt at:

- Gentage kode effektivt uden duplikering
- Arbejde med samlinger af data
- Lave interaktive programmer der kører indtil brugeren stopper
- Beregne værdier over mange elementer

*For-løkker* er bedst når du ved hvor mange gange noget skal gentages.
*While-løkker* er bedst når du skal fortsætte indtil en betingelse er opfyldt.

I næste kapitel vil vi lære om arrays, som giver os mulighed for at gemme og bearbejde mange værdier på én gang - perfect til brug med løkker!