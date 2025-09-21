---
title: 09 - Array og referencer
---
<!-- .slide: class="cover-14" -->

# Arrays og referencer

---
<!-- .slide: class="k-sunlit-energy" -->

## Program

- Array og referencer
- Øvelser  
- Opsamling  

---

# Arrays

--

Diskuter med din sidemakker:
*Hvorfor bruger vi variable?*

Notes:
- Spørgsmål til klassen
- Vi bruger variable til at gemme data, så vi kan bruge det senere i programmet.
- Det gør vores kode mere læsbar og lettere at vedligeholde.

--
<!-- .slide: class="large" -->

Indtil nu har vi arbejdet med variable, som gemmer **en enkelt værdi**.

```java
int coins;
coins = 50;
```

Notes:
- Vi kan give den et navn og bruge den andre steder i programmet.
- For eksempel, bruger vi her en `int` variabel `coins` til at gemme antallet af guld-mønter, som vi har i vores skattekiste
- Men, nogle gange har vi brug for at gemme en række værdier i én variabel, fx en liste af tal eller en tekststreng. I Java kan vi bruge arrays til at gemme flere værdier af samme type.

--

Nogle gange har vi brug for at gemme **en række værdier** i én variabel

--

![Fire skattekister](img/four-chests.jpg)

--
<!-- .slide: class="large" -->
```java
int[] chests;
```

--
<!-- .slide: class="large" -->

```java
int[] chests = new int[4];
```

![Tomme kister](img/chests-empty.svg)

Notes:
- Her har vi en array, der repræsenterer fire kister, hvori vi kan gemme guldmønter.
- En array er en samling af værdier, der alle har samme datatype.
- Bemærk at vi bruger `[]` for at angive, at det er en array.

--
<!-- .slide: class="large" -->


Piraten gemmer 50 mønter i den **første** kiste.

```java
int[] chests = new int[4];
chests[0] = 50;
```

Notes:
- For at gemme en værdi i en array, bruger vi indekset, som starter fra 0.
- Her gemmer vi 50 mønter i den første kiste, som er `chests[0]`.

--
<!-- .slide: class="large" -->

![Mønter i første kiste](img/chests-1.svg)

```java
int[] chests = new int[4];
chests[0] = 50;
```

--
<!-- .slide: class="large" -->
Lad os gemme 10 mønter i den sidste kiste. 

```java
chests[???] = 10;
```

\- hvad er indekset for den sidste kiste?

Notes:
- Hvad er indekset for den sidste kiste?

--
<!-- .slide: class="large" -->

![Mønter i første og sidste kiste](img/chests-1-4.svg)

```java
int[] chests = new int[4];
chests[0] = 50;
chests[3] = 10;
```

--
<!-- .slide: class="large" -->

Vi kan initialisere en array med værdier direkte:

```java
int[] chests = {50, 0, 0, 10};
```

Notes:
- Vi kan initialisere en array med værdier direkte, uden at skulle sætte dem én ad gangen.
- Her har vi initialiseret `chests` med 50 mønter i den første kiste, 0 i de to midterste kister og 10 mønter i den sidste kiste.

--

Vi kan tilgå værdierne i array'et ved at bruge indekset.

--

Spørgsmål: *Hvilket indeks har den anden kiste?*

Notes:
- For at få adgang til værdierne i en array, bruger vi indekset.
- Husk at indekset starter fra 0, så den anden kiste er `chests[1]`.

--
<!-- .slide: class="large" -->

```java
int[] chests = {50, 0, 0, 10};
int secondChest = chests[1]; // 0
```

Notes:
- Vi kigger i den anden kiste, som er `chests[1]`
- Hvor mange mønter er der i den anden kiste?
- Vi gemmer værdien i `secondChest`

--
<!-- .slide: class="large" -->


Vi kan fjerne 20 mønter fra den første kiste.

```java
chests[0] = chests[0] - 20; // 30
````

--
<!-- .slide: class="large" -->

Alternativt, med `-=`

```java
chests[0] -= 20; // 30
```

---
<!-- .slide: class="cover-2" -->

# Primitive vs. reference

--

Primitive datatyper (fx `int`, `double`, `char`)

```java
int a = 5;
int b = a;
a = 10;
System.out.println(b); // Hvad bliver der printet?
```

Notes:
- Hvad bliver der printet?
- Det bliver 5, fordi `b` får en kopi af værdien i `a` på det tidspunkt, hvor `b` bliver tildelt.
- aka. når vi skriver `int b = a;`, så kopierer vi værdien af `a` (som er 5) ind i `b`.
- Ændringen af `a` påvirker ikke `b`, fordi de er to separate variable, der hver især gemmer deres egen værdi.

--

Reference datatyper (fx `String`, arrays, objekter)

```java
int[] arr1 = {1, 2, 3};
int[] arr2 = arr1;
arr1[0] = 10;
System.out.println(arr2[0]); // Hvad bliver der printet?
```

Notes:
- Hvad bliver der printet?
- Det bliver 10, fordi `arr2` refererer til den samme array som `arr1`.
- Når vi skriver `int[] arr2 = arr1;`, så kopierer vi referencen (adressen) til array'et, ikke selve værdierne.
- Ændringen af `arr1` påvirker også `arr2`, fordi de begge refererer til den samme array i hukommelsen.

--

Kort sagt:

- reference datatyper **gemmer en reference** til data, mens
- primitive datatyper gemmer **selve dataen**.

--

# Stack og heap

--

Java bruger to hukommelsesområder til at gemme data: stack og heap.

--

- **Stack**: Her gemmes **primitive datatyper og referencer**. 
- **Heap**: Her gemmes den data, som referencer peger på. 

--

- **Stack'en** er hurtig at tilgå, men har **begrænset størrelse**
- **Heap'en** er langsommere at tilgå, men har **større kapacitet**

--
<!-- .slide: class="large" -->
```txt
Stack Frame:                Heap:
+------------------+        +-----------------------+
| name   = 0x1A2B --------> | 0x1A2B: "Jakob"       |
| image  = 0x3C4D --------> | 0x3C4D: [0, 1, 255, 3]|
| height = 179.50  |        +-----------------------+
| age    = 34      |
+------------------+
```

0x1A2B og 0x3C4D er referecer (adresser) til data i heap'en.

---
<!-- .slide: class="cover-2" -->

# Arrays og indeksering

--
<!-- .slide: class="large" -->

```java
String[] names = {"Alice", "Bob", "Charlie", "Diana"};
```

hvorfor er **Alice** i `names[0]` og ikke i `names[1]`?

--

Hvorfor starter vi ikke på 1?

--

Indekset er i virkeligheden en **forskydning** (offset) fra hukommelsesadressen, så   
\- det første element er ved **forskydning 0**,   
\- det andet ved **forskydning 1**, osv.

Notes:
- Moderne sprog har nedarvet denne konvention fra ældre sprog som C, hvor det var nødvendigt for effektiv hukommelsesadgang.
- Der er dog sprog som Fortran og MATLAB, der starter indeksering ved 1, men det er mindre almindeligt - og ofte forbundet med forvirring

--

# Om call-by-value

--

I Java er alle argumenter til metoder **call-by-value**.

--

Det betyder at:
- primitive datatyper bliver kopieret (call-by-value)
- reference datatyper bliver kopieret (call-by-value af referencen)

--
<!-- .slide: class="large" -->

```java
public static void modify(int a) {
    a = 100;
}

int x = 5;
modify(x);

System.out.println(x); // Hvad bliver der printet?
```

Notes:
- Hvad bliver der printet?
- Det bliver 5, fordi `a` er en kopi af `x`.
- Ændringen af `a` påvirker ikke `x`, fordi de er to separate variable.

--
<!-- .slide: class="large" -->

```java
public static void modify(int[] arr) {
    arr[0] = 100;
}

int[] chests = {50, 0, 0, 10};
modify(chests);

System.out.println(chests[0]); // Hvad bliver der printet?
```

Notes:
- Hvad bliver der printet?
- Det bliver 100, fordi `arr` refererer til den samme array som `myArray`.
- Ændringen af `arr` påvirker `myArray`, fordi de begge refererer til den samme array i hukommelsen.

---
<!-- .slide: class="cover-3" -->
# for og foreach

--
<!-- .slide: class="large" -->
Vi kan bruge en `for`-løkke til at iterere over et array:

```java
int[] chests = {50, 0, 0, 10};

for (int i = 0; i < chests.length; i++) {
    System.out.println(chests[i]);
}
```

--

... men der er en smartere måde:

--
<!-- .slide: class="large" -->

Vi kan bruge denne `foreach`-løkke til at iterere over et array:

```java
for (int chest : chests) {
    System.out.println(chest);
}
```

---
<!-- .slide: class="o-sunlit-energy" -->

Hvilke tre ting tager du med fra i dag?