# Enten eller... med switch
I Java har vi en anden måde at skrive betingelser på, som kaldes en **switch statement**. Den har følgende syntax:
- Eksempel på brug af switch:
  ```java
  public static boolean isWeekend(String day) {
      switch (day) {
          case "Monday", "Tuesday", "Wednesday", 
               "Thursday", "Friday":
              return false;
          case "Saturday", "Sunday":
              return true;
          default:
              return false;
      }
  }
  ```

1. Opret et projekt `switch-case`
2. Omskriv flg. metode til at bruge en `switch` i stedet for if/else:
   ```java
    public static String seasonForMonth(int month) {
        String season;
        if (month == 12 || month == 1 || month == 2) {
            season = "Winter";
        } else if (month >= 3 && month <= 5) {
            season = "Spring";
        } else if (month >= 6 && month <= 8) {
            season = "Summer";
        } else if (month >= 9 && month <= 11) {
            season = "Autumn";
        } else {
            season = "Invalid month";
        }
        return season;
    }
    ```  
3. Lav en main metode, hvor du tester din `seasonForMonth` metode ved at kalde den med forskellige månedstal og printe resultaterne.
4. Prøv at omskrive `seasonForMonth` metoden til at bruge den nye switch syntax (->), dvs.
    ```java
    public static String seasonForMonth(int month) {
         return switch (month) {
              case 12, 1, 2 -> "Winter";
              // ... fortsæt her
         }
    }
    ```
