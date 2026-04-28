# Java Cheat Sheet

## 1. Grundlæggende syntaks og metoder
```java
int a = 5;
double b = 2.5;
boolean flag = true;
char c = 'A';
String s = "Hej";

int sum = a + 10;
double div = b / 2;
boolean check = a > 3 && b < 5;

public static int add(int x, int y) {
    return x + y;
}
```

## 2. Input, betingelser og løkker
```java
import java.util.Scanner;

Scanner sc = new Scanner(System.in);
int x = sc.nextInt();

if (x > 10) {
    System.out.println("Stor");
} else {
    System.out.println("Lille");
}

for (int i = 0; i < 5; i++) {
    System.out.println(i);
}

int i = 0;
while (i < 5) {
    i++;
}
```

## 3. Strings og rekursion
```java
public static int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
}

String s = "Hej";
s.length();
s.substring(0, 2);
```

## 4. Random og arrays
```java
import java.util.Random;
import java.util.Arrays;

Random rand = new Random();
int r = rand.nextInt(10);

int[] arr = {3,1,2};
Arrays.sort(arr);
System.out.println(Arrays.toString(arr));
```

## 5. Klasser og objekter (OOP basics)
```java
class Person {
    private String name;
    private int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public int getAge() { return age; }
    public void setAge(int age) {
        if (age >= 0) this.age = age;
    }
}

Person p = new Person("Anna", 20);
```

## 6. Arv, interfaces og komposition
```java
class Animal {
    void sound() {}
}

class Dog extends Animal {
    void sound() {
        System.out.println("Woof");
    }
}

interface Flyable {
    void fly();
}

class Bird implements Flyable {
    public void fly() {}
}

class Engine {}
class Car {
    Engine engine = new Engine();
}
```

## 7. Collections, ArrayList, List og sortering
```java
import java.util.*;

// ArrayList og List
List<Integer> list = new ArrayList<>();
list.add(3);
list.add(1);
list.add(2);

// Sortering (naturlig orden)
Collections.sort(list);

// Comparable (naturlig orden for egne klasser)
class Person implements Comparable<Person> {
    int age;

    public Person(int age) {
        this.age = age;
    }

    @Override
    public int compareTo(Person other) {
        return this.age - other.age;
    }
}

// Comparator (custom sortering)
List<Person> people = new ArrayList<>();
people.add(new Person(30));
people.add(new Person(20));

// Lambda comparator
Collections.sort(people, (a, b) -> a.age - b.age);

// Comparator klasse
Comparator<Person> byAge = new Comparator<Person>() {
    public int compare(Person a, Person b) {
        return a.age - b.age;
    }
};

Collections.sort(people, byAge);

// Locale-baseret sortering (strings)
List<String> names = Arrays.asList("Åke", "Anders", "Ægir");

names.sort(java.text.Collator.getInstance(new Locale("da", "DK")));
```java
import java.util.*;

ArrayList<Integer> list = new ArrayList<>();
list.add(3);
list.add(1);

Collections.sort(list);

class Person implements Comparable<Person> {
    int age;
    public int compareTo(Person other) {
        return this.age - other.age;
    }
}

Collections.sort(list, (a, b) -> a - b);
```

## 8. Fejl, exceptions og filer
```java
try {
    int x = 10 / 0;
} catch (ArithmeticException e) {
    System.out.println("Fejl!");
}

class MyException extends Exception {
    public MyException(String msg) {
        super(msg);
    }
}

import java.io.*;

FileWriter fw = new FileWriter("file.txt");
fw.write("Hej");
fw.close();

BufferedReader br = new BufferedReader(new FileReader("file.txt"));
String line = br.readLine();
br.close();
```

## 9. Test (JUnit)
```java
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class TestClass {
    @Test
    void testAdd() {
        assertEquals(4, 2 + 2);
    }
}
```


## 10. Packages og Dependency Injection
```java
// Package deklaration (øverst i fil)
package com.example.app;

// Import
import java.util.List;

// Klasse i package
public class Service {
    public void doWork() {}
}
```

```java
// Dependency Injection (constructor injection)
class Repository {
    public String getData() { return "data"; }
}

class Service {
    private final Repository repo;

    // Inject dependency via constructor
    public Service(Repository repo) {
        this.repo = repo;
    }

    public void process() {
        System.out.println(repo.getData());
    }
}

// Brug
Repository repo = new Repository();
Service service = new Service(repo);
service.process();
```

```java
// Interface + DI (bedre design)
interface Repo {
    String getData();
}

class RepoImpl implements Repo {
    public String getData() { return "data"; }
}

class Service2 {
    private final Repo repo;

    public Service2(Repo repo) {
        this.repo = repo;
    }
}
```


## 11. Array beregninger og filtrering
```java
// Sum af int[]
int[] nums = {1, 2, 3, 4, 5};
int sum = 0;

for (int i = 0; i < nums.length; i++) {
    sum += nums[i];
}

System.out.println("Sum: " + sum);
```

```java
// Gennemsnit af double[]
double[] values = {2.0, 4.0, 6.0, 8.0};
double total = 0;

for (int i = 0; i < values.length; i++) {
    total += values[i];
}

double average = total / values.length;
System.out.println("Average: " + average);
```

```java
// Filtrering af ArrayList med for-løkke
import java.util.*;

ArrayList<Integer> list = new ArrayList<>();
list.add(10);
list.add(3);
list.add(7);
list.add(20);

ArrayList<Integer> filtered = new ArrayList<>();

for (int i = 0; i < list.size(); i++) {
    if (list.get(i) > 5) {
        filtered.add(list.get(i));
    }
}

System.out.println(filtered);
```
