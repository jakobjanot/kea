<!-- Slide number: 1 -->
Array med Objekter

![](GoogleShape129p32.jpg)

### Notes:

<!-- Slide number: 2 -->
# Søgning i liste med for loop
public static void main(String[] args) {
   ArrayList<Integer> talListe = new ArrayList<>(Arrays.asList(1, 2, 3, 4));
   soegEfterTal(talListe, 4);
}
public static void soegEfterTal(ArrayList<Integer> liste, int tal) {
   for (int i = 0; i < liste.size(); i++) {
       if (liste.get(i) == tal) {
           System.out.println("Tallet " + tal + " findes i listen på indeks " + i);
           return;
       }
   }
   System.out.println("Tallet " + tal + " findes ikke i listen.");
}

### Notes:

<!-- Slide number: 3 -->
# Objekter i ArrayList
import java.util.ArrayList;

public class Pokedex {
   private ArrayList<Pokemon> pokemonList = new ArrayList<>();

   public void addPokemon(Pokemon pokemon) {
       pokemonList.add(pokemon);
       System.out.println(pokemon.getName() + " tilføjet til Pokedex!");
   }
}
public class Pokemon {
   private String name;

   public Pokemon(String name) {
       this.name = name;
   }

   public String getName() {
       return name;
   }
}
public class Main {
   public static void main(String[] args) {
       Pokedex myPokedex = new Pokedex();
       Pokemon pikachu = new Pokemon("Pikachu");
       Pokemon charmander = new Pokemon("Charmander");
       myPokedex.addPokemon(pikachu);
       myPokedex.addPokemon(charmander);
   }
}

### Notes:

<!-- Slide number: 4 -->
# Objekter i ArrayList
import java.util.ArrayList;

public class Pokedex {
   private ArrayList<Pokemon> pokemonList = new ArrayList<>();

 public void addPokemon(Pokemon p) {
   pokemonList.add(p);
   System.out.println(p.getName() + " tilføjet!");
}
}
public class Pokemon {
private String name;
private String type;
private int level;

public Pokemon(String name, String type, int level) {
   this.name = name;
   this.type = type;
   this.level = level;
}
}
public class Main {
   public static void main(String[] args) {
Pokemon pikachu = new Pokemon("Pikachu", "Electric", 10);

myPokedex.addPokemon(pikachu);

   }
}

### Notes:

<!-- Slide number: 5 -->
# Enhanced for loop
Almindeligt for-loop: kræver tæller (index) og henter elementer manuelt fra listen:
for (int i = 0; i < liste.size(); i++) {
       System.out.println(liste.get(i));
}
Enhanced for-loop: gennemløber alle elementer i listen uden at bruge index:
for (String navn : liste) {
       System.out.println(navn);
}

### Notes:

<!-- Slide number: 6 -->
# Enhanced for loop
Enhanced for-loop: gennemløber alle elementer i listen uden at bruge index:
import java.util.ArrayList;
import java.util.Arrays;

public class EnhancedForLoopExample {
   public static void main(String[] args) {

       ArrayList<Integer> talListe = new ArrayList<>(Arrays.asList(1, 2, 3, 4));

       søgEfterTal(talListe, 4);
   }

   public static void søgEfterTal(ArrayList<Integer> liste, int tal) {
       int index = 0;
       for (int nummer : liste) { // Enhanced for-loop
           if (nummer == tal) {
               System.out.println("Tallet " + tal + " findes på indeks " + index);
               return;
           }
           index++;
       }
       System.out.println("Tallet " + tal + " findes IKKE i listen.");
   }
}

### Notes: