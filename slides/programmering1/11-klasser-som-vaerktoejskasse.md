---
title: 11 - Klasser som værktøjskasser
---
<!-- .slide: class="cover-3" -->
## Klasser som værktøjskasser

---
<!-- .slide: class="o-sunlit-energy" -->

## Program:

- Hvad er en hjælpeklasse?
- Hvordan laver vi en?
- Hvad er det `import` gør?
- Hvad er et navnerum (namespace)?
- Hvordan laver vi en package?
- Øvelser
- Opsummering

---

Indtil nu har vi skrevet alt i én fil

--

Store programmer kræver **organisering**

--

I et objektorienteret sprog (som Java)  
organiserer vi kode i **klasser**

--

Konventioner: 
- Én klasse per fil
- Filnavn (`Math.java`) = klassenavn (`Math`)

Notes:
- Noget om at Java har en konvention om at hver klasse skal være i sin egen fil
- Det er for at gøre det nemmere at finde rundt i koden, især når projektet vokser

---
<!-- .slide: class="cover-14" -->

## Hjælpeklasser

--

Nogle klasser er **værktøjskasser** med nyttige metoder

--
<!-- .slide: class="x-large" -->

Eksempel: Hjælpeklassen `java.lang.Math`
```java
import java.lang.Math;

Math.sqrt(16);
Math.pow(2, 3);
Math.max(3, 7);
```
--

Bemærk: Vi skriver altid `Math.` foran metoderne

\- det er fordi klassen hedder `Math`

--
<!-- .slide: class="x-large" -->

Vi kunne også skrive
```java
java.lang.Math.sqrt(16);
java.lang.Math.pow(2, 3);
java.lang.Math.max(3, 7);
```

--

Metoderne i `java.lang.Math` er `static`

--
<!-- .slide: class="o-sunlit-energy" -->

DEMO: Er `Math` klassens metoder `static`?
Notes:
- Tjek i Intellij
--

Spørgsmål: Hvad betyder `static`?

--

Svar: Metoden tilhører klassen, ikke et objekt

-- 

Dvs. vi behøver ikke at lave et objekt af klassen Math for at bruge metoderne

--
<!-- .slide: class="x-large" -->

Med andre ord, vi behøver ikke

```java
Math math = new Math();
math.sqrt(16);
```

--

Derfor har alle vores egne metoder, vi har kaldt fra `main`, også været `static`

--

Fordi vi har kaldt metoder indenfor samme klasse som `main`,  
har vi ikke skullet skrive klassens navn foran

--
<!-- .slide: class="large" -->

```java
public class Main {
    public static void main(String[] args) {
        sayHello();
    }

    public static void sayHello() {
        System.out.println("Hello!");
    }
}
```

--

<!-- .slide: class="large" -->

Vi kunne også...

```java
public class Main {
    public static void main(String[] args) {
        Main.sayHello(); // Main. foran
    }

    public static void sayHello() {
        System.out.println("Hello!");
    }
}
```
--

Men så er der jo også `String` og `Scanner` og `Random`

--

Her skulle vi **instantiere et objekt** af klassen først, for at bruge metoderne

--
<!-- .slide: class="x-large" -->

a.k.a. 
```java
String text = new String("Hello");
Scanner input = new Scanner(System.in);
Random random = new Random(342);
```

--
<!-- .slide: class="x-large" -->

og så kalde metoder på objektet:
```java
text.toUpperCase();
input.nextLine();
random.nextInt(10);
```

--

Det vil vi selvfølgelig også kunne med vores egne klasser

--

Men - det er emnet i en senere i kurset

---

<!-- .slide: class="cover-10" -->
# `package` og `import`

--
<!-- .slide: class="x-large" -->

Vi har brugt `import` til at hente klasser fra Java's standardbibliotek, fx.
```java
import java.util.Scanner;
```

--

Hvad gør `import`?

--

`import` gør det muligt at bruge klasser fra andre pakker  
... uden at skulle skrive den fulde sti hver gang.

--
<!-- .slide: class="sunlit-energy" -->

DEMO: Lad os lede efter `Scanner`-klassen i Java's kildekode

Notes:
- `jenv which`
- Gå til JAVA_HOME folderen og led efter src.zip
- Pak src.zip ud et sted
- Kig i mappen `java.base/java/util/` efter `Scanner.java`

--

<!-- .slide: class="x-large" -->

I toppen af `Scanner.java` står der:
```java
package java.util;
```

--

<!-- .slide: class="x-large" -->

Så `Scanner`-klassen tilhører pakken `java.util`.
Altså kan vi importere den med:
```java
import java.util.Scanner;
```

--

Konvention: Pakke-navne er altid små bogstaver, fx
```java
package calculator;
```

--

Konvention: Pakke-navne med flere niveauer adskilles med punktum, fx
```java
package dk.kea.calculator;
```

--

Store apps bruger ofte domænenavne bagfra i pakke-navne, fx
```java
package com.google.code.gson;
package org.springframework.boot;
```

--

Konvention: Pakke-navne og mappenavne skal matche.  

Eksempel: `dk.kea.calculator.Math` → mappen `dk/kea/calculator/Math.java`

--

Hvorfor er pakker nyttige?

--

Pakker fungerer som **navnerum** (namespaces)

--

Jeg har lavet en klasse der hedder `Math`

--

Hvad nu hvis Java også havde en klasse der hed `Math`?  
**Navnekonflikt!**

--

... hvis ikke det var for `package`s

--
<!-- .slide: class="large" -->

så vi kunne kalde min klasse `dk.kea.calculator.Math` ved at:

.. ligge min `Math.java` i mappen `dk/kea.calculator/`

--
<!-- .slide: class="x-large" -->
... tilføje flg. i toppen af filen:
   ```java
   package dk.kea.calculator;
   public class Math {
       // ...
   }
   ```
--
<!-- .slide: class="x-large" -->
... og så importere den i en anden fil med:
   ```java
   import dk.kea.calculator.Math;
   ```
--
<!-- .slide: class="ek-sunlit-energy" -->

DEMO: En lommeregner i pakken dk.kea.calculator

![Lommeregner](img/lommeregner.png)

Notes:
```java
package dk.kea.calculator;

public class Calculator {
    public static int add(int a, int b) {
        return a + b;
    }

    public static int subtract(int a, int b) {
        return a - b;
    }
}
```
---

<!-- .slide: class="sunlit-energy" -->

Nævn tre ting du tager med fra i dag?