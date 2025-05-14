<!-- Slide number: 1 -->
Arrays II

![](GoogleShape129p32.jpg)

### Notes:

<!-- Slide number: 2 -->
# Endless loop - ikke altid synligt!
public class EndlessLoop {
   public static void main(String[] args) {
       int num = 4;
       while (num > 0) {
           System.out.println("se mit loop, wohoo");
       }
       System.out.println("slut på loop");
   }
}

### Notes:

<!-- Slide number: 3 -->
# Debugging i IntelliJ

![](GoogleShape141p34.jpg)

### Notes:

<!-- Slide number: 4 -->
# Java Primitive vs non-primitive (reference) types
Datatyper betyder alt i Java
De deles op i to slags, primitive og non-primitive
Primitive er som navnet antyder de simple byggekloder af data
Primitives gemmes direkte i hukommelsen, og derfor er de hurtige at hente igen!
De har en bestemt størrelse og kommer med default værdier
Non-primitive (reference) typer er mere komplekse
De indeholder referencer til objekter i hukommelsen, i stedet for reelle værdier

### Notes:

<!-- Slide number: 5 -->
# Indtil nu har vi kun brugt Primitive Types:
int
long
float
double
char
boolean

### Notes:

<!-- Slide number: 6 -->
# Array første reference type vi støder på
non-primitive typer:

klasser
interfaces
Arrays
Strings

### Notes:

<!-- Slide number: 7 -->
# Reference Types i Java
Laves af programmøren (fx. String, Array, Klase)
Reference data typer sender kopier af sig selv som parametre til metoder, og derfor er ændringer der sker med dem i metoder kun midlertidige
Deres defaultværdi er null, som indikerer at de ikke peger på et objekt i hukommelsen endnu

### Notes:

<!-- Slide number: 8 -->
# Arrays.toString()
System.out.println(Arrays.toString(numbers));
Nu kan vi pludselig snakke om hvorfor det ikke virker at printe et Array uden at lave en toString() metode på den først!

Hvis man bare printer et array, printer den referencen til Array i hukommelsen på dit program: [I@4aa8f0b4

### Notes: