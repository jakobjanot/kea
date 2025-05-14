<!-- Slide number: 1 -->
OOP — Inheritance II

![](GoogleShape65p15.jpg)

### Notes:

<!-- Slide number: 2 -->
# Opsamling fra sidste klasse

### Notes:

<!-- Slide number: 3 -->
# feedback:
I er velkomne til at komme med feedback til mig i klassen eller på mail.

I kan også sende en skriftlig klage eller booke en snak med vores uddannelseschef, Bård.

### Notes:

<!-- Slide number: 4 -->

![](GoogleShape81p18.jpg)

### Notes:

<!-- Slide number: 5 -->

![](GoogleShape86p19.jpg)

### Notes:

<!-- Slide number: 6 -->

![](GoogleShape91p20.jpg)

### Notes:

<!-- Slide number: 7 -->
# Det er hårdt og svært at lære, især programmering
Noget af det allervigtigste er faktisk at have et trygt og rart socialt rum til det

![](GoogleShape100p21.jpg)

![](GoogleShape98p21.jpg)

![](GoogleShape99p21.jpg)

### Notes:

<!-- Slide number: 8 -->
# Hvad er den mest Objektorienterede
måde at blive rig på?
🥁

### Notes:

<!-- Slide number: 9 -->
OOP — Inheritance II

![](GoogleShape111p23.jpg)

### Notes:

<!-- Slide number: 10 -->
# super()
super() bruges typisk til at referere til superklassens metoder, felter eller konstruktører.
Den anvendes i tre situationer:
super() → kalder superklasens konstruktør.
super.metodeNavn() → kalder en metode fra superklassen
super.variabelNavn → tilgår en variabel fra superklassen (kræver at variablen ikke er private)

### Notes:

<!-- Slide number: 11 -->
public class Animal {
   String name;
   public Animal (String name){
       this.name = name;
   }
   public void makeSound() {
       System.out.println("grynt pruh miau vuf øff muu!");
   }
}
public class Penguin extends Animal {
   public Penguin(String name){
       super(name);
   }
   @Override
   public void makeSound(){
      System.out.println("meepmeep!");
   }
}
# Kalde superklassens contructor
En subklasse arver ikke superklassens constructor
men kan kalde på den ved hjælp af super().

### Notes:

<!-- Slide number: 12 -->
# Kalde superklassens metoder
public class Animal {
   String name;
   public Animal (String name){
       this.name = name;
   }
   public void makeSound() {
       System.out.println("muu!");
   }
}

public class Cow extends Animal {
   @Override
   void makeSound(){
       System.out.println("Koen siger");
       super.makeSound();
   }
}
Hvis en subklasse har en metode med samme navn som superklassen, kan vi bruge:
super.metodeNavn() for at kalde superklassens version af metoden

### Notes:

<!-- Slide number: 13 -->
| CYKEL |
| --- |
| String: farve, Int: hjul, Double: nypris, Int: kilometerKoert |
| toString() |
| LADCYKEL |
| --- |
| String: farve, Int: hjul \= 3; Double: nypris, Int: kilometerKoert |
| toString() |
| ETHJULET |
| --- |
| String: farve, Int: hjul \= 1; Double: nypris, Int: kilometerKoert |
| toString() |

### Notes:

<!-- Slide number: 14 -->
# @Override

class Cat extends Animal {
   @Override
   public void makeSound() {
       System.out.println("Cat meows.");
   }
}

### Notes:

<!-- Slide number: 15 -->
# Problemløsning
“If you can’t explain something in simple terms, you don’t understand it.” — Richard Feynman

“If I had an hour to solve a problem I'd spend 55 minutes thinking about the problem and 5 minutes thinking about solutions.” — Albert Einstein

### Notes:

<!-- Slide number: 16 -->
# At forstå problemet:
Skriv problemet ned
Tegn et diagram
Fortæl nogen om dit problem
Rubber Ducking

### Notes:

<!-- Slide number: 17 -->
# Pseudokode

![](GoogleShape169p31.jpg)

### Notes:

<!-- Slide number: 18 -->
# Class Diagram

![](GoogleShape175p32.jpg)

### Notes:

<!-- Slide number: 19 -->

![](GoogleShape180p33.jpg)

### Notes:

<!-- Slide number: 20 -->

![](GoogleShape185p34.jpg)

### Notes:

<!-- Slide number: 21 -->
Bonus link: https://youtu.be/W8VhFor9zYU

![](GoogleShape191p35.jpg)

### Notes: