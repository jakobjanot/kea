# Er du med?

- Lav et nyt Java-projekt `are-you-with-me` med klassen `AreYouWithMe` og en `main` metode
- En efter en
    - uden at kode, prøv at gætte hvad værdien der udskrives med `System.out.println` bliver?
    - prøv herefter at skriv koden ind i din `main` metode og kør den
    - gættede du rigtigt?

1. 
```java
int x = 5;
x++;
x++;
x--;
System.out.println("x er nu: " + x);
```
2.
```java
int x = 5;
x+=2;
x*=2;
System.out.println("x er nu: " + x);
```

3.
```java
double x, y;
y = 15;
y *= 2;
x = y / 3;
System.out.println("x er nu: " + x);
```

---
4.
```java
int x, y = 2;
x = y * 2;
System.out.println("x er nu: " + x);
```

5.
```java
int x = 5;
int y = 10;
x += y;
System.out.println("x er nu: " + x);
```

6.
```java
int y = 5;
int x = 2 * y + 3;
System.out.println("x er nu: " + x);
```

7.
```java
int y = 5;
int x = 2 * (y + 3);
System.out.println("x er nu: " + x);
```

---
8.
```java
boolean isSunny = true;
boolean isHot = false;
boolean goToBeach = isSunny && isHot;
System.out.println("Skal jeg tage på stranden? " + goToBeach);
```

9.
```java
boolean isSunny = true;
boolean isHot = false;
boolean goToBeach = isSunny;
goToBeach &= isHot;
System.out.println("Skal jeg tage på stranden? " + goToBeach);
```
