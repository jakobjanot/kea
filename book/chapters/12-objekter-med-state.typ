#import "../style.typ": *

= Objekter med State og Adfærd

Indtil nu har vi set klasser brugt som værktøjskasser (static metoder) og som databærere (immutable værdiobjekter). Nu skal vi lære om objekter der både har *tilstand* (state) og *adfærd* (behavior) - objekter der kan ændre sig over tid og reagere på handlinger.

Dette er kernen i objektorienteret programmering: objekter der repræsenterer "ting" fra den virkelige verden med egenskaber der kan ændres og handlinger de kan udføre.

== Fra Statiske til Dynamiske Objekter

=== Statisk vs Dynamisk

```java
// Statisk: Altid samme resultat
int sum = Calculator.add(5, 3);  // Altid 8

// Dynamisk: Resultat afhænger af objektets tilstand
BankAccount account = new BankAccount(12345);
account.deposit(100);    // Ændrer kontoens tilstand
account.withdraw(30);    // Tilstand ændres igen
double balance = account.getBalance();  // Afhænger af tidligere operationer
```

=== Immutable vs Mutable

```java
// Immutable: Kan ikke ændres efter oprettelse
Contact contact = new Contact("Alice", "alice@example.com");
// contact.email = "new@email.com";  // Kan ikke lade sig gøre

// Mutable: Kan ændre tilstand
BankAccount account = new BankAccount(12345);
account.deposit(100);  // Ændrer balance fra 0 til 100
```

== Bank Konto - Et Klassisk Eksempel

Lad os bygge en bankkonto klasse der viser state og adfærd:

=== Grundlæggende BankAccount

```java
public class BankAccount {
    // State: Kontoens tilstand
    private final int accountNumber;  // Kan ikke ændres
    private double balance;           // Kan ændres over tid
    
    // Konstruktør
    public BankAccount(int accountNumber) {
        this.accountNumber = accountNumber;
        this.balance = 0.0;  // Start med tom konto
    }
    
    // Adfærd: Metoder der påvirker tilstanden
    public void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
            System.out.println("Indsat: " + amount + " kr. Ny saldo: " + balance + " kr.");
        } else {
            System.out.println("Beløb skal være positivt");
        }
    }
    
    public boolean withdraw(double amount) {
        if (amount <= 0) {
            System.out.println("Beløb skal være positivt");
            return false;
        }
        
        if (amount <= balance) {
            balance -= amount;
            System.out.println("Hævet: " + amount + " kr. Ny saldo: " + balance + " kr.");
            return true;
        } else {
            System.out.println("Ikke nok penge på kontoen");
            return false;
        }
    }
    
    // Adgang til tilstand (uden at ændre den)
    public double getBalance() {
        return balance;
    }
    
    public int getAccountNumber() {
        return accountNumber;
    }
    
    @Override
    public String toString() {
        return "Konto " + accountNumber + ": " + balance + " kr.";
    }
}
```

=== Brug af BankAccount

```java
public class BankDemo {
    public static void main(String[] args) {
        BankAccount account = new BankAccount(123456);
        
        System.out.println("Initial status: " + account);
        
        // Indsæt penge
        account.deposit(1000);
        account.deposit(500);
        
        // Prøv at hæve
        account.withdraw(300);
        account.withdraw(2000);  // Ikke nok penge
        
        System.out.println("Final status: " + account);
    }
}
```

#note[
Bemærk at metoderne `deposit` og `withdraw` er *ikke* static. De virker på et specifikt objekt og ændrer dets tilstand.
]

== Hvorfor Ikke Static?

=== Problemet med Static

```java
// FORKERT approach med static
public class BadBankAccount {
    private static double balance = 0.0;  // Alle konti deler samme balance!
    
    public static void deposit(double amount) {
        balance += amount;
    }
    
    public static void withdraw(double amount) {
        balance -= amount;
    }
}

// Alle "konti" deler samme balance
BadBankAccount.deposit(100);  // balance = 100
BadBankAccount.withdraw(50);  // balance = 50
// Hvordan skelner vi mellem forskellige konti?
```

=== Korrekt Approach med Instance Metoder

```java
// KORREKT approach med instance metoder
BankAccount account1 = new BankAccount(111);
BankAccount account2 = new BankAccount(222);

account1.deposit(100);  // Kun account1 påvirkes
account2.deposit(200);  // Kun account2 påvirkes

System.out.println(account1.getBalance());  // 100
System.out.println(account2.getBalance());  // 200
```

== Avanceret BankAccount

Lad os udvide vores bankkonto med mere funktionalitet:

```java
public class AdvancedBankAccount {
    private final int accountNumber;
    private final String accountHolder;
    private double balance;
    private int transactionCount;
    
    // Konstruktør
    public AdvancedBankAccount(int accountNumber, String accountHolder) {
        this.accountNumber = accountNumber;
        this.accountHolder = accountHolder;
        this.balance = 0.0;
        this.transactionCount = 0;
    }
    
    // Overloaded konstruktør med start balance
    public AdvancedBankAccount(int accountNumber, String accountHolder, double initialBalance) {
        this(accountNumber, accountHolder);  // Kald anden konstruktør
        if (initialBalance > 0) {
            this.balance = initialBalance;
        }
    }
    
    public void deposit(double amount) {
        if (amount <= 0) {
            throw new IllegalArgumentException("Beløb skal være positivt");
        }
        
        balance += amount;
        transactionCount++;
        System.out.printf("Indsat: %.2f kr. Ny saldo: %.2f kr.%n", amount, balance);
    }
    
    public boolean withdraw(double amount) {
        if (amount <= 0) {
            throw new IllegalArgumentException("Beløb skal være positivt");
        }
        
        if (amount > balance) {
            System.out.println("Ikke tilstrækkelig saldo");
            return false;
        }
        
        balance -= amount;
        transactionCount++;
        System.out.printf("Hævet: %.2f kr. Ny saldo: %.2f kr.%n", amount, balance);
        return true;
    }
    
    public boolean transfer(AdvancedBankAccount toAccount, double amount) {
        if (this.withdraw(amount)) {
            toAccount.deposit(amount);
            System.out.printf("Overført %.2f kr. til konto %d%n", 
                             amount, toAccount.getAccountNumber());
            return true;
        }
        return false;
    }
    
    public void addInterest(double interestRate) {
        if (interestRate > 0 && balance > 0) {
            double interest = balance * interestRate / 100;
            balance += interest;
            transactionCount++;
            System.out.printf("Renter tilføjet: %.2f kr. (%.2f%%)%n", interest, interestRate);
        }
    }
    
    // Getter metoder
    public double getBalance() { return balance; }
    public int getAccountNumber() { return accountNumber; }
    public String getAccountHolder() { return accountHolder; }
    public int getTransactionCount() { return transactionCount; }
    
    // Status metoder
    public boolean isEmpty() {
        return balance == 0.0;
    }
    
    public boolean hasMinimumBalance(double minimum) {
        return balance >= minimum;
    }
    
    public String getAccountStatus() {
        if (balance < 0) return "Overtrukket";
        if (balance == 0) return "Tom";
        if (balance < 1000) return "Lav saldo";
        return "Normal";
    }
    
    @Override
    public String toString() {
        return String.format("Konto %d (%s): %.2f kr. [%d transaktioner]", 
                           accountNumber, accountHolder, balance, transactionCount);
    }
}
```

== Biblioteks System

Lad os bygge et bibliotekssystem der viser objekter med state:

=== Book Klasse

```java
public class Book {
    private final String title;
    private final String author;
    private final String isbn;
    private boolean isAvailable;
    private String borrowedBy;
    private long borrowDate;  // Millisekunder siden 1970
    
    public Book(String author, String title, String isbn) {
        this.author = author;
        this.title = title;
        this.isbn = isbn;
        this.isAvailable = true;
        this.borrowedBy = null;
        this.borrowDate = 0;
    }
    
    public boolean borrow(String borrowerName) {
        if (!isAvailable) {
            System.out.println("Bog er allerede udlånt til: " + borrowedBy);
            return false;
        }
        
        isAvailable = false;
        borrowedBy = borrowerName;
        borrowDate = System.currentTimeMillis();
        
        System.out.println(title + " udlånt til " + borrowerName);
        return true;
    }
    
    public boolean returnBook() {
        if (isAvailable) {
            System.out.println("Bog er ikke udlånt");
            return false;
        }
        
        System.out.println(title + " returneret af " + borrowedBy);
        
        isAvailable = true;
        borrowedBy = null;
        borrowDate = 0;
        
        return true;
    }
    
    public long getDaysOnLoan() {
        if (isAvailable) return 0;
        
        long currentTime = System.currentTimeMillis();
        long daysDiff = (currentTime - borrowDate) / (1000 * 60 * 60 * 24);
        return daysDiff;
    }
    
    public boolean isOverdue() {
        return !isAvailable && getDaysOnLoan() > 14;  // 14 dages lånetid
    }
    
    // Getters
    public String getTitle() { return title; }
    public String getAuthor() { return author; }
    public String getIsbn() { return isbn; }
    public boolean isAvailable() { return isAvailable; }
    public String getBorrowedBy() { return borrowedBy; }
    
    @Override
    public String toString() {
        if (isAvailable) {
            return author + ": " + title + " (Tilgængelig)";
        } else {
            return author + ": " + title + " (Udlånt til " + borrowedBy + ")";
        }
    }
}
```

=== Library Klasse

```java
public class Library {
    private final String name;
    private Book[] books;
    private int bookCount;
    
    public Library(String name, int capacity) {
        this.name = name;
        this.books = new Book[capacity];
        this.bookCount = 0;
    }
    
    public boolean addBook(Book book) {
        if (bookCount >= books.length) {
            System.out.println("Biblioteket er fuldt");
            return false;
        }
        
        books[bookCount] = book;
        bookCount++;
        System.out.println("Bog tilføjet: " + book.getTitle());
        return true;
    }
    
    public Book findBookByTitle(String title) {
        for (int i = 0; i < bookCount; i++) {
            if (books[i].getTitle().equalsIgnoreCase(title)) {
                return books[i];
            }
        }
        return null;
    }
    
    public Book[] findBooksByAuthor(String author) {
        // Tæl matches først
        int matchCount = 0;
        for (int i = 0; i < bookCount; i++) {
            if (books[i].getAuthor().toLowerCase().contains(author.toLowerCase())) {
                matchCount++;
            }
        }
        
        // Opret result array
        Book[] result = new Book[matchCount];
        int resultIndex = 0;
        
        for (int i = 0; i < bookCount; i++) {
            if (books[i].getAuthor().toLowerCase().contains(author.toLowerCase())) {
                result[resultIndex++] = books[i];
            }
        }
        
        return result;
    }
    
    public void listAvailableBooks() {
        System.out.println("\nTilgængelige bøger i " + name + ":");
        boolean foundAny = false;
        
        for (int i = 0; i < bookCount; i++) {
            if (books[i].isAvailable()) {
                System.out.println("- " + books[i]);
                foundAny = true;
            }
        }
        
        if (!foundAny) {
            System.out.println("Ingen tilgængelige bøger");
        }
    }
    
    public void listOverdueBooks() {
        System.out.println("\nForsinede bøger:");
        boolean foundAny = false;
        
        for (int i = 0; i < bookCount; i++) {
            if (books[i].isOverdue()) {
                System.out.println("- " + books[i].getTitle() + 
                                 " (udlånt til " + books[i].getBorrowedBy() + 
                                 " for " + books[i].getDaysOnLoan() + " dage siden)");
                foundAny = true;
            }
        }
        
        if (!foundAny) {
            System.out.println("Ingen forsinede bøger");
        }
    }
    
    public void printStatistics() {
        int available = 0;
        int borrowed = 0;
        int overdue = 0;
        
        for (int i = 0; i < bookCount; i++) {
            if (books[i].isAvailable()) {
                available++;
            } else {
                borrowed++;
                if (books[i].isOverdue()) {
                    overdue++;
                }
            }
        }
        
        System.out.println("\n=== " + name + " Statistik ===");
        System.out.println("Total bøger: " + bookCount);
        System.out.println("Tilgængelige: " + available);
        System.out.println("Udlånte: " + borrowed);
        System.out.println("Forsinede: " + overdue);
    }
}
```

=== Brug af Biblioteks System

```java
public class LibraryDemo {
    public static void main(String[] args) {
        Library library = new Library("Hovedbiblioteket", 100);
        
        // Tilføj bøger
        library.addBook(new Book("Allan B. Downey", "Think Java", "9781492072508"));
        library.addBook(new Book("Rachel Cusk", "Omrids", "9788763851664"));
        library.addBook(new Book("Yuval Noah Harari", "Sapiens", "9780062316097"));
        library.addBook(new Book("Robert C. Martin", "Clean Code", "9780132350884"));
        
        // Vis tilgængelige bøger
        library.listAvailableBooks();
        
        // Lån nogle bøger
        Book javaBook = library.findBookByTitle("Think Java");
        if (javaBook != null) {
            javaBook.borrow("Alice Anderson");
        }
        
        Book cleanCodeBook = library.findBookByTitle("Clean Code");
        if (cleanCodeBook != null) {
            cleanCodeBook.borrow("Bob Brown");
        }
        
        // Vis status efter udlån
        library.listAvailableBooks();
        library.printStatistics();
        
        // Returnér en bog
        if (javaBook != null) {
            javaBook.returnBook();
        }
        
        // Find bøger efter forfatter
        System.out.println("\nBøger af Yuval Noah Harari:");
        Book[] harariBooks = library.findBooksByAuthor("Harari");
        for (Book book : harariBooks) {
            System.out.println("- " + book);
        }
        
        // Final status
        library.printStatistics();
    }
}
```

#exercise(title: "Personlig bankmand")[
Implementer en `PersonalBanker` klasse der kan:

1. Håndtere flere bankkonti for samme person
2. Overføre penge mellem konti
3. Beregne samlet formue
4. Finde den konto med højest/lavest saldo
5. Generere månedlig rapport med alle transaktioner
6. Automatisk overføre penge hvis en konto går under et minimum

Test systemet med forskellige scenarier.
]

== Arrays af Objekter med State

=== BankAccount Manager

```java
public class BankManager {
    private BankAccount[] accounts;
    private int accountCount;
    
    public BankManager(int capacity) {
        accounts = new BankAccount[capacity];
        accountCount = 0;
    }
    
    public boolean addAccount(BankAccount account) {
        if (accountCount >= accounts.length) {
            return false;
        }
        
        accounts[accountCount] = account;
        accountCount++;
        return true;
    }
    
    public BankAccount findAccount(int accountNumber) {
        for (int i = 0; i < accountCount; i++) {
            if (accounts[i].getAccountNumber() == accountNumber) {
                return accounts[i];
            }
        }
        return null;
    }
    
    public double getTotalBalance() {
        double total = 0.0;
        for (int i = 0; i < accountCount; i++) {
            total += accounts[i].getBalance();
        }
        return total;
    }
    
    public void printAllAccounts() {
        System.out.println("=== Alle Konti ===");
        for (int i = 0; i < accountCount; i++) {
            System.out.println(accounts[i]);
        }
        System.out.printf("Total saldo: %.2f kr.%n", getTotalBalance());
    }
    
    public boolean transferBetweenAccounts(int fromAccount, int toAccount, double amount) {
        BankAccount from = findAccount(fromAccount);
        BankAccount to = findAccount(toAccount);
        
        if (from == null || to == null) {
            System.out.println("En eller begge konti findes ikke");
            return false;
        }
        
        if (from.withdraw(amount)) {
            to.deposit(amount);
            System.out.printf("Overført %.2f kr. fra konto %d til konto %d%n", 
                             amount, fromAccount, toAccount);
            return true;
        }
        
        return false;
    }
}
```

== Null og NullPointerException

=== Hvad er Null?

`null` er en speciel værdi der betyder "ingen reference" - variablen peger ikke på noget objekt:

```java
BankAccount account = null;  // Peger ikke på noget objekt
System.out.println(account); // Udskriver: null

// Men hvis vi prøver at kalde en metode:
account.deposit(100);  // NullPointerException!
```

=== Sikker Håndtering af Null

```java
public class SafeBankOperations {
    
    public static void safeDeposit(BankAccount account, double amount) {
        if (account != null) {
            account.deposit(amount);
        } else {
            System.out.println("Kan ikke indsætte på null konto");
        }
    }
    
    public static String getAccountInfo(BankAccount account) {
        if (account == null) {
            return "Ingen konto";
        }
        return account.toString();
    }
    
    public static BankAccount findAccountSafely(BankAccount[] accounts, int accountNumber) {
        if (accounts == null) {
            return null;
        }
        
        for (BankAccount account : accounts) {
            if (account != null && account.getAccountNumber() == accountNumber) {
                return account;
            }
        }
        
        return null;  // Ikke fundet
    }
}
```

== Garbage Collection og Object Lifecycle

=== Object Lifecycle

```java
public class ObjectLifecycle {
    public static void main(String[] args) {
        // 1. Object Creation
        BankAccount account = new BankAccount(12345);  // Objekt oprettes i heap
        
        // 2. Object Usage
        account.deposit(100);
        account.withdraw(50);
        
        // 3. Reference Loss
        account = null;  // Reference fjernes
        
        // Nu er objektet "orphaned" - ingen kan komme til det
        // Garbage Collector vil på et tidspunkt fjerne det fra heap
        
        // 4. Automatic Cleanup (Garbage Collection)
        // Sker automatisk i baggrunden
        System.gc();  // Forslag til GC (ikke garanti)
    }
}
```

=== Multiple References

```java
BankAccount account1 = new BankAccount(12345);
BankAccount account2 = account1;  // Samme objekt, to references

account1.deposit(100);
System.out.println(account2.getBalance());  // 100 - samme objekt!

account1 = null;  // Første reference fjernet
// Objektet lever stadig fordi account2 stadig peger på det

account2 = null;  // Nu er objektet orphaned og kan garbage collectes
```

== Debugging og Troubleshooting

=== Common Issues

```java
public class CommonIssues {
    
    // Issue 1: Forgetting to initialize
    private BankAccount account;  // null by default
    
    public void badMethod() {
        account.deposit(100);  // NullPointerException!
    }
    
    public void goodMethod() {
        if (account == null) {
            account = new BankAccount(12345);
        }
        account.deposit(100);  // Safe
    }
    
    // Issue 2: Array of objects not initialized
    BankAccount[] accounts = new BankAccount[5];  // Array af null references!
    
    public void badArrayUsage() {
        accounts[0].deposit(100);  // NullPointerException!
    }
    
    public void goodArrayUsage() {
        for (int i = 0; i < accounts.length; i++) {
            accounts[i] = new BankAccount(1000 + i);  // Initialize hver element
        }
        accounts[0].deposit(100);  // Nu er det sikkert
    }
}
```

== Sammenfatning

I dette kapitel har vi lært:

- *State og Behavior*: Objekter der både gemmer data og kan udføre handlinger
- *Instance metoder*: Metoder der virker på specifikke objekter (ikke static)
- *Mutable objekter*: Objekter hvis tilstand kan ændres over tid
- *Object lifecycle*: Oprettelse, brug og garbage collection
- *Null håndtering*: Sikker arbejde med references der måske er null
- *Praktiske eksempler*: BankAccount og Library systemer

Objekter med state og adfærd er kraftfulde værktøjer til at modellere komplekse systemer. De gør det muligt at kapsle både data og logik sammen på en naturlig måde.

I næste kapitel lærer vi om komposition - hvordan objekter kan indeholde andre objekter for at bygge endnu mere komplekse og realistiske systemer.