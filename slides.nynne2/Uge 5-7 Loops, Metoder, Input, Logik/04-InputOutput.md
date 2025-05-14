<!-- Slide number: 1 -->
Working with Inputs,
handling logic with if

![](GoogleShape77p1.jpg)

### Notes:

<!-- Slide number: 2 -->
# I/O

![Image](GoogleShape83p5.jpg)

### Notes:

<!-- Slide number: 3 -->

![Image](GoogleShape88p6.jpg)

### Notes:

<!-- Slide number: 4 -->

![Image](GoogleShape93p7.jpg)

### Notes:

<!-- Slide number: 5 -->
# System Class
Interaktion med OS
System class indeholder bl.a.
InputStream in; (input.nextInt())
PrintStream out; (System.out.println)
Filer
Input fra brugeren

### Notes:

<!-- Slide number: 6 -->
# System Class

Among the facilities provided by the System class are standard input, standard output, and error output streams; access to externally defined properties and environment variables; a means of loading files and libraries; and a utility method for quickly copying a portion of an array.
Oracle documentation

### Notes:

<!-- Slide number: 7 -->
# Scanner Class
Før du kan bruge Scanner, skal du importere den:

import java.util.Scanner;

public class Example {
   public static void main(String[] args) {
       Scanner sc = new Scanner(System.in)
   }
}

### Notes:

<!-- Slide number: 8 -->
# Scanner Class

Du skal også initialize et instans af din Scanner, før du kan bruge den:

import java.util.Scanner;

public class Example {
   public static void main(String[] args) {
       Scanner sc = new Scanner(System.in)
   }
}

### Notes:

<!-- Slide number: 9 -->
# Scanner Class

Du kan tilgå brugerens input med metoden nextLine og gemme input i et variabelnavn:
myVariableName = input.nextLine()

### Notes:

<!-- Slide number: 10 -->
# Scanner Types
myVariableName = input.nextLine()

input.nextInt();
input.nextDouble();

### Notes:

<!-- Slide number: 11 -->
# Eksempel: Input fra Scanner

### Notes:

<!-- Slide number: 12 -->
# Comments

### Notes:

<!-- Slide number: 13 -->

public class Example {
   public static void main(String[] args) {
       // Her er en linje kode kommentar

       /*
       Her er der
       flere linjer
       med kode kommentarer!
        */
       int myNumber = 1;
       // String myString = "hej!";
   }
}

### Notes:

<!-- Slide number: 14 -->
# Pseudokode
Beskrivelse af algoritme
Uformel skitsering af program
Redskab til at danne overblik

### Notes:

<!-- Slide number: 15 -->
# Divide and Conquer
public class FahrenheitConverter {
   public static void main(String[] args) {
       // Convert 100 Fahrenheit to celsius

       // Start with Fahrenheit (e.g., 100 degrees)
       // Subtract 32 from this number (100 - 32 = 68)
       // Divide answer by 1.8 (68 / 1.8 = 37.78)
       // Print the result
   }
}

### Notes:

<!-- Slide number: 16 -->
public class FahrenheitConverter {
   public static void main(String[] args) {
       // Convert 100 Fahrenheit to celsius

       // Start with Fahrenheit (e.g., 100 degrees)
       int startTemperatureFahrenheit = 100;

       // Subtract 32 from this number (100 - 32 = 68)
       // Divide answer by 1.8 (68 / 1.8 = 37.78)
       // Print the result
   }
}

### Notes:

<!-- Slide number: 17 -->
public static void main(String[] args) {
   // Convert 100 Fahrenheit to celsius

   // Start with Fahrenheit (e.g., 100 degrees)
   int startTemperatureFahrenheit = 100;

   // Subtract 32 from this number (100 - 32 = 68)
   int middlePoint = startTemperatureFahrenheit - 32;

   // Divide answer by 1.8 (68 / 1.8 = 37.78)
   // Print the result
}

### Notes:

<!-- Slide number: 18 -->
# if

else if

### Notes:

<!-- Slide number: 19 -->
If else struktur:
Betinget udførelse med to muligheder:

![](GoogleShape182g2fb1964a1f4_0_8.jpg)
if(color.equals("rød")){
   System.out.println("Rødt lys");
}
else{
   System.out.println("Grønt lys");
}

### Notes:

<!-- Slide number: 20 -->
# If – else if - Sammenkædning (chaining)
Betinget udførelse med mere end to muligheder:

![](GoogleShape190g2fb1964a1f4_0_24.jpg)
if(color.equals("rød")){
   System.out.println("Rødt lys");
}
else if (color.equals("gul")){
   System.out.println("Gult lys");
} else {
   System.out.println("Grønt lys");
}

![](GoogleShape192g2fb1964a1f4_0_24.jpg)

### Notes:

<!-- Slide number: 21 -->
# To måder at lave betingelser på

![](GoogleShape198g2fb1964a1f4_0_35.jpg)

### Notes:

<!-- Slide number: 22 -->
# Indlejrede If sætninger (nesting)

![](GoogleShape205g2fb1964a1f4_0_41.jpg)

![](GoogleShape204g2fb1964a1f4_0_41.jpg)
Indlejrede if sætninger er meget almindelige, men de bliver hurtigt svære at læse. Her bliver god indrykning vigtig for læsbarheden.

### Notes:

<!-- Slide number: 23 -->
# Boolske Operatorer
Man kan bruge boolske operatorer &&, || og ! i if-sætninger
| Operator | Description | Example | Result |
| --- | --- | --- | --- |
| \&\& | and | (2 \=\= 3\) \&\& (\-1 \< 5\) | false |
| \|\| | or | (2 \=\= 3\) \|\| (\-1 \< 5\) | true |
| ! | not | !(2 \=\= 3\) | true |

### Notes:

<!-- Slide number: 24 -->
# Eksempel  - &&

![](GoogleShape219g2fb1964a1f4_0_65.jpg)

### Notes:

<!-- Slide number: 25 -->

![](GoogleShape224g2fb1964a1f4_0_71.jpg)

![](GoogleShape225g2fb1964a1f4_0_71.jpg)
  Eksempel er taget herfra: https://greenteapress.com/thinkjava7/thinkjava2.pdf

### Notes:

<!-- Slide number: 26 -->
# Øvelser

### Notes: