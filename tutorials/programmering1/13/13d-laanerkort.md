# Lånerkort

Her fortsætter vi på IntelliJ-projektet `library-management-system` og det forudsættes nu, at du har en `Main`-klasse, hvor du har tre `Book`-objekter og en `Book`-klasse.
Biblioteket har svært ved at holde styr på hvem der har lånt hvilke bøger. Næste skridt må være at lave en klasse `Member`, der kan repræsentere et lånerkort.
1. Tilføj en ny klasse `Member` til projektet.
2. En `Member` skal have et navn og et medlemsnummer, så vi kan oprette et `Member`-objekt med fx
   ```java
   Member member1 = new Member("Thorkild Hansen", 356);
   Member member2 = new Member("Lise Andersen", 287);
   ```
3. Gør felterne `final`, så et medlems navn og nummer ikke kan ændres efter oprettelse.
4. Tilføj en `toString`-metode, så vi kan udskrive et medlem på en pæn måde, fx
   ```java
   System.out.println(member1); 
      // Thorkild Hansen (Lånernummer: 356)
   ```
5. Test at du kan oprette `Member`-objekter og udskrive dem i `Main`-klassen.
6. Ret nu `Book`-klassen, så vi kan holde styr på hvilket `Member`, der har lånt en bog. Tilføj et felt `Member borrowedBy` til `Book`-klassen.
7. Er der nogen grund til at beholde `isAvailable`-feltet? Næh, da vi en bog kun er tilgængelig hvis `borrowedBy == null`. Fjern derfor `isAvailable`-feltet (også fra konstruktøren). Du kan i stedet lave det som en metode, da det nu kan beregnes ud fra `borrowedBy`:
   ```java
   public boolean isAvailable() {
       return borrowedBy == null;
   }
   ```
8. Ret `loanBook`-metoden, så den tager en `Member` som parameter, færdiggør
   ```java
   public boolean loanBook(Member member) {
       if (isAvailable()) {
          // TODO: lån bogen ud til member
          return true;
       }

       return false;
   }
   ```
   Hints:
   - Du skal tjekke om bogen er tilgængelig (dvs. `isAvailable()`)
   - Hvis bogen er tilgængelig, skal `borrowedBy` sættes til den givne `Member` og metoden returnere `true`.
   - Hvis bogen ikke er tilgængelig, skal metoden returnere `false`.
9. Ret desuden `toString`-metoden, så den også viser hvem der har lånt bogen, fx
   ```java
   System.out.println(book1); 
      // Allan B. Downey: Think Java 
      // (9781492072508) - Udlånt til 
      // Thorkild Hansen (Lånernummer: 356)
   ```
   Hint: `Member`-klassen skriver selv pænt ud med sin `toString`-metode
10. Test at det virker i `Main`-klassen, fx
    ```java
    System.out.println(book1); 
      // Allan B. Downey: Think Java 
      // (9781492072508) - På hylden
    boolean loaned = book1.loanBook(member1);
    System.out.println(book1);   
      // Allan B. Downey: Think Java 
      // (9781492072508) - Udlånt til 
      // Thorkild Hansen (Lånernummer: 356)
    System.out.println(book1.loanBook(member2)); // false
    ```
11. Ret nu `returnBook`-metoden, så den sætter `borrowedBy` til `null`.
12. Test at det virker i `Main`-klassen, fx
    ```java
    System.out.println(book1); 
      // Allan B. Downey: Think Java
      // (9781492072508) - Udlånt til 
      // Thorkild Hansen (Lånernummer: 356)
    book1.returnBook();
    System.out.println(book1); 
      // Allan B. Downey: Think Java 
      // (9781492072508) - På hylden
    book1.loanBook(member2);
    System.out.println(book1); 
      // Allan B. Downey: Think Java 
      // (9781492072508) - Udlånt til 
      // Lise Andersen (Lånernummer: 287)
    ```
