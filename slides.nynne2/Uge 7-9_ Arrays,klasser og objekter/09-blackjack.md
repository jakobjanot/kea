<!-- Slide number: 1 -->
Blackjack

![](GoogleShape129p32.jpg)

### Notes:

<!-- Slide number: 2 -->
# Koncepter vi skal bruge
variables
if, else if, else
while loop
Scanner Object
Random Object
cumulative algoritme

### Notes:

<!-- Slide number: 3 -->
# Random Object

import java.util.Random;

public class RandomExample {
   public static void main(String[] args) {
       // Lav et random objekt
       Random random = new Random();

       // Lav en random integer
       int randomInt = random.nextInt();
   }
}

### Notes:

<!-- Slide number: 4 -->
# Cumulative Algoritme

public class CummulativeExample {
   public static void main(String[] args) {
       int[] numbers = {1, 2, 3, 4, 5};
       int sum = 0; // Initialize sum til 0

       // Loop igennem array og læg alle tal sammen
       for (int num : numbers) {
           sum += num;
       }
       System.out.println("Cumulative Sum: " + sum);
   }
}

### Notes: