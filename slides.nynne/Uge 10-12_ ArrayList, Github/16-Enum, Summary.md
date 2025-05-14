<!-- Slide number: 1 -->
Enum

![](GoogleShape55p13.jpg)

### Notes:

<!-- Slide number: 2 -->
# Hvad er Enum?
En særlig type der bruges til at definere en samling af konstanter
Enums bruges til at definere værdier for en variabel der ikke kan ændres
De er smarte til kategorier du ved ikke kommer til at ændre sig: ugedage, måneder i året etc.
Enums giver typesikkerhed og gør din kode mere pålidelig

### Notes:

<!-- Slide number: 3 -->
enum levels {
   LOW, MEDIUM, HIGH;
}
// Enums har ingen type og de kan aldrig ændre værdi
public class LetsDoEnums {
// Det her er bare et Array
//    static String[] levels = {"low", "medium", "high"};
   public static void main (String[] args){
//        System.out.println(levels[0]);
//        System.out.println(levels[1]);
//        System.out.println(levels[2]);
       levels h = levels.HIGH;
       System.out.println(h);
   }
}

### Notes:

<!-- Slide number: 4 -->
# Hvorfor bruge Enum?
Type sikkerhed: forhindrer forkerte værdier
Nemt at læse og forstå
Bedre design: afgrænser konstanter på en struktureret måde (encapsulation!)
Kan bruges i switch statements for at give bedre kontrol over logik

### Notes:

<!-- Slide number: 5 -->
# Deklarering af Enum
enum  Fruits
{
   APPLE, BANANA, GRAPES;
}

### Notes:

<!-- Slide number: 6 -->
# Deklarering inde i en klasse
public class Fruits {
   //Deklarering af Enum inde i klassen
   enum Fruit {
       APPLE("RED"), BANANA("YELLOW"), GRAPES("GREEN");
       private String color;
       Fruit(String color) {
           this.color = color;
       }
       public String getColor() {
           return color;
       }
   }
   public static void main(String[] args) {
       for (Fruit f : Fruit.values()) {
           System.out.println(f + " is " + f.getColor());
       }
   }
}

### Notes:

<!-- Slide number: 7 -->
# Deklarering udenfor en klasse
enum Fruit {
   //Deklarering af Enum udenfor klassen
   APPLE("RED"), BANANA("YELLOW"), GRAPES("GREEN");
   private String color;
   Fruit(String color) {
       this.color = color;
   }
   public String getColor() {
       return color;
   }
}
public class FruitsTest {
   public static void main(String[] args) {
       for (Fruit f : Fruit.values()) {
           System.out.println(f + " is " + f.getColor());
       }
   }
}

### Notes:

<!-- Slide number: 8 -->
# Hvordan bruger man Enum
enum  Fruit
{
APPLE,
BANANA,
GRAPES;
}
public class FruitPicker {
   public static void main(String[] args) {
       Fruit bestFruit = Fruit.BLUEBERRY;
       System.out.println("Best fruit is " + bestFruit);
   }
}

### Notes:

<!-- Slide number: 9 -->
# Udskrive alle værdierne i et Enum
System.out.println("All types of fruit");
for (Fruit type : Fruit.values()){
   System.out.println(type);
}

EnumType.values() returnerer et array med alle definerede værdier i en EnumType
Du kan iterere over dem med et for loop

### Notes:

<!-- Slide number: 10 -->
# Enum med atributter
enum  Fruits
{
   APPLE(“RED”), BANANA(“YELLOW”), GRAPES(“GREEN”);
}

### Notes:

<!-- Slide number: 11 -->
# Enum & Switch
enum Mood {
   HAPPY,TIRED;
}
public class MoodChecker {
   public static void main(String[] args) {
       Mood currentMood = Mood.HAPPY;
       switch (currentMood) {
           case HAPPY:
               System.out.println("Yay gode vibes 😊");
               break;
           case TIRED:
               System.out.println("Husk at hvile dig og tage pauser 😴");
               break;
           default:
               System.out.println("Det mood kender jeg ikke.");
       }
   }
}

### Notes: