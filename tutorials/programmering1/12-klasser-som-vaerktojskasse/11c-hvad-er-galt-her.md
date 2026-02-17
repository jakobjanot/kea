# Hvad er galt her?

- Find og ret fejlene i kodeeksemplerne nedenfor

1. Hvad er galt med `services/ProductService.java`
   ```java
   package services;

   public class ProductService {
       public static void addProduct(String product) {
           System.out.println("Tilføjer produkt: " + product);
       }
   }
   ```
   og `Main.java`?
   ```java

   public class Main {
       public static void main(String[] args) {
           ProductService.addProduct("Laptop");
       }
   }
   ```

2. Hvad er galt med `services/UserService.java`
   ```java
   package users;

   public class UserService {
       public static void createUser(String name) {
           System.out.println("Opretter bruger: " + name);
       }
   }
   ```
   og `Main.java`?
   ```java
   import services.UserService;

   public class Main {
       public static void main(String[] args) {
           UserService.createUser("Alice");
       }
   }
   ```

3. Hvad er galt med `utils/Math.java`
   ```java
   package utils;

   public class Math {
       public static int multiply(int a, int b) {
           return a * b;
       }
   }
   ```
   og `app/Main.java`?
   ```java
   package app;
   import utils.MathUtils;

   public class Main {
       public static void main(String[] args) {
           int result = MathUtils.multiply(5, 10);
           System.out.println("Resultat: " + result);
       }
   }
   ```
4. Hvad er galt med `data/Database.java`
   ```java
   package data;

   public class Database {
       public void connect() {
           System.out.println("Connecting to database...");
       }
   }
   ```
   og `app/Main.java`
   ```java
   package app;
   import data.Database;

   public class Main {
       public static void main(String[] args) {
           Database.connect();
       }
   }
   ```
5. Hvad er galt med `tools/Logger.java`
   ```java
   package tools;

   public class Logger {
       public static void log(String message) {
           System.out.println("Log: " + message);
       }
   }
   ```

   og `app/Main.java`?
   ```java
   import tools.Logger;

   public class Main {
       public static void main(String[] args) {
           Logger.log("Application started");
       }
   }
   ```