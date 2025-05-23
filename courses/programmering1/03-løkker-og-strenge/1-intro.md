---
title: Løkker og strenge
---
<!-- .slide: class="kea-red" -->

# Løkker og strenge

---
<!-- .slide: class="kea-dark" -->

## Program

- 08:30 Praktisk information  
- 09:00 Installering af Java og IntelliJ  
- 10:00 Pause  
- 10:15 Første program  
- 11:30 Opsamling  

---
# For Loops & While Loops

--

## Hvad vi skal gennemgå i dag
- Hvad er loops
- For loop
- While loop

---

# Demo: Hvorfor skal vi bruge loops?

Notes:

- et eksempel hvor vi har brug for at gentage printning af noget
- vejrtrækningsøvelsesprogram: 10 repetitioner
- vis eksempel på at det er kedeligt at skrive det 10 gange
- vis først uden sleep, så det ikke giver den rigtige effekt
```java
public class Main {
    public static void main(String[] args) {
        System.out.println("1. Træk vejret langsomt ind");
        sleep(4000);
        System.out.println("2. Hold vejret");
        sleep(4000);
        System.out.println("3. Pust langsomt ud");
        sleep(4000);
        System.out.println("4. Hold vejret");
        sleep(4000);
        System.out.println("1. Træk vejret langsomt ind");
        sleep(4000);
        System.out.println("2. Hold vejret");
        sleep(4000);
        System.out.println("3. Pust langsomt ud");
        sleep(4000);
        System.out.println("4. Hold vejret");
        sleep(4000);
        System.out.println("5. Træk vejret langsomt ind");
        // ...
    }
}
```

--

## Hvad er loops?

--

> **Programmet** skal gøre **[noget]** **[x]** antal gange

--

## for loop

```java
for (int i = 0; i < 10; i++ ) {
    System.out.println("Hello World!");
}
```

--

## For Loop “signatur”
- For loops bruges **når du ved** hvor mange iterationer skal bruges
    Incremental counter / iteration
- Kan også være decremental
- Counter variable kan bruges inde i scope of the loop

```java
for (int i = 0; i < 10; i++)
```

--

For-loops bruges til at køre et stykke kode et **bestemt antal gange**.

Man plejer at lave en variablen, der hedder `i`, der fungerer som en tæller.

Derudover har man en betingelse. Så længe betingelsen er sand, kører koden.

--

## `i++` er det samme som at skrive `i = i + 1;`

--

![loop visualisering](./img/loop-visualisering.png)

--

## for loop

```java
for (int i = 0; i < 10; i++){
    System.out.println("printing for the " + i + "th time!");
}
```

--

## While Loop

--

## While Loop “signatur”
While loops sætter en **betingelse** og udfører det kode der er defineert inde i dets scope, indtil betingelsen er **false**.

```java
while (condition){
    // code block to be executed
}
```

--

**While-loops** bruges til at køre et stykke kode flere gange.

Man plejer at lave en variablen, der hedder `i`, der fungerer som en tæller.

Derudover har man en betingelse.

Så længe betingelsen er sand, kører koden.

---
<!-- .slide: class="kea-purple" -->
# QUIZ!

[https://not-yet/](https://not-yet/)

---
<!-- .slide: class="kea-dark" -->
Tre ting du tager med fra fra i dag?