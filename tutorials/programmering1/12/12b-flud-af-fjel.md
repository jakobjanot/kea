# Flud af fjel

- Hvad er den korrekte måde at oprette et array på med 5 `int`-elementer?

1. ```java
   []int arr = new int[5];
   ```
2. ```java
   int arr[] = new int[5];
   ```
3. ```java
   double arr[] = new int[5];
   ```

- Hvilken kode er korrekt for at tildele værdier 10, 20 og 30 til de tre første elementer i et array?

1. ```java
   int[] arr = new int[3];
   arr[1] = 10;
   arr[2] = 20;
   arr[3] = 30;
   ```
2. ```java
   int[] arr = new int[3];
   arr[10] = 1;
   arr[20] = 2;
   arr[30] = 3;
   ```
3. ```java
   int[] arr = new int[3];
   arr[0] = 10;
   arr[1] = 20;
   arr[2] = 30;
   ```

- Hvilken kode bruges til at få længden af et array `arr`?
1. ```java
   int length = arr.getLength();
   ```
2. ```java
   int length = arr.length();
   ```
3. ```java
   int length = arr.length;
   ```

- Følgende kode producerer: "Alice, 30 år".
  ```java
    Person p = new Person("Alice", 30);
    System.out.println(p);
  ```
  Hvilken af klasserne herunder er den korrekte implementering af `Person`-klassen?
1. ```java
   public class Person {
       String name;
       int age;

       public Person(String name, int age) {
           this.name = name;
           this.age = age;
       }

       @Override
       public String toString() {
           return name + ", " + age + " år";       
       }
   }
   ```
2. ```java
   public class Person {
       String name;
       int age;

       public Person(int age, String name) {
           this.age = age;
           this.name = name;
       }

       @Override
       public String toString() {
           return name + ", " + age + " år";
       }
   }
   ```

3. ```java
   public class Person {
       String name;
       int age;

       public Person(String name, int age) {
           this.name = name;
           this.age = age;
       }

       @Override
       public String toString() {
           return name + ", " + age + " år";
       }
   }
   ```
