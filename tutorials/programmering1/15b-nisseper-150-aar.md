# Nisseper, 150 år

Nisser bliver gamle - det er ikke ualmindeligt at de bliver flere hundrede år gamle. Nu er app'en målrettet alm. danskere, så det vil være en forbedring af app'en, hvis vi kunne sikre at den indtastede alder er realistisk. Da vi har benyttet os af indkapsling i `Person`-klassen, kan vi nemt tilføje denne funktionalitet, ved at udvide `setAge(int age)` metoden - det kunne vi aldrig have gjort, hvis `age`-feltet havde været `public`. Det skyldes, at alle der har anvendt `Person`-klassen, ville have sat `age` direkte, dvs.
```java
Person person = new Person();
person.age = 15; // direkte adgang til age feltet
```
Den nævnte ændring ville altså medføre at alle der har brugt `Person`-klassen, skulle ændre deres kode til 
```java
person.setAge(15); // brug af setAge metoden
```
Ved at bruge indkapsling, kan vi altså ændre implementeringen af `Person`-klassen, uden at det påvirker den kode der bruger klassen.

1. Tag udgangspunkt i dit `age-verification` projekt fra forrige øvelse.
2. Ret `setAge(int age)` metoden, så den kun sætter alderen, hvis den er mellem 0 og 120 år. Hvis alderen er udenfor dette interval, skal metoden ikke ændre alderen, fx
   ```java
   public void setAge(int age) {
        if (age >= 0 && age <= 120) {
             this.age = age;
        }
   }
   ```
3. Test at det virker ved at køre `Main`-klassen, test evt. at alderen ikke ændres, hvis du prøver at sætte den til 150 år.
4. For at undgå fejl-tastninger, må vi også tjekke at navnet ikke er tomt. Ændre implementering af `setName(String name)` metoden, så `name` kun sættes, hvis 
   - `name` ikke er `null` og 
   - `name` ikke er tom (`name.length() > 0`)
5. Test at det virker ved at køre `Main`-klassen.
8. Til alders-verifkation, har vi brug for en `isAdult()` metode, der returnerer `true`, hvis personen er 18 år eller ældre, og `false` ellers. Tilføj metoden til `Person`-klassen og test at det virker i `Main`-klassen, fx
   ```java
   System.out.println("Er voksen: " + person.isAdult());
   ```
9. Efter nærmere overvejelse, vil vi gerne skjule navn og alder fra alle `public` adgange til klassen, herunder `toString()`. Ret klassen, det eneste den udstiller `public` er
   - en konstruktør, der tager `name` og `age` som parametre
   - `setName(String name)` og `setAge(int age)` metoderne
   - `isAdult()` metoden
   - `toString()` der returnerer `"Personen er voksen"` eller `"Personen er ikke voksen"`
10. Test at det virker ved at køre `Main`-klassen.