<!-- Slide number: 1 -->
Unit Test

![](GoogleShape129p32.jpg)

### Notes:

<!-- Slide number: 2 -->
# Unit tests
Software testing
Unit testing

### Notes:

<!-- Slide number: 3 -->

![](GoogleShape142p34.jpg)
# Software Testing

![](GoogleShape141p34.jpg)

### Notes:

<!-- Slide number: 4 -->

SOFTWARE TEST 4 NIVEAUER:

ACCEPTANCE TESTING

SYSTEM TESTING
Omfang

INTEGRATION TESTING

UNIT TESTS
Tid

### Notes:

<!-- Slide number: 5 -->
# De 4 Niveauer af Testing
Unit test — individuelle komponenter
Integration test — integrerede komponenter
System test — HELE systemet
Acceptance test — det færdige system

### Notes:

<!-- Slide number: 6 -->
# Hvad er en unit?

![](GoogleShape172p37.jpg)

![](GoogleShape173p37.jpg)

### Notes:

<!-- Slide number: 7 -->
# Unit test

![](GoogleShape179p38.jpg)

![](GoogleShape180p38.jpg)

### Notes:

<!-- Slide number: 8 -->
# Classes/Objects = units

![](GoogleShape186p39.jpg)

### Notes:

<!-- Slide number: 9 -->

![](GoogleShape192p40.jpg)

![](GoogleShape191p40.jpg)

### Notes:

<!-- Slide number: 10 -->
# Arrange Act Assert
https://freecontent.manning.com/making-better-unit-tests-part-1-the-aaa-pattern/

### Notes:

<!-- Slide number: 11 -->
# Equivalence Partitioning

![](GoogleShape204p42.jpg)
https://en.wikipedia.org/wiki/Equivalence_partitioning

### Notes:

<!-- Slide number: 12 -->
# Equivalence Partitioning

![](GoogleShape211p43.jpg)

### Notes:

<!-- Slide number: 13 -->
# Borderline Analysis

![](GoogleShape217p44.jpg)

### Notes:

<!-- Slide number: 14 -->
# JUnit 5
Det mest anvendte test-framework til Java
Bruges til at skrive og køre unit tests
import static org.junit.jupiter.api.Assertions.assertEquals;

import example.util.Calculator;

import org.junit.jupiter.api.Test;

class MyFirstJUnitJupiterTests {

   private final Calculator calculator = new Calculator();

   @Test
   void addition() {
       assertEquals(2, calculator.add(1, 1));
   }

}

### Notes:

<!-- Slide number: 15 -->
# Assertions
En påstand om hvad der skal være sandt i din kode.
Med unit test bruger du Assertions til at verificere at koden fungerer som planlagt.
Hvis testen fejler, ved du at der er noget galt med den kode du tester.

### Notes:

<!-- Slide number: 16 -->
# Assertions eksempler

//check om to værdier er ens

assertEquals(5, myCalculator.add(2, 4));

//check om en boolean er sand eller falsk

	assertTrue(user.isLoggedIn());

//check om noget er null

	assertNotNull(user.getEmail());

//check om en bestemt exception bliver kastet

	assertThrows(IllegalArgumentException.class, () -> {
       new Person(null);
});

### Notes:

<!-- Slide number: 17 -->

public class Tulip {
   private String color;

   public Tulip(String color) {
       this.color = color;
   }

   public String getDescription() {
       return "Tulip color is: " + color;
   }

   public String getColor() {
       return color;
   }
}
# Assertions🌷🌷🌷

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class TulipTest {

   @Test
   void testGetDescription() {
       Tulip t = new Tulip("Red");
       assertEquals("Tulip color is: Red", t.getDescription());
       assertNotNull(t.getDescription());
   }
}

### Notes: