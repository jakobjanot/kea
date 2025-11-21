#import "../style.typ": *

= Brugerdefinerede Typer

Indtil nu har vi brugt Javas indbyggede datatyper som `int`, `String`, `boolean` og arrays. Men ofte har vi brug for at gemme data der hører sammen på en mere struktureret måde. Her kommer *brugerdefinerede typer* ind i billedet.

Ved at definere vores egne klasser kan vi skabe nye datatyper der passer præcis til vores behov. Dette er fundamentet for objektorienteret programmering.

== Fra Løse Variable til Struktureret Data

=== Problemet med Løse Variable

Forestil dig at du skal gemme kontaktoplysninger:

```java
// Upraktisk og næsten ulæseligt
String givenName1 = "Victor";
String familyName1 = "Lukic";
String email1 = "lucky@victory.dk";

String givenName2 = "Thorkild";
String familyName2 = "Hansen";
String email2 = "thorkild@hansen.dk";

// Hvordan sender vi dette til en metode?
generateEmail(givenName1, familyName1, email1,
              givenName2, familyName2, email2,
              "Hej", "Hvordan går det?");
```

=== Løsningen: Egne Datatyper

```java
// Meget mere læseligt og praktisk
Contact victor = new Contact("Victor", "Lukic", "lucky@victory.dk");
Contact thorkild = new Contact("Thorkild", "Hansen", "thorkild@hansen.dk");

generateEmail(victor, thorkild, "Hej", "Hvordan går det?");
```

== Din Første Brugerdefinerede Type

Lad os skabe en `Contact` klasse til at repræsentere kontaktpersoner:

=== Grundlæggende Klasse Definition

```java
public class Contact {
    // Felter (instance variables)
    String givenName;
    String familyName;
    String email;
    String phone;
}
```

=== Brug af Klassen

```java
public class ContactDemo {
    public static void main(String[] args) {
        // Opret et nyt Contact objekt
        Contact victor = new Contact();
        
        // Tildel værdier til felterne
        victor.givenName = "Victor";
        victor.familyName = "Lukic";
        victor.email = "lucky@victory.dk";
        victor.phone = "+45 12 34 56 78";
        
        // Brug objektet
        System.out.println("Navn: " + victor.givenName + " " + victor.familyName);
        System.out.println("Email: " + victor.email);
        System.out.println("Telefon: " + victor.phone);
    }
}
```

== Hvad gør `new`?

Når vi skriver `new Contact()` sker der tre ting:

1. *Hukommelse allokeres*: Plads til objektet reserveres i heap
2. *Felter initialiseres*: Alle felter får default værdier
3. *Reference returneres*: Vi får en "adresse" til objektet

```java
Contact victor = new Contact();  // victor peger på objektet
Contact thorkild = new Contact(); // thorkild peger på et andet objekt

// victor og thorkild er references (adresser), ikke selve objekterne
```

== Konstruktører - Initialisering Gjort Rigtigt

=== Problemet med Manuel Initialisering

```java
Contact contact = new Contact();
// Hvad hvis vi glemmer at sætte email?
contact.givenName = "Anna";
contact.familyName = "Larsen";
// contact.email er stadig null!
```

=== Løsningen: Konstruktører

En konstruktør er en speciel metode der:
- Har samme navn som klassen
- Ingen returtype (ikke engang `void`)
- Kaldes automatisk ved `new`
- Bruges til at initialisere objektet

```java
public class Contact {
    String givenName;
    String familyName;
    String email;
    String phone;
    
    // Konstruktør
    public Contact(String givenName, String familyName, String email, String phone) {
        this.givenName = givenName;
        this.familyName = familyName;
        this.email = email;
        this.phone = phone;
    }
}
```

=== Brug af Konstruktør

```java
public class ContactDemo {
    public static void main(String[] args) {
        // Alle felter initialiseres med det samme
        Contact victor = new Contact("Victor", "Lukic", 
                                    "lucky@victory.dk", "+45 12 34 56 78");
        
        Contact anna = new Contact("Anna", "Larsen", 
                                  "anna@larsen.dk", "+45 87 65 43 21");
        
        System.out.println("Victor: " + victor.email);
        System.out.println("Anna: " + anna.email);
    }
}
```

=== `this` Keyword

`this` refererer til det aktuelle objekt:

```java
public Contact(String givenName, String familyName, String email, String phone) {
    this.givenName = givenName;  // this.givenName = objektets felt
    this.familyName = familyName; // familyName = parameter
    this.email = email;
    this.phone = phone;
}
```

Uden `this` ville Java ikke kunne skelne mellem parametre og felter med samme navn.

== Overloading af Konstruktører

Vi kan have flere konstruktører med forskellige parametre:

```java
public class Contact {
    String givenName;
    String familyName;
    String email;
    String phone;
    
    // Konstruktør med alle felter
    public Contact(String givenName, String familyName, String email, String phone) {
        this.givenName = givenName;
        this.familyName = familyName;
        this.email = email;
        this.phone = phone;
    }
    
    // Konstruktør uden telefon
    public Contact(String givenName, String familyName, String email) {
        this.givenName = givenName;
        this.familyName = familyName;
        this.email = email;
        this.phone = "N/A";  // Default værdi
    }
    
    // Konstruktør kun med navn
    public Contact(String givenName, String familyName) {
        this.givenName = givenName;
        this.familyName = familyName;
        this.email = "N/A";
        this.phone = "N/A";
    }
}
```

=== Brug af Overloaded Konstruktører

```java
public class ContactDemo {
    public static void main(String[] args) {
        Contact contact1 = new Contact("Victor", "Lukic", 
                                      "lucky@victory.dk", "+45 12 34 56 78");
        
        Contact contact2 = new Contact("Anna", "Larsen", "anna@larsen.dk");
        
        Contact contact3 = new Contact("Bob", "Smith");
        
        System.out.println("Contact 1 telefon: " + contact1.phone);
        System.out.println("Contact 2 telefon: " + contact2.phone);  // "N/A"
        System.out.println("Contact 3 email: " + contact3.email);    // "N/A"
    }
}
```

#exercise(title: "Kontakt system")[
Implementer et komplet kontakt system:

1. Lav en `Contact` klasse med felterne `name`, `email`, og `phone`
2. Lav mindst to konstruktører (med og uden telefon)
3. Opret et array med 5 kontaktpersoner
4. Implementer en metode der finder en kontakt baseret på navn
5. Implementer en metode der udskriver alle kontakter
6. Test systemet grundigt
]

== ToString() - Pæn Udskrivning

=== Problemet med Standard Udskrivning

```java
Contact victor = new Contact("Victor", "Lukic", "lucky@victory.dk");
System.out.println(victor);  // Output: Contact@6bc7c054
```

Standard `toString()` viser kun klassens navn og en hash kode - ikke særlig informativt!

=== Løsningen: Egen toString()

```java
public class Contact {
    String givenName;
    String familyName;
    String email;
    String phone;
    
    public Contact(String givenName, String familyName, String email) {
        this.givenName = givenName;
        this.familyName = familyName;
        this.email = email;
        this.phone = "N/A";
    }
    
    // Override toString metoden
    @Override
    public String toString() {
        return givenName + " " + familyName + " <" + email + ">";
    }
}
```

=== Brug af toString()

```java
public class ContactDemo {
    public static void main(String[] args) {
        Contact victor = new Contact("Victor", "Lukic", "lucky@victory.dk");
        Contact anna = new Contact("Anna", "Larsen", "anna@larsen.dk");
        
        System.out.println(victor);  // Victor Lukic <lucky@victory.dk>
        System.out.println(anna);    // Anna Larsen <anna@larsen.dk>
        
        // toString() kaldes automatisk ved string concatenation
        String message = "Kontakt: " + victor;
        System.out.println(message);
    }
}
```

=== Avanceret toString() Formatering

```java
@Override
public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("Contact{");
    sb.append("name='").append(givenName).append(" ").append(familyName).append("'");
    sb.append(", email='").append(email).append("'");
    if (!phone.equals("N/A")) {
        sb.append(", phone='").append(phone).append("'");
    }
    sb.append("}");
    return sb.toString();
}
```

== Immutable Objects - Uforanderlige Objekter

=== Problemet med Mutable Objects

```java
Contact victor = new Contact("Victor", "Lukic", "lucky@victory.dk");
victor.email = "hacker@evil.com";  // Ups! Email ændret ved en fejl
```

=== Løsningen: Final Fields

```java
public class Contact {
    final String givenName;  // Kan ikke ændres efter konstruktion
    final String familyName;
    final String email;
    final String phone;
    
    public Contact(String givenName, String familyName, String email, String phone) {
        this.givenName = givenName;
        this.familyName = familyName;
        this.email = email;
        this.phone = phone;
    }
    
    @Override
    public String toString() {
        return givenName + " " + familyName + " <" + email + ">";
    }
}
```

=== Fordele ved Immutable Objects

```java
Contact victor = new Contact("Victor", "Lukic", "lucky@victory.dk", "+45 12345678");

// victor.email = "new@email.com";  // Kompileringsfejl!

// Objektet kan ikke ændres - det er sikkert at dele med andre
sendEmailTo(victor);  // Vi ved at victor ikke ændres
```

== Records - Moderne Værdiobjekter

Java 14+ introducerede `records` som en kompakt måde at lave immutable værdiobjekter:

=== Traditionel Approach

```java
public class Contact {
    private final String givenName;
    private final String familyName;
    private final String email;
    
    public Contact(String givenName, String familyName, String email) {
        this.givenName = givenName;
        this.familyName = familyName;
        this.email = email;
    }
    
    public String getGivenName() { return givenName; }
    public String getFamilyName() { return familyName; }
    public String getEmail() { return email; }
    
    @Override
    public String toString() {
        return givenName + " " + familyName + " <" + email + ">";
    }
    
    @Override
    public boolean equals(Object obj) {
        // ... kompleks implementation
    }
    
    @Override
    public int hashCode() {
        // ... kompleks implementation
    }
}
```

=== Record Approach

```java
public record Contact(String givenName, String familyName, String email) {
    // Automatisk genereret:
    // - Konstruktør
    // - Getter metoder (givenName(), familyName(), email())
    // - toString()
    // - equals()
    // - hashCode()
}
```

=== Brug af Records

```java
public class RecordDemo {
    public static void main(String[] args) {
        Contact victor = new Contact("Victor", "Lukic", "lucky@victory.dk");
        Contact anna = new Contact("Anna", "Larsen", "anna@larsen.dk");
        
        System.out.println(victor);  // Pæn toString()
        System.out.println("Email: " + victor.email());  // Getter metode
        
        // Sammenligning baseret på værdier, ikke referencer
        Contact victor2 = new Contact("Victor", "Lukic", "lucky@victory.dk");
        System.out.println(victor.equals(victor2));  // true
    }
}
```

== Værdiobjekter og Equals()

=== Problemet med Reference Sammenligning

```java
Contact victor1 = new Contact("Victor", "Lukic", "lucky@victory.dk");
Contact victor2 = new Contact("Victor", "Lukic", "lucky@victory.dk");

System.out.println(victor1 == victor2);       // false (forskellige objekter)
System.out.println(victor1.equals(victor2));  // false (default equals)
```

Standard `equals()` sammenligner kun referencer, ikke indhold.

=== Implementering af Equals()

```java
public class Contact {
    final String givenName;
    final String familyName;
    final String email;
    
    public Contact(String givenName, String familyName, String email) {
        this.givenName = givenName;
        this.familyName = familyName;
        this.email = email;
    }
    
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        
        Contact contact = (Contact) obj;
        return Objects.equals(givenName, contact.givenName) &&
               Objects.equals(familyName, contact.familyName) &&
               Objects.equals(email, contact.email);
    }
    
    @Override
    public int hashCode() {
        return Objects.hash(givenName, familyName, email);
    }
}
```

== Praktisk Eksempel: Person Klasse

```java
public class Person {
    private final String name;
    private final int age;
    private final String address;
    
    public Person(String name, int age, String address) {
        if (name == null || name.trim().isEmpty()) {
            throw new IllegalArgumentException("Navn kan ikke være tomt");
        }
        if (age < 0 || age > 150) {
            throw new IllegalArgumentException("Ugyldig alder: " + age);
        }
        
        this.name = name.trim();
        this.age = age;
        this.address = address != null ? address.trim() : "Ukendt";
    }
    
    public Person(String name, int age) {
        this(name, age, "Ukendt");  // Kalder anden konstruktør
    }
    
    // Getter metoder
    public String getName() { return name; }
    public int getAge() { return age; }
    public String getAddress() { return address; }
    
    // Beregnet egenskab
    public boolean isAdult() {
        return age >= 18;
    }
    
    public String getAgeGroup() {
        if (age < 13) return "Barn";
        if (age < 20) return "Teenager";
        if (age < 65) return "Voksen";
        return "Senior";
    }
    
    @Override
    public String toString() {
        return String.format("%s, %d år (%s)", name, age, getAgeGroup());
    }
    
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        
        Person person = (Person) obj;
        return age == person.age &&
               Objects.equals(name, person.name) &&
               Objects.equals(address, person.address);
    }
    
    @Override
    public int hashCode() {
        return Objects.hash(name, age, address);
    }
}
```

=== Brug af Person Klasse

```java
public class PersonDemo {
    public static void main(String[] args) {
        Person[] people = {
            new Person("Anna Larsen", 25, "København"),
            new Person("Bob Smith", 17),
            new Person("Charlie Brown", 45, "Aarhus"),
            new Person("Diana Prince", 30, "Odense")
        };
        
        System.out.println("Alle personer:");
        for (Person person : people) {
            System.out.println(person);
        }
        
        System.out.println("\nVoksne personer:");
        for (Person person : people) {
            if (person.isAdult()) {
                System.out.println("- " + person.getName());
            }
        }
        
        System.out.println("\nAldersgrupper:");
        for (Person person : people) {
            System.out.println(person.getName() + " -> " + person.getAgeGroup());
        }
    }
}
```

#exercise(title: "Bog bibliotek")[
Lav et simpelt bibliotekssystem:

1. Opret en `Book` klasse med felter: `title`, `author`, `isbn`, `publicationYear`
2. Implementer konstruktører, toString(), equals(), og hashCode()
3. Lav en `Library` klasse der kan gemme en array af bøger
4. Implementer metoder til at:
   - Tilføje bog
   - Finde bog efter titel
   - Finde bøger efter forfatter
   - Liste alle bøger fra et bestemt år
5. Test systemet med forskellige bøger
]

== Arrays af Objekter

=== Oprettelse og Initialisering

```java
// Opret array af Contact objekter
Contact[] contacts = new Contact[3];

// Initialiser hvert element
contacts[0] = new Contact("Alice", "Anderson", "alice@example.com");
contacts[1] = new Contact("Bob", "Brown", "bob@example.com");
contacts[2] = new Contact("Charlie", "Clark", "charlie@example.com");

// Alternativ: Array literal
Contact[] moreContacts = {
    new Contact("David", "Davis", "david@example.com"),
    new Contact("Eva", "Evans", "eva@example.com"),
    new Contact("Frank", "Fisher", "frank@example.com")
};
```

=== Gennemløb og Søgning

```java
public class ContactManager {
    private Contact[] contacts;
    private int count;
    
    public ContactManager(int capacity) {
        contacts = new Contact[capacity];
        count = 0;
    }
    
    public void addContact(Contact contact) {
        if (count < contacts.length) {
            contacts[count] = contact;
            count++;
        } else {
            System.out.println("Contact list is full!");
        }
    }
    
    public Contact findByEmail(String email) {
        for (int i = 0; i < count; i++) {
            if (contacts[i].getEmail().equals(email)) {
                return contacts[i];
            }
        }
        return null;  // Ikke fundet
    }
    
    public void printAllContacts() {
        System.out.println("Alle kontakter:");
        for (int i = 0; i < count; i++) {
            System.out.println((i + 1) + ". " + contacts[i]);
        }
    }
    
    public Contact[] getContactsByDomain(String domain) {
        // Tæl matches først
        int matchCount = 0;
        for (int i = 0; i < count; i++) {
            if (contacts[i].getEmail().endsWith("@" + domain)) {
                matchCount++;
            }
        }
        
        // Opret result array
        Contact[] result = new Contact[matchCount];
        int resultIndex = 0;
        
        for (int i = 0; i < count; i++) {
            if (contacts[i].getEmail().endsWith("@" + domain)) {
                result[resultIndex++] = contacts[i];
            }
        }
        
        return result;
    }
}
```

== Objekter som Parametre og Returnværdier

=== Objekter som Parametre

```java
public class EmailService {
    
    public static void sendEmail(Contact sender, Contact recipient, 
                               String subject, String body) {
        System.out.println("Fra: " + sender.getEmail());
        System.out.println("Til: " + recipient.getEmail());
        System.out.println("Emne: " + subject);
        System.out.println("Besked: " + body);
        System.out.println("Email sendt!");
    }
    
    public static void sendBulkEmail(Contact[] recipients, Contact sender,
                                   String subject, String body) {
        for (Contact recipient : recipients) {
            if (recipient != null) {
                sendEmail(sender, recipient, subject, body);
                System.out.println("---");
            }
        }
    }
}
```

=== Objekter som Returnværdier

```java
public class ContactFactory {
    
    public static Contact createContact(String fullName, String email) {
        String[] nameParts = fullName.split(" ", 2);
        String givenName = nameParts[0];
        String familyName = nameParts.length > 1 ? nameParts[1] : "";
        
        return new Contact(givenName, familyName, email);
    }
    
    public static Contact[] createContactsFromCSV(String csvData) {
        String[] lines = csvData.split("\n");
        Contact[] contacts = new Contact[lines.length];
        
        for (int i = 0; i < lines.length; i++) {
            String[] parts = lines[i].split(",");
            if (parts.length >= 2) {
                contacts[i] = new Contact(parts[0].trim(), "", parts[1].trim());
            }
        }
        
        return contacts;
    }
}
```

== Sammenfatning

I dette kapitel har vi lært:

- *Brugerdefinerede typer*: Skabe egne klasser for at strukturere data
- *Konstruktører*: Initialisering af objekter med forskellige parametre
- *`this` keyword*: Reference til det aktuelle objekt
- *toString()*: Pæn udskrivning af objekter
- *Immutable objects*: Sikkerhed gennem final felter
- *Records*: Moderne syntaks for værdiobjekter
- *equals() og hashCode()*: Sammenligning baseret på værdier
- *Arrays af objekter*: Håndtering af samlinger af brugerdefinerede typer

Brugerdefinerede typer er fundamentet for objektorienteret programmering. De gør det muligt at modellere virkeligheden i kode og skaber mere læselig og vedligeholdelig software.

I næste kapitel lærer vi om objekter med state og adfærd, hvor objekter ikke kun gemmer data, men også kan udføre handlinger og ændre deres tilstand over tid.