---
title: 25 - Sortering
---

<!-- .slide: class="cover-15" -->

#### Sortering

--

Vi har arbejdet med arrays og lister - ofte har vi brug for at sortere

--

Til at sortere arrays bruger vi `Arrays.sort`

```java
int[] numbers = {5, 2, 9, 1, 5, 6};
Arrays.sort(numbers);
// numbers er nu 1, 2, 5, 5, 6, 9
```

--

Til at sortere `ArrayList` osv. bruger vi `Collections.sort`

```java
ArrayList<Integer> numbers = new ArrayList<>();
numbers.add(5);
numbers.add(2); // then 9, 1, 5, 6
Collections.sort(numbers);
// numbers er nu 1, 2, 5, 6, 9

--

Den simpleste sortering er den naturlige orden for den datatype vi arbejder med, fx `int` i stigende rækkefølge:

```java
int[] numbers = {5, 2, 9, 1, 5, 6};
Arrays.sort(numbers);
// numbers er nu 1, 2, 5, 5, 6, 9
```

--

Eller `char` i alfabetisk rækkefølge:

```java
char[] letters = {'d', 'a', 'c', 'b'};
Arrays.sort(letters);
// letters er nu {'a', 'b', 'c', 'd'}
```

--
<!-- .slide: class="o-patrck-star" -->
## Prøv selv

- Sorter et array af int, char
- Sorter en ArrayList af Integer

--

For `String` objekter er den naturlige orden alfabetisk:

```java
String[] names = {"Zoe", "Asraf", "Mia", "Kevin", "Øyvind", "Åge"};
Arrays.sort(names);
// names er nu {"Asraf", "Kevin", "Mia", "Zoe", "Åge", "Øyvind"}
```

Åge før Øyvind? Det var ikke det vi forventede!


--
<!-- .slide: class="cover-16" -->

# Text encoding

--

`char` er i grunden bare et tal, fx 'A' er `65`

```java
char letter = (char) 65;
```

--

Og `String`s er bare en række af `char`s, så når vi sorterer `String`s, så sammenligner vi i virkeligheden de tal der repræsenterer hvert bogstav i `String`en.

--

## Karaktersæt

Et karaktersæt er en tabel der mapper tegn (bogstaver, tal, symboler) til tal-værdier.

--

#### ASCII

Bruger vi 128 tegn (7 bit af information), kan vi repræsentere de engelske bogstaver og nogle specialtegn. Som sagt 'A' er `65`, 'B' er `66` osv.

Det er smart fordi vi så kan gemme tekst i meget lidt hukommelse.

Ulempe: Ingen danske bogstaver

--

#### Latin-1 extension til (Karaktersæt man bruger i latinske sprog)

Bruges 256 tegn (8 bit af information), kan vi udover ASCII også repræsentere danske bogstaver som æ, ø, å osv, samt bogstaver med accenttegn som é, ñ, ü osv.

Latin-1 findes stadig men er mindre udbredt.

Ulempe: Ikke alle verdens sprog dækkes, fx kinesiske tegn: 汉字, kyrilliske bogstaver: Кириллица, emojis: 😀.

--

#### Unicode

Karaktersæt der kan repræsentere over 1 million tegn fra alle verdens sprog, inklusiv emojis.

Java bruger Unicode som standard til at repræsentere `char` og `String` objekter.

Så send en venlig tanke til de mennesker der har arbejdet på at lave og vedligeholde Unicode-standarden! Ellers var du nødt til at skrive emojis med tekst, :D

--

#### Natural order og lokalitet

Natural order (den måde Java sorterer tekst på som standard) er baseret på Unicode værdierne af hvert tegn i teksten.

Det går godt, så længe vi kun bruger engelske bogstaver.

--

I Unicode kommer fx 'Å' før 'Ø', fordi 'Å' har værdien 197 og 'Ø' har værdien 216.
Det er dumt, fordi i dansk alfabetisk orden kommer 'Ø' før 'Å' - synes danskere

Dansk:  A B C D E F G H I J K L M N O P Q R S T U V W X Y Z Æ Ø Å


Svensk: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z Å Ä Ö

--

Java tilbyder måder at sortere tekst efter `Locale` (sprog og land).

```java
String[] letters = {"A", "Å", "Ä", "B", "Ö", "C"};
Collator swedishCollator = Collator.getInstance(Locale.forLanguageTag("sv-SE"));
Arrays.sort(letters, swedishCollator);
// letters er nu {"A", "B", "C", "Å", "Ä", "Ö"} --- korrekt svensk sortering!
```

--

```java
String[] letters = {"A", "Å", "Æ", "B", "Ø", "C"};
Collator danishCollator = Collator.getInstance(Locale.forLanguageTag("da-DK"));
Arrays.sort(letters, danishCollator);
// letters er nu {"A", "B", "C", "Æ", "Ø", "Å"} --- korrekt dansk sortering!
```
---

<!-- .slide: class="cover-1" -->
# Sorteringsalgoritmer

--

Sortering af bankbøger

<iframe width="750" height="422" src="https://datamuseum.dk/wiki/IBM_082_Card_Sorter" title="Sorteringsmaskine" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

[IBM 082 Card Sorter](https://datamuseum.dk/wiki/IBM_082_Card_Sorter)

--

Sorteringsalgoritmer er måder at sortere data på.

--

Der findes mange forskellige sorteringsalgoritmer, med forskellige fordele og ulemper.

--

<iframe width="750" height="422" src="https://www.youtube.com/watch?v=kPRA0W1kECg?rel=0&showinfo=0&controls=0&privacy_mode=1" title="Sorteringsalgoritmer - visuelt" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

[Sorteringsalgoritmer visuelt](https://www.youtube.com/watch?v=kPRA0W1kECg)

---

<!-- .slide: class="cover-10" -->

# Sortering i Java

--

#### To muligherder:

- Interfacet `Comparable<T>` - klasse-*interne* sorteringsregler
- Interfacet `Comparator<T>` - klasse-*eksterne* sorteringsregler
    
--

#### `Comparable<T>` interfacet

```java
public interface Comparable<T> {
    int compareTo(T other);
}
```

--

```java
public class MyClass implements Comparable<MyClass> {
    @Override
    public int compareTo(MyClass other) {
        // returner negativt tal hvis this < other
        // returner 0 hvis this == other
        // returner positivt tal hvis this > other
    }
}
```

--

```java
public class Student implements Comparable<Student> {
    private ArrayList<Integer> grades;
    String firstName;
    String lastName;

    public double gradeAverage() {
        int total = 0;
        for (Integer grade : grades) {
            total += grade;
        }
        return (double) total / grades.size();
    }

    @Override
    public int compareTo(Student other) {
        return Double.compare(this.gradeAverage(), other.gradeAverage());
    }
    
    // getters og setters ...
}
```

--

Nu kan vi sortere `Student` objekter efter gennemsnitlig karakter:

```java
Student[] students = { ... }; // array af Student objekter
Arrays.sort(students); // sorterer efter gennemsnitlig karakter

for (Student student : students) {
    System.out.println(student.gradeAverage());
}
```

--

#### `Comparator<T>` interfacet

```java
import java.util.Comparator;

public class AverageGradeComparator implements Comparator<Student> {
    @Override
    public int compare(Student obj1, Student obj2) {
        return Double.compare(obj1.gradeAverage(), obj2.gradeAverage());
    }
}
```

--

Nu kan vi sortere `Student` objekter efter gennemsnitlig karakter ved at bruge `AverageGradeComparator`:

```java
Student[] students = { ... }; // array af Student objekter
Arrays.sort(students, new AverageGradeComparator()); // sorterer efter gennemsnitlig karakter

for (Student student : students) {
    System.out.println(student.gradeAverage());
}
```

--

Men vi kan også lave andre `Comparator` implementeringer, fx efter fornavn:

```java
import java.util.Comparator;

public class FirstNameComparator implements Comparator<Student> {
    @Override
    public int compare(Student obj1, Student obj2) {
        return obj1.getFirstName().compareTo(obj2.getFirstName());
    }
}
```

så vi kan sortere efter fornavn:

```java
Arrays.sort(students, new FirstNameComparator()); // sorterer efter fornavn
```

--

Fordelene ved `Comparator` er at vi kan have flere forskellige måder at sortere samme type objekter på, uden at ændre selve objektets klasse.

Eksempel: `AverageGradeComparator`, `FirstNameComparator` men også `Collator.getInstance(Locale.forLanguageTag("da-DK"))`

--

| Situation                      | `Comparable<T>` | `Comparator<T>` |
| ------------------------------ | --------------- | --------------- |
| Én naturlig måde at sortere på | Ja              | Nej             |
| Flere måder at sortere på      | Nej             | Ja              |
| Kan ændres i objektets klasse  | Ja              | Nej             |