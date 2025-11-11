# Delimiteret filformat

Vi kunne godt tænke os at gemme listen af kunder i en file, så vi kan åbne den i Excel. En måde at gøre det på er at bruge et komma-separeret filformat (CSV - Comma Separated Values), hvor hver linje i filen repræsenterer en kunde, og hver felt-værdi er adskilt af et komma  - ligesom kolonnerne i et regneark. Komma er et almindeligt valg som delimiter (seperator), andre muligheder kunne være semikolon og tabulator.
Eksempel på en CSV-fil med kunder:
```csv
Navn,Telefon,Email
Thorkild Hansen,39485732,thorkild@hotmail.com
Kirsten Jensen,29384756,kirsten.jensen@gmail.com
```
1. Opret et nyt Intellij-projekt `kunde-database` med tilhørende git repo (sæt flueben i **Create git repository**). Du må gerne løbende committe og pushe dit arbejde til GitHub.
2. Opret en klasse `Customer` med felterne `name`, `phone` og `email`. Implementer getter- og setter-metoder for disse felter.
3. Opret også en liste `List<Customer> customers` i din `Main`-klasse, og tilføj nogle `Customer`-objekter til listen manuelt, fx `customers.add(new Customer("Thorkild Hansen", "39485732", "thorkild@hotmail.com"))`.
4. Lav en metode `public static void writeCustomersToCSV(List<Customer> customers, String filePath)`, der skriver kundelisten til en CSV-fil givet ved `filePath`. Metoden skal:
   - Åbne (eller oprette) filen givet ved `filePath` til skrivning.
   - Skriv en header-linje med kolonnenavnene: `Navn,Telefon,Email`.
   - For hver kunde i listen, skriv en linje med kundens data, adskilt af kommaer.
   - Luk filen efter skrivning.
5. Test din metode i `main` ved at kalde `writeCustomersToCSV(customers, "customers.csv")` og tjekke at filen `customers.csv` er oprettet korrekt i din projektmappe.
6. (Valgfrit) Ret metoden således at den bruger en anden delimiter, fx semikolon eller tabulator, i stedet for komma.
7. (Valgfrit) Lav en metode `public static List<Customer> readCustomersFromCSV(String filePath)`, der læser kundedata fra en CSV-fil og returnerer en liste af `Customer`-objekter. Test metoden ved at læse den fil, du lige har skrevet, og printe kundelisten ud.