# Gæt et tal - 10 forsøg
- Fortsæt på projektet `secret-number`
- Som programmet er nu, kan brugeren gætte så mange gange som han/hun vil. Lad os begrænse det til 10 forsøg.
- Du kan bruge en `for` løkke til at gentage gætningen 10 gange og bruge break til at afslutte løkken, hvis brugeren gætter rigtigt:
  ```java
  for (int i = 0; i < 10; i++) {
        // ...
        if (guess == secretNumber) break;
        // ...
    }
  ```
- Test programmet og se om det virker