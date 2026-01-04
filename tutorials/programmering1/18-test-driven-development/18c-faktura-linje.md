# Faktura - en linje i fakturaen

1. Fortsæt med IntelliJ-projekt `invoice`
2. Du bør nu have en klasse `Product` og en test-klasse `ProductTest`, hvor `Product` ligner
   ```java
   public class Product {
       private String name;
       private double price;
   
       public Product(String name, double price) {
           this.name = name;
           this.price = price;
       }
   
       public String getName() {
           return name;
       }
   
       public double getPrice() {
           return price;
       }
   
       @Override
       public String toString() {
           return name + ": " + 
                  String.format("%.2f", price) + " kr";
       }
   }
   ```
3. En faktura består af en række linjer, hvor hver linje indeholder et produkt og en mængde (antal), samt den samlede pris for den linje (antal * pris). Lav en klasse `InvoiceLine` med felterne:
   - Product product
   - int quantity
   Lav en constructor, getters `getProduct()`, `getQuantity()`. 
4. Lav også en `toString()` metode der returnere en tekst som fx `2 x Bread: 25,00 kr`
5. Lav nu metoden `getLineTotal()` der returnere den samlede pris for linjen (antal * pris)
6. Lav en test-klasse `InvoiceLineTest` og skriv tests for constructoren og getters i `InvoiceLine`.
7. Er testene OK, så skriv en test for `getLineTotal()`, fx:
   ```java
   @Test
   void getLineTotal() {
       Product product = new Product("Bread", 12.50);
       InvoiceLine line = new InvoiceLine(product, 2);
       assertEquals(25.00, line.getLineTotal());
   }
   ```
8. Ret evt. fejl i `InvoiceLine` indtil alle tests består.