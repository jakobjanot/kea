# String klassens substring metode
- Lav et nyt IntelliJ-projekt kaldet `substring`, hvori du har en klasse og en `main` metode
- Prøv at køre denne kode:
  ```java
  String text = "strawberry";
  String part = text.substring(5);
  System.out.println(part);
  ```
- Hvad printer den? Hvad gør `substring` metoden?
- Prøv at ændre `5` til et andet tal. Hvad sker der?
- Prøv også at bruge `substring` med to parametre, som her:
  ```java
  String part = text.substring(2, 5);
  ```
- Prøv desuden
    ```java
    String part = text.substring(10);
    ```
- Og 
    ```java
    String part = text.substring(11);
    ```
    Hvad sker der? Hvorfor?