**Øvelse: Byg et Dyrehåndteringssystem til en Zoo**

**Scenarie:**

Du skal udvikle et simpelt dyrehåndteringssystem, der modellerer dyr med forskellige adfærd. Hvert dyr har en type, et navn og specifik adfærd (f.eks. at lave lyde eller bevæge sig). Nogle dyr kan flyve, mens andre kan svømme.

**Krav:**

1. **Arv**:
	* Opret en basisklasse Dyr med fælles egenskaber og metoder.
	* Opret underklasser som Pattedyr, Fugl og Fisk, der nedarver fra Dyr.
2. **Interfaces**:
	* Opret interfaces for specifikke adfærd:
		+ KanFlyve med en metode flyv().
		+ KanSvoemme med en metode svoem().
3. **Polymorfi**:
	* Brug polymorfi til at håndtere forskellige dyretyper i en fælles liste.
4. **Implementering**:
	* Opret specifikke dyr som Hund, Falk og Haj, og implementer de relevante interfaces.
5. **Output**:
	* Skriv en Zoo\-klasse med en main\-metode til at tilføje dyr og demonstrere deres adfærd.

**Implementeringsdetaljer**

**Basisklasse og Underklasser**

1. Dyr:
	* Attributter: navn og type.
	* Metode: givLyd() (abstrakt).
2. Underklasser:
	* Pattedyr, Fugl, Fisk arver fra Dyr.
	* Overskriver (overrider) metoden givLyd().

**Interfaces**

* KanFlyve: Har en metode flyv().
* KanSvoemme: Har en metode svoem().

**Dyr**

* Hund: Et Pattedyr, der ikke implementerer nogen interfaces.
* Falk: En Fugl, der implementerer KanFlyve.
* Haj: En Fisk, der implementerer KanSvoemme.