# Integer division

- Opret et IntelliJ projekt kaldet 'integer-division' med en klasse `IntegerDivision` og en `main` metode.
- I Java gør regnearterne addition, subtraktion og multiplikation som vi forventer, men du kan blive overrasket over hvordan division fungerer.
- Lad os prøve at beregne hvor stor en brøkdel af en time, der er gået når der er gået 59 minutter.
  ```java
  int minutes = 59;
  System.out.print("Brøkdel af timen, der er gået: " + 
                   minutes / 60);
  ```
- Hvad får du? Var det forventet?
- Resultatet `0` forvirrer ofte folk, da 59 divideret med 60 er `0,98333`, ikke `0`. Problemet er, at Java udfører **integer division**, når operanderne er `int`, altså heltal. Integer division runder altid ned til nul, selv i tilfælde som dette, hvor det næste heltal er tæt på.
- Med din nye erfaring med **casting**, prøv nu at ændre din kode, så du får det ønskede resultat - og anvender **floating-point division** frem for **integer division**.
- Prøv andre minut-tal hvordan det virker med henholdsvis **integer division** og **floating-point division**.