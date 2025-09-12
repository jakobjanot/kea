# Sten, Saks, Papir
- Lav et nyt IntelliJ-projekt kaldet `stone-scissor-paper`, hvori du har en klasse og en `main` metode
- Skriv et program, der spiller sten, saks, papir mod brugeren. Start med flg. skabelon

```java
import java.util.Random;
import java.util.Scanner;

public class StoneScissorPaper {
    public static void main(String[] args) {
        final int STONE = 0;
        final int SCISSOR = 1;
        final int PAPER = 2;

        Scanner scanner = new Scanner(System.in);
        Random random = new Random();

        System.out.printf("Hvad fik du - sten (%s), saks (%s) eller papir (%s)?", STONE, SCISSOR, PAPER);
        int me = scanner.nextInt();
        int ai = random.nextInt(3);

        System.out.printf("Jeg fik %s og du fik %s. ", ai, me);
        
        if (me == STONE && ai == SCISSOR) {
            System.out.println("Du vandt!");
        } else if (me == SCISSOR && ai == PAPER) {
            System.out.println("Jeg vandt!");
        } // ... tilføj de resterende kombinationer her
        else { System.out.println("Uafgjort!"); }
}
```
- Test programmet og se om det virker
- (Valgfrit) Brugen af final variabler til sten, saks og papir gør koden mere læsbar. En mere almindelig måde at gøre det på er med en `enum`. Google `enum` eller få ChatGPT til at forklare brugen af `enum`. Prøv herefter at omskrive koden til at bruge en `enum` i stedet for `final` variabler.