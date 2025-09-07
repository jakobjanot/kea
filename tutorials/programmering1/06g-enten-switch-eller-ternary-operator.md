# Enten eller... med ternary operator og switch

1. Lad os genbesøge opgaverne i `either-or` projektet og implementere dem med enten en `switch` eller en **ternary operator** (`? :`).
- Eksempel på brug af ternary operator:
   ```java
   public static boolean isAdult(int age) {
       return (age >= 18) ? true : false;
   }
   ```
- Eksempel på brug af switch:
   ```java
   public static String getDayOfWeek(int dayNumber) {
       switch (dayNumber) {
           case 1:
               return "Mandag";
           case 2:
               return "Tirsdag";
           case 3:
               return "Onsdag";
           case 4:
               return "Torsdag";
           case 5:
               return "Fredag";
           case 6:
               return "Lørdag";
           case 7:
               return "Søndag";
           default:
               return "Ugyldigt dagnummer";
       }
   }
   ```
- Prøv at udvælge nogle af opgaverne fra `either-or` projektet og implementere dem med enten en `switch` eller en **ternary operator** (`? :`) ligesom ovenfor.