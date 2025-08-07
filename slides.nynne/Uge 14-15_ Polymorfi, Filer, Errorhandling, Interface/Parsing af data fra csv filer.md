<!-- Slide number: 1 -->
# Læsning eller parsing af data fra csv filer

### Notes:

<!-- Slide number: 2 -->
# Introduktion
CSV står for "Comma-Separated Values," hvilket på dansk kan oversættes til "komma-separerede værdier."
En CSV-fil er et almindeligt filformat, der bruges til at repræsentere strukturerede data i tekstform.
CSV-filer er meget udbredt inden for databehandling, da de er lette at læse og skrive for både mennesker og computerprogrammer.

2

### Notes:

<!-- Slide number: 3 -->
# Parsing af csv filer
En csv filer består af linjer hvor hver linje repræsenterer et objekt

csv fil
Klasse
Navn, Alder, By
Alice, 25, New York
Bob, 30, Los Angeles
Charlie, 22, Chicago
David, 28, San Francisco
Eva, 35, Miami

public class Person {
    private String name;
    private int age;
    private String city;
…
}

3

### Notes:

<!-- Slide number: 4 -->
# FileHandler
Vi vil gerne separere håndtering af persistens fra den øvrige kode
Herved overholder vi Single Responsability Principle og vi kan genbruge koden
Vi indfører derfor en FileHandler klasse, der netop har til formål at persistere domæne objekter til en .csv fil (udskrivning og indlæsning)
Klassen placeres typisk i en datasource pakke
Vi kan senere skifte implementeringen ud med f.eks. en database uden at resten af programmet skal ændres

FileHandler

![](GoogleShape68p8.jpg)
4

### Notes: