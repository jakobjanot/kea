#import "../style.typ": *

= Java fra scratch

== Introduktion til programmering

En computer er en *standardmaskine*, der kan udføre mange forskellige opgaver. For at forstå hvordan vi programmerer, skal vi først forstå forskellen mellem hardware og software.

=== Hardware
Hardware er computerens fysiske komponenter:
- *CPU'en* beregner og udfører instrukser
- *RAM* er midlertidig arbejdshukommelse
- *Harddisk* er permanent hukommelse til filer

=== Software
Software er de programmer, der kører på computeren:
- *Operativsystem* styrer computeren (fx Windows, macOS, Android, iOS)
- *Drivere* får computeren til at kommunikere med hardware (fx keyboard, printer, skærm)
- *Applikationer* er det, vi bruger computeren til (fx Word, Photoshop, browsere, spil)

At skrive software, dvs. programmere, er både kraftfuldt og kreativt, fordi du kan løse mange forskellige problemer og skal forstå problemet for at finde en løsning.

== Programmeringssprog

Ligesom vi har mange forskellige talte sprog til at kommunikere med hinanden, har vi også mange forskellige programmeringssprog til at kommunikere med computeren. Forskellige sprog har forskellige ord og syntaks (dvs. regler for rækkefølgen af ord i en sætning).

Java er et *general purpose programmeringssprog*, hvilket betyder at du kan løse mange forskellige opgaver med det:
- Apps til mobiltelefoner
- Hjemmesider og web-applikationer  
- Spil (fx Minecraft er lavet i Java)
- Desktop-applikationer

Dette er i modsætning til "domæne specifikke sprog", der kun bruges til én ting, fx SQL til databaser eller HTML/CSS til hjemmesider.

== Syntaks - reglerne for sproget

*Syntaks* er reglerne for rækkefølge af ord i programmeringssprog. Ligesom i dansk, hvor vi siger "jeg spiser en sandwich" i stedet for "spiser en sandwich jeg", har Java også specifikke regler.

Her er eksempler på korrekt og forkert Java syntaks:

*Korrekt:*
```java
int age = 18;
System.out.println("Hello, World!");
```

*Forkert:*
```java
age = 18 int;        // Forkert rækkefølge
System.out println("Hello, World!");  // Mangler punktum
```

=== Whitespace og indrykning

Whitespace (mellemrum, tabulatorer og linjeskift) er ikke vigtigt for computeren, men vigtigt for læsbarhed:

```java
// Korrekt og læsbart
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}

// Også korrekt, men svært at læse
public class HelloWorld { public static void main(String[] args) { System.out.println("Hello, World!"); } }
```

Vi bruger indrykning for at gøre koden lettere at læse og forstå strukturen.

== Opsætning af udviklingsmiljø

For at begynde at programmere i Java, skal vi installere nogle værktøjer på computeren.

=== Installation af Java Development Kit (JDK)

#exercise(title: "Installér Java JDK")[
1. Gå til https://adoptium.net/ og download *Java JDK 21*
2. Klik på "Other Downloads" og vælg fanen *JDK 21*
3. Vælg den version der passer til dit operativsystem (Windows, macOS, Linux)
4. Åbn den downloadede fil og følg installationsvejledningen
5. Bekræft installationen ved at åbne Terminal (macOS) eller PowerShell (Windows)
6. Skriv `java -version` og tryk Enter
7. Tjek at der står *version 21* i outputtet
]

=== Installation af IntelliJ IDEA

IntelliJ IDEA er et udviklingsmiljø, der hjælper os med at skrive, organisere og køre Java-kode.

#exercise(title: "Installér IntelliJ IDEA")[
1. Gå til https://www.jetbrains.com/idea/download/
2. Scroll ned til *IntelliJ IDEA Community Edition* (ikke Ultimate)
3. Download og installér programmet
4. Start IntelliJ IDEA
5. Hvis du bliver spurgt om at importere indstillinger, vælg *Do not import settings*
]

== Dit første Java-program

Nu skal vi skrive vores første Java-program - det klassiske "Hello, World!" program.

=== Opret et nyt projekt

#exercise(title: "Opret nyt projekt")[
1. Start IntelliJ IDEA og klik på *New Project*
2. Vælg *Java* som projekttype
3. Udfyld følgende:
   - *Name*: `helloworld`
   - *JDK*: Vælg JDK 21
   - *Build system*: IntelliJ
   - Fjern fluebenet i *Add sample code*
4. Klik *Create*
]

=== Opret din første klasse

#exercise(title: "Hello World program")[
1. I venstre sidepanel, højreklik på `src` og vælg *New* → *Java Class*
2. Navngiv klassen `HelloWorld`
3. Udfyld klassen med følgende kode:

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

4. Kør programmet ved at klikke på den grønne ▷ ved siden af `main` metoden
5. Se outputtet i konsollen nederst - skriver programmet "Hello, World!"?
]

=== Eksperimenter med kommentarer

#exercise(title: "Kommentarer")[
1. Sæt `//` foran `System.out.println("Hello, World!");` så det bliver til en kommentar:

```java
public class HelloWorld {
    public static void main(String[] args) {
        // System.out.println("Hello, World!");
    }
}
```

2. Kør programmet igen - hvad sker der?
3. Fjern kommentaren (`//`) og kør programmet igen
4. Tilføj en ny linje med en anden besked:

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
        System.out.println("I am learning Java!");
    }
}
```
]

== Kompilering og kørsel

Når vi skriver Java-kode, sker der følgende:

1. *Kildekode* skrives i en `.java` fil (fx `HelloWorld.java`)
2. *Kompilering* oversætter kildekoden til bytecode (`.class` filer)
3. *Java Virtual Machine (JVM)* kører bytecode-filerne

Denne proces gør Java *platform-uafhængigt* - du kan skrive kode på én computer og køre den på en anden, selvom de har forskellige operativsystemer.

#note[
IntelliJ håndterer kompilering automatisk, når du kører dit program. Du behøver ikke at bekymre dig om de tekniske detaljer i begyndelsen.
]

== Opsummering

I dette kapitel har vi lært:
- Forskellen mellem hardware og software
- Hvad et programmeringssprog er, og hvorfor vi bruger Java
- Vigtigheden af korrekt syntaks
- Hvordan man installerer Java JDK og IntelliJ IDEA
- Hvordan man opretter og kører sit første Java-program
- Hvad der sker når Java-kode kompileres og køres

Du har nu grundlaget for at begynde at lære programmering i Java!