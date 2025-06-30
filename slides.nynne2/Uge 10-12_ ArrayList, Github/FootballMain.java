import java.util.Scanner;

public class FootballMain {
    private FootballManager manager;
    private Scanner scanner;

    public FootballMain() {
        this.manager = new FootballManager();
        this.scanner = new Scanner(System.in);
    }

    public void visMenu() {
        System.out.println("\n⚽Menu:");
        System.out.println("1⃣ Tilføj en spiller");
        System.out.println("2⃣ Søg efter en spiller");
        System.out.println("3⃣ Sortér spillerlisten alfabetisk");
        System.out.println("4⃣ Afslut programmet");
        System.out.print("Indtast dit valg: ");
    }

    public void brugerValg() {
        boolean kører = true;

        while (kører) {
            manager.visSpillere();
            visMenu();
            int valg;
            try {
                valg = Integer.parseInt(scanner.nextLine());
            } catch (NumberFormatException e) {
                System.out.println("Ugyldigt input. Venligst indtast et tal mellem 1-6.");
                continue;
            }

            switch (valg) {
                case 1:
                    System.out.print("Indtast navnet på spilleren, du vil tilføje: ");
                    String nySpiller = scanner.nextLine();
                    manager.tilføjSpiller(nySpiller);
                    break;
                case 2:
                    System.out.print("Indtast navnet på spilleren, du vil søge efter: ");
                    String søgeNavn = scanner.nextLine();
                    manager.søgSpiller(søgeNavn);
                    break;
                case 3:
                    manager.sorterSpillere();
                    break;
                case 4:
                    kører = false;
                    System.out.println("⚽Programmet afsluttes. Tak for at bruge FootballManager!⚽");
                    break;
                default:
                    System.out.println("Noget gik galt, prøv igen.");
            }
        }
        scanner.close();
    }

    public static void main(String[] args) {
        FootballMain app = new FootballMain();
        app.brugerValg();
    }
}
