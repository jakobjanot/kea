# Invitationer

Refaktorering er når vi ændrer på vores kode for at gøre den bedre, uden at ændre på dens funktionalitet. En god måde at refaktorere på er at extract'e en del af koden til en metode, så den kan genbruges og så den får et sigende navn. Lav et nyt Java-projekt i IntelliJ, som du navngiver `invitations` og tilføj koden herunder. Refaktorer den, så den bliver mere læselig.

```java
public class Invitations {
    public static void main(String[] args) {
        System.out.println("Hej Ahmed, du er "+
                           "inviteret til house "+
                           "warming på fredag kl. 19.");
        System.out.println("Hej Bent, du er " +
                           "inviteret til fødsels"+
                           "dagsfest på lørdag kl. 15.");
        System.out.println("Hej Charlotte, du er " +
                           "inviteret til fødsels" +
                           "dagsfest på lørdag kl. 15.");
        System.out.println("Hej David, du er " +
                           "inviteret til house" +
                           "warming på fredag kl. 19.");
    }
}
```