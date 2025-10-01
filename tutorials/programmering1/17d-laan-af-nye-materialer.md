# Lån af nye materialer

Vi har i forrige tutorial lavet en superklasse `Resource`, der repræsenterer materialer på et bibliotek. Nu skal vi udvide funktionaliteten i `Library`-klassen, så vi kan håndtere lån af både bøger, film og computerspil. Vi udnytter is-a relationen mellem `Resource` og de konkrete materialetyper (`Book`, `Movie`, `VideoGame`), dvs. at vi kan gemme en blanding af materialetyper i et array af `Resource`s.

1. Fortsæt med projektet `library-management-system` fra forrige tutorial.
2. Opdater `Library`-klassens felt `books` til at hedde `resources` og være af typen `Resource[]` i stedet for `Book[]`.
   ```java
   public class Library {
       private Resource[] resources;
       private Member[] members;
       private Loan[] loans;
       private int loanCount;
       // ...
   }
   ```
3. Opdater konstruktøren til at tage et `Resource[]`-array i stedet for et `Book[]`-array.
4. Opdater andre steder i `Library`-klassen, hvor `books` blev brugt, så de nu bruger `resources`, fx i `printBooks()`-metoden, der nu skal hedde `printResources()`.
5. Opdater `Main`-klassen, så du laver et `Resource[]`-array, der indeholder både `Book`, `Movie` og `VideoGame`-objekter, og brug det til at oprette et `Library`-objekt.
6. Opdater `loan`-metoden i `Library`-klassen, så den tager en `Resource` i stedet for en `Book` som parameter.
   ```java
   public void loan(Resource resource, 
                    Member member, 
                    LocalDate borrowedDate) {
       // ...
   }
   ```