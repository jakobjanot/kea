# Problembørn

Vi har nu et stamtræ bestående af personer med forældre og børn, dvs. en klasse Person, der kunne se sådan ud:

```java
public class Person {
    private String name;
    private Gender gender;
    private Person[] parents;
    private Person[] children;
    private int childCount = 0;

    public Person(String name, Gender gender, Person[] parents) {
        this.name = name;
        this.gender = gender;
        this.parents = parents;
        this.children = new Person[10];
    }

    public void addChild(Person child) {
        this.children[childCount] = child;
        childCount++;
    }
}
```
og en enum Gender:

```java
public enum Gender {
    MALE,
    FEMALE
}
```

Er der ikke lidt omstændigt at skulle oprette en Person, sætte dens forældre og så derefter tilføje barnet til forældrenes børnelister? Hvad nu hvis vi kunne gøre det hele i én operation?

1. Prøv at ændre din konstruktor for Person, så den ikke bare sætter parents-feltet, men også kalder addChild på hver af forældrene for at tilføjer personen som barn til dem.
   ```java
   public Person(String name, Gender gender, Person[] parents) {
       this.name = name;
       this.gender = gender;
       this.parents = parents;
       this.children = new Person[10];
       for (Person parent : parents) {
           parent.addChild(this);
       }
   }
   ```
2. Smart! Men `addChild` kan godt give os lidt problemer, da vi kan tilføje børn uden at sætte barnets forældre. Skal vi ændre `addChild` til også at sætte barnets forældre? Det går ikke godt, da de to metoder så vil kalde hinanden i en uendelig løkke. Hvordan kan vi løse det problem?
3. Ok, måske skal vi bare gøre `addChild` privat, så det kun kan kaldes indefra Person-klassen. Eneste ulempe er, at vi skal oprette forældrene før børnene. Er det et problem? Næh.