---
title: 08 - For-løkker og tilfældighed
---
<!-- .slide: class="cover-3" -->

# For-løkker og tilfældighed

---
<!-- .slide: class="k-sunlit-energy" -->
## Program
- For-løkker
- Tilfældighed
- Øvelser
- Opsamling

---
<!-- .slide: class="cover-15" -->

# `for` løkker

--

Java har to typer af løkker

- `while`: Gentag så længe en betingelse er sand
- `for`: Gentag et antal gange

--

Sidste gang brugte vi `while` løkker til at gentage noget, så længe en betingelse var sand

```java
while (condition) {
    // do something
}
```

--

Men fordi kun kendte `while` løkker, brugte vi dem til alt

```java
int count = 0;
while (count < 10) {
    breathCycle();
    count = count + 1;
}
```

--

Der er en lettere måde når man ved, hvor mange gange noget skal gentages

```java
for (int i = 0; i < 10; i = i + 1) {
    breathCycle();
}
```

--

```java
for (int i = 0; i < 10; i = i + 1)
```

- `int i = 0` - start med at sætte en tæller `i` til 0
- `i < 10` - fortsæt så længe `i` er mindre end 10
- `i = i + 1` - øg `i` med 1 hver gang løkken kører

--

Hvorfor `i`, når du siger, at vi skal bruge meningsfulde navne?

--

 
`i` er en **konvention** i programmering, der står for "index" eller "iterator"

--

Ikke nødvendigt at bruge et meningsfuldt navn, da det kun bruges internt i løkken

--

Vi kan selvfølgelig også bruge `i++` til at øge `i` med 1

```java
for (int i = 0; i < 10; i++) {
    breathCycle();
}
```

--

Tilsvarende kan vi også tælle nedad med `i--`

```java
for (int i = 10; i > 0; i--) {
    System.out.println(i);
}
System.out.println("Lift off!");
```

--

Vi kan også tælle med andre intervaller

```java
for (int i = 0; i < 20; i = i + 2) {
    System.out.println(i);
}
```

... 2-tabellen

--

Vi kan også iterere hen over `char` værdier
(husk at 65 er 'A', 66 er 'B', osv.)

```java
for (char c = 'A'; c <= 'Z'; c++) {
    System.out.print(c);
}
```

--

# Indlejrede `for` løkker

--

Hvor mange 'a'´er, 'b'´er, osv. er der i 

```java
String longText = "Well, Prince, so Genoa and Lucca are ..."

for (char c = 'a'; c <= 'e'; c++) {
    for (int i = 0; i < longText.length(); i++) {
        if (longText.charAt(i).toLowerCase() == c) {
            System.out.print(c);
        }
    }
}
```

--

Hvad tror i den her gør?

```java
for (;;;) {
    System.out.println("Jeg kan en sang, der kan drive dig til vanvid!");
}
```

--

Noget i den her stil?

<iframe width="750" height="422" src="https://www.youtube.com/watch?v=x_xFS-05XUc" title="Jeg kan en sang der kan drive dig til vanvid" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

---
<!-- .slide: class="cover-3" -->

# Tilfældighed

--

Vi kan bruge tilfældighed til mange ting i programmering:
- Spil (terninger, kortspil, mm.)
- Simuleringer (fysik, biologi, mm.)
- Kryptering (sikkerhed)
- Testdata (generere tilfældige data til testformål)
- Kunst (generere tilfældige mønstre, musik, mm.)

--

Vidste i at jeres computerspil Minecraft bruger tilfældighed til at generere verdener?

--

Så derfor vil vi gerne kunne generere tilfældige tal i Java

-- 

Det kan vi gøre med `java.util.Random` klassen. Fx et tilfældigt tal mellem 0 og 99:

```java
Random random = new Random();
int randomNumber = random.nextInt(100);
```

--

... men jeg vil ha et tal mellem 1 og 100

```java
Random random = new Random();
int randomNumber = random.nextInt(100) + 1;
```

--

Hvad så med et komma-tal mellem 0.0 og 1.0?

```java
Random random = new Random();
double randomDouble = random.nextDouble();
```

--

Men jeg vil ha et komma-tal mellem -1.0 og 1.0

```java
Random random = new Random();
double randomDouble = random.nextDouble(2.0) - 1.0;
```

--

Det er irritende at det er tilfældigt hver gang vi kører programmet, jeg kan jo ikke teste det ordentligt!

--

Vi kan sætte et "seed" (frø) for tilfældighedsgeneratoren, så den altid genererer de samme tal

```java
Random random = new Random(60); // seed
int randomNumber = random.nextInt(100) + 1;
```