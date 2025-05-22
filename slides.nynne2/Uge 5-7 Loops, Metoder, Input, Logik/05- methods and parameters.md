<!-- Slide number: 1 -->
Metoder og Parametre

![](GoogleShape129p32.jpg)

### Notes:

<!-- Slide number: 2 -->
# Hvad er en metode?

![](GoogleShape136p33.jpg)

![](GoogleShape135p33.jpg)

### Notes:

<!-- Slide number: 3 -->
# Hvad er en metode?
En blok af kode du kan genbruge og kalde igen og igen fordi du har givet det et navn!

### Notes:

<!-- Slide number: 4 -->
# Hvordan ser en metode ud?
public class Example {
   public static int sum(int first, int second) {
      int sum = first + second;
return sum;
   }
}

### Notes:

<!-- Slide number: 5 -->
# Metodens parametre
public class Example {
   public static int sum(int first, int second) {
int sum = first + second;
return sum;
   }
}

### Notes:

<!-- Slide number: 6 -->
# Method body
public class Example {
   public static int sum(int first, int second) {
      int sum = first + second;
return sum;
   }
}

### Notes:

<!-- Slide number: 7 -->
# Return statement
public class Example {
   public static int sum(int first, int second) {
      int sum = first + second;
return sum;
   }
}

### Notes:

<!-- Slide number: 8 -->
# Refactoreret
public class Example {
   public static int sum(int first, int second) {
       return first + second;
   }
}

### Notes:

<!-- Slide number: 9 -->
# Static vs. non-static (også kaldet instance) method
En static method tilhører den specifikke java class
En non-static (instance) method tilhører hvert object der er genereret fra den klasse
Brug static, medmindre din metode gør noget som afhænger af en bestemt class’ karakteristika
At bruge static, sparer på hvor tungt dit programs hukommelse er

### Notes:

<!-- Slide number: 10 -->
# At kalde på en statisk metode
public class Example {
   public static void main(String[] args) {
       int twoPlusFour = sum(2,4);
       System.out.println(twoPlusFour);
   }
   public static int sum(int first, int second){
       int sum;
       sum = first + second;
       return sum;
   }
}

### Notes:

<!-- Slide number: 11 -->
Opgave: skriv et program med en static metode der tager to tal (integers) og returnerer summen af de to tal

### Notes:

<!-- Slide number: 12 -->
# Hvad bliver printet til konsollen?
public class Example {
   public static void main(String[] args) {
       int twoPlusFour = sum(2,4);
       System.out.println(twoPlusFour);
       sum(3,300);
   }
   public static int sum(int first, int second){
       int sum;
       sum = first + second;
       return sum;
   }
}

### Notes:

<!-- Slide number: 13 -->
# Rækkefølge
public class Hello {
   public static void main(String[] args) {
       // Denne main metode vil altid eksekvere først
       // Den er i bunden af compilerens call stack
       System.out.println(" Hejsa Verden!");
   }
}

### Notes:

<!-- Slide number: 14 -->
# Call Stack
public class Hello {
   public static void main(String[] args) {
      methodOne();
   }
   public static void methodOne(){
       System.out.println("Jeg er inde i metode 1!");
       methodTwo();
   }
   public static void methodTwo(){
       System.out.println("Jeg er inde i metode 2!");
   }
}

![](GoogleShape208p45.jpg)

### Notes:

<!-- Slide number: 15 -->
# Method scope

![](GoogleShape214p46.jpg)

### Notes:

<!-- Slide number: 16 -->
# Method scope
public static void main(String[] args) {
  String name = "Nynne";
}
public static void sum(){
   System.out.println(name);
}

FEJL! Name variabel er  udenfor scope

### Notes:

<!-- Slide number: 17 -->
# Hvorfor bruge metoder?
Genanvendelig kode
DRY Don’t Repeat Yourself!
Bryder koden op i små logiske bidder der er nemmere at ændre / forbedre og lettere at forstå

### Notes:

<!-- Slide number: 18 -->
# Math.class

![](GoogleShape234p49.jpg)

### Notes: