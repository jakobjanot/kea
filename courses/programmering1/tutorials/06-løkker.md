---
title: "06 - Løkker"
---
<!-- .slide: class="ek-academic-fire" -->
# Løkker

---

# Øvelse: 7-tabellen

- Skriv et program, der printer 7-tabellen fra 7 til 70, så det ser sådan ud:
```
7
14
21
// osv.
```

---

# Øvelse: 7-tabellen med for-løkke
- Skriv nu et program, der printer 7-tabellen fra 7 til 70, så det ser sådan ud i stedet:
```
1 * 7 = 7
2 * 7 = 14
3 * 7 = 21
// osv.
```
Notes:
- Brug en for-løkke til at løse opgaven
- Iterationerne skal være fra 1 til 10
- Gang med 7 i hver iteration i forbindelse med printning

---

# Øvelse: En hvilken somhelst tabel

- Skriv et program, der printer en hvilken som helst tabel, som du giver den i input.
```
Indtast et tal: 3
1 * 3 = 3
2 * 3 = 6
3 * 3 = 9
// osv.
```

---

# Øvelse: Alle tabeller

- Kan du rette programmet herover så det printer alle tabeller fra 1 til 10?
```
1 2 3 4 5 6 7 8 9 10
2 4 6 8 10 12 14 16 18 20
3 6 9 12 15 18 21 24 27 30
// osv.
```

---

# Øvelse: Karaktergennemsnit

- En elev har fået karaktererne 7, 10, 2, 4, 10. Hvad er gennemsnit?
- 

---

# Øvelse: Gæt et tal
- Skriv et program, der lader brugeren gætte et tal mellem 1 og 10.
- Hvis brugeren gætter rigtigt, skal programmet sige "Du gættede rigtigt!" og afslutte.
- Hvis brugeren gætter forkert, skal programmet sige "Forkert gæt, prøv igen!" og lade brugeren gætte igen.

Notes:
```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int secretNumber = 7;
        int guess = 0;
        
        while (guess != secretNumber) {
            System.out.println("Gæt et tal mellem 1 og 10");
            guess = scanner.nextInt();
        }

        System.out.println("Tillykke! Du gættede rigtigt: " + secretNumber);
    }
}
```

---

# Øvelse: Gæt et tal med hjælp
- Skriv et program, der lader brugeren gætte et tal mellem 1 og 100
- Hvis brugeren gætter rigtigt, skal programmet sige "Du gættede rigtigt!" og afslutte.
- Skriv "For højt" eller "For lavt" hvis brugeren gætter forkert, og lad brugeren gætte igen.

Notes:
```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int secretNumber = 42; // Hemmeligt tal
        int guess = 0;

        while (guess != secretNumber) {
            System.out.println("Gæt et tal mellem 1 og 100");
            guess = scanner.nextInt();

            if (guess < secretNumber) {
                System.out.println("For lavt, prøv igen!");
            } else if (guess > secretNumber) {
                System.out.println("For højt, prøv igen!");
            }
        }

        System.out.println("Tillykke! Du gættede rigtigt: " + secretNumber);
    }
}
```

---

# A-B-C sangen

- Uden at bruge lister, implementer A-B-C sangen i Java, så computeren printer ABC sangen ud.

> A - B - C - D - E - F - G - H - I - J - K - L - M - N - O - P - Q - R - S - T - U - V - W - X - Y - Z - Now I know my ABCs, next time won't you sing with me?

Notes:

```java
public class Main {
    public static void main(String[] args) {
        for (char c = 'A'; c <= 'Z'; c++) {
            System.out.print(c + " - ");
        }
        System.out.println("Now I know my ABCs, next time won't you sing with me?");
    }
}
```

---

# A-B-C sangen med rekursion

- En anden måde at løbe gennem ABC sangen på er at bruge rekursion. I rekursion kalder en metode sig selv. I dette tilfælde giver vi metoden det næste bogstav i alfabetet.
- Brug koden herunder som udgangspunkt, dog mangler vi at kalde singABC med det næste bogstav.
- Hint: Du kan bruge casting til at konvertere en int til en char, fx `(char) (letter + 1)` for at få det næste bogstav.
```java
public class AbcSong {
    public static void main(String[] args) {
        singABC('A', 'Z');
        System.out.println("Now I know my ABCs, next time won't you sing with me?");
    }

    public static void singABC(char letter, char lastLetter) {
        if (letter > lastLetter) return;
        System.out.print(letter + " - ");
        // Her mangler vi at kalde singABC med det næste bogstav
    }
}
```

---

# Øvelse - Primtal
- Et primtal er et tal, som kun er delbart med 1 og tallet selv. Et eksempel på et primtal er 7, der kun kan deles med 1 og 7. Derimod er 8 _ikke_ et primtal, idet det kan deles med 1, 2, 4 og 8. 
- En anden måde at sige, at et tal er delbart er, at modulus, dvs. resten efter division er lig 0.
- Vi vil bruge en while løkke og `%` (modulus), til at undersøge 

```java
int number = 8;
for(int i = 2; i < number; i++) {
    if (number % i == 0) return
}

---

