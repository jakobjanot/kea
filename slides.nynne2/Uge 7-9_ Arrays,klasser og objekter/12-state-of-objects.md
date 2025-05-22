<!-- Slide number: 1 -->
Objekters State

![](GoogleShape80p19.jpg)

### Notes:

<!-- Slide number: 2 -->
# Nøglekoncepter ved Klasser i Java:
Når vi definerer en class, skabes en ny objekt type med samme navn

En class definition er en template for objekter: det bestemmer hvilke atributter objektet skal have og hvilke metoder der kan operere på dem

Hvert objekt tilhører en object type, og er en instans af den klasse

new operator instantierer objekter = laver nye instanser af en class

### Notes:

<!-- Slide number: 3 -->

![](GoogleShape94p21.jpg)
Encapsulation: data & metoder i en samlet pakke

#

### Notes:

<!-- Slide number: 4 -->
# Kode eksempel med state

![](GoogleShape103p22.jpg)

![](GoogleShape104p22.jpg)

![](GoogleShape105p22.jpg)

### Notes:

<!-- Slide number: 5 -->
# Access Modifiers

Default - sat automatisk til kun at give adgang i samme package (kode projekt)
Private - kun tilgængelig i den ene class hvor de befinder sig
Protected - ligesom private, men kan også tilgås i subclasses
Public - tilgængelig overalt i dit Java program

### Notes:

<!-- Slide number: 6 -->
# Kode eksempel med Access Modifiers

![](GoogleShape117p24.jpg)

### Notes:

<!-- Slide number: 7 -->
Encapsulation

![](GoogleShape123p25.jpg)

### Notes:

<!-- Slide number: 8 -->
# Hvorfor Encapsulation
Definerer hvordan flere classes kan kommunikere til hinanden
Gør det lettere at ændre eller forbedre koden (refactorere)
Gør det mindre sansynligt at en atribut bliver overskrevet med en invalid værdi eller null

### Notes:

<!-- Slide number: 9 -->
# Getter & Setter — “accessors”
setter & getter er almindelige funktioner der har navnekonvention

getter for noget er getNoget og setter er setNoget

Tænk på dem som en abstraktion over dine variabler, der tillader dig at tilgå metoder udenfor en klasse, uden at kunne ændre noget

getter: det kan være smart at holde metoderne i en klasse “read only”
setter: giver mulighed for at modificere instanser af en klasse, uden at ændre ved klassen

### Notes:

<!-- Slide number: 10 -->
# Kode eksempel med getter & setter

![](GoogleShape141p28.jpg)

### Notes: