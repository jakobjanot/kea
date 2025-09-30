# Du lyver med din alder!

Regeringen barsler med en app, der skal gøre det lettere at verificere sin alder, bl.a. i forbindelse med køb af alkohol og tobak, men også adgang til websteds med aldersbegrænsning. Et af kravene til appen er, at den ikke må opbevare eller videregive personens nøjagtige alder, men kun bekræfte om personen er over eller under 18 år.
I analysen, er vi kommet frem til at vi skal bruge en `Person`-klasse med felterne `name` (String) og `age` (int). Lad os implementere den i Java.

1. Opret et nyt IntelliJ projekt `age-verification` og tilføj en Main-klasse med følgende kode:
   ```java
   public class Main {
       public static void main(String[] args) {
           Person person = new Person();
           person.name = "Alfons Åberg";
           person.age = 5;
           System.out.println(person); // Alfons Åberg, 5 år
           // System.out.println("Voksen? " + person.isAdult());
       }
   }
   ```
2. Opret klassen `Person` i projektet med en passende `toString()` metode og felterne `name` og `age`, som du i første omgang lader være `public`.
3. Test at det virker ved at køre `Main`-klassen
4. Et rimeligt krav til kvaliteten af software er, at vi følger objektorienterede principper, herunder indkapsling (encapsulation). Det betyder at vi skal skjule felterne i `Person`-klassen, så de ikke kan ændres direkte udefra. Ret derfor felterne `name` og `age` til `private`.
5. Prøv at køre `Main`-klassen igen - hvad sker der?
6. For at kunne sætte og læse indholdet af `name` er vi nu nødt at lave `public` getter og setter metoder, fx
   ```java
   public String getName() {
        return name;
   }

   public void setName(String name) {
        this.name = name;
   }
   ```
7. Ret `Main`-klassen til at bruge `setName(...)` i stedet for at sætte `name` direkte, og test at det virker.
8. Vi skal også kunne sætte og læse `age`, så lav tilsvarende getter og setter metoder for `age`.
9. Ret `Main`-klassen til at bruge `setAge(...)` i stedet for at sætte `age` direkte, og test at det virker.
10. Ret nu også din `toString()` metode til at bruge `getName()` og `getAge()`.
11. Til alders-verifkation, har vi brug for en `isAdult()` metode, der returnerer `true`, hvis personen er 18 år eller ældre, og `false` ellers. Tilføj metoden til `Person`-klassen.
12. Fjern `//` fra linjen, der kalder `isAdult()` i `Main`-klassen. Test at det virker med forskellige aldre.