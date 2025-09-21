---
title: 10 - Mere om Arrays
---

# Om String og char

# `Arrays`-klassen

Bruge metoder fra Arrays-klassen (f.eks. Arrays.toString(), Arrays.sort(), Arrays.copyOf()).
Forstå forskellen mellem at kopiere en reference og at lave en ny kopi af et array.
Forklare forskellen mellem primitive typer og reference typer i Java.
Forstå hvordan arrays i Java fungerer som referencer, og hvad det betyder for ændringer af arrayets indhold.
Forstå hvorfor ændringer i en metode kan påvirke det originale array.

# Mere String

# Karaktersæt - ASCII og Unicode

Nogle bud på hvad der bliver udskrevet:

```java
char c1 = 74;
char c2 = 65;
char c3 = 86;
System.out.println("Jeg elsker " + c1 + c2 + c3 + c2);
```

--

Derfor kan vi også printe fra `'A'` til `'Z'`:

```java
for (char c = 'A'; c <= 'Z'; c++) {
    System.out.print(c);
}
```

giver 

"**A**BCDEFGHIJKLMNOPQRSTUVXYABCDEFGHIJKLMNOPQRSTUVWXY**Z**"

--

... og fra `'A'` til `'Å'`, men:

```java
for (char c = 'A'; c <= 'Å'; c++) {
    System.out.print(c);
}
```

giver derimod

"**A**BCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~ ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄ**Å**"

# 🤔

--

## I gamle dage 



Notes:
I gamle var det ikke helt ualmindeligt at få en mail der 