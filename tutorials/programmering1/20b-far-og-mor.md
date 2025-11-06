# Far og mor

Vi fortsætter med vores Person-klasse, som ser omtrent sådan her ud:

```java
public class Person {
   private String name;
   private Gender gender;
   private Person father;
   private Person mother;

   public Person(String name, Gender gender) {
       this.name = name;
       this.gender = gender;
       this.father = null;
       this.mother = null;
   }

   public void setFather(Person father) {
       this.father = father;
   }

   public void setMother(Person mother) {
       this.mother = mother;
   }

   // getters...
}
```

1. Ved nærmere overvejelse, kan vi komme til at have en far der er kvinde, eller en mor der er mand. Det skyldes at vi bærer den samme oplysning to steder: både i gender feltet og i hvorvidt personen er sat som far eller mor (det er jo implicit at en far skal være mand og en mor skal være kvinde). VI kan undgå denne inkonsistens ved at fjerne father og mother felterne, og i stedet kun have et felt for forældre:

```java
private Person[] parents;
```

Vi kan endda overveje at lade konstruktoren tage imod et array af forældre:

```java
public Person(String name, Gender gender, Person[] parents) {
    this.name = name;
    this.gender = gender;
    this.parents = parents;
}
```

2. Opdater din kode, der opretter stamtræet for din familie, så den passer til den nye struktur.