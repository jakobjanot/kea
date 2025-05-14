<!-- Slide number: 1 -->
Overloading Constructor

![](GoogleShape129p32.jpg)

### Notes:

<!-- Slide number: 2 -->
# Default Constructor

• En default constructor er en konstruktør oprettet af compileren, hvis vi ikke definerer nogen konstruktør(er) for en klasse. Denne konstruktør har ingen argumenter.

![](GoogleShape136p33.jpg)

![](GoogleShape137p33.jpg)

### Notes:

<!-- Slide number: 3 -->
# Default Constructor

Denne kode printer: null
Java udfylder ikke værdierne for os
Hvis vi selv har defineret en konstruktør, definerer java den ikke for os

![](GoogleShape145p34.jpg)

![](GoogleShape144p34.jpg)

### Notes:

<!-- Slide number: 4 -->
# no-argument Constructor

![](GoogleShape152p35.jpg)
Der er regler man skal følge når man laver en constructor:
Navnet skal være ens med klassen
constructor skal have no return type (void)

### Notes:

<!-- Slide number: 5 -->
# Eksempel: Cat

Cat figaro = new Cat();
Vi laver en variabel; med navnet figaro, med typen Cat.
For at skabe et nyt objekt kan vi sige new Cat();
This  will create a new object.

![](GoogleShape160p36.jpg)

![](GoogleShape159p36.jpg)

### Notes:

<!-- Slide number: 6 -->
# Overloading Constructor

![](GoogleShape167p37.jpg)
I denne implementering er der en klasse Box med kun én konstruktør, der tager tre argumenter.
Det betyder, at alle deklarationer af Box-objekter skal sende tre argumenter til Box() konstruktør.

### Notes:

<!-- Slide number: 7 -->
# Overloading Constructor

![](GoogleShape174p38.jpg)
Da Box() kræver tre argumenter, er det en fejl at kalde den uden dem
Hvad hvis vi vil have et Box objekt uden at kende dets dimensioner?
I dette her tilfælde vil det være et problem
MEN det kan løses ved constructor overloading

### Notes:

<!-- Slide number: 8 -->
# this keyword

![](GoogleShape181p39.jpg)
this refererer til instansen af objektet
Det betyder, at vi sætter navnet ("figaro"), der kom fra oprettelse af et nyt objekt, til at være navnet på instansen af objektet

### Notes: