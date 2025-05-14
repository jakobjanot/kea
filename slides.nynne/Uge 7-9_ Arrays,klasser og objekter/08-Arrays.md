<!-- Slide number: 1 -->
Arrays

![](GoogleShape77p1.jpg)
0
1
2

### Notes:

<!-- Slide number: 2 -->
# Datastrukturer
Fællesbetegnelse for data, der er organiseret i elementer, som kan tilføjes eller fjernes fra strukturen. Nogle datastrukturer forudsætter, at dataelementerne hver har et nøglefelt, der kan sorteres efter.
https://da.wikipedia.org/wiki/Datastruktur

### Notes:

<!-- Slide number: 3 -->
# Opbevaring af Mange Værdier

### Notes:
Skal være ens type!

<!-- Slide number: 4 -->

![Image](GoogleShape97p4.jpg)

![Image](GoogleShape96p4.jpg)

### Notes:
Sådan her instantieres en array med new
Array er en sekvens af værdier. De kaldes ‘elements’.

<!-- Slide number: 5 -->
Variable

![Image](GoogleShape103p6.jpg)
Vs.
Instantiated array sized 10

![Image](GoogleShape102p6.jpg)
Vs.
Initialised array with int values 1-10

![Image](GoogleShape106p6.jpg)

### Notes:
Shorthand for at instanciere og deklarere en arrays værdi på én linje ser sådan her ud:

<!-- Slide number: 6 -->
# Ligesom ved strings er første element i et array 0, ikke 1

System.out.println(“Det første element er “ mitArray[0]);

### Notes:

<!-- Slide number: 7 -->
# Eksempel: Find sum af 3 integers i et array

### Notes:

<!-- Slide number: 8 -->
Array + loop
# Øvelse 30 min:
Skriv en metode der både lægger alle tallene sammen og returnerer alle værdierne af integers i et array

### Notes:

<!-- Slide number: 9 -->
java.util.Arrays
int[] a = { 1, 2, 3 };

System.out.println(Arrays.toString(a));

### Notes:
Særlig Metode Klasse.

<!-- Slide number: 10 -->
Array Metoder
Arrays.toString(a)

Arrays.equals(a1, a2) // sammenligner to arrays

Arrays.sort(a) // Sorterer fx talrækkefølge

Arrays.copyOf(a) // laver kopi af et array

a.length // en built-in constant - ingen argumenter()

### Notes:
Særlig Metode Klasse.

<!-- Slide number: 11 -->
# Eksempel: Katte objekter i et KatteArray

![Image](GoogleShape144p9.jpg)

![Image](GoogleShape145p9.jpg)

![Image](GoogleShape153p9.jpg)

![Image](GoogleShape151p9.jpg)

![Image](GoogleShape152p9.jpg)

![Image](GoogleShape146p9.jpg)

![Image](GoogleShape147p9.jpg)

![Image](GoogleShape154p9.jpg)

![Image](GoogleShape150p9.jpg)

![Image](GoogleShape148p9.jpg)

![Image](GoogleShape149p9.jpg)

### Notes:

<!-- Slide number: 12 -->
# Arrays Opsummeret:
Arrays indeholder data i en index-baseret struktur
Arrays kan indeholde primitive værdier & objekter
Elementer i et array kan tilgås vha. deres index
Arrays kan blive brugt som parametre i metoder
Arrays skal have en bestemt length

### Notes:

<!-- Slide number: 13 -->

![Image](GoogleShape166p13.jpg)

### Notes:
Når man prøver at tilgå et index der ikke findes!

<!-- Slide number: 14 -->
# Indbyggede metoder
Arrays.stream(numbers).sum() konverterer et array til en stream som kan bruge metode sum(), og andre metoder såsom filtrering, mapping, reducering.For meget store datasæt er loops hurtigere!
.sum()kan kun bruges i loops
Math.min(), Math.max() Finder højeste og mindste tal i array

### Notes:

<!-- Slide number: 15 -->
# Øvelser

### Notes: