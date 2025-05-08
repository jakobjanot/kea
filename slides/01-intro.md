# Java 1. Semester  
#### Introduktion til programmering

---

## Program
- **08:30** — Velkomst praktisk  
- **09:00** — Installer Java og IntelliJ  
- **10:00** — Pause  
- **10:15** — Hello World! Opgaver i studiengruppe  
- **11:00** — Compiler  
- **11:30** — Opsamling, forberedelse til næste gang  

---

## Praktisk
- [Fronter](https://kea-fronter.itslearning.com/)  
- [Link til gratis Java bog](https://books.trinket.io/thinkjava/)  
- [Linkedin Learning Java videoer](https://www.linkedin.com/learning/learning-java-17/)  
- [Oracle docs og materiale](https://dev.java/learn/)  

---

## Inlay Hints  
![Inlay hints](./assets/images/inlayhints.png)  
![Inlay hints](./assets/images/inlayhints2.png)  

---

### Hvad vi skal gennemgå i dag
- Programmering  
- Java  
- `main()`  
- `"Hello World!"` med Java  
- Terminal  
- IntelliJ  

---

## Installere Java & IntelliJ  
- Installeringsguides findes på Fronter  
- Hvis du er hurtig eller allerede har installeret, så benyt chancen for at hjælpe din medstuderende  

---

## Programmering  
![Toast](./assets/images/toast.png)  

---

## Java er:
- Class based / Object oriented  
- Platform uafhængig  
- General purpose / High level  
- **W**rite **O**nce **R**un **A**nywhere  
- Compiler til bytecode  

---

## Compiler til bytecode  
> *Java applications are typically compiled to [bytecode](https://en.wikipedia.org/wiki/Java_bytecode) that can run on any [Java virtual machine](https://en.wikipedia.org/wiki/Java_virtual_machine) (JVM) regardless of the underlying [computer architecture](https://en.wikipedia.org/wiki/Computer_architecture). The [syntax](https://en.wikipedia.org/wiki/Syntax_(programming_languages)) of Java is similar to C and C++, but has fewer [low-level](https://en.wikipedia.org/wiki/Low-level_programming_language) facilities than either of them.*

[https://en.wikipedia.org/wiki/Java_(programming_language)](https://en.wikipedia.org/wiki/Java_(programming_language))

---

## Populær  
**Nr. 2 mest populære sprog ved PYPL (Google søgning)**  
**Anvendt bredt i industrien**  
![Java i industrien](./assets/images/javasteder.png)  
![Java Popularity](./assets/images/javaranking.png)  

---

## Deler vandene...  
> *“There are only two kinds of languages: the ones people complain about and the ones nobody uses.”*  
— Bjarne Stroustrup  

---

## **Class-based** & **object oriented**  
![jigglypuff](./assets/images/jigglypuff.png)  

---

## **General purpose** & **High Level**  
![highlevel](./assets/images/highlevel.png)  

---

## Write **Once**, Run **Anywhere**, Compiled til **Bytecode**  
![WORA](./assets/images/wora.png)

---

```java [|1,3]
  // Mit første Java program!
  public class HelloWorld {
    public static void main(String[] args) {
      System.out.println("Hello world!");
    }
  }
```