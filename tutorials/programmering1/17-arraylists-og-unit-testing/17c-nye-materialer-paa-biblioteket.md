# Nye materialer på biblioteket

Vi har lavet klasser til at repræsentere bøger, medlemmer og lån på et bibliotek. Bibliotekets medlemmer har efterspurgt nye materialer, som film og computerspil. Det vil være unaturligt at forsøge at putte en film ind i en `Book`-klasse, bl.a. da en filmi ikke har et ISBN-nummer. Men som materialer på et bibliotek må vi alligevel kunne identificere dem og vise en titel, en "skaber". Vi kan med fordel lave en superklasse `Resource`, der indeholder de fælles felter (`identifier`, `title`, `creator`) og fælles metoder til at "låne" materialet. Og så lade `Book`, `Movie` og `VideoGame` arve fra `Resource`. Et fun fact er, at Internettets opbygning er inspireret af hvordan biblioteker håndterer deres *resources*. Internet resourcer (fx websider) identificeres med en *URI* (Uniform Resource Identifier), fx `https://www.dr.dk/drtv/serie/bluey_227278`

1. Vælg selv om du vil fortsætte med projektet `library-management-system` fra forrige tutorial eller starte et nyt projekt.
2. Opret en ny abstrakt klasse `Resource`, der har felterne `identifier`, `title` og `creator`.
   ```java
   public abstract class Resource {
       private String identifier;
       private String title;
       private String creator;
       // ...
   }
   ```
3. Lav en konstruktør, der initialiserer felterne.
4. Lav getter- og setter-metoder til felterne.
5. Lav nu en `Book`-klasse, der arver fra `Resource`. Giv den en konstruktør, der initialiserer `identifier`, `title` og `creator` vha. `super(...)` som henholdsvis `isbn`, `title` og `author`.
6. Lav getter-metoder `getIsbn()`, `getTitle()` og `getAuthor()` i `Book`, der returnerer henholdsvis `identifier`, `title` og `creator` vha. superklassens getter-metoder `getIdentifier()`, `getTitle()` og `getCreator()`.
7. Lav tilsvarende en `Movie` og en `VideoGame`-klasse, der arver fra `Resource`. Vi bruger 
   - `ean` (stregkoden på bagsiden af filmen/spillet) som `identifier` i `Movie` og `VideoGame`.
   - `studio` som `creator` i `Movie` og `VideoGame`.
   - `director` som et ekstra felt i `Movie`.
   - `platform` (fx "PC", "PS5", "XBOX", "NINTENDO_SWITCH") som et ekstra felt i `VideoGame`. Du kan overveje at lave en `enum` til platform.
8. Lav en `toString`-metode i `Resource`, der returnerer noget i stil med `"creator - title (identifier)"`, fx `"J.K. Rowling - Harry Potter og de vises sten (978-87-02-11260-5)"`.
9. Lav en `Main`-klasse med en `main`-metode, hvor du tester at det virker.
10. Overskriv `toString`-metoden i `Movie` og `VideoGame`, så de returnerer noget i stil med `"creator - title (identifier), directed by director"` for `Movie` og `"creator - title (identifier), platform: platform"` for `VideoGame`, fx "`"Pixar - Toy Story (1234567890123), directed by John Lasseter"` og `"Nintendo - The Legend of Zelda: Breath of the Wild (9876543210987), platform: Playstation 5"`.
11. Nu har du mulighed for at lave en liste af `Resource`-objekter, der kan indeholde både bøger, film og spil. Prøv flg. i din `main`-metode:
    ```java
    Resource[] resources = new Resource[3];
    resources[0] = new Book("978-87-02-11260-5", "Harry Potter og de vises sten", "J.K. Rowling");
    resources[1] = new Movie("1234567890123", "Toy Story", "Pixar", "John Lasseter");
    resources[2] = new VideoGame("9876543210987", "The Legend of Zelda: Breath of the Wild", "Nintendo", Platform.PLAYSTATION_5);
    for (Resource r : resources) {
        System.out.println(r);
    }
    ```
    Det virker fordi både `Book`, `Movie` og `VideoGame` er en `Resource` (is-a relationen).
