---
title: 06 - Løkker, Strings og rekursion
---
<!-- .slide: class="cover-1" -->

# Løkker og strenge

---
<!-- .slide: class="k-sunlit-energy" -->

## Program

- Løkker, Rekursion og mere om `String`'s
- Øvelser
- Opsamling

---
<!-- .slide: class="cover-15" -->
# Løkker

--

I dag skal vi lære om **løkker**

--

Ikke den slags *Løkke*

![Lille-lars fra Græsted](img/lille-lars.png)

--

Hvad er en **løkke** (eng: loop)?   
   
Lad os starte med et eksempel:

--
<!-- .slide: class="k-sunlit-energy" -->
# Demo: Vejrtrækningsøvelse

--

```java
public class Main {
    public static void main(String[] args) {
        System.out.println("1. Træk vejret langsomt ind");
        System.out.println("2. Hold vejret");
        System.out.println("3. Pust langsomt ud");
        System.out.println("4. Hold vejret");
        
        System.out.println("1. Træk vejret langsomt ind");
        System.out.println("2. Hold vejret");
        System.out.println("3. Pust langsomt ud");
        System.out.println("4. Hold vejret");
        // ...
    }
}
```
Notes:
- et eksempel hvor vi har brug for at gentage printning af noget
- vejrtrækningsøvelsesprogram: 10 repetitioner
- vis eksempel på at det er kedeligt at skrive det 10 gange
- vis først uden sleep, så det ikke giver den rigtige effekt

--


```java
public class Main {
    public static void main(String[] args) {
        System.out.println("1. Træk vejret langsomt ind");
        Thread.sleep(4000);
        System.out.println("2. Hold vejret");
        Thread.sleep(4000);
        System.out.println("3. Pust langsomt ud");
        Thread.sleep(4000);
        System.out.println("4. Hold vejret");
        Thread.sleep(4000);
        System.out.println("1. Træk vejret langsomt ind");
        Thread.sleep(4000);
        System.out.println("2. Hold vejret");
        Thread.sleep(4000);
        System.out.println("3. Pust langsomt ud");
        Thread.sleep(4000);
        System.out.println("4. Hold vejret");
        Thread.sleep(4000);
        // ...
    }
}
```

--

Vi har lært at lave metoder, for at undgå gentagelse af kode (DRY: Don't Repeat Yourself)

```java
public class Main {
    public static void main(String[] args) {
        breathCycle();
        breathCycle();
        // ...
    }
    public static void breathCycle() {
        System.out.println("1. Træk vejret langsomt ind");
        Thread.sleep(4000);
        System.out.println("2. Hold vejret");
        Thread.sleep(4000);
        System.out.println("3. Pust langsomt ud");
        Thread.sleep(4000);
        System.out.println("4. Hold vejret");
        Thread.sleep(4000);
    }
}
```

---
<!-- .slide: class="k-sunlit-energy" -->
# Demo: Repetition vha. løkke

--

```java
int repetitions = 10;

while (repetitions > 0) {
    breathCycle();
}
```

Notes:
- Hvad sker der her?
- Vi har lavet en uendelig løkke, fordi `repetitions` aldrig bliver mindre end 0
- Vi skal huske at ændre `repetitions` inde i løkken, så den til sidst bliver 0
- Nu vil løkken køre 10 gange og så stoppe

--

```java [3,6|4,5]
int repetitions = 10;

while (repetitions > 0) {
  breathCycle();
  repetitions = repetitions - 1;
}
```

--

```java [3,6|4,5]
int repetitions = 10;

while (repetitions > 0) {
  breathCycle();
  repetitions--;
}
```

---
<!-- .slide: class="cover-9" -->

# Anvendelser

--

Vi kan bruge en løkke til:
- at gøre noget et **antal gange**
- at gøre noget **indtil** en bestemt tilstand er opnået
- at gennemløbe en **liste** (fx en String)
- at blive ved med at spørge brugeren om input, indtil det er gyldigt

--

# Input-validering vha. en løkke

```java
Scanner scanner = new Scanner(System.in);
int age = -1;
while (age < 0 || age > 100) {
    System.out.print("Indtast din alder: ");
    age = scanner.nextInt();
}
System.out.println("Din alder er: " + age);
```

Det skal vi lære mere om i næste gang.

--

En `String` er en liste af `char`-værdier

```java
String name = "Lars";
char firstChar = name.charAt(0); // 'L'
char secondChar = name.charAt(1); // 'a'
char thirdChar = name.charAt(2); // 'r'
char fourthChar = name.charAt(3); // 's'
```

--

Vi kan bruge en løkke til at gennemløbe en String

```java
String name = "Lars";
int length = name.length();
int index = 0;

while (index < length) {
    char c = name.charAt(index);
    System.out.println(c);
    index++;
}
```
Notes:
- Gennemløber strengen "Lars" og printer hvert tegn på en ny linje
- Næste gang skal vi se på en mere kompakt måde at gøre dette på med en `for`-løkke

---

# Uendelige løkker

--
<!-- .slide: class="ek-sunlit-energy" -->

# Demo: Uendelig løkke

--

```java
while (true) {
    breathCycle();
}
```

--

Vi kan stoppe programmet med en **Ctrl + C** i terminalen eller ved at stoppe det i IntelliJ

--

Eller vi kan stoppe med et `break`-statement:

```java
int repetitions = 10;

while (true) {
    breathCycle();
    
    if (repetitions == 0) {
        break;
    }

    repetitions = repetitions - 1;
}
```

--

En uendelig løkke kan være nyttig, fx
- i spil, hvor spillet skal køre indtil brugeren lukker det ned
- i servere, der skal køre og lytte efter beskeder hele tiden

--

Der er andre måder at ende i en uendelig løkke på
```java
public static void breathCycle() {
    System.out.println("1. Træk vejret langsomt ind");
    System.out.println("2. Hold vejret");
    System.out.println("3. Pust langsomt ud");
    System.out.println("4. Hold vejret");
    
    breathCycle(); // rekursion
}
```

---
<!-- .slide: class="cover-5" -->
# Rekusion

> Når en metode kalder sig selv

--

```java
public static void countDown(int n) {
    if (n <= 0) {
        System.out.println("Liftoff!");
    }
    
    System.out.println(n);
    countDown(n - 1);
}
```

som vi kan kalde med

```java
countDown(10);
```

---

<!-- .slide: class="k-sunlit-energy" -->
Tre ting du tager med fra fra i dag?