**Top of Form**

**Hello World i terminal/powershell**

Denne opgave er en øvelse i at bruge en helt simpel teksteditor og terminalen til at skrive og køre java\-programmer.

**Teksteditoren**

Åbn den simpleste teksteditor I har på jeres maskine. For Windows\-brugere vil det være Notepad, og for Mac\-brugere er det TextEdit.

Det er vigtigt at få slået alt ”klogt” fra i editoren, dvs stavekontrol og diverse formatteringer.

I TextEdit skal man gå ind under menupunktet ”Format” og konvertere til almindelig tekst (hvis der står ”konverter til RTF” så gør man ingenting! Så er indstillingen allerede rigtig). Inde under menupunktet ”Rediger” skal I slå ALT stavekontrol fra. NB! Når vi skriver javakode i TextEdit kan vi ikke bruge almindelige gåseøjne (så kommer der fejl) – dem der virker sidder over 2\-tallet.

I Notepad er stavekontrol højst sandsynligt slået fra allerede.

Før I går i gang med selve kodningen, så lav en ny mappe inde i Dokumenter. Kald mappen for MyFirstJavaProgram(uden mellemrum mellem ordene). Mappen skal være gemt lokalt på computeren, ikke i fx OneDrive.

**Selve java\-programmet (kildekoden)**

Der er tradition for at det første program man laver udskriver teksten Hello World!.

Inde i jeres tomme dokument skal I skrive følgende tekst:

public class HelloWorld {

  public static void main (String\[] args) {
     System.out.println("Hello World!");
  }

}

Derefter skal I gemme filen i den mappe I lige har lavet. Det er MEGET vigtigt at filen hedder nøjagtigt det samme som det der står lige efter ordet ”class” i den kode I har skrevet, og at den har endelsen .java. I dette tilfælde skal filen hedde HelloWorld.java. Det er vigtigt at det står med stort H og W, og at det er i ét ord! Endelsen .java er filtypen. Hvis I ved en fejl får gemt filen med endelsen .txt skal I ændre det så den kommer til at hedde .java i stedet.

**Naviger i fil\-systemet via powershell/terminalen**

I er vant til at man kan navigere i sit fil\-system ved at åbne mapper, som måske både har filer og mapper indeni, og at man så kan åbne mapperne, som så igen kan have filer og mapper indeni sig. Det samme kan man gøre via kommandoer i terminalen.

Der kan være en lille smule forskel på de kommandoer man skal skrive på Mac og Windows.

Åbn terminalen. Det er vigtigt at du er på din brugers ‘hjemmesti’ for at kunne følge de kommende instrukser. På Mac angives dette med en \~ (tilde notation), så hvis du ser dette i terminalen er du allerede hvor du skal være for nu. På Windows vil din brugersti i powershell indholde dit brugernavn ex. *Users\\edith*. Hvis I ikke ser jeres brugerhjemmesti, så skriv cd \~ og Enter. Dette kan gøres både i terminalen på Mac og Windows powershell. Så, nu burde du være klar til at gå videre.

Hvis du er Mac\-bruger skriver du ls (står for list) og trykker Enter, og hvis du er Windows\-bruger skriver du enten ls eller dir og trykker Enter.

Nu kan I se jeres mappestruktur, som er den samme som I fx kan se i Stifinderen.

Én af de mapper I kan se er mappen Dokumenter. Den skal I navigere hen til ved at skrive cd Dokumenter og trykke Enter (dvs. de to bogstaver cd, et mellemrum, og så Dokumenter. Cd står for Change Directory, dvs. skift mappe.

Hvis I så igen skriver ls eller dir kan I se indholdet af *denne* mappe. Her skulle I gerne kunne se mappen MyFirstJavaProgram. Naviger hen til den på samme måde som ovenfor.

NB! Man kan også hoppe et ”skridt op” i sin mappestruktur, ved at skrive cd .. (dvs. bogstaverne cd, så et mellemrum, og så to punktummer lige efter hinanden).

**Compile og kør programmet**

Når I skriver ls eller dir når I står inde i mappen MyFirstJavaProgram skulle I gerne kunne se at den indeholder filen HelloWorld.java som I gemte tidligere. Nu skal I skrive javac HelloWorld.java og trykke Enter. javac er kommandoen til at starte java compileren. Husk mellemrum mellem javac og HelloWorld.java.

Når I har trykket Enter sker der enten INGENTING, eller der kommer en fejlbesked. Vi vil helst have at der ingenting står, for så betyder det at der ikke er nogen fejl, og programmet er compilet.

Hvis I prøver at skrive ls eller dir igen kan I se at der alligevel er sket noget: compileren har lavet en ny fil, som også hedder HelloWorld, men med endelsen .class i stedet for .java. Det er denne fil programmet bruger når det skal køre – hvis man kun har .java filen fungerer det ikke.

Nu kan I køre programmet ved at skrive kommandoen java HelloWorld og trykke Enter. Altså: java i denne omgang, **ikke** javac som tidligere,  et mellemrum, og HelloWorld **uden** endelsen .java.

Nu skulle programmet gerne udskrive Hello world!

Og så har I skrevet og kørt jeres første javaprogram ☺