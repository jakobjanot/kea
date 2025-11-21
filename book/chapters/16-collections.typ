#import "../style.typ": *

= Collections og ArrayList

I dette kapitel skal vi se på _collections_ i Java - datastrukturer der kan indeholde flere elementer. Vi starter med `ArrayList`, som løser mange af de begrænsninger, vi stødte på med arrays.

== Problemer med arrays

Lad os først genbesøge de udfordringer, vi møder når vi arbejder med arrays:

=== Problem 1: Fast størrelse

Arrays har en fast størrelse, der skal defineres når de oprettes:

```java
String[] makes = new String[3];
makes[0] = "Volvo";
makes[1] = "BMW";
makes[2] = "Ford";
makes[3] = "Mazda"; // ArrayIndexOutOfBoundsException!
```

Når vi når grænsen, får vi en fejl. Vi kan ikke bare tilføje flere elementer.

En løsning er at kopiere arrayet til et større array:

```java
makes = Arrays.copyOf(makes, 4);
makes[3] = "Mazda"; // Nu virker det
```

Men det er omstændigt og kræver manuelt arbejde.

=== Problem 2: Skal holde styr på antal elementer

Når vi arbejder med arrays, skal vi manuelt holde styr på hvor mange elementer vi faktisk har:

```java
BankAccount[] accounts = new BankAccount[1000];
int count = 0;

accounts[count] = new BankAccount("12345");
count++;
accounts[count] = new BankAccount("67890");
count++;
// ...
```

Dette er fejltilbøjeligt - hvad hvis vi glemmer at opdatere `count`?

== ArrayList til undsætning

Alle disse problemer løses elegant med `java.util.ArrayList`:

```java
import java.util.ArrayList;

ArrayList<String> makes = new ArrayList<>();
makes.add("Volvo");
makes.add("BMW");
makes.add("Ford");
makes.add("Mazda"); // Virker fint!
```

ArrayList:
- *Vokser automatisk* når vi tilføjer elementer
- *Holder selv styr* på antal elementer
- Giver os *nyttige metoder* til at arbejde med listen

== Generiske typer

Læg mærke til den specielle syntaks med vinkelparenteser `<>`:

```java
ArrayList<String> makes = new ArrayList<>();
```

Hvorfor ikke bare `ArrayList` uden `<String>`?

`ArrayList` er en _generisk klasse_ - den kan bruges med alle mulige typer:

```java
ArrayList<String> makes = new ArrayList<>();
ArrayList<BankAccount> accounts = new ArrayList<>();
ArrayList<Integer> numbers = new ArrayList<>();
```

Vi angiver typen i vinkelparenteserne for at fortælle Java hvilken slags objekter listen skal indeholde.

#note[
Vi kan kun bruge objekttyper i vinkelparenteserne, ikke primitive typer:

```java
ArrayList<int> nums = new ArrayList<>(); // FEJL!
ArrayList<Integer> nums = new ArrayList<>(); // OK
```

Vi skal bruge wrapper-klasserne: `Integer`, `Double`, `Boolean` osv.
]

=== Hvordan virker generiske klasser?

Vi kan faktisk lave vores egne generiske klasser. Her er et simpelt eksempel:

```java
class Pair<T> {
    private T first;
    private T second;

    public Pair(T first, T second) {
        this.first = first;
        this.second = second;
    }

    public T getFirst() { 
        return first; 
    }
    
    public T getSecond() { 
        return second; 
    }
}
```

`T` er en _type parameter_ - en pladsholder for den faktiske type. Når vi bruger klassen, erstatter Java `T` med den konkrete type:

```java
Pair<String> p = new Pair<>("Hund", "Kat");
String first = p.getFirst(); // "Hund"
```

```java
BankAccount acc1 = new BankAccount("123");
BankAccount acc2 = new BankAccount("321");
Pair<BankAccount> p = new Pair<>(acc1, acc2);
BankAccount first = p.getFirst();
```

== Hvad kan vi gøre med en ArrayList?

ArrayList tilbyder mange nyttige metoder:

=== Tilføje elementer

```java
ArrayList<String> makes = new ArrayList<>();
makes.add("Volvo");
makes.add("BMW");
makes.add("Ford");
```

=== Tilgå elementer

Ligesom arrays bruger vi indeks (men med `get()` metoden):

```java
String first = makes.get(0); // "Volvo"
String second = makes.get(1); // "BMW"
```

=== Fjerne elementer

```java
makes.remove(1); // Fjerner "BMW"
// Nu er listen: ["Volvo", "Ford"]
```

Når vi fjerner et element, rykker de resterende elementer op.

=== Få størrelsen

```java
int size = makes.size(); // 2
```

Bemærk: `size()` ikke `length` som for arrays.

=== Iterere over elementer

Vi kan bruge en for-each løkke ligesom med arrays:

```java
for (String make : makes) {
    System.out.println(make);
}
```

Eller en traditionel for-løkke:

```java
for (int i = 0; i < makes.size(); i++) {
    System.out.println(makes.get(i));
}
```

=== Tjekke om listen indeholder et element

```java
if (makes.contains("Volvo")) {
    System.out.println("Vi har Volvo biler!");
}
```

=== Tømme listen

```java
makes.clear();
```

=== Tjekke om listen er tom

```java
if (makes.isEmpty()) {
    System.out.println("Ingen bilmærker i listen");
}
```

== Hvordan virker ArrayList internt?

ArrayList bruger faktisk et array internt! Forenklede version:

```java
class ArrayList<E> {
    private Object[] elements;
    private int size;

    public ArrayList() {
        elements = new Object[10]; // Start med kapacitet 10
        size = 0;
    }

    public void add(E element) {
        if (size == elements.length) {
            // Hvis arrayet er fuldt, lav et nyt større array
            elements = Arrays.copyOf(elements, elements.length * 2);
        }
        elements[size] = element;
        size++;
    }

    public E get(int index) {
        return (E) elements[index];
    }

    public int size() {
        return size;
    }
}
```

Når arrayet bliver fyldt, laver ArrayList automatisk et nyt array der er dobbelt så stort og kopierer alle elementerne over.

== ArrayList vs Array

#table(
  columns: 3,
  align: left,
  [*Egenskab*], [*Array*], [*ArrayList*],
  [Størrelse], [Fast], [Dynamisk],
  [Syntaks for oprettelse], [`String[]`], [`ArrayList<String>`],
  [Tilføj element], [`arr[0] = "x"`], [`list.add("x")`],
  [Hent element], [`arr[0]`], [`list.get(0)`],
  [Længde/størrelse], [`arr.length`], [`list.size()`],
  [Kan kun indeholde objekter], [Nej], [Ja],
)

== Praktisk eksempel: Bogsamling

Lad os bygge et system til at håndtere en bogsamling:

```java
public class Book {
    private String title;
    private String author;
    private int year;

    public Book(String title, String author, int year) {
        this.title = title;
        this.author = author;
        this.year = year;
    }

    @Override
    public String toString() {
        return title + " af " + author + " (" + year + ")";
    }

    public String getAuthor() {
        return author;
    }
}
```

```java
public class Library {
    private ArrayList<Book> books;

    public Library() {
        books = new ArrayList<>();
    }

    public void addBook(Book book) {
        books.add(book);
        System.out.println("Tilføjet: " + book);
    }

    public void removeBook(int index) {
        if (index >= 0 && index < books.size()) {
            Book removed = books.remove(index);
            System.out.println("Fjernet: " + removed);
        }
    }

    public void listBooks() {
        if (books.isEmpty()) {
            System.out.println("Biblioteket er tomt");
            return;
        }

        System.out.println("Bøger i biblioteket:");
        for (int i = 0; i < books.size(); i++) {
            System.out.println(i + ": " + books.get(i));
        }
    }

    public ArrayList<Book> findBooksByAuthor(String author) {
        ArrayList<Book> result = new ArrayList<>();
        for (Book book : books) {
            if (book.getAuthor().equals(author)) {
                result.add(book);
            }
        }
        return result;
    }
}
```

Brug:

```java
Library library = new Library();

library.addBook(new Book("1984", "George Orwell", 1949));
library.addBook(new Book("Dyregården", "George Orwell", 1945));
library.addBook(new Book("Krøniker fra Narnia", "C.S. Lewis", 1950));

library.listBooks();

ArrayList<Book> orwellBooks = library.findBooksByAuthor("George Orwell");
System.out.println("\nBøger af George Orwell:");
for (Book book : orwellBooks) {
    System.out.println(book);
}
```

#exercise[
  Udvid `Library`-klassen med følgende metoder:
  
  1. `findBooksByYearRange(int startYear, int endYear)` - finder alle bøger udgivet mellem to årstal
  2. `getTotalBooks()` - returnerer det totale antal bøger
  3. `getNewestBook()` - returnerer den nyeste bog (højeste årstal)
  4. `sortBooksByYear()` - sorterer bøgerne efter årstal
]

== ArrayList af objekter

Når vi arbejder med ArrayList af objekter (ikke primitive typer), skal vi huske at:

1. *Hvert element er en reference*

```java
ArrayList<BankAccount> accounts = new ArrayList<>();
BankAccount acc1 = new BankAccount("123");
accounts.add(acc1);

acc1.deposit(100);
System.out.println(accounts.get(0).getBalance()); // 100
```

2. *Elementer kan være null*

```java
ArrayList<String> names = new ArrayList<>();
names.add("Alice");
names.add(null);
names.add("Bob");

for (String name : names) {
    if (name != null) {
        System.out.println(name.toUpperCase());
    }
}
```

3. *Objekter deles ikke automatisk*

```java
ArrayList<Integer> numbers1 = new ArrayList<>();
numbers1.add(1);
numbers1.add(2);

ArrayList<Integer> numbers2 = numbers1; // Samme liste!
numbers2.add(3);

System.out.println(numbers1.size()); // 3
```

Hvis vi vil kopiere:

```java
ArrayList<Integer> numbers2 = new ArrayList<>(numbers1);
```

== Andre nyttige metoder

=== Set - udskift et element

```java
ArrayList<String> colors = new ArrayList<>();
colors.add("rød");
colors.add("grøn");
colors.add("blå");

colors.set(1, "gul"); // Udskifter "grøn" med "gul"
// Nu: ["rød", "gul", "blå"]
```

=== IndexOf - find position

```java
int index = colors.indexOf("blå"); // 2
int notFound = colors.indexOf("pink"); // -1
```

=== AddAll - tilføj flere elementer

```java
ArrayList<String> moreColors = new ArrayList<>();
moreColors.add("sort");
moreColors.add("hvid");

colors.addAll(moreColors);
// Nu: ["rød", "gul", "blå", "sort", "hvid"]
```

== Primitive typer og wrapper-klasser

Siden ArrayList kun kan indeholde objekter, skal vi bruge wrapper-klasser for primitive typer:

#table(
  columns: 2,
  align: left,
  [*Primitiv type*], [*Wrapper-klasse*],
  [`int`], [`Integer`],
  [`double`], [`Double`],
  [`boolean`], [`Boolean`],
  [`char`], [`Character`],
  [`long`], [`Long`],
  [`float`], [`Float`],
)

Java konverterer automatisk mellem primitive typer og wrapper-klasser (_autoboxing_ og _unboxing_):

```java
ArrayList<Integer> numbers = new ArrayList<>();
numbers.add(42); // Autoboxing: int → Integer
int value = numbers.get(0); // Unboxing: Integer → int
```

#note[
Autoboxing og unboxing sker automatisk, men det har en lille performance-omkostning. Når performance er kritisk, kan arrays af primitive typer være bedre end ArrayList.
]

== Øvelser

#exercise[
  === Opgave 1: Kontaktliste
  
  Lav et program der håndterer en kontaktliste:
  
  1. Opret en `Contact`-klasse med felter: `name`, `phone`, `email`
  2. Opret en `ContactList`-klasse med en ArrayList af Contact
  3. Implementer metoder til:
     - `addContact(Contact contact)` - tilføj kontakt
     - `removeContact(String name)` - fjern kontakt ved navn
     - `findContact(String name)` - find kontakt ved navn
     - `listAllContacts()` - vis alle kontakter
     - `findContactsByPartialName(String partial)` - find kontakter hvor navnet indeholder en given streng
]

#exercise[
  === Opgave 2: Temperaturmålinger
  
  Lav et program der håndterer temperaturmålinger:
  
  1. Opret en ArrayList til at gemme temperaturer (Double)
  2. Implementer metoder til:
     - `addMeasurement(double temp)` - tilføj måling
     - `getAverage()` - beregn gennemsnit
     - `getMax()` - find højeste temperatur
     - `getMin()` - find laveste temperatur
     - `getMeasurementsAbove(double threshold)` - find målinger over en grænse
]

#exercise[
  === Opgave 3: Ordliste
  
  Lav et program der håndterer en ordliste:
  
  1. Opret en ArrayList af strings
  2. Læs ord fra brugeren (indtil brugeren skriver "stop")
  3. Tilføj hvert ord til listen
  4. Når brugeren er færdig:
     - Vis alle ord
     - Vis antal ord
     - Vis længste ord
     - Vis alle ord i alfabetisk rækkefølge (brug `Collections.sort()`)
]

#exercise[
  === Opgave 4: Todo-liste
  
  Lav en todo-liste applikation:
  
  1. Opret en `Task`-klasse med felter: `description`, `done` (boolean)
  2. Opret en `TodoList`-klasse med ArrayList af Task
  3. Implementer metoder til:
     - `addTask(String description)` - tilføj opgave
     - `completeTask(int index)` - marker opgave som færdig
     - `removeTask(int index)` - fjern opgave
     - `listAllTasks()` - vis alle opgaver (med status)
     - `listIncompleteTasks()` - vis kun ufærdige opgaver
  
  4. Lav en menu-drevet main-metode hvor brugeren kan:
     - Tilføje opgaver
     - Se opgaver
     - Markere opgaver som færdige
     - Slette opgaver
]

== Opsummering

I dette kapitel har vi lært:

- *ArrayList* løser mange af de begrænsninger arrays har
- ArrayList vokser *automatisk* når vi tilføjer elementer
- Vi bruger *generiske typer* med vinkelparenteser: `ArrayList<Type>`
- ArrayList har mange *nyttige metoder*: `add()`, `get()`, `remove()`, `size()`, osv.
- ArrayList bruger internt et *array* der bliver større efter behov
- Vi skal bruge *wrapper-klasser* for primitive typer: `Integer`, `Double`, osv.
- ArrayList kan indeholde `null`-værdier, så vi skal være forsigtige

ArrayList er en af de mest brugte datastrukturer i Java og et vigtigt værktøj i enhver Java-programmørs værktøjskasse.
