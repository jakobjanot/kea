# Pizza data

Vi kan lave en klasse `Pizza`, der repræsenterer en pizza med navn, pris og ingredienser:
```java
public class Pizza {
    private String name;
    private double price;
    private String ingredients;

    public Pizza(String name, double price, String ingredients) {
        this.name = name;
        this.price = price;
        this.ingredients = ingredients;
    }

    // Getters/setters og evt. toString() metode
}
```
Det kunne dog være praktisk at kunne læse pizza-data fra en fil fx flg. fil `pizza-margherita.txt`:
```txt
Margherita
59.0
tomatsauce mozzarella basilikum
```
Her er første linje navnet på pizzaen, anden linje prisen, og tredje linje er en mellemrums-separeret liste af ingredienser.
1. Lav et nyt Intellij-projekt `pizza-data` med tilhørende git repo (sæt flueben i **Create git repository**). Du må gerne løbende committe og pushe dit arbejde til GitHub.
2. Opret klassen `Pizza` som vist ovenfor.
3. Opret en tekstfil `pizza-margherita.txt` i projektmappen med ovenstående indhold.
4. Opret en `Main`-klasse med en `main`-metode.
5. Prøv at lave en metode `public static Pizza readPizzaFromFile(String filePath)`, der læser pizza-data fra en fil og returnerer en `Pizza`-instans. Metoden skal:
   - Åbne filen givet ved `filePath`.
   - Brug `Scanner` til at læse filen linje for linje, dvs. navnet (første linje), prisen (anden linje) og ingredienserne (tredje linje). Hint: `Scanner` har en metode `nextLine()` til at læse en hel linje.
   - Konvertere prisen til en `double`.
6. Test din metode i `main` ved at læse pizza-data fra `pizza-margherita.txt` og printe pizza-objektet ud.
   - Du kan evt. override `toString()` i `Pizza`-klassen for at få pæn udskrift.
7. `main`-metoden har et arguement `String[] args`, som kan bruges til at give filstien som et kommandolinjeargument. Hint:
   ```java
   public static void main(String[] args) {
      String filePath = args[0]; // Få filstien fra kommandolinjeargumentet
      Pizza pizza = readPizzaFromFile(filePath);
      System.out.println(pizza);
   }
   ```
   I Intellij kan du angive kommandolinjeargumenter ved at gå til **Run > Edit Configurations...**, vælge din `Main`-konfiguration, og indtaste `pizza-margherita.txt` i feltet **Program arguments**. Prøv at køre programmet igen.
8. Prøv nu at oprette flere pizza-filer (fx `pizza-pepperoni.txt`, `pizza-hawaii.txt` osv.) og test dit program med forskellige filer ved at angive filnavnet som et kommandolinjeargument, når du kører programmet.
9. (Valgfrit) Prøv at gøre `Pizza`-klassens ingredienser til en `ArrayList<String>` i stedet for en enkelt `String`. Juster `readPizzaFromFile`-metoden derefter til at oprette en liste af ingredienser ud fra den mellemrums-separerede linje i filen. Hint: `Scanner` har en metode til at læse ord adskilt af mellemrum: `scanner.next()`. Alternativt kan du bruge `String.split(" ")` til at splitte ingrediens-linjen op i et array.