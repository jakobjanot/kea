---
title: "01#2 - Intro og installation af Java - Øvelser"
---
<!-- .slide: class="kea-red" -->
# Installering af udviklingsværktøjer

--
<!-- .slide: class="kea-dark" -->

## Opgaver

- Installér Java Development Kit (JDK)
- Installer IntelliJ IDEA editoren
- Bliv fortrolig med IntelliJ og Java-kode

---

## Øvelse: Installation af Java Development Kit

For at udvikle og køre Java-programmer, skal vi have installeret nogle værktøjer på vores computer.

--

- Gå til [https://adoptium.net/](https://adoptium.net/) og download **Java JDK 21**
- Klik på "Other Downloads"

![Adoptium](<img/adoptium-other-downloads.png>)

-- 
# Download Java JDK 21

1. Klik på fanen **JDK 21**
2. Vælg den version der passer til dit operativsystem (Windows, macOS, Linux)
3. Åbn den downloadede fil for at starte installationen

Notes:
- JDK står for Java Development Kit, altså alt det vi skal bruge som Java-udviklere
- Er du ferm med at installere software med homebrew på Mac eller Winget på Windows eller apt-get på Linux, kan du også bruge det til at installere JDK 21.
- homebrew: `brew install --cask temurin@21`
- Winget: `winget install EclipseAdoptium.TemurinJDK.21`
- apt-get: `sudo apt-get install openjdk-21-jdk`

--

# Kør installeren
Den stiller ingen vigtige spørgsmål, så bare Continue, Next, Agree osv.

![Install](img/install.png)

---

# Tjek installationen
Når installationen er færdig, skal vi sikre os, at Java er korrekt installeret. Det gør vi ved at åbne en **konsolapplikation** og køre en kommando.

- macOS-brugere skal åbne **Terminal** (se næste side)
- Windows-brugere skal åbne **PowerShell** (se to sider frem)

--

# macOS: find Terminal i Spotlight

- Klik på **forstørrelsesglasset** øverst til højre på skærmen
    ![Mac Spotlight button](img/mac-spotlight-button.png)
- Skriv "Terminal" i søgefeltet og tryk **Enter**
    ![Mac Sporlight search](img/mac-spotlight-search.png)

--

# Windows: find PowerShell i Start-menuen

- Klik på **Start-menuen** i nederste venstre hjørne af skærmen
- Skriv "PowerShell" i søgefeltet og tryk **Enter**
    ![Windows PowerShell search](img/windows-search-powershell.png)

--

- Skriv `java -version` og tryk **Enter**.
- Tjek at du får en besked, der ligner denne:
    ![write-java-version](img/write-java-version.png)
- Tjek at der står **version 21**, hvilket betyder at du har installeret Java JDK 21.
- Hvis du får en fejl, så prøv at genstarte din computer og kør kommandoen igen.
- Stadig har problemer? Spørg dine klassekammerater eller underviseren om hjælp.

---

# Øvelse: Installering af IntelliJ IDEA

--

## Download

- Gå til [https://www.jetbrains.com/idea/download/](https://www.jetbrains.com/idea/download/)
- Download **ikke** IntelliJ IDEA **Ultimate**
- **Scroll** ned til IntelliJ IDEA **Community Edition**
    ![Download IntelliJ](img/download-intellij.png)
- Klik "Download"

--

## Installér

- Åbn den downloadede fil for at starte installationen
- Følg installationsvejledningen og klik "Next" eller "Continue" indtil installationen er færdig

--

## Start IntelliJ IDEA

- Start IntelliJ IDEA
- Find den i Start-menuen (Windows) eller i Spotlight (macOS)
- Hvis du bliver spurgt om at importere indstillinger, så vælg **Do not import settings**

---

## Opsætning af IntelliJ IDEA

- Vi skal konfigurere IntelliJ IDEA, så den passer til vores behov

--

- Al konfiguration foregår i **Settings** vinduet
- I vinduet finde og klikke på **Settings** i menuen
- I Windows er det under **File** → **Settings**
- I macOS er det i topmenuen under **IntelliJ IDEA** → **Preferences**
- ![Intellij Settings Mac](img/intellij-settings-mac.png)

--

- I venstre sidepanel, klik på **Plugins**
- Scroll ned til du finder **Local AI/ML Tools**
- Klik på **Disable all**
- Klik på **Ok** for at gemme ændringerne
- Måske skal du genstarte IntelliJ IDEA for at ændringerne træder i kraft
- Gå tilbage til **Plugins** og scroll ned for at sikre dig at **Local AI/ML Tools** er deaktiveret, som her:
![Disable IntelliJ AI plugins](img/intellij-ai.png)

--

- I venstre sidepanel, klik på **Editor** → **General** → **Code Folding**
- Scroll ned til du finder **Java**
- Fjern alle flueben under **Java**, så det ligner billedet herunder
- Dette deaktiverer sammenfoldning af kode, der kan skjule kode og skabe forvirring
- Klik på **Ok** for at gemme ændringerne
![Disable code folding](img/intellij-codefold.png)

--

- I venstre sidepanel, klik på **Editor** → **Inlay Hints**
- Fjern fluebenet ved **Code Vision** og **Parameter hints**, så det ligner billedet herunder
- Dette deaktiverer ekstra informationer i koden, som kan være forstyrrende for begyndere
- Klik på **Ok** for at gemme ændringerne
![Disable inlay hints](img/intellij-inlay-hints.png)

---

<!-- .slide: class="kea-rose" -->
# Øvelser i IntelliJ

---

# Øvelse - Hello World
1. Lav et nyt Java-projekt i IntelliJ, som du 
    -   navngiver `helloworld`
    -   som Buildsystem vælger du `IntelliJ`
    -   som JDK vælger du `21`
2. Under `Project` i venstre sidepanel, højreklik på `src` og vælg `New` → `Java Class`
3. Navngiv klassen `HelloWorld`
4. Udfyld klassen, så den ligner dette:
    ```java
    public class HelloWorld {
        public static void main(String[] args) {
            System.out.println("Hello, World!");
        }
    }
    ```
5. Kør programmet for at se outputtet - skriver programmet "Hello, World!" i konsollen?
6. Sæt `//` foran `System.out.println("Hello, World!");` - så den bliver til en kommentar, så det ligner dette:
    ```java
    public class HelloWorld {
        public static void main(String[] args) {
            // System.out.println("Hello, World!");
        }
    }
    ```
7. Kør programmet igen - hvad sker der?
8. Fjern kommentaren og kør programmet igen - hvad sker der nu?

---

# Øvelse - Syntax highlighting

- Måske har du lagt mærke til at IntelliJ farver din kode, så den er lettere at læse - det kaldes **syntax highlighting**. Ligesom indrykning, så forbedrer syntax highlighting læsbarheden af din kode - vi kan bedre se hvilke ord der har en særlig betydning i Java.

1. Fortsæt med at arbejde i dit `helloworld` projekt
2. Prøv at **copy-paste** hele `helloworld` koden du har skrevet før til et alm. tekstbehandlingsprogram (fx Notepad i Windows - eller Notes på Mac)
3. Hvad sker der? - er der stadig farver i koden?
4. Så det er altså IntelliJ der farver koden - det er ikke en del af Java-koden - Java-koden er ren tekst.
5. Læg mærke til hvilke ord der er farvet - de ord har en særlig betydning i Java
6. Prøv at ændre `class` til `klasse` - hvad sker der, hvilken farve får det - kan det stadig køre? 
7. `class` er ligesom `public`, `static`, `void` og flere andre ord **reservede ord** i Java, som har en særlig betydning der hvor vi har brugt det, så vi kan ikke bare ændre det til et andet ord

---

# Øvelse - Udskriv din egen besked

- Lav et nyt Java-projekt i IntelliJ, som du 
    -   navngiver `helloagainworld`
    -   som Buildsystem vælger du `IntelliJ`
    -   som JDK vælger du `21`

1. Under `Project` i venstre sidepanel, højreklik på `src` og vælg `New` → `Java Class`
2. Navngiv klassen `HelloAgainWorld`
3. Tilføj en `main` metode så det ligner dette:
    ```java
    public class HelloAgainWorld {
        public static void main(String[] args) {
            
        }
    }
    ```
4. Indtast følgende kode i `main` metoden:
    ```java
    System.out.println("Hello Again, World!");
    ```
5. Tjek at din kode ligner dette:
    ```java
    public class HelloAgainWorld {
        public static void main(String[] args) {
            System.out.println("Hello Again, World!");
        }
    }
    ```
5. Kør programmet for at se outputtet - skriver programmet "Hello Again, World!" i konsollen?

--

6. Skriv en ny linje i `main` metoden, der bruger `System.out.println` til at udskrive en besked - vælg selv en besked. 
    ```java
    public class HelloAgainWorld {
        public static void main(String[] args) {
            System.out.println("Hello Again, World!");
            System.out.println("I am learning Java!");
        }
    }
    ```
7. Kør programmet igen - hvad sker der?

---

# Øvelse - Indrykning og mellemrum (whitespaces)
- Når vi programmerer bruger vi indrykning for at gøre vores kode mere læsbar
- Indrykning hjælper os med at se hvilke linjer der hører sammen
- Er Java ligeglad med indrykning? - lad os undersøge det!

1. Fortsæt med at arbejde i dit `helloagainworld` projekt
2. Prøv at fjerne indrykningen i din kode, så den ligner dette:
    ```java
    public class HelloAgainWorld {
    public static void main(String[] args) {
    System.out.println("Hello Again, World!");
    System.out.println("I am learning Java!");
    }
    }
    ```
3. Kør programmet - hvad sker der?
4. Hvorfor er det vigtigt at have indrykning i din kode?
5. Brug **tabulator**-tasten (⇥) for at indrykke koden igen, så den ligner dette:
    ```java
    public class HelloAgainWorld {
        public static void main(String[] args) {
            System.out.println("Hello Again, World!");
            System.out.println("I am learning Java!");
        }
    }
    ```
6. Kør programmet igen - alt ok?
7. Ok, så indrykning er ikke vigtigt for at Java kan forstå koden
---

# Øvelse - andre mellemrum (whitespaces)
- Vi har set at indrykning ikke er vigtigt for at Java kan forstå vores kode
- Hvad med andre mellemrum (whitespaces) - er de vigtige? - lad os undersøge det!

1. Fortsæt med at arbejde i dit `helloagainworld` projekt
2. Prøv nu at eksperimentere fjerne andre mellemrum, fx alle mellemrum omkring `{` og `}` og efter `;`, så det ligner dette:
    ```java
    public class HelloAgainWorld{public static void main(String[] args){System.out.println("Hello Again, World!");...}}
    ```
4. Ok, så Java er tilsyneladede også ligeglad med de mellemrum og linjeskift vi lige har fjernet.
3. Hvorfor synes du ikke vi skal have hele vores kode på en linje?
4. Sæt din **markør** (cursor) på linjen og tryk på 
    - **Ctrl + Alt + L** hvis du er på **Windows** (først Ctrl, så Alt, så L)
    - **Cmd + Option + L** hvis du er på **Mac** for at formattere koden (først Cmd, så Option, så L)
5. Snedigt ikke? - IntelliJ formatterer din kode automatisk, så den bliver mere læsbar
6. Kør programmet igen - alt ok?

--

7. Prøv at fjerne **alle** mellemrum i din kode, så den ligner dette:
    ```java
    publicclassHelloAgainWorld{publicstaticvoidmain(String[]args){System.out.println("HelloAgain,World!");System.out.println("IamlearningJava!");}}
    ```
8. Kør programmet - hvad sker der? 
9. Læg mærke til at IntelliJ ikke lægere tilføjer syntax highlighting - det er fordi det ikke længere følger Java's syntaksregler,  og IntelliJ kan derfor ikke forstå koden.
10. Ok, så Java er ikke _helt_ ligeglad med mellemrum - hvordan skulle den - hvordan skal man kende forskel på `public`, `class` og `publicclass` hvis de ikke er adskilt af mellemrum?
11. Prøv at formattere koden igen med **Ctrl + Alt + L** (Windows) eller **Cmd + Option + L** (Mac) - hvad sker der?
12. Ok, så IntelliJ kan kun formattere koden, hvis den kan forstå den - og det kan den ikke når vi har "ødelagt" den ved at fjerne alle mellemrum
13. Tilføj mellemrum indtil du igen kan formattere koden igen, så den ligner dette:
    ```java
    public class HelloAgainWorld {
        public static void main(String[] args) {
            System.out.println("Hello Again, World!");
            System.out.println("I am learning Java!");
        }
    }
    ```
---

# Øvelse - Fuld af fejl

1. Fortsæt med at arbejde i dit `helloagainworld` projekt
2. Prøv at fjerne `;` fra slutningen af linjen `System.out.println("Hello, World!");`
3. Kør programmet - hvilken fejl får du fra compileren i IntelliJ?
4. Hvad betyder fejlen?
5. Ret fejlen (tilføj `;` igen) og tjek at programmet kører igen

--

På samme måde som før, prøv at 

- lave følgende ændringer i din kode, 
- compiler/kør - hvilken fejl får du?
- diskuter evt. med din makker hvad fejlen betyder
- ret fejlen og compiler/kør programmet igen

for hver af de følgende ændringer:

1. Fjern en af `{`'erne i din kode
2. Fjern en af `}`'erne i din kode
3. Skriv `mian` i stedet for `main`
4. Fjern ordet `static`
5. Fjern ordet `public` før `static`
6. Fjern ordet `System.`
7. Udskift `prinln` med `Println`
8. Udskift `println` med `print`