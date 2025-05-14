<!-- Slide number: 1 -->
Error Handling

![](GoogleShape55p13.jpg)

### Notes:

<!-- Slide number: 2 -->
# Typer af fejl
Logikfejl (som man kunne kalde ”tænkefejl”)
Koden kompilerer og kører, men gør noget andet end hvad vi ville.
int sum = 5 – 3; // Vi vil ”plusse”, men vi ”minusser” ved en fejl.

Compiletime-fejl/syntaksfejl (som man kunne kalde ”sprogfejl”)
Kildekode, som ikke kan kompileres til bytecode.
int number = 4.5; // En int kan ikke være et kommatal.

Runtime-fejl (fejl under eksekvering af koden – måske ”kørefejl”)
Koden kører og kompilerer, men der opstår afviklingsfejl (error el. exception).
PrintStream ps = new PrintStream(new File(”doesn’t_exist.txt”));

### Notes:

<!-- Slide number: 3 -->
# Errors samt checked/unchecked exceptions

ERROR:		Kan ikke “recoveres” og kan derfor ikke “håndteres”
			Fx OutOfMemoryError eller StackOverflowError

EXCEPTION:		Håndteres compile-time eller run-time

	Checked:	Compiletime-håndtering – skal håndteres *)
			Fx ClassNotFoundException eller IOException
	Unchecked:	Runtime-håndtering – kan håndteres *)
			Fx NullPointerException eller ArithmeticException

*) Håndtering sker med try/catch eller throws

### Notes:

<!-- Slide number: 4 -->
# Checked Exceptions

Java ‘checker’ altid efter dem og nægter at udføre dit program hvis en checked exception finder sted

![](GoogleShape75p16.jpg)

![](GoogleShape76p16.jpg)
Kilde: https://www.atatus.com/blog/content/images/size/w1000/2022/12/exception-types-1.png

### Notes:

<!-- Slide number: 5 -->

![](GoogleShape84p17.jpg)
# Exception Hierarki

Kilde: https://www.atatus.com/blog/content/images/size/w1000/2022/12/exception-types-1.png

### Notes:

<!-- Slide number: 6 -->
# Typer af Exceptions

![](GoogleShape95p18.jpg)
Kilde: https://www.atatus.com/blog/content/images/size/w1000/2022/12/exception-types-1.png

### Notes:

<!-- Slide number: 7 -->
# throw eller  try/catch

![](GoogleShape101p19.jpg)

### Notes:

<!-- Slide number: 8 -->

![](GoogleShape109p20.jpg)
# throw eller  try/catch
Try-catch:
når der opstår en fejl, så gør det her i stedet

Throw:
når der opstår en fejl, så stands hele programmet!

![](GoogleShape108p20.jpg)

### Notes:

<!-- Slide number: 9 -->
# Sådan skriver du dine egne Exceptions

Skal nedarve fra Exception (faktisk Throwable)
Konstruktøren kan modtage en String og kalde super(String)
Override public String toString() med en fornuftig meddelelse til klienten.

### Notes:

<!-- Slide number: 10 -->
# Eksempel: Exceptions ved fillæsning

![](GoogleShape121p22.jpg)
Java kræver at du bruger try-catch når du arbejder med filer.

Selvom din kode er korrekt, kan Java stadig kaste en automatisk fejlbesked, der skal håndteres.

FileWriter klassen fx, kaster altid en ‘IOException’.

### Notes:

<!-- Slide number: 11 -->
# Pokemon Exception

try {
    // kode der muligvis fejler
} catch (Exception e) {
    // Kode der skal eksekvere i tilfælde af fejl
}

### Notes:

<!-- Slide number: 12 -->
# Hvornår bliver exceptions thrown?
Når problematisk, uventet, upassende adfærd finder sted.
Når udvikleren bestemmer at en exception skal finde sted. Dvs at vi som udviklere selv sætter kriteriet for det.

### Notes:

<!-- Slide number: 13 -->
# Exception or not exception? That’s the question!

![](GoogleShape141p25.jpg)
Brugeren indtaster ”hej”, hvor programmet forventer et heltal.
Filen indeholder 3.2, hvor programmet forventer et heltal.
Programmet dividerer et heltal med 0.
En metode prøver at bruge charAt(0) på en String, som er null.
Brugeren skal indtaste én karakter, men taster blot Enter (nul karakterer).
Programmet prøver at skrive til en fil, men filen er skrivebeskyttet.
Programmet kalder cats.get(i).getName(), men name er null.
Brugeren skal indtaste et heltal, men indtaster 99999999999999999999.
Programmet tilføjer karakter nr. 8 i en liste, som må indeholde højst 7 karakterer.
setYearOfBirth() modtager værdien 2120, hvilket er uden for klassens invarians.
Programmet prøver at skrive til en fil, men filen overskrider maksimal størrelse.
Konstruktøren modtager en null-værdi, men attributten må ikke være null.

### Notes:

<!-- Slide number: 14 -->
# Throwing exceptions
public class Program {
    public static void main(String[] args) throws Exception{
        throw new NumberFormatException();
}
}

### Notes:

<!-- Slide number: 15 -->
# Generic throw mechanism

![Image](GoogleShape153p27.jpg)

![Image](GoogleShape154p27.jpg)

### Notes:

<!-- Slide number: 16 -->
# Hvorfor lave vores egne exceptions?
For at få besked når uønsket, upassende adfærd har fundet sted, som ellers ikke kan fanges automatisk.

![Image](GoogleShape163p28.jpg)

### Notes:

<!-- Slide number: 17 -->
# Try Catch — pas på scope
Kan ikke compile

![Image](GoogleShape170p29.jpg)

![Image](GoogleShape168p29.jpg)

### Notes: