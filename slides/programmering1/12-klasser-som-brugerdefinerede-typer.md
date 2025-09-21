---
title: 12 - Klasser som brugerdefinerede typer
---
<!-- .slide: class="cover-3" -->
## Klasser som brugerdefinerede typer

---
<!-- .slide: class="o-sunlit-energy" -->

## Program:

- Hvad gør `new`?
- Hvad er et value object?
- Hvordan laver vi en brugerdefineret type?
- Hvad er en konstruktør?
- Hvordan bruger vi vores nye type?
- Øvelser
- Opsummering

---

Indtil nu har vi brugt primitiv-typer til at gemme data, fx
```java
String givenName = "Victor";
String familyName = "Lukic";
String phoneNumber = "20158222";
```

--

Det kan være *upraktisk* at have tre variable for hver person vi vil gemme kontaktinfo for

-- 

Det kan være *mere praktisk* at samle relaterede data i én variabel

--

Hvad nu hvis vi vil gemme alle kontaktoplysninger for en person i én variabel?
```java
Contact victor = new Contact(...);

System.out.printf("%s %s, %s", victor.givenName, victor.familyName, victor.phoneNumber);
```

--

Vi har brug for at lave vores egen type, `Contact`, som kan bære alle informationerne

--

Vi kan lave vores **egen type** ved at definere en ny klasse

--

Vi laver en ny fil `Contact.java`, en klasse `Contact` med tre felter

```java
public class Contact {
    String givenName;
    String familyName;
    String phoneNumber;

}
```

--

Nu kan vi oprette en instans af `Contact` med `new`-nøgleordet
```java
public class Main {
    public static void main(String[] args) {
        Contact victor = new Contact();
        victor.givenName = "Victor";
        victor.familyName = "Lukic";
        victor.phoneNumber = "20158222";

        System.out.printf("%s %s, %s", 
            victor.givenName, 
            victor.familyName, 
            victor.phoneNumber);
    }
}
```

--

## Hvad gør `new`?

- `new` opretter et nyt objekt i hukommelsen
- `new` returnerer en reference (adresse) til objektet

--

Referencen kan vi gemme i en variabel af typen `Contact`, fx

```java
Contact victor = new Contact();
```
dvs. 
- `victor` er en variabel af typen `Contact`
- `victor` indeholder en reference til et `Contact`-objekt

--

Vi kan bruge `victor` til at få adgang til objektets felter, fx
```java
victor.givenName = "Victor";
```
--

`new` kalder også klassens konstruktør-metode

--

## Hvad er en konstruktør?

En speciel metode, der
- har samme navn som klassen
- ikke har nogen returtype (ikke engang `void`)
- ikke har `static` i signaturen
- kaldes automatisk når vi laver et nyt objekt med `new`

--

Hvis vi *ikke* selv skriver en konstruktør, så laver Java en tom en for os
```java
public class Contact {
    String givenName;
    String familyName;
    String phoneNumber;
}
```

--

... er det samme som
```java
public class Contact {
    String givenName;
    String familyName;
    String phoneNumber;

    public Contact() {
        // tom konstruktør
    }
}
```

--

Vi kan også selv skrive en konstruktør, fx
```java
public class Contact {
    String givenName;
    String familyName;
    String phoneNumber;

    public Contact(String gn, String fn, String pn) {
        givenName = gn;
        familyName = fn;
        phoneNumber = pn;
    }
}
```

--

Nu kan vi oprette et `Contact`-objekt med initialværdier
```java
Contact victor = new Contact("Victor", "Lukic", "20158222");
```

---

Hvorfor skrev du ikke bare ...
```java
public class Contact {
    String givenName;
    String familyName;
    String phoneNumber;
    public Contact(String givenName, String familyName, String phoneNumber) {
        givenName = givenName;
        familyName = familyName;
        phoneNumber = phoneNumber;
    }
}
```

--

Fordi parameterne (givenName) "skygger" for felterne med samme navn. 

Java ved ikke om du mener feltet eller parameteren.

--

Løsning: Brug `this` til at referere til objektets felter
```java
public class Contact {
    String givenName;
    String familyName;
    String phoneNumber;

    public Contact(String givenName, String familyName, String phoneNumber) {
        this.givenName = givenName;
        this.familyName = familyName;
        this.phoneNumber = phoneNumber;
    }
}
```

--

## Overloading af konstruktører

Som andre metoder, kan vi **overloade** konstruktører, dvs. lave flere med forskellige parametre

```java
public class Contact {
    String givenName;
    String familyName;
    String phoneNumber;

    public Contact(String givenName, String familyName, String phoneNumber) {
        this.givenName = givenName;
        this.familyName = familyName;
        this.phoneNumber = phoneNumber;
    }

    public Contact(String givenName, String familyName) {
        this.givenName = givenName;
        this.familyName = familyName;
        this.phoneNumber = "N/A";
    }
}
```

--

Spørgsmål: Hvor mange konstruktører har klassen `Contact` nu?

Notes:
- Tre


--

Nu kan vi oprette `Contact`-objekter med eller uden telefonnummer

```java
Contact victor = new Contact("Victor", "Lukic", "20158222");
Contact thorkild = new Contact("Thorkild", "Hansen");
Contact unknown = new Contact(); // Fejl!
```

---
<!-- .slide: class="cover-14" -->
## `toString()`

--

Vi er vant til at 

```java
int age = 22;
System.out.println(age); // => "22"
```

og
```java
String name = "Thorkild";
System.out.println(name); // "Thorkild

--

men hvad sker der hvis vi prøver at printe et objekt?

```java
Contact victor = new Contact("Victor", "Lukic", "20158222");
System.out.println(victor); // => "Contact@6bc7c054"
```

--

Hvad sker der egentlig når vi printer et objekt?

--

Når vi printer et objekt, fx med `System.out.println()`, kaldes objektets `toString()`-metode

--

Hvis vi har lavet en `toString()`-metode i vores klasse, så bliver den kaldt

--

Har vi ikke lavet en `toString()`-metode, får vi en standard `toString()` 
og den returnerer altså bare `klassenavn + "@" + hashkode`.

--

Hvorfor viser `toString()` ikke bare alle felterne i objektet?

--

Fordi Java ikke ved
- hvilke felter skal den vise?
- er nogle felter fx "hemmelige"?
- i hvilken rækkefølge?
- hvordan skal det formateres?

--

Løsning: Vi kan selv lave en `toString()`-metode i vores klasse

```java
@Override
public String toString() {
    return String.format("%s %s, tlf: %s", 
        givenName, familyName, phoneNumber);
}
```

```java
Contact victor = new Contact("Victor", "Lukic", "20158222");
System.out.println(victor); // => "Victor Lukic, tlf: 20158222"
```

--

<!-- .slide: class="sunlit-energy" -->

Nævn tre ting du tager med fra i dag?