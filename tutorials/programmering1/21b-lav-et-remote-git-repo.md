# Lav et remote Git-repo
1. Gå til [https://github.com/](https://github.com/)
2. Klik på "Sign up" knappen
3. Udfyld felterne. OBS! Det brugernavn du vælger her, vil blive brugt i URL'en til dine repositories på GitHub, så vælg med omhu.
4. Bekræft din e-mailadresse ved at klikke på linket i den e-mail, du modtager fra GitHub
5. Log ind på din nye GitHub-konto

## Opret et nyt repository på GitHub
1. Klik på "+" ikonet i øverste højre hjørne (tæt på dit profilbillede) og vælg "New repository"
2. Skriv et navn til dit repository (Du kan vælge navnet på et tidligere projekt du har lavet i IntelliJ, fx "bmi-calculator")
3. Vælg at projektet skal være "public".
   - public, dvs. alle i verden kan se det eller 
   - private, kun du og de du inviterer kan se det
4. (valgfrit) Tilføj en beskrivelse af dit repository i feltet "Description"
5. (valgfrit) Sæt et flueben i "Add a README file", så der automatisk bliver lavet en README fil til dit projekt
6. Klik på "Create repository" knappen

## Push dit lokale git-repo til GitHub
Vi skal nu forbinde dit lokale git-repo med det remote git-repo du lige har lavet på GitHub. Når du har gjort det, med andre ord sat "remote origin", kan du "push"e dine lokale commits til GitHub.
1. Åbn IntelliJ-projektet "bmi-calculator" du lavede lige før
2. I IntelliJs top-bjælke til højre for "bmi-calculator"-knappen (projekt-knappen) hvor der står "main", vælg "Push".
3. I vinduet der kommer frem, klik på "Define remote" linket nederst
4. Et nyt vindue kommer frem. I feltet "URL", indsæt URL'en til dit GitHub repository. Den kan du finde på GitHub-siden for dit repository, klik på den grønne "Code" knap og kopier URL'en der står under "HTTPS".
5. Klik "OK" (Hint: Du skal muligvis indtaste dit GitHub brugernavn og password for at forbinde IntelliJ med GitHub)
6. Tilbage i "Push" vinduet, klik på "Push" knappen nederst til højre
7. Åbn Github i din browser og gå til dit repository
8. Er der nye ændringer i dit repository? Du skulle bl.a. gerne kunne se