---
title: 12 - Klasser som brugerdefinerede typer
---
<!-- .slide: class="cover-3" -->
#### Klasser som brugerdefinerede typer

---
<!-- .slide: class="o-sunlit-energy" -->

## Program:

- Hvad gør `new`?
- Hvordan laver vi en brugerdefineret type?
- Hvad er en konstruktør?
- Hvordan bruger vi vores nye type?
- `toString()`
- `equals()`
- Hvad er et værdiobjekt?
- Øvelser
- Opsummering

---
<!-- .slide: class="large" -->

Indtil nu har vi brugt primitiv-typer til at gemme data, fx
```java
String givenName = "Victor";
String familyName = "Lukic";
String email = "lucky@victory.dk";
```

--
<!-- .slide: class="large" -->

Det kan være *upraktisk* - og næsten *ulæseligt*

```java
generateEmail(fromGivenName, fromFamilyName, fromEmail,
              toGivenName, toFamilyName, toEmail,
              subject, body);
```

--

Det kan være *mere praktisk* at samle relaterede data i én variabel

--
<!-- .slide: class="large" -->

Hvad nu hvis vi vil gemme alle kontaktoplysninger for en person i én variabel?
```java
Contact victor = new Contact(...);
Contact thorkild = new Contact(...);

generateEmail(victor, thorkild, subject, body);
```

--

Vi kan lave vores **egen type** ved at definere en ny klasse

--
<!-- .slide: class="large" -->

Vi laver en ny fil `Contact.java`, en klasse `Contact` med tre felter

```java
public class Contact {
    String givenName;
    String familyName;
    String email;

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
        victor.email = "lucky@victory.dk";

        Contact thorkild = new Contact();
        thorkild.givenName = "Thorkild";
        thorkild.familyName = "Hansen";
        thorkild.email = "thorkild@hansen.dk";

        generateEmail(victor, thorkild, "Hej", "Hvordan går det?");
    }
}
```

--

## Hvad gør `new`?

- `new` opretter et nyt objekt i hukommelsen
- `new` returnerer en reference (adresse) til objektet

--
<!-- .slide: class="large" -->
Referencen kan vi gemme i en variabel af typen `Contact`, fx

```java
Contact victor = new Contact();
```
dvs. 
- `victor` er en variabel af typen `Contact`
- `victor` indeholder en reference til et `Contact`-objekt

--
<!-- .slide: class="large" -->
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
<!-- .slide: class="large" -->
Hvis vi *ikke* selv skriver en konstruktør, så laver Java en tom en for os
```java
public class Contact {
    String givenName;
    String familyName;
    String email;
}
```

--
<!-- .slide: class="large" -->
... er det samme som
```java
public class Contact {
    String givenName;
    String familyName;
    String email;

    public Contact() {
        // tom konstruktør
    }
}
```

--
<!-- .slide: class="large" -->
Vi kan også selv skrive en konstruktør, fx
```java
public class Contact {
    String givenName;
    String familyName;
    String email;

    public Contact(String gn, String fn, String pn) {
        givenName = gn;
        familyName = fn;
        email = pn;
    }
}
```

--
<!-- .slide: class="large" -->
Nu kan vi oprette et `Contact`-objekt med initialværdier
```java
Contact victor = new Contact("Victor", "Lukic", "lucky@victory.dk");
```

--
<!-- .slide: class="large" -->
Hvorfor skrev du ikke bare ...
```java
public class Contact {
    String givenName;
    String familyName;
    String email;
    public Contact(String givenName, String familyName, String email) {
        givenName = givenName;
        familyName = familyName;
        email = email;
    }
}
```

--
<!-- .slide: class="large" -->
```java
public class Contact {
    String givenName;
    String familyName;
    String email;
    public Contact(String givenName, String familyName, String email) {
        givenName = givenName;
        familyName = familyName;
        email = email;
    }
}
```

Fordi parameterne (fx `givenName`) "skygger" for felterne med samme navn.

Java ved ikke om du mener feltet eller parameteren.

--
<!-- .slide: class="large" -->
Løsning: Brug `this` til at referere til objektets felter
```java
public class Contact {
    String givenName;
    String familyName;
    String email;

    public Contact(String givenName, String familyName, String email) {
        this.givenName = givenName;
        this.familyName = familyName;
        this.email = email;
    }
}
```

--

## Overloading af konstruktører

--
<!-- .slide: class="large" -->

Som andre metoder, kan vi **overloade** konstruktører

```java
public class Contact {
    String givenName;
    String familyName;
    String email;

    public Contact(String givenName, String familyName, String email) {
        this.givenName = givenName;
        this.familyName = familyName;
        this.email = email;
    }

    public Contact(String givenName, String familyName) {
        this.givenName = givenName;
        this.familyName = familyName;
        this.email = "N/A";
    }
}
```

--

Spørgsmål: Hvor mange konstruktører har klassen `Contact` nu?

```java
public class Contact {
    String givenName;
    String familyName;
    String email;

    public Contact(String givenName, String familyName, String email) {
        this.givenName = givenName;
        this.familyName = familyName;
        this.email = email;
    }

    public Contact(String givenName, String familyName) {
        this.givenName = givenName;
        this.familyName = familyName;
        this.email = "N/A";
    }
}
```

Notes:
- To, da der ikke er nogen tom konstruktør længere, fordi vi selv har defineret to andre.


--
<!-- .slide: class="large" -->

Nu kan vi oprette `Contact`-objekter med eller uden email
```java
Contact victor = new Contact("Victor", "Lukic", "lucky@victory.dk");
Contact thorkild = new Contact("Thorkild", "Hansen");
```

--
<!-- .slide: class="large" -->

Men ikke uden parametre

```java
Contact ukendt = new Contact(); // Fejl!
```

--
<!-- .slide: class="k-sunlit-energy" -->
## DEMO: Konstruktører

---
<!-- .slide: class="cover-14" -->
## `toString()`

--
<!-- .slide: class="large" -->
Vi er vant til at 

```java
int age = 22;
System.out.println(age); // => "22"
```

--
<!-- .slide: class="large" -->
men hvad sker der hvis vi prøver at printe et objekt?

```java
Contact victor = new Contact("Victor", "Lukic", "lucky@victory.dk");
System.out.println(victor); // => "Contact@6bc7c054"
```

--

```java
System.out.println(victor); // => "Contact@6bc7c054"
```

Når vi printer et objekt, fx med `System.out.println()`,  
kaldes objektets `toString()`-metode

--

Hvis vi *har* lavet en `toString()`-metode i vores klasse, så bliver den kaldt

--

Har vi ikke lavet en `toString()`-metode, får vi en standard `toString()` 
og den returnerer altså bare

```java
System.out.println(victor); // => "Contact@6bc7c054"
```

--

Hvorfor viser `toString()` ikke bare alle felterne i objektet?

--

Fordi Java ikke ved
- hvilke felter skal den vise?
- er nogle felter fx "hemmelige"?
- i hvilken rækkefølge?
- hvordan skal det formateres?

--
<!-- .slide: class="large" -->
Løsning: Vi kan selv lave en `toString()`-metode i vores klasse

```java
public String toString() {
    return String.format("%s %s, tlf: %s", 
        givenName, familyName, email);
}
```

```java
Contact victor = new Contact("Victor", "Lukic", "lucky@victory.dk");
System.out.println(victor); // => "Victor Lukic, tlf: lucky@victory.dk"
```

--
<!-- .slide: class="k-sunlit-energy" -->
## DEMO: `toString()`

---
<!-- .slide: class="cover-11" -->
## Immutable objects

--
<!-- .slide: class="large" -->
```java
Contact victor = new Contact("Victor", "Lukic", "lucky@victory.dk");

victor.email = "lol@megalol.com"; // Ændrer victors email
```

--

Hvis vi *ikke* vil tillade at felterne i et objekt kan ændres efter oprettelse,  
kan vi gøre dem `final`

```java
public class Contact {
    final String givenName;
    final String familyName;
    final String email;

    public Contact(String givenName, String familyName, String email) {
        this.givenName = givenName;
        this.familyName = familyName;
        this.email = email;
    }
}
```

--
<!-- .slide: class="large" -->
Nu kan vi *ikke* ændre felterne efter oprettelse

```java
Contact victor = new Contact("Victor", "Lukic", "lucky@victory.dk");
victor.email = "lol@megalol.com"; // Fejl!
```

--

Objekter med `final` felter kaldes **immutable objects** (uforanderlige objekter)

--

`String`-klassen er et eksempel på en *immutable* klasse

--
<!-- .slide: class="large" -->
```java
String name = "Thorkild";
String name2 = name.toUpperCase();
System.out.println(name);  // => "Thorkild"
System.out.println(name2); // => "THORKILD"
```

dvs. `toUpperCase()` ændrer ikke i `name`, men returnerer en ny `String`.

--
<!-- .slide: class="k-sunlit-energy" -->
## DEMO: `final` felter

---

<!-- .slide: class="cover-14" -->
# Værdiobjekter

--

Vi har kredset om begrebet **værdiobjekter** (value objects)  
uden at definere det præcist

--

Værdiobjekter (value objects) er objekter, der

- kun indeholder data (felter) - ingen adfærd (metoder)
- ved sammenligning, sammenlignes deres felter og ikke deres referencer
- ofte er immutable (felterne er `final`)

--

Hvorfor bruge værdiobjekter?
- Samler relaterede data i én variabel
- Gør det nemmere at sende data rundt i programmet (fx som parametre til metoder)

--

<!-- .slide: class="large" -->
Er `Contact` et værdiobjekt?

```java
Contact victor1 = new Contact("Victor", "Lukic", "lucky@victory.dk");
Contact victor2 = new Contact("Victor", "Lukic", "lucky@victory.dk");

System.out.println(victor1 == victor2); // => false
```

Spørgsmål: Burde `victor1 == victor2`?

--

`victor1 == victor2` er for reference-typer det samme som at kalde `victor1.equals(victor2)`

--
<!-- .slide: class="large" -->
Standard for reference-typer: `equals()` sammenligner referencer (adresser), ikke felter.

```java
Contact victor1 = new Contact("Victor", "Lukic", "lucky@victory.dk");
Contact victor2 = victor1;
System.out.println(victor1 == victor2); // => true
```

--
<!-- .slide: class="large" -->
Så skal `Contact` være et værdiobjekt, skal vi overskrive `equals()`-metoden

```java
public boolean equals(Object other) {
    // ...
}
```

--
<!-- .slide: class="large" -->
For `Contacts` kunne det (simplificeret) se således ud

```java
public boolean equals(Object other) {
    Contact contact = (Contact) other;
    return givenName == contact.givenName &&
           familyName == contact.familyName &&
           email == contact.email;
}
```

--

```java
public class Contact {
    final String givenName;
    final String familyName;
    final String email;

    public Contact(String givenName, String familyName, String email) {
        this.givenName = givenName;
        this.familyName = familyName;
        this.email = email;
    }


    public boolean equals(Object other) {
        Contact contact = (Contact) other;
        return givenName.equals(contact.givenName) &&
               familyName.equals(contact.familyName) &&
               email.equals(contact.email);
    }
}
```

--
<!-- .slide: class="o-sunlit-energy" -->
## DEMO: `equals()`

--
<!-- .slide: class="large" -->
Nu sammenlignes felterne i stedet for referencerne

```java
Contact victor1 = new Contact("Victor", "Lukic", "lucky@victory.dk");
Contact victor2 = new Contact("Victor", "Lukic", "lucky@victory.dk");

System.out.println(victor1 == victor2); // => true
```

--

Er der ikke nogen nemmere måde at lave værdiobjekter på?

--
<!-- .slide: class="large" -->
Jo, vi kan bruge **records**

```java
public record Contact(String givenName, String familyName, String email) {}
```

```java
Contact victor1 = new Contact("Victor", "Lukic", "lucky@victory.dk");
Contact victor2 = new Contact("Victor", "Lukic", "lucky@victory.dk");

System.out.println(victor1 == victor2); // => true
```

Done!

--

Så værdiobjekter ... `record`s

--
<!-- .slide: class="o-sunlit-energy" -->
## DEMO: `record`s

---

<!-- .slide: class="sunlit-energy" -->

Nævn tre ting du tager med fra i dag?