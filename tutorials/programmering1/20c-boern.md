# Børn

Fortsæt på stamtræet ved at tilføje børn til personerne. Du kan tilføje et felt til Person-klassen for at repræsentere børnene. Det er ret ualmindeligt at have mere end 10 børn, så det må være nok med et array af størrelse 10:

```java
private Person[] children = new Person[10];
```

1. Tilføj en metode `addChild(Person child)` til at tilføje en anden Person som barn til en given Person. Overvej at have en counter, der holder styr på, hvor mange børn en Person allerede har, så du ved, hvor i arrayet det næste barn skal tilføjes.
2. Prøv at udvide dit stamtræ for din familie ved at tilføje børn til personerne, fx at dine forældre har dig og evt. søskende som børn.