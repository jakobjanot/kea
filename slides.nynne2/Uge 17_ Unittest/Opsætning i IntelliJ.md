<!-- Slide number: 1 -->

![Lydstyrke skydekontroller](Picture4.jpg)
# Opsætning af JUnit 5
Og din første unittest (eller to)

<!-- Slide number: 2 -->

# Opret mappen ”test” (all-lowercase)på samme niveau som src

![](Billede4.jpg)

<!-- Slide number: 3 -->

![](Billede4.jpg)
# Markér mappensom Test Sources Root.Så bliver den grøn.

![](Billede6.jpg)

<!-- Slide number: 4 -->
# Opret klassen Cup som normalt under src
public class Cup {  private String liquidType;  private int percentageFilled;  public Cup(String liquidType, int percentageFilled) {    this.liquidType = liquidType;    this.percentageFilled = percentageFilled;  }  public String getLiquidType() {    return liquidType;  }  public void setLiquidType(String liquidType) {    this.liquidType = liquidType;  }  public int getPercentageFilled() {    return percentageFilled;  }  public void setPercentageFilled(int percentageFilled) {    this.percentageFilled = percentageFilled;  }}

### Notes:
public class Cup {  private String liquidType;  private int percentageFilled;  public Cup(String liquidType, int percentageFilled) {    this.liquidType = liquidType;    this.percentageFilled = percentageFilled;  }  public String getLiquidType() {    return liquidType;  }  public void setLiquidType(String liquidType) {    this.liquidType = liquidType;  }  public int getPercentageFilled() {    return percentageFilled;  }  public void setPercentageFilled(int percentageFilled) {    this.percentageFilled = percentageFilled;  }}

<!-- Slide number: 5 -->

# Stil markøren på klasseerklæringenContext action -> Create Test(eller Crtl+Shift+T)

![](Billede4.jpg)

<!-- Slide number: 6 -->

![](Billede20.jpg)
# Opret Test

![](Pladsholdertilindhold4.jpg)

2. Klik OK
Klik Fix
(Åbner nyt vindue)
3. Vælg getLiquid()
4. Klik OK

<!-- Slide number: 7 -->
# Tilføj JUnit-library(kun nødvendigt første gang)
1. Placér markøren på Assertions -> Alt-Enter
2. Vælg”Add library ‘Junitx.x.x’ to classpath”

![](Pladsholdertilindhold4.jpg)

<!-- Slide number: 8 -->
# Opsætning af import-statement(kun nødvendigt første gang)
1.
Slet qualifieren, så der bare står @Test
2.
Vælg org.junit.jupiter.api
3.
IntelliJ indsætter ny
Import-statement

![](Pladsholdertilindhold4.jpg)

![](Billede6.jpg)

![](Billede8.jpg)

<!-- Slide number: 9 -->

![Atom](Graphic6.jpg)
# Let's start testing!

<!-- Slide number: 10 -->
# Skriv og kør en test
1.
Skriv testmetode
(linje 8 og 9)
2.
Kør testen

![](Billede4.jpg)

![](Billede20.jpg)
3.
Tjek succes!

<!-- Slide number: 11 -->

![](Billede4.jpg)

![](Billede19.jpg)
# Denne test fejler – selvfølgelig!

<!-- Slide number: 12 -->
# https://www.baeldung.com/junit-assertions
Rul ned til Junit 5:

![](Billede4.jpg)