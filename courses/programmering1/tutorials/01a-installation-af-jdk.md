---
title: "01a - Installation af Java Development Kit"
---

## Installation af Java Development Kit

For at udvikle og køre Java-programmer, skal vi have installeret nogle værktøjer på vores computer.

1. Gå til [https://adoptium.net/](https://adoptium.net/) og download **Java JDK 21**
2. Klik på "Other Downloads"
    ![Adoptium](<img/adoptium-other-downloads.png>)
3. Klik på fanen **JDK 21**
4. Vælg den version der passer til dit operativsystem (Windows, macOS, Linux)
5. Åbn den downloadede fil for at starte installationen

Notes:
- JDK står for Java Development Kit, altså alt det vi skal bruge som Java-udviklere
- Er du ferm med at installere software med homebrew på Mac eller Winget på Windows eller apt-get på Linux, kan du også bruge det til at installere JDK 21.
- homebrew: `brew install --cask temurin@21`
- Winget: `winget install EclipseAdoptium.TemurinJDK.21`
- apt-get: `sudo apt-get install openjdk-21-jdk`

---

## Kør installeren
Den stiller ingen vigtige spørgsmål, så bare Continue, Next, Agree osv.

![Install](img/install.png)

## Tjek installationen
Når installationen er færdig, skal vi sikre os, at Java er korrekt installeret. Det gør vi ved at åbne en **konsolapplikation** og køre en kommando.

- macOS-brugere skal åbne **Terminal** (se næste side)
- Windows-brugere skal åbne **PowerShell** (se to sider frem)

---

### macOS: find Terminal i Spotlight

- Klik på **forstørrelsesglasset** øverst til højre på skærmen
    ![Mac Spotlight button](img/mac-spotlight-button.png)
- Skriv "Terminal" i søgefeltet og tryk **Enter**
    ![Mac Sporlight search](img/mac-spotlight-search.png)
- Skriv `java -version` og tryk **Enter**.
- Tjek at du får en besked, der ligner denne:
    ![write-java-version](img/write-java-version.png)
- Tjek at der står **version 21**, hvilket betyder at du har installeret Java JDK 21.
- Hvis du får en fejl, så prøv at genstarte din computer og kør kommandoen igen.
- Stadig har problemer? Spørg dine klassekammerater eller underviseren om hjælp.

---

### Windows: find PowerShell i Start-menuen

- Klik på **Start-menuen** i nederste venstre hjørne af skærmen
- Skriv "PowerShell" i søgefeltet og tryk **Enter**
    ![Windows PowerShell search](img/windows-search-powershell.png)
- Skriv `java -version` og tryk **Enter**.
- Tjek at du får en besked, der ligner denne:
    ![write-java-version](img/write-java-version.png)
- Tjek at der står **version 21**, hvilket betyder at du har installeret Java JDK 21.
- Hvis du får en fejl, så prøv at genstarte din computer og kør kommandoen igen.
- Stadig har problemer? Spørg dine klassekammerater eller underviseren om hjælp.