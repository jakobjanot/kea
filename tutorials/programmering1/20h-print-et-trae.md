# Print et træ

1. Lav en metode `printTree()` til at udskrive stamtræet i et læsbart format. Her er et eksempel på, hvordan den danske kongefamilies stamtræ kunne se ud:

```- Dronning Margrethe II ♀
     ─ Kong Frederik X ♂
         ─ Kronprins Christian ♂
         - Princess Isabella ♀
         - Prince Vincent ♂
         - Princess Josephine ♀
     ─ Prins Joachim ♂
         ─ Grev Nikolai 
         ─ Grev Felix ♂
         ─ Grev Henrik ♂
         ─ Komtesse Athena ♀
```

Hint: Du kan lave en rekursiv metode, der tager en Person. Metoden kan så udskrive personens navn og køn, og derefter kalde samme metode for hver af personens børn, med en indrykning for hvert niveau i træet. Du kan bruge et ekstra parameter til at holde styr på indrykningen/niveauet i træet.
```java
    String indent = "   ".repeat(level);
```