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
4. Lav getter-metoder til felterne.
5. Lav nu en `Book`-klasse, der arver fra `Resource`. Giv den en konstruktør, der initialiserer `identifier`, `title` og `creator` vha. `super(...)` som henholdsvis `isbn`, `title` og `author`.
6. Lav getter-metoder til `isbn`, `title` og `author` i `Book`-klassen, der kalder superklassens getter-metoder.
7. Lav tilsvarende en `Movie` og en `VideoGame`-klasse, der arver fra `Resource`. Vi bruger 
   - `ean` (stregkoden på bagsiden af filmen/spillet) som `identifier` i `Movie` og `VideoGame`.
   - `studio` som `creator` i `Movie` og `VideoGame`.
   - `director` som et ekstra felt i `Movie`.
    - `platform` (fx "PC", "PS5", "Xbox") som et ekstra felt i `VideoGame`. Du kan overveje at lave en `enum` til platform.
8. Lav en `toString`-metode i `Resource`, der returnerer noget i stil med `"creator - title (identifier)"`, fx `"J.K. Rowling - Harry Potter og de vises sten (978-87-02-11260-5)"`.
9. Lav en `Main`-klasse med en `main`-metode, hvor du tester at det virker