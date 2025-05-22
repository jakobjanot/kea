Skubbe mit kode projekt til Github

I denne opgave skal vi lære at tage et eksisterende Java\-projekt og gøre det til et Git repository, committe ændringer og skubbe det til GitHub.

# Trin 1: Opsætning af Git i IntelliJ

* **Åbn IntelliJ IDEA** og **åbn dit eksisterende Java\-projekt** (et projekt som du har lavet færdig og synes blev godt).
* Initialiser Git i projektet:
	+ Gå til **VCS (Version Control System) → Enable Version Control Integration.**
	+ Vælg **Git** som system og tryk **"OK".**
	+ IntelliJ initialiserer nu et **lokalt Git repository** i projektmappen.

# Trin 2: Første Commit i Git

Gå til Version Control\-panelet (nederst i IntelliJ).

* Hvis du ikke ser det, gå til View → Tool Windows → Version Control.
* Du bør nu se, at alle projektets filer er "untracked" (gul markering).

Tilføj alle filer til Git:

* Gå til VCS → Git → Add
* Alternativt: Højreklik på projektmappen → **Git → Add.**

Commit ændringerne:

* Klik på **"Commit"** i Version Control\-panelet.
* Skriv en commit\-besked som "Initial commit" og tryk Commit.
* Klik **Commit** (eller **Commit and Push**, hvis du vil uploade direkte til GitHub).

# Trin 3: Opret et repository på GitHub

Gå til [github.com](https://github.com) og log ind.

* Klik på "\+" i øverste højre hjørne → New repository.
* Giv repository'et et navn, f.eks. "MitJavaProjekt". (eller noget der giver mening som titel til netop dit projekt).

Vælg om repository'et skal være Public eller Private.

* Klik Create Repository.

Kopiér repository\-URL’en, som ser sådan ud:

https://github.com/DitBrugernavn/MitJavaProjekt.git

# Trin 4: Tilknyt dit lokale Git\-repo til GitHub

 Gå tilbage til IntelliJ.

 Gå til VCS → Git → Remotes.

 Klik på "\+" (tilføj ny remote).

 Indsæt repository\-URL’en fra GitHub i feltet "URL".

 Klik OK.

# Trin 5: Push projektet til GitHub

 Vælg origin/main som destination.

 Klik Push.

 IntelliJ vil muligvis bede om dit GitHub\-login. Brug dit GitHub brugernavn og adgangskode eller en Personal Access Token (hvis adgangskoder ikke virker).

 Tjek på GitHub, at din kode nu er online! 🎉

# Trin 7: Arbejd med branches og pull requests (valgfrit)

For at øve samarbejde, kan man prøve følgende:

Opret en ny branch:

* Gå til VCS → Git → Branches → New Branch.
* Navngiv den f.eks. feature\-ændring og skift til den.

 Lav en ændring i koden og commit den:

 Commit ændringen via VCS → Commit.

 Push den nye branch via VCS → Git → Push.

Opret en Pull Request på GitHub:

* Gå til dit repository på GitHub → Pull Requests → New Pull Request.
* Sammenlign feature\-ændring med main og klik Create Pull Request.

**Merge ændringerne på GitHub.**