# Udskrivning vha. printf

Indtil nu har vi næsten kun brugt `System.out.println` til at udskrive tekst. Nogle gange ønsker vi dog at formatere vores udskrift mere præcist. Her kommer `System.out.printf` ind i billedet. Først nogle eksempler på hvordan du kan bruge `printf`.

- Udskrivning af tekst (`%n` er en newline)
    ```java
    System.out.printf("Hej, verden!%n");
    ```
    giver
    ```
    Hej, verden!
    ```

- Udskrivning af variabler
    ```java
    String name = "Benny";
    int age = 25;
    double height = 1.75455;
    System.out.printf("%s på %d år er %.2f m høj%n", name, age, height);
    ```
    giver
    ```
    Benny på 25 år er 1.75 m høj
    ```

- Udfyldning med nuller, whitespace-padding
    ```java
    double bikePrice = 12000.0;
    double bikeHelmet = 442.25;
    double bikeLights = 29.50;
    System.out.printf("Cykel:\t%10.2f kr%n", bikePrice);
    System.out.printf("Hjelm:\t%10.2f kr%n", bikeHelmet);
    System.out.printf("Lygter:\t%10.2f kr%n", bikeLights);
    ```
    giver
    ``` 
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
   Romeo: "Men, soft! Hvad lys igennem vinduet bryder?"
   Juliet: "Det er øst, og Julia er solen."
   Romeo: "O, Julia! Du er så lysende som solen."
   Juliet: "Jeg er ikke lysende, jeg er kun en skygge af mig selv."
   Romeo: "Men skygger kan også være smukke."
   Juliet: "Måske, men de er stadig kun skygger."
   ```
3. ```txt
   /\/\/\/\
   |  EK  |
   \/\/\/\/