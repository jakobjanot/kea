# Lommeregner og casting

Husker du `casting`? Vi kan caste, altså at konvertere en type til en anden type, fx fra `double` til `int`? Når der castes fra `double` til `int` bliver decimalerne bare skåret væk (dvs. et tab af information), fx:
```java
double x = 5.7;
int y = (int) x; // y bliver 5
```
Derfor er vi tvunget til at skrive `(int)` foran `x`, når vi vil caste fra `double` til `int`. Det kalder vi en eksplicit cast.
Derimod er konvertering fra `int` til `double` automatisk, da der ikke sker noget tab af information, fx:
```java
int a = 5;
double b = a; // b bliver 5.0
```
Det kalder vi en implicit cast.

I Intellij-projekt `pocketcalculator` har vi implementeret `add` to gange, en der tager `int` som parametre og en der tager `double` som parametre. De er helt ens bortset fra parametrene. Vi siger at metoderne er **overloaded**.
Ved nærmere eftertanke, så er det jo lidt dumt at have to `add` metoder, når den ene bare caster `int` til `double` og kalder den anden. Lad os prøve at ændre det.
1. Ret din `Math`-klasse så den alene har `add`, `subtract`, `multiply` og `divide` metoder.
2. Prøv igen. Ser du nogle ændringer i output?
3. Hvorfor er det især interessant at se på `divide` metoden? Kan du forklare hvad der sker?
4. Ser du nogle problemer ved at skulle "undvære" `int` metoderne? 