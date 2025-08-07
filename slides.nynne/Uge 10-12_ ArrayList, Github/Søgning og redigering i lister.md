<!-- Slide number: 1 -->

![](object5.jpg)
# Søgning

<!-- Slide number: 2 -->
# Søgning
❏	Søgning efter elementer i en liste er et almindeligt forekommende problem i programmering
❏	Eksempler:
Søg efter personer med et bestemt navn
Søg efter personer der er højere end 1.80
Søg efter personer med forhøjet BMI

❏	En søgealgoritme er en algoritme der udvælger de elementer fra en liste der opfylder søgekriteriet
Søgning
2

<!-- Slide number: 3 -->
# Søgealgoritmer
❏	Søgning i liste med uordnede elementer
Vi anvender sekventiel søgning, dvs vi starter fra en ende af og undersøger hvert
element i listen for match
Liste: {5,3,6,1,3,4}, søgetal: 1 -> der er et match på index 3

❏	Søgning i lister med ordnede elementer (sorterede elementer)
Hvis listen er ordnet kan vi opdele elementerne i intervaller og søge i disse
Binær søgning
Søgning
3

<!-- Slide number: 4 -->
# Sekventiel søgning
❏	Den simpleste måde vi kan søge efter et element på, er at gennemløbe listen sekventielt, startende med første element i listen
Dette er den eneste søgealgoritme vi kan benytte i en ikke-sorteret liste (hvorfor?)
❏	Der kan forekomme tre tilfælde af resultater
Elementet findes ikke
Der findes ét element der opfylder søgekriteriet
Der findes mere en ét element der opfylder søgekriteriet
Søgning
4

<!-- Slide number: 5 -->
# Søging i et array - find alle forekomster
int[] tabel = {2, 5, 7, 4, 8, 11, 45, 23, 76, 34, 45, 44, 55, 77, 99, 2, 5};
int søgeTal = 5;

boolean fundet = false;
for (int i = 0; i < tabel.length; i++) {
if (tabel[i] == søgeTal) {
 System.out.println("Fundet på position: " + i);
 fundet = true;
}
}
if (!fundet){
System.out.println("Elementet blev ikke fundet");
}
Søgning
5

<!-- Slide number: 6 -->
# Søging i et array - aktivitetsdiagram

![](object8.jpg)

Søgning

![](object6.jpg)
6

<!-- Slide number: 7 -->
# Opgave
❏	Lav eksemplet på forrige slide ved brug af en ArrayList
❏	Arraylisten med data kan defineres sådan:
       ArrayList<Integer> tabel2 = new ArrayList<Integer> (
Arrays.asList(2, 5, 7, 4, 8, 11, 45, 23, 76, 34, 45, 44, 55, 77, 99, 2, 5));

❏	Prøv også at lave en version hvor du bruger en “enhanced” for-løkke til at fylde ArrayListen op med elementerne fra arrayet
Søgning
7

<!-- Slide number: 8 -->
# Søging i et array - find kun første element
Nogle gange er vi kun interesserede i at finde én forekomst af det element vi søger
efter. Her kan vi bruge ‘break’ til at afslutte for-løkken:
int[] tabel = {2, 5, 7, 4, 8, 11, 45, 23, 76, 34, 45, 44, 55, 77, 99, 2, 5}
søgeTal = 5;

boolean fundet = false;
for (int i = 0; i < tabel.length; i++) { if (tabel[i] == søgeTal) {
System.out.println("Fundet på position: " + i);
fundet = true;
break;
}
}
if (!fundet)
System.out.println("Elementet blev ikke fundet");
Søgning
8

<!-- Slide number: 9 -->
# Søgning i en liste med objekter
❏	Ofte er vi interesserede i at søge efter objekter i en liste hvor objektets attributter opfylder et bestemt søgekriterium
❏	Eksempel:
søg efter personer med et bestemt navn
søg efter personer med et bestemt efternavn
søg efter personer med en bestemt alder
søg efter personer højere en 170 cm
❏	Når vi indlæser et af disse søgekriterier fra brugeren kan det være nemmest at læse det ind som en tekststreng, uanset om det er fx navn eller alder
❏	Det betyder at vi skal konvertere brugerindputtet fra String til int hvis vi vil søge 	efter alder
❏	String klassen indeholder nyttige metoder til at checke indholdet af en streng
❏	Wrapper klasserne: Integer, Double… indeholder metoder til at konvertere fra
String til numerisk type, f.eks. int, double …
Søgning
9

<!-- Slide number: 10 -->
# String metoder til at checke for lighed
❏	String-klassen indeholder forskellige metoder til at sammenligne strenge:
equals
checker om to delstrenge er ens
equalsIgnoreCase
checker om to delstrenge er ens - ignorerer case
contains
Checker om en streng indeholder en anden streng
isEmpty
Checker om en streng er tom
❏	Eksempel:
"Mads".equals("Mads"); -> true
"Mads".equals("mads"); -> false
"Mads".equalsIgnoreCase("mads"); -> true
"Mads".contains("ads"); -> true
"Mads".contains("mads"); -> false
"".isEmpty(); -> true
Søgning
10

<!-- Slide number: 11 -->
# Wrapper-klasser med parsing-metoder
❏	Wrapper-klasserne er en objektrepræsentation af primitive typer
❏	Wrapper-klasserne indeholder alle en parse-metode der kan konvertere en streng til dens numeriske værdi, eller til en boolean
❏	Eksempel:
Integer.parseInt("144"); -> 144
Double.parseDouble("12.4"); -> 12.4
...
Søgning
11

<!-- Slide number: 12 -->
# Søgning i liste af personer
❏	Vi ser på søgning i en liste af person-objekter
❏	Person-klassen: (konstruktør, setter, getter og toString er udeladt)
public class Person { private String navn; private int alder; private double hoejde; private double vaegt;
...
}
Søgning
12

<!-- Slide number: 13 -->
# Søgning i liste af personer
❏	Liste med objekter
Person p1 = new Person("Mikkel Hansen", 25, 192.5, 91.0);
Person p2 = new Person("Ulla Jensen", 40, 167.0, 65.3);
Person p3 = new Person("Lotte Olsen", 30, 171.0, 56.8);
Person p4 = new Person("Lilian Jensen", 46, 177.0, 66.8);
Person p5 = new Person("Morten Petersen", 23,	188.0, 87.0);

ArrayList<Person> personDatabase = new ArrayList<Person> (List.of(p1, p2, p3, p4, p5));

❏	Søg efter "Lotte Olsen"
String søgeNavn = "Lotte Olsen";

boolean fundet = false;
for (Person p : personDatabase) {
if (p.getNavn().equals(søgeNavn)) { System.out.println("Person fundet: " + p); fundet = true;
}
}
if (!fundet)
System.out.println("Kunne ikke finde: " + søgeNavn + " i listen");
Søgning
13

<!-- Slide number: 14 -->
# Opgave
❏	Skriv kode der søger efter og udskriver personer, der er højere end 170 cm
❏	Brug Double.parseDouble(...) til at konvertere String-input til double
❏	Søgestreng:
String søgeHoejde = "170.0";
Søgning
14

<!-- Slide number: 15 -->
# At gemme resultater af en søgning
❏	Hvis vi senere ønsker at benytte vores søgeresultat, f.eks fordi vi gerne vil redigere data, er vi nødt til at gemme dette
❏	Der er to situationer:
Hvis vi søger efter første forekomst kan vi gemme resultatet i en variabel
Hvis vi søger efter flere forekomster må vi gemme resultaterne i en liste
Søgning
15

<!-- Slide number: 16 -->
# Gem søgeresultater i en ArrayList
❏	Vi vil søge efter alle personer der hedder "Jensen"
❏	Vi gemmer resultaterne i en ArrayList
søgeNavn = "Jensen";
// opret arrayliste til søgeresultater
ArrayList<Person> søgeResultat = new ArrayList<Person>();
// find personer, hvis navn indeholder søgekriterium og gem i liste
for (Person p : personDatabase) {
if (p.getNavn().contains(søgeNavn)) { søgeResultat.add(p);
}
}
// Udskriv resultater - check om der er noget i listen
if (!søgeResultat.isEmpty())  for (Person p : søgeResultat)
System.out.println(p);
else
System.out.println("Der findes ingen personer i listen med navn: " + "\"" + søgeNavn + "\"");

Output:
{ Ulla Jensen, 40, 167.0, 65.3}
{ Lilian Jensen, 46, 177.0, 66.8}
Søgning
16

<!-- Slide number: 17 -->
# Redigering
❏	Når vi redigerer ønsker vi at ændre på en eller flere attributter i et objekt i en liste
❏	For at give brugeren mulighed for at vælge hvilket objekt der skal redigeres, starter vi med at præsentere listen af objekter med nummerering
❏	Eksempel: Lad os præsentere søgeresultatet fra forrige slide, nummereret
for (int i=0; i<søgeResultat.size(); i++) { System.out.println(i+1 +":"	+ søgeResultat.get(i));
}
Output:
1:{ Ulla Jensen, 40, 167.0, 65.3}
      2:{ Lilian Jensen, 46, 177.0, 66.8}

❏	Brugeren kan nu vælge det nummer der skal redigeres
Redigering
17

<!-- Slide number: 18 -->
# Redigering - brugerdialog (eksempel)
❏	Vi vil lave en brugerdialog der giver brugeren mulighed for at vælge nummeret på den person der skal redigeres ud fra listen, eks:
1:{ Ulla Jensen, 40, 167.0, 65.3}
     2:{ Lilian Jensen, 46, 177.0, 66.8}
❏	Når brugeren har valgt en person præsenteres alle attributværdier og man kan overskrive med nye værdier eller trykke ENTER hvis der ikke skal ske en ændring. Eksempel på kørsel, hvor vægten ændres for person 1:
Rediger data og tryk ENTER. Hvis data ikke skal redigeres: tryk ENTER
Navn: Ulla Jensen

Alder: 40

Højde: 167.0

Vægt: 65.3
68 //her har brugeren tastet 68 ind
Redigering
18

<!-- Slide number: 19 -->
# Redigering - brugerdialog (kode)
for (int i=0; i<søgeResultat.size(); i++) { System.out.println(i+1 +":" + søgeResultat.get(i));
}

System.out.println("indtast nr på den person der skal redigeres:"); int nr = sc.nextInt();
sc.nextLine();

Person editPerson = søgeResultat.get(nr-1); // index starter fra 0
System.out.println("Editperson: " + editPerson);

System.out.println("Rediger data og tryk ENTER. Hvis data ikke skal redigeres tryk ENTER"); System.out.println("Navn: " + editPerson.getNavn());
String nyNavn = sc.nextLine(); if (!nyNavn.isEmpty())
editPerson.setNavn(nyNavn);

System.out.println("Alder: " + editPerson.getAlder()); String nyAlder = sc.nextLine();
if (!nyAlder.isEmpty()) { editPerson.setAlder(Integer.parseInt(nyAlder));
}

System.out.println("Højde: " + editPerson.getHoejde()); String nyHoejde = sc.nextLine();
if (!nyHoejde.isEmpty()) editPerson.setHoejde(Double.parseDouble(nyHoejde));

System.out.println("Vægt: " + editPerson.getVaegt()); String nyVaegt = sc.nextLine();
if (!nyVaegt.isEmpty()) editPerson.setVaegt(Double.parseDouble(nyVaegt));
Redigering
19