<!-- Slide number: 1 -->
Conditionals & Booleans

![](GoogleShape80p1.jpg)

### Notes:

<!-- Slide number: 2 -->
# Opsamling på metoder

public class Metode {
   public static void main(String[] args) {
       //main er en metode, som vi nu er vant til at bruge
       System.out.println("Dette her er også en metode!");
   }
}

### Notes:

<!-- Slide number: 3 -->
# Metoder

public class MegetLangtMetodenavnMaaskeFindpaaNogetKortereMenDetSkalVaerePascalCase {
   public static void main(String[] args) {
       // er main metoden et krav?
       // skal alle klasser have en main metode?
   }
   // kan man skrive kode her?
}

### Notes:

<!-- Slide number: 4 -->
# Metoder
main metoden er ikke et krav i ALLE klasser!
Derimod er det et krav at ÉN klasse i dit program er:
public
main
har returtype void
accepterer et array af Strings (String[] args) som eneste parameter
Det ER muligt at skrive al din kode inde i en main klasse
Det er en dårlig praksis! Vi skal bryde koden op i metoder der hver har et job, for at koden er mere robust og DRY

### Notes:

<!-- Slide number: 5 -->
# Metode Anatomi

public static <returType> <MetodeNavn>(<ParameterType> <ParameterNavn>){
   // Method Body (altid inde i {})
}

<ReturType>: int, double, boolean osv.
<MetodeNavn>: Vi vælger selv navnet. Skal være CamelCase.
<ParameterType>: String, int osv.
<ParameterNavn>: Vi vælger selv navnet.

### Notes:

<!-- Slide number: 6 -->
# Forskellige Typer af metoder
Der findes forskellige typer af metoder i Java
void metoder uden parametre
System.out.println();
void metoder med parametre
System.out.println(“Hello World!”);
Metoder der returnerer værdier uden parametre
scanner.nextline();
Metoder der returnerer værdier med parametre
“noget tekst”.replace(“ “, “_”);
OBS! void betyder at metoden ikke har nogen returværdi.

### Notes:

<!-- Slide number: 7 -->
# void metode uden parametre
En void metode er en metode uden returværdi.
Uden parametre betyder at vi ikke “sender” noget til metoden:

public class MetodeEksempelVoidIngenParametre {
   // Metode der printer hilsen
   public static void printGreeting(){
       System.out.println("Hej, Datamatikere!");
   }
   public static void main(String[] args) {
       // Nu kalder vi på metoden
       printGreeting();
   }
}

### Notes:

<!-- Slide number: 8 -->
Eksempel i IntelliJ - void metode uden parametre
ProgramStart

### Notes:

<!-- Slide number: 9 -->
# void metode med parametre

public class MetodeEksempelVoidMedParameter {
   // void metode med parameter
   public static void greetPerson(String name){
       System.out.println("Hej, " + name);
   }
   public static void main(String[] args) {
       String firstname = "Ulla";
       greetPerson(firstname);
   }
}

Bemærk at vores main metode giver firstName som input til greetPerson. I selve greetPerson, hedder parameteren name.
Vi kan kalde parameteren inde i vores greetPerson lige hvad der passer os

### Notes:

<!-- Slide number: 10 -->
Eksempel i IntelliJ - void metode med parametre
ProgramStartWithParameters

### Notes:

<!-- Slide number: 11 -->
# metode med returværdi uden parametre

public class MetodeEksempelMedReturvaerdiUdenParametre {
   // metoden returnerer en int og har ingen input
   public static int getSomeNumber(){
       int someNumberFromCalculation = 12;
       return someNumberFromCalculation;
   }
   public static void main(String[] args) {
       int someNumber = getSomeNumber();
       System.out.println("Resultatet er: " + someNumber);
   }
}

### Notes:

<!-- Slide number: 12 -->
# metode med returværdi med parametre

public class MetodeEksempelMedReturvaerdiMedParametre {
   // metoden returnerer en string med parametre
   public static String getFullName(String firstName, String lastName){
       String fullName = firstName + " " + lastName;
       return fullName;
   }
   public static void main(String[] args) {
      String firstName = "Ada";
      String lastName = "Lovelace";
      String fullName = getFullName(firstName, lastName);
       System.out.println("Hello " + fullName);
   }
}

### Notes:

<!-- Slide number: 13 -->
# static vs non-static methods
Hvorfor er der forskellige måder at kalde metoder på?
System.out.println("Hello World!");
Scanner scanner = new Scanner(System.in)
scanner.nextLine();
static vs non-static
static metoder kaldes direkte uden at oprette et objekt (de tilhører klassen) - eksempel Hello World
non-static metoder kræver et objekt for at blive kaldt (de tilhører et specifikt objekt) - eksempel Scanner

### Notes:

<!-- Slide number: 14 -->
# static vs non-static methods
System.out.println("Hello World!");
Scanner scanner = new Scanner(System.in)
scanner.nextLine();
println() er en statisk metode fra System.out, så vi kan kalde den uden at oprette et objekt (dvs. bruge new)
nextLine() er en non-static metode fra Scanner klassen, så vi er nødt til at oprette et objekt (scanner) for at bruge den.

### Notes:

<!-- Slide number: 15 -->
# static vs non-static methods
static Metoder
 Tilhører selve klassen, ikke et objekt.
Kaldes direkte via klassen ( vi skal ikke bruge new keyword)
non-static Metoder
Tilhører et objekt og kræver at vi skal bruge  new keyword for at oprette et objek.
 Bruges typisk til at arbejde med objektets data (kommer vi til om et par uger!)

### Notes:

<!-- Slide number: 16 -->
# Logik / Relational Operators

### Notes:

<!-- Slide number: 17 -->
# Relational Operators

![Image](GoogleShape184p6.jpg)

### Notes:

<!-- Slide number: 18 -->
# Boolske Operatorer
Man kan bruge boolske operatorer &&, || og ! i if-sætninger
| Operator | Description | Example | Result |
| --- | --- | --- | --- |
| \&\& | and | (2 \=\= 3\) \&\& (\-1 \< 5\) | false |
| \|\| | or | (2 \=\= 3\) \|\| (\-1 \< 5\) | true |
| ! | not | !(2 \=\= 3\) | true |

### Notes:

<!-- Slide number: 19 -->
# final keyword
 final keyword er en non-access modifier der kan bruges til classes, metioder og variabler
 Det gør en værdi umulig at ændre

### Notes:

<!-- Slide number: 20 -->
# Evaluating Expressions
public static void main(String[] args) {
int heightFromUser; // input fra brugeren
final int HEIGHT_LIMIT = 160; // hard limit på højde
if(HEIGHT_LIMIT > heightFromUser){
System.out.println("Du er ikke høj nok!");
  	}
}

### Notes:

<!-- Slide number: 21 -->
# else
public static void main(String[] args) {
int heightFromUser; // input fra brugeren
   final int HEIGHT_LIMIT = 160; // hard limit på højde
   if(HEIGHT_LIMIT > heightFromUser){
       System.out.println("Du er ikke høj nok!");
   }
   else{
       System.out.println("Du må gerne komme ind");
   }
   System.out.println("Nu er det slut");
}

### Notes:

<!-- Slide number: 22 -->
# else if
public static void main(String[] args) {
   if(x){
       System.out.println("x!");
   }
   else if (y){
       System.out.println("Y!");
   } else {
       System.out.println("Z!");
   }
}
Husk sekvensen altid slutter med else

### Notes:

<!-- Slide number: 23 -->
# Nested if statement
public static void whatArticleToDisplay() {
   if (xloggedIn == true) {
       if (isPremiumUser == true) {
           displayArticleWithPremiumContent:

       } else {
           displayArticle();
       }
   }
   displayPayWall();
}

### Notes:

<!-- Slide number: 24 -->
# Logik kan drille!
public class Clubhouse {
   public boolean isOlEnoughToEnter(int age){
       //man skal være fyldt 18 for at komme ind
       if(18 >= age){
           System.out.println("Velkommen i klubhuset!");
           return true;
       } else{
           System.out.println("Ud!");
           return false;
       }
   }
}

### Notes:

<!-- Slide number: 25 -->
# Logic Error / Bugs
Giver andet resultat end forventet
Bliver ikke fanget af compiler
Fanges med tests
CodingBat/Codewars sørger for at teste for dig
Syntax er korrekt - logikken er forkert

### Notes:

<!-- Slide number: 26 -->
# Switch
En switch metode giver det samme som if else blokke: evaluering med udfald for hvert enkelt tilfælde
public class Switch {
   public boolean switchExample(){
     switch(/*expression*/)
       case /*tilfælde 1*/:
           /* Hvad der skal ske*/
       case /*tilfælde 2*/:
           /* Hvad der skal ske*/
       case /*tilfælde 3*/:
           /* Hvad der skal ske*/
       }
   }
}

### Notes:

<!-- Slide number: 27 -->
# Switch
Flere forskellige udfald med den samme expression
gør det samme som if/else
Switch kan være lettere at læse / mere kompakt

### Notes:

<!-- Slide number: 28 -->
String dayOfTheWeek;
 switch(getNumberOfTheWeek()){
   case 0:
       dayOfTheWeek = "Monday";
       break;
   case 1:
       dayOfTheWeek = "Tuesday";
       break;
   case 2:
       dayOfTheWeek = "Wednesday";
       break;
   case 3:
       dayOfTheWeek = "Thursday";
       break;
   case 4:
       dayOfTheWeek = "Friday";
       break;
   case 5:
       dayOfTheWeek = "Saturday";
       break;
   case 6:
       dayOfTheWeek = "Sunday";
       break;
 }

# Switch

### Notes:

<!-- Slide number: 29 -->
public class Switch {
   String season;

     switch(getMonthInNumber()){
       case 11:
       case 0:
       case 1:
           season = "Winter is coming";
           break;
       case 2:
       case 3:
       case 4:
           season = "Spring";
           break;
       case 5:
       case 6:
       case 7:
           season = "Summer";
           break;
       case 8:
       case 9:
       case 10:
           season = "Fall";
           break;
     }
}
# Switch flere cases

### Notes:

<!-- Slide number: 30 -->
# Ternary
variable = Expression1 ? Expression2: Expression3

public class TernaryFruitChecker {
   public static void main(String[] args) {
       String fruit = "jordbær";

       String result = fruit.equals("Jordbær") ? "Det et jordbær!" :
               fruit.equals("æble") ? "Det er et æble!" :
                       fruit.equals("banan") ? "Det er en banan!" :
                               "ukendt frugt";

       System.out.println(result);
   }
}

### Notes:

<!-- Slide number: 31 -->
# Ternary kan blive utrolig kompakt
Husk på at det vigtigste er at koden er let at forstå. Kompaktere er ikke altid bedre!

public class TernaryOddEven {
   public static void main(String[] args) {
       int num = 10;
       String result = (num % 2 == 0) ? "Even" : "Odd";
       System.out.println(result);
   }
}

### Notes:

<!-- Slide number: 32 -->

![](GoogleShape278g2fbf264d0d5_0_118.jpg)
# codingbat

### Notes:

<!-- Slide number: 33 -->
# Øvelser

### Notes: