<!-- Slide number: 1 -->
OOP — Inheritance

![](GoogleShape65p15.jpg)

### Notes:

<!-- Slide number: 2 -->
# Nøglekoncepter ved Klasser i Java:
Når vi definerer en class, skabes en ny objekt type med samme navn

En class definition er en template for objekter: det bestemmer hvilke atributter objektet skal have og hvilke metoder der kan operere på dem

Hvert objekt tilhører en object type, og er en instans af den klasse

new operator instantierer objekter = laver nye instanser af en class

### Notes:

<!-- Slide number: 3 -->
# Is an

![](GoogleShape77p17.jpg)

### Notes:

<!-- Slide number: 4 -->
# Alle løver er et dyr — ikke alle dyr er en løve!

![](GoogleShape91p18.jpg)

Superclass

Subclass

Multi-level inheritance

### Notes:

<!-- Slide number: 5 -->
# Hvorfor Inheritance
Får os til at genanvende kode blokke, i stedet for at duplikere koden flere steder
Sublasses kan nedarve fra Superclass og nu skal ændringer kun finde sted i én class: Superclass

### Notes:

<!-- Slide number: 6 -->
# extends{}
Med extends{} fortæller man compileren hvilken klasse der nedarves fra
‘Barne’ klassen kan ændre metoder fra ‘forældre’ klassen vha. @override
Man kan teknisk set ændre metoder fra superclass uden at bruge @override, men det er best practice, så husk at brug dette keyword!

### Notes:

<!-- Slide number: 7 -->
# super()

Med super() refererer man til constructeren den arver fra i dens superclass
class Fruit {
   void taste() {
       System.out.println("Frugt kan smake både sødt og surt");
   }
}

class Apple extends Fruit {
   @Override
   void taste() {
       super.taste();
       System.out.println("Æbler smager sødt, for det meste");
   }
}

### Notes:

<!-- Slide number: 8 -->
# Implements{} — lærer vi om senere med Interfaces
Et keyword der bruges når en klasse implementerer fra et interface
I en klasse der implements{} et interface skal man lave en implementering af alle metoderne der kommer fra det interface med @override

### Notes: