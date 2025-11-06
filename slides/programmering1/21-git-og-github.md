---
title: 21 - Versionsstyring med git og GitHub
---

<!-- .slide: class="cover-8" -->

#### Versionsstyring med git og GitHub


--

# Versionsstyring

--

Spørgsmål: I projektet, hvordan holdte I styr på ændringer i jeres filer?

--

### Demo: Software projekt uden versionsstyring

--

Notes:
Brugte i filnavne til at holde styr på versioner?

```txt
Main.java
Main.java.old
Main.java.old2
```

Sendte i filer frem og tilbage via e-mail


Udkommenteringer i koden

```java
public double calculateBmi() {
    return weight / Math.pow(height, 2);
}

// Den gamle version, hvor height var i cm
// public double calculateBmi() {
//     return (weight * 10000) / (height * height);
//}
```

--

Problemet med gammel kode:
- Hvad er den nyeste version?
- Hvem lavede ændringen?
- Hvorfor blev ændringen lavet?

--

Den værste er **tvivlen**:
- Mister vi noget viden, hvis vi sletter gammel kode i kommentaren/.old-filer?

--

# Hvad er versionsstyring?

--

- En historik over ændringer i filer i et projekt
- Hvem lavede ændringen
- Hvornår blev ændringen lavet
- Hvorfor blev ændringen lavet (ofte via en kommentar)
- Mulighed for at gendanne tidligere versioner af filer
- Mulighed for at arbejde sammen med andre på samme projekt uden at overskrive hinandens ændringer

--

### Demo: Software projekt med git

- Lav et nyt git repository på GitHub
- Clone det ned lokalt
- Lav et IntelliJ projekt i mappen
- Tilføj en fil, commit og push
- Lav en ændring, commit og push
- Vis historik med git log

---
<!-- .slide: class="cover-15" -->
# Git koncepter

--

### Repository (repo)

- En mappe der indeholder alle filer i projektet
- Alle filændringer er gemt / sporet
- Lokalt på din computer eller på en server (f.eks. GitHub)

--

#### Clone
- Lav en kopi af et git repository fra en server (f.eks. GitHub) til din lokale computer

--

#### Origin
- Det repository som du klonede fra ofte git repository GitHub URL: 
- Generelt: `https://github.com/BRUGERNAVN/REPO_NAVN.git`
- Eksempel: `https://github.com/jakobjanot/bmi-calculator.git`

--

### Demo: Opret et nyt git repository lokalt
- se .git mappen

--

#### Demo: Nyt git repository på GitHub

- Gå til GitHub
- Opret nyt repository
- Clone det ned lokalt
- Se .git mappen

--

#### Commit
En **snapshot** af alle filer i projektet på et bestemt tidspunkt, indeholder:
- Hvilke filer der er ændret
- Hvem der lavede ændringen
- Hvornår ændringen blev lavet
- En kommentar der beskriver ændringen

(lidt ligesom når du gemmer i et spil)

--

Måske vil du ikke committe alle ændringer i dine filer - hvad så?

--

#### Staging area
- Et **midlertidigt område** hvor ændringer til filer bliver samlet inden de bliver committed

--

### Demo: Lav et commit

- Lav en ændring i flere filer
- Brug git add til at tilføje ændringen i en fil til staging area
- Brug git commit til at lave et commit med en kommentar
- Vis historik med git log
- Vis forskel med git diff
- Vis status med git status
- Tilføj ændringen i den anden fil og commit igen

--

### Push
- Sender dine commits fra din lokale computer til en server (f.eks. GitHub)

--

### Demo: Push et commit til GitHub

- Lav en ændring i en fil
- Commit ændringen
- Push til GitHub
- Vis på GitHub at ændringen er der

--

### Pull
- Henter de nyeste commits fra en server (f.eks. GitHub) til din lokale computer

--

### Demo: Pull ændringer fra GitHub

- Lav en ændring direkte på GitHub (rediger en fil)
- Pull ændringen ned til din lokale computer

--

### Commit ID

- En unik identifikator for hvert commit
- git bruger "f5c3d2e1a4b6c7d8e9f0a1b2c3d4e5f6g7h8i9j0", "au3s..." i stedet for "Commit 1", "Commit 2", etc.

--

### HEAD

- En pegepin (et alias) til det **seneste commit** i dit nuværende branch

--

### Demo: Commits og HEAD

- Lav et par commits
- Se git log i IntelliJ
- Flyt HEAD til et tidligere commit med git checkout
- Vis at HEAD er flyttet (gul mærke)
- Flyt HEAD tilbage til seneste commit med git checkout main

--

### Merge conflict
- Når to personer ændrer den samme linje i en fil
- Hvilken ændring skal beholdes?

--

### Demo: Merge conflict
- To git repositories (to mapper)
- Begge laver ændring i samme linje i en fil
- Push den ene til GitHub
- Pull den anden ned og vis merge conflict

---
<!-- .slide: class="cover-15" -->
# GitHub

--

- Et git repo er "bare" en mappe `.git` i dit projekt
- GitHub er en online tjeneste til at hoste git repositories
- Gør det nemt at dele kode med andre

--

### Fork
- Lav en kopi af et repository på GitHub til din egen konto

--

### Demo: Fork et repository på GitHub

- eks: https://github.com/OpenTTD/OpenTTD
- fix sprogfilen i src/lang/danish.txt