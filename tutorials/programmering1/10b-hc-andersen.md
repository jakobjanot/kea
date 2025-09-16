# H.C. Andersen

- Opret et Intellij-projekt `fairytale` med en klasse og en `main`-metode.
- Der er flere måeder hvormed man kan lave en `String` i Java.
  ```java
  String s1 = "H.C. Andersen";
  
  String s2 = new String("H.C. Andersen");

  char[] chars = {'H', '.', 'C', '.', ' ', 
                  'A', 'n', 'd', 'e', 'r', 
                  's', 'e', 'n'};
  String s3 = new String(chars);
  
  String s4 = """
    Der var engang en fattig Prinds; 
    han havde et Kongerige, der var 
    ganske lille, men det var da altid 
    stort nok til at gifte sig paa, 
    og gifte sig det vilde han.
    """;
  ```
- Den sidste måde, `s4`, er en såkaldt "text block", som er praktisk til længere tekster.
- Bemærk hvordan `s3`er en `String` lavet ud fra et `char` array. Vi kan også lave et `char` array ud fra en `String`:
  ```java
  char[] chars2 = s3.toCharArray();
  ```
1. Brug en "text block" til oprette en `String` med et H.C. Andersens eventyr efter eget valg.
2. Prøv nu at bruge en `for`-løkke til at tælle hvor mange gange bogstavet 'h' (både stort og lille) optræder i eventyret. Du skal bruge en `int count` variabel til at holde styr på antallet. Du kan gøre det på to måder:
   - *enten* bruge en `for`-løkke med et indeks og `charAt(i)`, 
   - *eller* en `foreach`-løkke over et `char` array lavet med `toCharArray()`.
3. Prøv at lave en metode `public static int countChar(String text, char c)`, der tæller hvor mange gange et bogstav `c` optræder i `text`, og returnerer det som et `int`.
4. Test din metode ved at kalde den fra `main` med forskellige bogstaver, fx `countChar(eventyr, 'h')`
5. Prøv nu at lave en `for`-løkke, der løber gennem alle bogstaverne i alfabetet. Hint:
   ```java
   char[] alphabet = "abcdefghijklmnopqrstuvwxyzæøå".toCharArray();
   ```
   og brug din `countChar`-metode til at tælle hvor mange gange hvert bogstav optræder i eventyret.
6. Test dit program. Hvilke bogstaver optræder oftest? Hvilke bogstaver optræder slet ikke?