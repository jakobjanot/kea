# Formateret udskrift med printf

Indtil nu har vi næsten kun brugt `System.out.println` til at udskrive tekst. Nogle gange ønsker vi dog at formatere vores udskrift mere præcist. Her kommer `System.out.printf` ind i billedet. Først nogle eksempler på hvordan du kan bruge `printf`.

- Udskrivning af tekst (`%n` er en newline)
    ```java
    System.out.printf("Hej, verden!%n");
    ```
    giver
    ```txt
    Hej, verden!
    ```
- Udskrivning af variabler
    ```java
    String name = "Benny";
    int age = 25;
    double height = 1.75455;
    System.out.printf("%s på %d år er %.2f m høj%n", 
                      name, age, height);
    ```
    giver
    ```txt
    Benny på 25 år er 1.75 m høj
    ```

- Formatering af kolonner, kaldet whitespace-padding, (`%10.2f` er 10 tegn bredt med 2 decimaler)
    ```java
    double bikePrice = 12000.0;
    double bikeHelmet = 442.25;
    double bikeLights = 29.50;
    System.out.printf("Cykel:\t%10.2f kr%n", bikePrice);
    System.out.printf("Hjelm:\t%10.2f kr%n", bikeHelmet);
    System.out.printf("Lygter:\t%10.2f kr%n", bikeLights);
    ```
    giver
    ``` txt
    Cykel:      12000,00 kr
    Cykelhjelm:   442,25 kr
    Lygter:        29,50 kr
    ```
- Nu er det din tur. Kan du printe flg. til konsollen?
1. ```txt
   Pizza Margherita:  89,00 kr
   Pizza Pepperoni:   99,00 kr
   Pizza Portobello:  69,50 kr
   ```
2. ```txt
   Varenr Vare
   000001 Gaffelnøglesæt
   000002 Torxnøglesæt
   000212 Unbrakonøglesæt
   030200 Lappegrej
   030302 Drikkedunk
   145012 Skiftegreb
   ```