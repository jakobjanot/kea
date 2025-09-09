
## Iteration over et array

- Vi har et array med 10 elementer, og vi vil gerne printe hvert element ud.
```java
String[] names = {"Alice", "Børge", "Cecilie", "David", "Eva", "Frederik", "Gitte", "Hans", "Ida", "Jens"};
System.out.println(names[0]);
System.out.println(names[1]);
System.out.println(names[2]);
System.out.println(names[3]);
// ...
```

--

Har du lyst til at gøre det samme for en liste med 1000 elementer?

---

# Java har to typer af løkker

- `for`: Gentag et antal gange
- `while`: Gentag så længe en betingelse er sand

--

## `for` løkker

--

Lad os køre 10 vejrtrækningscykler.

```java
for (int i = 0; i < 10; i = i + 1) {
    breathCycle();
}
```

Notes:
- `for` løkker bruges, når du ved, hvor mange gange du vil gentage noget
- `i` er en tæller, en `int` variabel, der starter med at blive sat til 0
- `i < 10` er betingelsen, der skal være sand for at løkken fortsætter
- `i = i + 1` betyder, at tælleren øges med 1 for hver iteration
- Hver gang løkken kører, kaldes det der står i body'en, i dette tilfælde `breathCycle()`
- Hvorfor kalder vi det `i`, når jeg plejer at sige at vi skal bruge meningsfulde navne?
    - `i` er en konvention i programmering, der står for "index" eller "iterator"
    - Det er en kort og simpel måde at referere til tælleren i løkken
    - Det er ikke nødvendigt at bruge et meningsfuldt navn, da det kun bruges internt i løkken
    - Så lige her gør vi en undtagelse fra reglen om meningsfulde navne
- Hvorfor starter vi ikke på 1?
    - Det er en konvention i programmering at tælle fra 0, da det ofte er nemmere at arbejde med index i arrays, hvor første element har index 0

--

```java
public class Main {
    public static void main(String[] args) {
        for (int i = 0; i < 10; i = i + 1) {
            breathCycle();
        }
    }
    public static void breathCycle() {
        System.out.println("1. Træk vejret langsomt ind");
        sleep(4000);
        System.out.println("2. Hold vejret");
        sleep(4000);
        System.out.println("3. Pust langsomt ud");
        sleep(4000);
        System.out.println("4. Hold vejret");
        sleep(4000);
    }
}
```

--

`for` løkker bruges ofte til at tælle op eller ned

--

Vi **tæller op** fra 0 til 9

```java
for (int i = 0; i < 10; i = i + 1) {
    System.out.println("Iteration: " + i);
}
```

--
<!-- .slide: data-background-image="img/rocket-launch.png" -->

--


Eller vi kan **tælle ned** fra 10 til 1 (`i--`)

```java
for (int i = 10; i > 0; i = i - 1) {
    System.out.println(i + " sekunder tilbage");
}
System.out.println("Liftoff!");
```

--

Eller kortere (`i =- 1`)

```java
for (int i = 10; i > 0; i =- 1) {
    System.out.println(i + " sekunder tilbage");
}
System.out.println("Liftoff!");
```

---

## Demo: 4-tabellen

Notes:

- Er i gode til tabeller? Lad os tage 4-tabellen.
- dvs. alle tal der er delelige med 4 op til 40
- ```java
    for (int i = 4; i < 40; i = i + 4) {
        System.out.println(i);
    }
  ```
- `i` starter på 4
- Vi vil gerne stopper når `i` er større end 40
- Hvad går der galt her? Sidste iteration vil være 36, og så vil `i` blive 40, hvorfor vi ikke printer 40
- Vi kan ændre betingelsen til `i < 41`, så vi også printer 40
```java
for (int i = 4; i < 41; i = i + 4) {
    System.out.println(i);
}
```
- `i <= 40` vil også virke
```java
for (int i = 4; i <= 40; i = i + 4) {
    System.out.println(i);
}
```
- Men `i != 40` er lidt farlig, fx hvis vi ikke rammer 40
```java
for (int i = 4; i != 41; i = i + 4) {
    System.out.println(i);
}
```

--

En anden almindelig brug af `for` løkker er at iterere over et array

```java
String[] emails = {"alice@gmail.com", "billal@hotmail.com", "valdemar@outlook.com"}
for (int i = 0; i < emails.length; i++) {
    sendInvitation(emails[i]);
}
```

---

## `while` løkker

Notes:
- `for` løkker bruges, når du ved, hvor mange gange du vil gentage noget
- `while` løkker bruges, når du ikke ved, hvor mange gange du vil gentage noget
- `while` løkker kører så længe en betingelse er sand
- Har I gode eksempler på, hvornår vi kan bruge `while` løkker?
- Et eksempel kunne være at vi vil vente på at brugeren indtaster et gyldigt input

--

## Demo: Velkommen til baren

Notes:
- Lad os lave et program, der spørger brugeren om deres alder, og hvis de er under 18, skal de ikke komme ind i baren
- Vi kan bruge en `while` løkke til at gentage spørgsmålet, indtil brugeren er gammel nok
    ```java
    int age = 0;
    
    while (age < 18) {
        System.out.println("Ud! Du er kun " + age + " år gammel.");
        age++;
    }
    System.out.println("Velkommen til baren! Du er " + age + " år gammel.");
    ```
---

---

# Iteration over lister

En typisk anvendelse af løkker er, at iterere hen over lister. 

--

Eks: Find den ældste i blandt en liste af aldre på nogle personer (18 år, 3 år, etc.)

```java

int[] ages = {17, 5, 19, 3, 92, 18, 66, 78};

int ageOldest = 0;

for (int i = 0; i < ages.length(); i++) {
    if (ageOldest < ages[i]) {
        ageOldest = ages[i];
    }
}

System.out.println("Den ældste er " + ageOldest);
```

Notes:
- Vi har en liste med aldre.
- Vi itererer fra første element (i=0) til sidste ages.length() - 1
- Hver gang tager vi navn ud af listen og sammenligner med ageOldest
- Hvis det "nuværende" age er større end ageOldest, da sæt ageOldest til age.
- Til slut printer vi ageOldest
- I denne algoritme er det nødvendigt at nå igennem hele listen
- I andre tilfælde kan vi stoppe tidligt og behøver ikke at iterere igennem alle elementer

--

Eks: Find en voksen

```java
int[] ages = {17, 5, 19, 3, 92, 18, 66, 78};
int ageAdult = 0;

for (int i = 0; i < ages.length(); i++) {
    if (ages[i] >= 18) {
        ageAdult = ages[i];
        return;
    }
}

System.out.println("Den ældste er " + ageOldest);