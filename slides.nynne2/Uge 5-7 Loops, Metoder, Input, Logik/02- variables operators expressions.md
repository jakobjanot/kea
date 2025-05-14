<!-- Slide number: 1 -->
Variabler, Operatorer og Expressions

![](GoogleShape78p18.jpg)

### Notes:

<!-- Slide number: 2 -->
# Program
08:30 — Velkomst praktisk, slides

08:50 — Igang med øvelser i grupper

10:00 — Pause

10:15 — Øvelser fortsat

11:30 — Opsamling og forberedelse til næste gang

### Notes:

<!-- Slide number: 3 -->
# Hvad vi skal gennemgå i dag
- Hvad er:
- Variabler
- Operatorer
- Expressions

### Notes:

<!-- Slide number: 4 -->

![](GoogleShape95p21.jpg)

### Notes:

<!-- Slide number: 5 -->
# Variabel = beholder af en værdi
int x = 22;

### Notes:

<!-- Slide number: 6 -->
# Operator
= symbol der udfører udregning
3 + 5;

### Notes:

<!-- Slide number: 7 -->
# Expression = Simpel værdi eller sæt af operatorer der producerer en værdi

3 + 5;

### Notes:

<!-- Slide number: 8 -->
# Variabels
For at danne en variable, skriver man :
først navnet på ens variable,
derefter skriver man et lighedstegn =
følgende med værdien man gerne vil definere ens variable med.
 x er en variabel.
 = kaldes en tildelingsoperator (assignment operator).
 Den tildeler værdien på højre side til variablen til venstre.

### Notes:

<!-- Slide number: 9 -->
# Variabels

int x = 22;
Type
Name
Value

### Notes:

<!-- Slide number: 10 -->
# Variabels
For at et program kan arbejde med data, er computeren nødt til at reservere en del af hukommelsen til arbejdet.
Variablen skal have et navn, så det er muligt at henvise til den.

En variabel kan grundlæggende bruges på tre måder:
Den kan erklæres, hvilket betyder at der allokeres plads i hukommelsen samt gives et navn og en datatype.
Den kan tildeles en værdi.
Dens værdi kan anvendes.

### Notes:

<!-- Slide number: 11 -->
# Hvad er en datatype?
•En datatype er en klassificering af hvilken typer data man har at gøre med.
•Primitive Data Typer:
•boolean, som kan antage to sandhedsværdier, True for sandt, og False for falsk.
•int, som repræsenterer heltal, fx -1, 2, 44, 42, 69
•float, som er decimaltal, fx -1.12, 3.1415, 1.4423, 2/3
•Reference Data Type:
•string, som er et stykke tekst, fx ”Se mor! Jeg koder i JAVA!” eller ”Jeg er 25 år gammel”

### Notes:

<!-- Slide number: 12 -->
# Hvad er en datatype?

Primitive Data Type
boolean
Numeric Type
Integral Type
Floating-Point Type
float
double
byte
short
long
char
int

### Notes:

<!-- Slide number: 13 -->
| Primitive Type | Memory Size | Default Value | Range |
| --- | --- | --- | --- |
| boolean | 8 bits | false | true or false |
| byte | 8 bits, signed integer | 0 | from \-128 to 127 |
| char | 16 bits, unicode character | \\u0000 or code point u | 0 to 65535 inclusive |
| short | 16 bits, signed integer | 0 | from \-32,768 to 32,767 |
| int | 32 bits, signed integer | 0 | from \-2,147,483,648 to 2,147,483,647 |
| long | 64 bits, signed integer | 0 | 64 bits, signed integer |
| float | 32 bit, IEE 754, floating\-point value | 0\.0 | 6 to 7 decimal digits |
| double | 64 bit, IEE 754 | 0\.0 | 15 to 16 decimal digits |

### Notes:

<!-- Slide number: 14 -->
# Naming convention
Variable navne må kun indeholde bogstaver, tal eller underscore_
Variable er ”case-sensitive”, dvs TALLET_fem og tallet_fem er to forskellige variabler.
Variabel navne skal være beskrivende.
Hvis du har flere ord, kan du adskille ordene med en understregning, eller bruge camelCase.
Ingen tomme mellemrum!

### Notes:

<!-- Slide number: 15 -->
# Variabel Typer
4
2.5
‘a’
‘hello’

myChar
myInt
myDouble
myString

### Notes:

<!-- Slide number: 16 -->
# Printe Variabler

![](GoogleShape212p33.jpg)

int salary = 400000;
System.out.println(salary);

### Notes:

<!-- Slide number: 17 -->
# Kode Kommentar
En tekstlinje som starter med //
Computeren ikke kan oversætte det. (hoppe over)
Det gør det nemmere for en selv og andre at huske: hvordan koden virker, hvad ens kode betyder.
Til at udkommentere ens kode, hvis det f.eks. ikke skal bruges på nuværende tidspunkt, men måske senere.
 Hvad man mangler at programmere, hvilke fejl der er.
hvad mangler der i koden.
Java Comments (w3schools.com)

### Notes:

<!-- Slide number: 18 -->
# final

final String name = "Nynne";
name = "Dorte"; // Java throws an error!!

### Notes:

<!-- Slide number: 19 -->
# Operators & Expressions
An expression is a simple value or a set of operations that produce a value.

3 + 5;

### Notes:

<!-- Slide number: 20 -->
# Operators & Expressions
An expression is a simple value or a set of operations that produce a value.

+ - Addition
- - Subtraction
* - Multiplication
/ - Division
% - Modulus

### Notes:

<!-- Slide number: 21 -->
# Mere komplekse Expressions
result = 3 * 5 / 5 + 1
// will this java code run??

![](GoogleShape245p38.jpg)

### Notes:

<!-- Slide number: 22 -->
# Rækkefølge på operations
| ORDER OF OPERATIONS |
| --- |
| (), \[], {} Parentheses, brackets, braces |
| √, Xi Exponents, Radicals |
| X, ÷ Multiplication, Division |
| \+, — Addition, Subtraction |

### Notes:

<!-- Slide number: 23 -->
main
public = access modifier gør metoden tilgængelig overalt i din application
static = sørger for at gøre din metode til en class method i stedet for en instance method - uden at du behøver instanciere den først
void = metoden må ikke returnere noget - andet en void
main() = giver programmet et start punkt, kan ikke udføres uden

![](GoogleShape258p40.jpg)

### Notes:

<!-- Slide number: 24 -->
# Shortcuts
main giver public static void main

![](GoogleShape265p41.jpg)
sout giver System.out.println();

![](GoogleShape264p41.jpg)

### Notes: