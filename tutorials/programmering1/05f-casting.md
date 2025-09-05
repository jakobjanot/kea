# Casting

- Opret et IntelliJ projekt kaldet 'casting-quiz' med en klasse `Main` og en `main` metode.
- Casting er det, at konvertere en datatype til en anden. 
- Nogle *casting* operationer er 
    - **implicitte** - dvs. er **uden** tab af information og sker automatisk, mens andre er 
    - **eksplicitte** - dvs. og **med** tab af information og kræver at vi tydeligt angiver at vi virkelig ønsker det.
- I opgaverne herunder, skal du gætte på 
    - hvad der printes til konsollen 
    - *eller* om der opstår en fejl
    - Er der et tab af information
    - Prøv dernæst at indsætte og køre koden i din `main` metode og se om du har gættet rigtigt.

1. ```java
   int a = 5;
   double b = a;
   System.out.println(b);
   ```

2. ```java
   double a = 5.5;
   int b = (int) a;
   System.out.println(b);
   ```

3. ```java
   double a = 5.5;
   int b = (int) a;
   System.out.println(b);
   ```

4. ```java
   int a = 66;
   char b = (char) a;
   System.out.println(b);
   ```

5. ```java
   char a = 'B';
   int b = a;
   System.out.println(b);
   ```

6. ```java
   char a = 't';
   boolean b = (boolean) a;
   System.out.println(b);
   ```
7. ```java
   String a = "true";
   boolean b = (boolean) a;
   System.out.println(b);
   ```

8. ```java
   String a = "true";
   boolean b = Boolean.parseBoolean(a);
   System.out.println(b);
   ```

9. ```java
   String a = "10";
   int b = (int) a;
   System.out.println(b);
   ```

10. ```java
   String a = "10";
   int b = Integer.parseInt(a);
   System.out.println(b);
   ```

