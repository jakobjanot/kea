# Refactoring med hjælpe-metoder

I denne opgave skal vi arbejde videre med `Person` klassen i IntelliJ-projektet `age-verification-cpr` fra forrige opgave.
Tag endnu et kig på `getAge()` metoden:
```java
public int getAge() {
    int year = Integer.parseInt(cpr.substring(0, 2));
    if (year > 30) {
        year += 1900;
    } else {
        year += 2000;
    }
    int month = Integer.parseInt(cpr.substring(2, 4));
    int day = Integer.parseInt(cpr.substring(4, 6));
    LocalDate birthday = LocalDate.of(year, month, day);
    LocalDate today = LocalDate.now();
    Period age = Period.between(birthday, today);
    return age.getYears();
}
```
Det er en ret kompleks metode, der gør mange ting på én gang:
-  Den udtrækker år, måned og dag fra CPR-nummeret, en `String`
-  Den konverterer de udtrukne `String`-værdier til `int`
-  Den beregner fødselsdatoen som et `LocalDate`
-  Den beregner alderen som en forskel mellem to `LocalDate` objekter, dvs. som et `Period`
-  Den returnerer alderen som et `int`
Her er mange kandidater til kode, der kan flyttes til egne metoder, så `getAge()` bliver nemmere at læse og forstå. Lad os prøve at forbedre koden ved at lave nogle hjælpe-metoder.
Det er vigtigt at forstå, at fordelene ved indkapsling - herunder, at anvende `private` hjælpe-metoder er, at de *ikke* er en del af klassens `public` interface (a.k.a. API), dvs. de kan *ikke* bruges udenfor klassen. Dermed kan vi ændre eller fjerne dem *uden* at det påvirker den kode, der bruger `Person`-klassen. Og du skal ikke være bange for at lave mange `private` hjælpe-metoder, det gør koden nemmere at læse og forstå og det gør ingen forskel for den der bruger klassen.
1. Her er nogle forslag til hjælpe-metoder, du kan implementere i `Person`-klassen:
   - `private int extractYearFromCpr()`
   - `private int extractMonthFromCpr()`
   - `private int extractDayFromCpr()`
   - `private LocalDate birthDateFromCpr()`
2. Prøv at flytte kode fra `getAge()` til de nye metoder, og kald dem så fra `getAge()`, så den bliver nemmere at læse og forstå.
3. Test at det virker ved at køre `Main`-klassen.
