# Returtyper

1. Lav et nyt Java-projekt i IntelliJ, som du navngiver `return-type`.
2. Lav en Java-klasse `ReturnType`, der ser sådan ud:
    ```java
    blic class ReturnType {
      public static void main(String[] args) {
          ??? result = add(5, 10);
          System.out.println("Resultatet er: " + result);

        }

        public static ??? add(int a, int b) {
            return a + b;
        }
    }
    ```
3. Udfyld `???` med den rigtige type, så programmet kan kompileres og køre.
4. Prøv nu med eksemplerne herunder, først gæt og derefter tjek.
- ```java
  public static ??? add(double a, double b) {
      return a + b;
  }
  ```
- ```java
  public static ??? isWeekend(int dayOfWeek) {
      return dayOfWeek == 6 || dayOfWeek == 7;
  }
  ```
- ```java
  public static ??? sendEmail(String text) {
      EmailService.send(text);
  }
  ```
- ```java
  public static ??? fullName(String firstName,
                             String lastName) {
      return firstName + " " + lastName;
  }
  ```
- ```java
  public static ??? getLength(String text) {
      return text.length();
  }
  ```
- ```java
  public static ??? greet(String name) {
      System.out.println("Hello, " + name + "!");
  }
  ```
- ```java
  public static ??? getFirstCharacter(String text) {
      return text.charAt(0);
  }
  ```
- ```java
  public static ??? isEven(int number) {
      return number % 2 == 0;
  }
  ```
- ```java
  public static ??? substring(String text, 
                              int start, int end) {
      return text.substring(start, end);
  }
  ```
