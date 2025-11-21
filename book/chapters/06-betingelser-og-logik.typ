#import "../style.typ": *

= Betingelser og Logik

Indtil nu har vores programmer udført det samme hver gang vi kørte dem. Men programmer bliver først virkelig kraftfulde når de kan træffe beslutninger og reagere forskelligt afhængigt af situationen. Det er her betingelser kommer ind i billedet.

Betingelser gør det muligt for programmer at:
- Reagere på brugerinput
- Håndtere forskellige scenarier
- Træffe "intelligente" beslutninger
- Undgå fejl ved at tjekke værdier først

== If-statements - grundlæggende beslutninger

Det mest grundlæggende værktøj til beslutninger er `if`-statements. Tænk på det som "hvis... så...":

```java
boolean isWeekend = true;

if (isWeekend) {
    System.out.println("Jeg ser Netflix!");
}
```

Hvis betingelsen i parenteserne er `true`, udføres koden i de krøllede parenteser. Hvis den er `false`, springes blokken over.

=== If-else statements

Ofte vil vi gøre noget andet, hvis betingelsen ikke er opfyldt:

```java
public class WeekendRoutine {
    public static void main(String[] args) {
        boolean isWeekend = false;
        
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
        System.out.println("Jeg vågner op");
    }
    
    public static void watchNetflix() {
        System.out.println("Jeg ser Netflix");
    }
    
    public static void work() {
        System.out.println("Jeg arbejder");
    }
    
    public static void commute() {
        System.out.println("Jeg pendler");
    }
    
    public static void goToBed() {
        System.out.println("Jeg går i seng");
    }
}
```

Læg mærke til at `wakeUp()` og `goToBed()` altid udføres, uanset om det er weekend eller ej.

#exercise(title: "Porto beregner")[
Lav en portoberegner for PostNord:
- Op til 1 kg: 60 kr
- Op til 2 kg: 65 kr  
- Op til 5 kg: 70 kr
- Op til 10 kg: 90 kr
- Op til 20 kg: 160 kr

1. Start med hardcoded vægte og test forskellige scenarier
2. Udvid så brugeren kan indtaste vægten via Scanner
3. Håndter vægte over 20 kg med en fejlbesked
]

== Else-if - flere betingelser

Når vi har flere mulige scenarier, bruger vi `else if`:

```java
int temperature = 35;
boolean isWeekend = true;

wakeUp();

if (temperature > 40) {
    goToBeach();  // Varmefri!
} else if (isWeekend) {
    watchNetflix();
} else {
    commute();
    work();
    commute();
}

goToBed();
```

Java tjekker betingelserne i rækkefølge og udfører den første der er `true`. Resten springes over.

== Indlejrede betingelser

Vi kan have if-statements inden i andre if-statements:

```java
boolean isWeekend = true;
int temperature = 31;
boolean isRaining = false;
boolean isSick = false;

wakeUp();

if (isWeekend) {
    if (temperature > 30) {
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

#note[
Mange indlejrede if-statements kan gøre koden svær at læse. Vi lærer snart bedre måder at organisere kompleks logik.
]

== Sammenligningsoperatorer

For at lave betingelser bruger vi sammenligningsoperatorer:

```java
int age = 20;
double price = 99.99;
String name = "Anna";

// Lighed og ulighed
boolean isAdult = (age == 18);        // false
boolean isNotChild = (age != 5);      // true

// Numeriske sammenligninger
boolean canDrive = (age >= 18);       // true
boolean isExpensive = (price > 100);  // false
boolean isCheap = (price <= 50);      // false

// String sammenligning
boolean isAnna = name.equals("Anna"); // true - VIGTIGT!
boolean isNotBob = !name.equals("Bob"); // true
```

#note[
Brug altid `.equals()` til at sammenligne strings, ikke `==`. Operatoren `==` sammenligner kun referencer, ikke indhold.
]

== Logiske operatorer

Vi kan kombinere flere betingelser med logiske operatorer:

=== AND-operator (`&&`)
Begge betingelser skal være sande:

```java
boolean canVote = (age >= 18) && (hasCitizenship);
boolean isWorkDay = !isWeekend && !isHoliday;
```

=== OR-operator (`||`)
Mindst én betingelse skal være sand:

```java
boolean needsUmbrella = isRaining || isSnowing;
boolean getDiscount = isMember || hasValidCoupon;
```

=== NOT-operator (`!`)
Vender en boolean værdi om:

```java
boolean isNotWeekend = !isWeekend;
boolean isAwake = !isSleeping;
```

=== Komplekse udtryk
Vi kan kombinere flere operatorer:

```java
boolean goToBeach = isWeekend && (temperature > 25) && !isRaining && !isSick;
```

Brug parenteser til at gøre rækkefølgen tydelig!

== Forbedring af læsbarhed

Komplekse betingelser kan gøres mere læselige på flere måder:

=== Navngivne variabler
```java
// Svært at læse
if (isWeekend && (isRaining || isSick || temperature <= 30)) {
    watchNetflix();
}

// Lettere at læse
boolean stayInside = isRaining || isSick || temperature <= 30;
if (isWeekend && stayInside) {
    watchNetflix();
}
```

=== Metoder der returnerer boolean
```java
public static boolean isBeachWeather(int temp, boolean isRaining) {
    return temp > 30 && !isRaining;
}

// I main metoden
if (isWeekend && isBeachWeather(temperature, isRaining)) {
    goToBeach();
}
```

=== Guard clauses
I stedet for indlejrede if-statements kan vi bruge "guards":

```java
public static boolean isBeachWeather(int temp, boolean isRaining) {
    if (temp <= 30) {
        return false;  // For koldt
    }
    
    if (isRaining) {
        return false;  // Det regner
    }
    
    return true;  // Ellers er det strandvejr
}
```

#exercise(title: "Enten eller")[
Implementer følgende metoder med passende betingelser:

1. ```java
   public static boolean isTeenager(int age) {
       // Returnér true hvis alderen er mellem 13 og 19
   }
   ```

2. ```java
   public static boolean canDrive(int age, boolean hasLicense) {
       // Returnér true hvis personen er 18+ og har kørekort
   }
   ```

3. ```java
   public static String seasonForMonth(int month) {
       // Returnér årstiden for måneden (1-12)
   }
   ```

4. ```java
   public static boolean isBetween(int number, int min, int max) {
       // Returnér true hvis number er mellem min og max (inklusiv)
   }
   ```
]

== Switch-statements

Når vi har mange specifikke værdier at tjekke, kan `switch` være mere læseligt end mange `else if`:

```java
public static String getDayOfWeek(int dayNumber) {
    switch (dayNumber) {
        case 1:
            return "Mandag";
        case 2:
            return "Tirsdag";
        case 3:
            return "Onsdag";
        case 4:
            return "Torsdag";
        case 5:
            return "Fredag";
        case 6:
            return "Lørdag";
        case 7:
            return "Søndag";
        default:
            return "Ugyldig dag";
    }
}
```

=== Switch med break
Hvis vi ikke bruger `return`, skal vi huske `break`:

```java
public static boolean isWeekend(int dayOfWeek) {
    boolean weekend = false;
    
    switch (dayOfWeek) {
        case 6:  // Lørdag
        case 7:  // Søndag
            weekend = true;
            break;
        case 1:  // Mandag
        case 2:  // Tirsdag
        case 3:  // Onsdag
        case 4:  // Torsdag
        case 5:  // Fredag
            weekend = false;
            break;
        default:
            System.out.println("Ugyldig ugedag!");
    }
    
    return weekend;
}
```

=== Switch med Strings
Switch virker også med strings:

```java
public static int getSeasonNumber(String season) {
    switch (season.toLowerCase()) {
        case "vinter":
            return 1;
        case "forår":
            return 2;
        case "sommer":
            return 3;
        case "efterår":
            return 4;
        default:
            return -1;  // Ugyldig årstid
    }
}
```

== Ternary operator

For simple if-else kan vi bruge den kompakte ternary operator:

```java
// I stedet for:
String message;
if (age >= 18) {
    message = "Du er myndig";
} else {
    message = "Du er ikke myndig";
}

// Kan vi skrive:
String message = (age >= 18) ? "Du er myndig" : "Du er ikke myndig";
```

Syntaks: `betingelse ? værdi_hvis_sand : værdi_hvis_falsk`

Men brug det med måde - det kan hurtigt blive ulæseligt!

== Almindelige fejl og faldgruber

=== Assignment vs. comparison
```java
// FORKERT - tildeler værdi i stedet for at sammenligne
if (age = 18) {  // Kompileringsfejl
    
// RIGTIGT
if (age == 18) {
```

=== Floating point sammenligning
```java
double price = 0.1 + 0.2;  // Ikke præcis 0.3!

// FORKERT
if (price == 0.3) {

// RIGTIGT
if (Math.abs(price - 0.3) < 0.00001) {
```

=== String sammenligning
```java
String name1 = "Anna";
String name2 = scanner.nextLine();

// FORKERT
if (name1 == name2) {

// RIGTIGT  
if (name1.equals(name2)) {
```

=== Null pointer
```java
String name = null;

// FARLIGT - kan give NullPointerException
if (name.equals("Anna")) {

// SIKKERT
if ("Anna".equals(name)) {  // eller
if (name != null && name.equals("Anna")) {
```

== Avanceret eksempel

Lad os kombinere alt i et større eksempel:

```java
import java.util.Scanner;

public class WeatherAdvisor {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Indtast temperatur (°C): ");
        int temperature = scanner.nextInt();
        
        System.out.print("Regner det? (true/false): ");
        boolean isRaining = scanner.nextBoolean();
        
        System.out.print("Er det weekend? (true/false): ");
        boolean isWeekend = scanner.nextBoolean();
        
        String advice = getWeatherAdvice(temperature, isRaining, isWeekend);
        System.out.println("Anbefaling: " + advice);
    }
    
    public static String getWeatherAdvice(int temp, boolean raining, boolean weekend) {
        if (!weekend) {
            return "Arbejdsdag - tag på arbejde uanset vejret!";
        }
        
        if (raining) {
            return "Det regner - bliv hjemme og hygge dig";
        }
        
        if (temp > 25) {
            return "Perfekt strandvejr - tag på stranden!";
        } else if (temp > 15) {
            return "Godt vejr til en gåtur i parken";
        } else if (temp > 5) {
            return "Tag en jakke på og gå en tur";
        } else {
            return "Koldt ude - måske læse en bog indendørs?";
        }
    }
}
```

#exercise(title: "BMI klassificering")[
Lav en forbedret BMI beregner:

1. Læs vægt og højde fra brugeren
2. Beregn BMI: `weight / (height * height)`
3. Klassificer resultatet:
   - Under 18.5: Undervægt
   - 18.5-24.9: Normal vægt  
   - 25-29.9: Overvægt
   - 30+: Fedme
4. Giv passende sundhedsråd baseret på kategorien
5. Håndter ugyldige input (negative værdier)
]

== Sammenfatning

Betingelser og logik er fundamentale for at skabe intelligente programmer. Vi har lært:

- *If-statements*: Grundlæggende beslutninger med `if`, `else`, og `else if`
- *Sammenligningsoperatorer*: `==`, `!=`, `<`, `>`, `<=`, `>=` 
- *Logiske operatorer*: `&&` (og), `||` (eller), `!` (ikke)
- *Switch-statements*: Effektiv håndtering af mange specifikke værdier
- *Læsbarhed*: Navngivning, guards, og opdeling i metoder
- *Almindelige fejl*: String sammenligning, null values, og floating point

Med disse værktøjer kan du nu skrive programmer der reagerer intelligent på forskellige situationer og brugerinput. I næste kapitel lærer vi om løkker, som gør det muligt at gentage kode baseret på betingelser.