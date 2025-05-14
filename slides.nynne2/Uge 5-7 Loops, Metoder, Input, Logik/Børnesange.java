public class Børnesange {
    public void fingerSang() {
        fingerVers("tommelfinger");
        fingerVers("pegefinger");
        fingerVers("langefinger");
        fingerVers("ringefinger");
        fingerVers("lillefinger");
        fingerVers("alle fingre");
    }

   private void fingerVers(String finger) {
       System.out.println(finger + ", " + finger + ",");
       System.out.println("hvor er du?");
       System.out.println("her er jeg, her er jeg,");
       System.out.println("Goddag, goddag, goddag.");
       System.out.println();
   }
}
