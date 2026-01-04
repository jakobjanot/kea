# What the bug

Vi har lært at anvende unit tests og debugging til at finde og rette logiske fejl i vores programmer. Her er en række programmer der gør noget andet end vi forventer - din opgave er at finde og rette fejlene ved hjælp af de teknikker vi har lært.

1. Opret et nyt Intellij-projekt `what-the-bug` med tilhørende git repo (sæt flueben i **Create git repository**). Du må gerne genbruge projektet i alle opgaverne nedenfor og committe og pushe dit arbejde til GitHub løbende.
2. Find og ret fejlen i:
   ```java
   public class OddEvenChecker {
       public static boolean isEven(int number) {
           return number % 2 == 1;
       }

       public static boolean isOdd(int number) {
           return number % 2 == 0;
       }
   }
   ```
   Test fx med tallene 4 og 7.
3. Find og ret fejlen i:
    ```java
    public class LargestNumberFinder {
        public static int findLargest(int[] numbers) {
            int largest = numbers[1];
            for (int i = 2; i < numbers.length; i++) {
                if (numbers[i] < largest) {
                    largest = numbers[i];
                }
            }
            return largest;
        }
    }
    ```
    Test fx med arrayet `{9, 5, 2, 8, 1}`.
4. Find og ret fejlen i:
    ```java
    public class StringStatistics {
        public static int countChars(String str, char ch) {
            int count = 0;
            for (int i = 0; i < str.length(); i++) {
                if (str.charAt(i) == ch) {
                    count =+ 1;
                }
            }
            return count;
        }
    }
    ```
    Test fx med strengen `"programmering"` og tegnet `'r'`.