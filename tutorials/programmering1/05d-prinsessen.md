# Prinsessen skal giftes

- Prinsessen skal giftes og der skal vælges en prins
- Prinsessen har følgende betingelser for at vælge en prins, som hun stiller til rådighed for os i en metode:
  ```java
  public boolean canMarry(int age, boolean isHandsome, boolean isBrave, boolean isRich) {
      if (age < 18) {
          return false;
      }
      if (isHandsome) {
        if (isBrave || isRich) {
          return true;
        }
      }
      return false;
  }
  ```
- Der er fire kandidater
  - Prins Charming (alder: 20, flot: ja, modig: nej, rig: nej)
  - Prins Ib (alder: 22, flot: nej, modig: ja, rig: nej)
  - Prins Bieber (alder: 19, flot: ja, modig: nej, rig: ja)
  - Prins Blop (alder: 5, flot: ja, modig: ja, rig: ja)
- Hvem vælger prinsessen? Prøv at gætte først. Dernæst kod det og tjek resultatet.
- Ekstra: Tilføj gerne flere krav og/eller kandidater