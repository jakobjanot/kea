---
title: 26 - Git branches og GitHub Pull Requests
---

<!-- .slide: class="cover-8" -->

#### Git branches og GitHub Pull Requests

--

### Recap: Hvad er versionsstyring?

- En historik over ændringer i filer i et projekt
- Hvem lavede ændringen
- Hvornår blev ændringen lavet
- Hvorfor blev ændringen lavet (ofte via en kommentar)
- Mulighed for at gendanne tidligere versioner af filer

--

### Hvorfor git branches?

For at kunne ...

--

- arbejde på nye features uden at ødelægge den stabile kode i main branch

--

- arbejde sammen med andre på samme projekt *uden* at overskrive hinandens ændringer

--

- lave code reviews vha. pull requests på GitHub (godkendelsesproces for ændringer)

--

Standard branch hedder "main" (tidligere "master")

--

"main" er den "gyldne" branch, hvor den stabile kode er

--

Du kan lave nye branches til nye features, bug fixes, etc.

--

Branches er som "parallele universer" af dit projekt

--

Du kan lave alle de commits du vil i en branch uden at påvirke main branch

--

Du kan lave branch af din branch...

--

### Navngivning af branches

--

Eksempler på branch navne:
- **rank-pizzas-by-sales**
- **fix-random-range-off-by-one**
- **remove-unused-ui-components**
- **fix-crash-on-startup**

--

... eller med en type prefix:

Eksempler på :
- **feature/rank-pizzas-by-sales**
- **bugfix/random-range-off-by-one**
- **refactor/remove-unused-ui-components**
- **hotfix/fix-crash-on-startup**

--


--
<!-- .slide: class="o-patrick-star" -->

### Prøv: Lav en ny git branch og push den til GitHub (origin)

- Åbn et IntelliJ projekt med git repository
- Lav en ny branch (f.eks. "feature/new-feature")
- Lav en ændring i en fil og commit det i den nye branch
- Skift tilbage til main branch og vis at ændringen ikke er der
- Skift tilbage til din branch og vis at ændringen er der
- Push din branch til GitHub (origin)
- Se om du kan se din branch på GitHub
  
---

<!-- .slide: class="cover-15" -->
#### Code Review med GitHub Pull Requests

--

#### Hvorfor code review?

--

- Ingen er perfekt - vi laver alle fejl

--

- Er det den rigtige løsning på problemet? Er der en bedre måde at gøre det på?

--

#### Code review er

--

- kvalitetssikring

--

- vidensdeling

--

- læring og feedback

--

- fælles ejerskab af koden

---

<!-- .slide: class="o-patrick-star" -->

### Prøv: Lav en Pull Request på GitHub
- Gå til "Branches" oversigten på GitHub
- **Klik** på den branch du lige har pushet i "Branches"
- **Klik** på "Compare & pull request"
- Skriv en beskrivelse af ændringen og klik på "Create pull request"
- Se at pull requesten er oprettet
- Vis at du kan se ændringerne i pull requesten
- 
- Når reviewet er godkendt, merge pull requesten til main branch
- Vis at ændringen nu er i main branch

---

# Best practices

--

- Lav små, fokuserede pull requests

--

- Skriv klare commit/pull request beskeder

--

- Review hurtigt og få merget hurtigt
