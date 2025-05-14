---
title: 24 - Collection sort
---

<!-- Slide number: 1 -->
Sortering

![](GoogleShape56p13.jpg)

![](GoogleShape55p13.jpg)

### Notes:

<!-- Slide number: 2 -->
# Læringsmål
Kort introduktion til sortering og naturlig orden
Comparable
Collections.sort()

### Notes:

<!-- Slide number: 3 -->
# Eksamensemner programmering 2024
Alle disse emner skal ses som overskrifter da der kan være flere ting der hører ind under emnet:

Hovedemner:
Metoder/metodekald. parameteroverførsel
Loops. for / for each / while / do while
if / else / switch
working with files / Scanner/printStream objekt
Arrays / multidimensional Arrays, traversing
ArrayList / vs Arrays
Klasser/objekter.
Arv. super klasse/subklasse
Interface / polymorphism
Collection sort

### Notes:

<!-- Slide number: 4 -->
# Eksamens Prep: Terminologiøvelse 40 min
Sæt jer sammen i grupper og forklar skiftevis til jeres gruppe hvad hver term betyder, med dine egne ord, uden at slå op eller bruge hjælpemidler! Computeren skal være klappet sammen
Det ok hvis der er ting ingen af jer kan. Sæt flueben ved hvert ord ingen kunne forklare.
Til sidst deler i de ubekendte ord op, finder ud af hvad de står for, og forklarer dem til gruppen.

### Notes:

<!-- Slide number: 5 -->
# Terminologiøvelse indtil kl: 09:20

### Notes:

<!-- Slide number: 6 -->
Collection .sort

### Notes:

<!-- Slide number: 7 -->
# Selection Algorithm
In computer science, a selection algorithm is an algorithm for finding the smallest value in a collection of ordered values, such as numbers. The value that it finds is called the order statistic. Selection includes as special cases the problems of finding the minimum, median, and maximum element in the collection.

https://en.wikipedia.org/wiki/Selection_algorithm

### Notes:

<!-- Slide number: 8 -->
# Sammenligning og Naturlig Orden
Sammenligningsfunktion ("comparison function")
En veldefineret procedure for at afgøre den relative orden mellem to elementer.

Naturlig orden ("natural order")
Den orden, som anvendes på en type baseret på sammenligningsfunktionen jf. Ovenfor.

Eksempel: sortere int efter størst eller minds, sortere strings alfabetisk efter forbogstav.

### Notes:

<!-- Slide number: 9 -->
# Sortering af en liste med selection sort

![](GoogleShape102p21.jpg)

### Notes:

<!-- Slide number: 10 -->
# Comparable
Definerer en naturlig orden på et objekt af en klasse (fx numerisk, alfabetisk, kronologisk)
Klassen implementerer Comparable interface og definerer en compareTo metode
Denne metode dikterer hvordan to instanser af klassen skal sammenlignes
1
2
3
4
5

### Notes:

<!-- Slide number: 11 -->
# Comparable kode eksempel
public class Apple implements Comparable<Apple> {
   @Override
   public int compareTo(Apple other) {
       return Integer.compare(this.price, other.price);
   }
}

### Notes:

<!-- Slide number: 12 -->
# Comparator
Selvbestemmelse over sorterings logik, så du kan sortere efter andet en numerisk, alfabetisk, kronologisk rækkefølge etc
Comparator implementeres som egen klasse og definere en skræddersyet compare metode

![](GoogleShape132p24.jpg)

![](GoogleShape131p24.jpg)

![](GoogleShape133p24.jpg)

### Notes:

<!-- Slide number: 13 -->
# Comparator kode eksempel
public class NameComparator implements Comparator<Apple> {
   @Override
   public int compare(Apple a1, Apple a2) {
       return a1.getName().compareToIgnoreCase(a2.getName());
   }
}

### Notes:

<!-- Slide number: 14 -->
# Sortering af Data Opsummering
Lister (arrays) af kan sorteres, fx numerisk, alfabetisk, kronologisk.

Collection.sort kommer fra Collections klassen og er en sorteringsmetode som bruges til at sorterer lister.

Hvis listen består af egne objekter i en klasse man selv har lavet, skal klassen implementere Comparable og compareTo metoden skal benyttes for at .sort metoden virker.

### Notes: