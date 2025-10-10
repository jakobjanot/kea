# Faktura - refaktorer

1. Fortsæt med IntelliJ-projekt `invoice`
2. Du bør nu have en klasse `Product`, en klasse `InvoiceLine` og en klasse `Invoice` med tilhørende test-klasser `ProductTest`, `InvoiceLineTest` og `InvoiceTest`.
3. Refaktorer koden i `Invoice` ved at ændre `addLine(InvoiceLine line)` til `addLine(Product product, int quantity)`, og opret en ny `InvoiceLine` inde i `addLine()`.
4. Ret også `InvoiceTest` så den passer til den nye `addLine()` metode.
5. Hvorfor er det rimeligt at ændre `addLine()` metoden på denne måde?