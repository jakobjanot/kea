# Faktura - total

1. Fortsæt med IntelliJ-projekt `invoice`
2. Du bør nu have en klasse `Product`, en klasse `InvoiceLine` og test-klasserne `ProductTest` og `InvoiceLineTest`, hvor `InvoiceLine` ligner
   ```java
   public class InvoiceLine {
       private Product product;
       private int quantity;
   
       public InvoiceLine(Product product, int quantity) {
           this.product = product;
           this.quantity = quantity;
       }
   
       public Product getProduct() {
           return product;
       }
   
       public int getQuantity() {
           return quantity;
       }
   
       public double getLineTotal() {
           return product.getPrice() * quantity;
       }
   
       @Override
       public String toString() {
           return quantity + " x " + 
                  product.toString();
       }
   }
   ```
3. En faktura består af en række linjer (`InvoiceLine`). Lav en klasse `Invoice` med et felt:
   - ArrayList<InvoiceLine> lines
4. Lav en constructor og en metode `addLine(InvoiceLine line)` der tilføjer en linje til fakturaen.
5. Lav en metode `getTotal()` der returnere den samlede pris for alle linjer i fakturaen.
6. Lav en `toString()` metode der returnere en tekst som fx:
    ```java
    2 x Bread: 25,00 kr
    1 x Milk: 10,00 kr
    -------------------
    Total: 35,00 kr
    ```
7. Lav en test-klasse `InvoiceTest` og skriv tests for constructoren og `addLine(InvoiceLine line)` i `Invoice`.
8. Er testene OK, så skriv en test for `getTotal()`, fx:
   ```java
   @Test
   void getTotal() {
       Product bread = new Product("Bread", 12.50);
       Product milk = new Product("Milk", 10.00);
       InvoiceLine line1 = new InvoiceLine(bread, 2);
       InvoiceLine line2 = new InvoiceLine(milk, 1);
       Invoice invoice = new Invoice();
       invoice.addLine(line1);
       invoice.addLine(line2);
       assertEquals(35.00, invoice.getTotal());
   }
   ```
    Ret evt. fejl i `Invoice` indtil alle tests består.
9. Skriv også en test for `toString()`, fx i stil med:
   ```java
   @Test
   void testToString() {
       // du laver de samme produkter 
       // og linjer som i getTotal() testen
       String expected = """
           2 x Bread: 25,00 kr
           1 x Milk: 10,00 kr
           -------------------
           Total: 35,00 kr
       """;
       assertEquals(expected, invoice.toString());
   }
   ```
10. Ret evt. fejl i `Invoice` indtil alle tests består.