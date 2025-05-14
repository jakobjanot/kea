<!-- Slide number: 1 -->
ArrayList

![](GoogleShape55p13.jpg)

### Notes:

<!-- Slide number: 2 -->
“An ArrayList is a collection, which is an object that contains other objects. It provides methods to add and remove elements, and it grows and shrinks automatically.”

### Notes:

<!-- Slide number: 3 -->
# En resizable slags Array
ArrayList kan dynamisk skifte størrelse, modsat Array
Importeres fraJava.util package:  import java.util.ArrayList;
Kommer med mange smarte indbyggede metoder

### Notes:

<!-- Slide number: 4 -->
# Lidt anden syntax end Array
import java.util.ArrayList;
public class Main {
   public static void main(String[] args) {
       ArrayList<String> pokemon = new ArrayList<String>();
       pokemon.add("Jigglypuff");
       pokemon.add("Pikachu");
       pokemon.add("Bulbasaur");
       pokemon.add("Cherubi");
       System.out.println(pokemon);
   }
}

### Notes:

<!-- Slide number: 5 -->
# Ligesom et Array, skal typen på inhold defineres:

import java.util.ArrayList;
public class Main {
   public static void main(String[] args) {
       ArrayList<Integer> mineTal = new ArrayList<Integer>();
       mineTal.add(1);
       mineTal.add(2);
       mineTal.add(3);
       mineTal.add(4);
       for (int i : mineTal) {
   			System.out.println(i);
}
   }
}

### Notes:

<!-- Slide number: 6 -->
# Array skal have startværdi / fast defineret størrelse
ArrayList kan have startværdi

// Array med startværdier
String[] pokemonArray = {"Pikachu", "Charmander", "Bulbasaur", "Squirtle"};

System.out.println("Pokémon in Array:");
for (String pokemon : pokemonArray) {
   System.out.println(pokemon);
}

// ArrayList med startværdier

List<String> pokemonList = new ArrayList<>(Arrays.asList("Aurorus", "Wurmple", "Komala", "Drampa"));

System.out.println("Pokémon List: " + pokemonList);

### Notes:

<!-- Slide number: 7 -->
# Array
ArrayList

String[] pokemonArray = {"Pikachu", "Charmander", "Bulbasaur", "Squirtle"};

// Nu printer jeg mit Array:
System.out.println("Pokémon in Array:");
for (String pokemon : pokemonArray) {
   System.out.println(pokemon);
}
ArrayList<String> pokemonList = new ArrayList<>();

// Tilføjer elementer til ArrayList:
pokemonList.add("Weedle");
pokemonList.add("Jigglypuff");
pokemonList.add("Wigglytuff");
pokemonList.add("Wenemoth");

// Nu printer jeg ArrayList
System.out.println("Pokémon in ArrayList:");
for (String pokemon : pokemonList) {
   System.out.println(pokemon);
}

### Notes:

<!-- Slide number: 8 -->
# Array
ArrayList
Har fixed size, hvilket betyder du skal definere hvor mange elementer det har når du opretter det
Kan ikke vokse eller skype dynamisk.
Bruges til at opbevare primitive types (int, double) og objekter
Dynamisk størrelse—du kan tilføje eller fjerne elementer.
Kommer med built-in methods såsom add(), remove() og contains(), der gør det nemt at manipulere data.
Kan kun indeholde objekter (fx Integer i stedet for int).

### Notes:

<!-- Slide number: 9 -->
# int
Integer
Primitiv type, fylder meget lidt.
Hurtig at hente i hukommelsen og derfor smart.
Kan ikke være null, men defaulter til 0.
Ingen built-in-methods, det er bare et tal!
En slags objekt-indpakning til int.
Fylder mere i hukommelsen, langsommere at hente og derfor mindre effektiv.
Kan have null værdi.
Har smarte indbyggede metoder fx. parseInt(), valueOf(), toString().

### Notes:

<!-- Slide number: 10 -->
# Tilføj og Fjern elementer

![](GoogleShape119p22.jpg)

### Notes:

<!-- Slide number: 11 -->
# Indbyggede metoder!
add() Add an item to the list. Returnerer: boolean|void
addAll() Add a collection of items to the list. Returnerer: boolean
clear() Remove all items from the list. void
clone() Create a copy of the ArrayList Object
contains() Checks whether an item exist in the list boolean
ensureCapacity() Increase the capacity of the list to be able to fit a specified number of items void
forEach() Perform an action on every item in the list void
get() Return the item at a specific position in the list
indexOf() Return the position of the first occurrence of an item in the list int
isEmpty() Checks whether the list is empty boolean
iterator() Return an Iterator object for the ArrayList Iterator
lastIndexOf() Return the position of the last occurrence of an item in the list int
listIterator() Return a ListIterator object for the ArrayList

### Notes:

<!-- Slide number: 12 -->
# ArrayList || Array?

< > ()
[ ]

![](GoogleShape135p24.jpg)

![](GoogleShape133p24.jpg)

### Notes:

<!-- Slide number: 13 -->

![](GoogleShape141p25.jpg)
at forstå Java performance optimization

### Notes:

<!-- Slide number: 14 -->
# Hvorfor ikke altid ArrayList?
Hvis du ved hvor stort dit Array skal være, vil det altid være bedst form at bruge Array med fast defineret størrelse
ArrayList elementer gemmes på en anden måde, og er tungere for hukommelsen på dit program
Det hører med til godt software håndværk at tænke grundigt over performance på det kode du skriver!

### Notes: