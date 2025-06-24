---
title: 04#1 - Conditionals og logik
---
<!-- .slide: class="kea-red" -->

# Conditionals og logik

---
<!-- .slide: class="kea-dark" -->

# Program

- 08:30 Conditionals og logik
- 09:30 Igang med øvelser
- 10:00 Pause
- 10:15 Øvelser fortsat
- 11:30 Opsamling, forberedelse til næste gang

---

# Enten/eller - `if` og `else`

--

```java
wakeUp();
work();
goToBed();
```

Notes:
- Indtil nu har vi skrevet programmer, der opfører sig ens hver gang.
- Nu skal vi lave et program, der gør forskellige ting afhængigt af nogle betingelser.
- I eksemplet herover er en normal, lidt kedelig hverdagsdag

--

## Demo - weekend

Notes:
- Lad os lave et program, der ændrer sig afhængigt af om det er hverdag eller weekend.
- Vi kan gøre det med `if`, som betyder **hvis** og `else` som betyder **ellers**.
    ```java
    public class WeekendDemo {
        public static void main(String[] args) {
            boolean isWeekend = true; // Er det weekend?

            wakeUp();
            if (isWeekend) {
                watchNetflix();
            } else {
                commute();
                work();
                commute();
            }
            goToBed();
        }

        public static void wakeUp() {
            System.out.println("Jeg vågner op.");
        }

        public static void watchNetflix() {
            System.out.println("Jeg ser Netflix.");
        }

        public static void work() {
            System.out.println("Jeg arbejder.");
        }

        public static void goToBed() {
            System.out.println("Jeg går i seng.");
        }
    }
    ```
- Læg mærke til, at 
    - `wakeUp()` og `goToBed()` altid udføres, uanset om det er weekend eller ej.
    - `if`-sætningen kun det der er imellem de krøllede parenteser `{}` hvis betingelsen er `true`.
    - altså hvis `isWeekend` er `true`, så udføres det der er i `if`-delen, som i dette tilfælde er `watchNetflix()`.
    - hvis `isWeekend` derimod er `false`, så springer programmet ned til `else`-delens, som udfører `commute()`, `work()` og `commute()`.

--

# Flere betingelser - `else if`

I gamle dage (før aircondition) kunne man få varmefri...

```java
    boolean isWeekend = true; // Er det weekend?
    int temp = 31; // Temperaturen udenfor

    wakeUp();
    if (temp > 40) {
        goToBeach();
    } else if (isWeekend) {
        watchNetflix();
    } else {
        commute();
        work();
        commute();
    }
```

Notes:
- Nogle gange har vi brug for flere betingelser.
- I gamle dage (før aircondition) kunne man få varmefri, hvis temperaturen var over (lad os sige 40 grader)
- Hvis det er varmt er det vel ligegyldigt om det er weekend eller ej, så vil vi gerne på stranden.
- Vi kan lave flere betingelser med `else if`, som betyder **ellers hvis**.
- Her har vi en betingelse, der tjekker om temperaturen er over 40 grader, hvor vi går på stranden, altså `goToBeach()`.
- Hvis temperaturen ikke er over 40 grader, så tjekker vi om det er weekend.
- Hvis det er weekend, så ser vi Netflix, altså `watchNetflix()`.
- Hvis det hverken er varmt eller weekend, så er det almindelig hverdag, og vi pendler til arbejde, arbejder og pendler hjem igen.

# Indlejrede betingelser

I dag kan vi ikke få varmefri, så...

```java
    boolean isWeekend = true; // Er det weekend?
    int temp = 31; // Temperaturen udenfor

    wakeUp();
    if (isWeekend) {
        if (temp > 30) {
            goToBeach();
        } else {
            watchNetflix();
        }
    } else {
        commute();
        work();
        commute();
    }
    goToBed();
```

Notes:
- I dag kan vi ikke få varmefri, så vi kan ikke gå på stranden, hvis det er hverdag
- Men vi kan selv bestemme om vi vil på stranden, hvis det er weekend og jeg har lyst når temperaturen er over 30 grader.
- Derfor er vi nødt til først at tjekke om det er weekend, og hvis det er, så tjekker vi om temperaturen er over 30 grader.
- I så fald går vi på stranden `goToBeach()`, ellers ser vi Netflix `watchNetflix()` afhængigt af om `temp > 30` er `true` eller `false`
- Er det ikke weekend, så er det almindelig hverdag, og vi pendler til arbejde, arbejder og pendler hjem igen.

--

... med mindre det regner - eller jeg er syg

```java
    boolean isWeekend = true; // Er det weekend?
    int temp = 31; // Temperaturen udenfor
    boolean isRaining = true; // Regner det?
    boolean isSick = false; // Er jeg syg?

    wakeUp();
    if (isWeekend) {
        if (temp > 30) {
            if (isRaining) {
                watchNetflix();
            } else {
                if (isSick) {
                    watchNetflix();
                } else {
                    goToBeach();
                }
            }
        } else {
            watchNetflix();
        }
    } else {
        commute();
        work();
        commute();
    }
    goToBed();
```
... argh!

Notes:
- Nåh ja, hvis det regner, bliver vi alligevel hjemme og ser Netflix.
- Hjælp, det bliver hurtigt meget indviklet og svært at læse.

--

> Efterlader denne <strike>verden</strike> koden bedre end jeg fandt den
> - Lord Baden-Powell (grundlægger af spejderbevægelsen)

Notes:
- Ulæselig kode er en kilde til fejl
- og en kilde til frustration for udviklere, der skal vedligeholde koden senere

--

Eller...

> Skriv altid din kode, som om ham, der ender med at vedligeholde den, er en voldelig psykopat, der ved, hvor du bor.
> - Martin Golding

---

# Logiske operatorer

--

Kan I huske, at vi talte om **operatorer** i Java?

- Aritmetiske operatorer: `+`, `-`, `*`, `/`
  - fx. `5 - 3;`
- Sammenligningsoperatorer: `==`, `!=`, `<`, `>`, `<=`, `>=`
  - fx. `temp >= 100;`
- Tildelingsoperatorer: `=`, `+=`, `-=`, `*=`, `/=`
  - fx. `x += 3;`
- Logiske operatorer: `&&`, `||`, `!`
  - fx. `raining || bringingUmbrella;`
--

Logiske operatorer arbejder med værdier, der er enten `true` eller `false`

--

Vi kan kombinere betingelser med logiske operatorer:

Kriterierne for at **se Netflix** er:
- Det er **weekend** 
- **og**
    - Det **regner**
    - Jeg **er syg**
    - Temperaturen er **max 30 grader**

```java
isWeekend && (isRaining || isSick || temp <= 30)
```

--

```java
...
if (isWeekend && (isRaining || isSick || temp <= 30)) {
    watchNetflix();
else if (isWeekend && temp > 30) {
    goToBeach();
} else {
    commute();
    work();
    commute();
}
...
```

--

Nogle gange skal man bare vende logikken om

```java
...
if (!isWeekend) {
    commute();
    work();
    commute();
} else if (isSick || isRaining || temp < 30) {
    watchNetflix();
} else {
    goToBeach();
}
...
```

--

Om et års tid har du glemt, hvorfor `isSick || isRaining || temp < 30` betyder "se Netflix"

--

Navngivning gør det nemmere at forstå

```java
...
...
boolean isBeachWeather = temp > 30 && !isRaining;

if (!isWeekend) {
    commute();
    work();
    commute();
}
else if (isBeachWeather) {
    goToBeach();
} else {
    watchNetflix();
}
...
```

Notes:
- Her har vi lavet en variabel `isBeachWeather`, der gør det nemmere at forstå, hvad betingelsen betyder.
- Det er en god idé at navngive dine betingelser, så de er nemmere at læse og forstå.
- Både for andre, men også for dig selv, når du skal læse koden igen om et stykke tid.

--

Vi kan også lave en metode, der tjekker om det er strandvejr

```java
if (!isWeekend) {
    commute();
    work();
    commute();
}
else if (isBeachWeather(temp, isRaining)) {
    goToBeach();
} else {
    watchNetflix();
}

public static boolean isBeachWeather(int temp, boolean isRaining) {
    return temp > 30 && !isRaining;
}
```

Notes:
- Alternativ, en metode der returnerer en `boolean` værdi, der fortæller om det er strandvejr.
- Det gør koden mere overskuelig, og vi kan genbruge metoden flere steder i koden.

--

Vi *kunne* også bruge `if` og `else` i metoden

```java
public static boolean isBeachWeather(int temp, boolean isRaining) {
    boolean isBeachWeather;
    
    if (temp > 30) {
        if (!isRaining) {
            isBeachWeather = true;
        } else {
            isBeachWeather = false;
        }
    } else {
        isBeachWeather = false;
    }
    return isBeachWeather;
}
```
--

men det er i virkeligheden nemmere "springe ud af funktionen"

```java
public static boolean isBeachWeather(int temp, boolean isRaining) {
    if (temp > 30) {
        if (!isRaining) {
            return true; // varmt og ikke regner
        } else {
            return false; // varmt og regner
        }
    } else {
        return false; // koldt
    }
}
```

--

En endnu mere læsbare måde er at anvende **guards**, her undgår vi helt indlejrede if/else

---

# Guards

```java
public isBeachWeather(int temp, boolean isRaining) {
    if (temp <= 30) {
        return false; // koldt
    }

    if (isRaining) {
        return false; // det regner
    }
    
    return true; // Ellers er det strandvejr
}
```

Notes:
- En anden måde at skrive metoden på, er at bruge såkaldte **guards**.
- En **guard** er en betingelse, der stopper udførelsen af metoden, hvis betingelsen er opfyldt.
- Guards er en god måde at gøre koden mere læsbar på
- Guards viser tydeligt, hvad der skal ske, hvis betingelsen (for strandvejr) er opfyldt
- Her stopper vi metoden, hvis temperaturen er under 30 grader eller det regner.
- Hvis ingen af betingelserne er opfyldt, returnerer vi `true`, hvilket betyder at det er strandvejr.
- Her undgår vi *igen* indlejrede `if`-sætninger, som kan gøre koden sværere at læse.

---

# Switch
```java
public static boolean isWeekend(dayOfWeek) {
    boolean isWeekend;

    switch (dayOfWeek) {
        case "Monday":
            isWeekend = false;
            break;
        case "Tuesday":
            isWeekend = false;
            break;
        case "Wednesday":
            isWeekend = false;
            break;
        case "Thursday":
            isWeekend = false;
            break;
        case "Friday":
            isWeekend = false;
            break;
        case "Saturday":
            isWeekend = true;
            break;
        case "Sunday":
            isWeekend = true;
            break;
        default:
            System.out.println("Ugyldig ugedag: " + dayOfWeek);
            isWeekend = false; // Antager at det ikke er weekend for ugyldige dages
            break;
    }
    return isWeekend;
}
```