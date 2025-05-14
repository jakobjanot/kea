<!-- Slide number: 1 -->
Interfaces

![](GoogleShape84p20.jpg)

### Notes:

<!-- Slide number: 2 -->
# Eksamensemner programmering 2024
Alle disse emner skal ses som overskrifter da der kan være flere ting der hører ind under emnet:

Hovedemner:
Metoder/metodekald. parameteroverførsel
Loops. for / for each / while / do while
if / else / switch
working with files / Scanner/printStream objekt
Arrays / multidimensional Arrays, traversing
ArrayList / vs Arrays
Klasser/objekter.
Arv. super klasse/subklasse
Interface / polymorphism
Collection sort

### Notes:

<!-- Slide number: 3 -->
4 pillars of OOP

ABSTRACTION
INHERITANCE
POLYMORPHISM
ENCAPSULATION

### Notes:

<!-- Slide number: 4 -->
“[Polymorphism] the quality or state of existing in or assuming different forms”
https://www.merriam-webster.com/dictionary/polymorphism

### Notes:

<!-- Slide number: 5 -->
# Polymorfi — Græsk for mange former

FrugtKlasse

![](GoogleShape118p24.jpg)

![](GoogleShape117p24.jpg)

![](GoogleShape119p24.jpg)

![](GoogleShape115p24.jpg)

![](GoogleShape116p24.jpg)

![](GoogleShape120p24.jpg)

### Notes:

<!-- Slide number: 6 -->
# 4 pillars of OOP

Encapsulation — Kontrollerer hvilke objekter der har adgang til data fra andre objekter
Abstraction — skaber en grundlæggende ramme for et helt program og gør det muligt at justere efter behov (med Interface og Abstract class)
Inheritance — tillader objekter at arve egenskaber fra andre objekter
Polymorphism — Definerer hvordan metoder og klasser kan opføre sig forskelligt, selvom de hedder det samme

### Notes:

<!-- Slide number: 7 -->
Abstraction

… abstraction is the process of generalizing concrete details, such as attributes, away from the study of objects and systems to focus attention on details of greater importance. Abstraction is a fundamental concept in computer science and software engineering, especially within the object-oriented programming paradigm.

https://en.wikipedia.org/wiki/Abstraction_(computer_science)

### Notes:

<!-- Slide number: 8 -->
# Definition af Interface
Et interface er en erklæring om hvad en klasse skal gøre uden at definere hvordan den skal gøre det.
Det betyder basically, at et interface er en samling af metodeerklæringer uden implementering (altså kode)
Metodeerklæringerne er abstrakte.

![](GoogleShape146p27.jpg)

### Notes:

<!-- Slide number: 9 -->
# Kendetegn ved interfaces

Alle metoder er public
Felter er public, static og final
En klasse kan implementere flere interfaces
Implementerende klasse kan ikke gøre metoder ikke-public
Interfaces kan arve fra hinanden
Metoder i et interface kan ikke være static eller final

### Notes:

<!-- Slide number: 10 -->
4 pillars of OOP

ABSTRACTION
INHERITANCE
POLYMORPHISM
ENCAPSULATION

### Notes:

<!-- Slide number: 11 -->
Public Private
Private

Default
Mere restriktiv
Mindre restriktiv
Protected

Public

### Notes:

<!-- Slide number: 12 -->
Interface Class
Mere implementation / mindre abstrakt
Class

Abstract class
Interface
Mindre implementation / mere abstrakt

### Notes:

<!-- Slide number: 13 -->
# Hvorfor Interfaces
Interfaces har tre formål:
1: At give det højeste niveau af abstraktion
2: At opnå polymorfi
3: At sikre at bestemte metoder er til stede / implementeret i en klasse
Opfører sig som en kontrakt som en klasse skal leve op til

### Notes:

<!-- Slide number: 14 -->
# Hvilket Problem skal Interfaces løse?
Class A
Class
Class B
Class
Interface
Class C
Class
Adfærd til fælles

Class
Class D
Class
Class E

### Notes:

<!-- Slide number: 15 -->
# Samme funktionalitet — forskellig implementation
Facebook User
Facebook login
Google User
Google login
Adfærd til fælles

Twitter login
Interface
Twitter User

![Image](GoogleShape243p34.jpg)

### Notes:

<!-- Slide number: 16 -->
# Hvorfor Interfaces
Interfaces har tre formål:
1: Give det højeste niveau af abstraktion
2: Give polymorphism
3: Sikre at bestemte metoder er tilstede / implementeret i en klasse
Opfører sig som en kontrakt som en klasse skal leve op til

### Notes:

<!-- Slide number: 17 -->
“A non programming analogy for an interface is a professional certification. It’s possible for a person to become certified as a teacher, nurse, accountant, or doctor. To do this, the person must demonstrate certain abilities required of members of those professions”

![](GoogleShape256p36.jpg)
Reges, Stepp - Chapter 9 P. 653

### Notes:

<!-- Slide number: 18 -->
# Et Interface sikrer at adfærd implementeres, men ikke hvordan den implementeres

### Notes:

<!-- Slide number: 19 -->
# Interface Opsummeret:
Et Interface indeholder kun method signatures*
Det er også kaldet abstrakte metoder
Et interface kan også bruges som en reference data type
En klasse kan implementere adskillige Interfaces
* Undtagelse til reglen: default og statiske metoder (siden Java 8)

### Notes:

<!-- Slide number: 20 -->
# EKSAMENSRELEVANT
Implementere interfaces: Comparable og Comparator
Herunder implementere metoder fra interfaces
Oprette egne interfaces med metodeerklæringer(uden implementering) samt implementere disse
Kunne svare fornuftigt på basale spørgsmål vedr. ovenstående

That's it! 💖

### Notes:

<!-- Slide number: 21 -->
|  | Abstrakt Klasse | Interface |
| --- | --- | --- |
| Definition | Kan ikke instantieres. Indeholder både abstrakte og konkrete metoder (med implementation) | Specificerer et sæt af abstrakte metoder som klassen SKAL implementere |
| Implementations Metode | Kan implementere både konkrete og abstrakte metoder | Metoder er abstrakte som deefault |
| Inheritance | En klasse kan kun arve fra EN abstrakt klasse | En klasse kan arve fra MANGE interfaces |
| Access Modifiers | Kan have alle slags (public, private, protected) | Metoder er implicit public |
| Variabler | Kan have både final, non\-final, static og non\-static | Variabler er implicit public, static og final (konstanter) |

### Notes:

<!-- Slide number: 22 -->
Hvad er Design Patterns?

![](GoogleShape295p41.jpg)

### Notes:

<!-- Slide number: 23 -->
# GRASP General Responsibility Assignment Software Patterns
Kun tillad klasser med mest viden om en anden klase at oprette instanser af den klasse
Ansvar skal ligge hos den klasse der har den rette information til at eksekvere på det ansvar
Low coupling - klasser er så lidt afhængige af hinanden som muligt
High cohesion - samle ansvar og funktionalitet der hænger sammen i én klasse
Polymorphism - brug arv og interface til at lave flere implementationer af adfærd
Brug abstraktion til at gøre din kode fleksibel og decoupled

### Notes:

<!-- Slide number: 24 -->
# SOLID
Single responsibility, Open–closed, Liskov substitution, Interface segregation, Dependency inversion
Hver klasse skal kun have et ansvar.
Software skal være åbent for udvidelse, men lukket for modifikation.
Brug interfaces for at sikre at base-klasser forbliver uændrede, selvom sub-klasser har forskellige udformninger.
Reducér afhængighed mellem klasser så meget som muligt.
Gør brug af abstraktion, hvor det er muligt. Det reducerer dependencies mellem klasser og gør koden mere fleksibel og nemmere at teste.

### Notes: