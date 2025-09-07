# Enten eller... med ternary operator og switch

1. Lad os genbesøge opgaverne i `either-or` projektet og implementere dem med enten en `switch` eller en **ternary operator** (`? :`).
- Eksempel på brug af ternary operator:
   ```java
   public static double applyDiscount(double price, boolean isMember) {
       return isMember ? price * 0.8 : price; // 20% discount for members
   }
   ```
- Eksempel på brug af switch:
   ```java
   public static String seasonForMonth(int month) {
       switch (month) {
           case 12, 1, 2:
               return "Winter";
           case 3, 4, 5:
               return "Spring";
           case 6, 7, 8:
               return "Summer";
           case 9, 10, 11:
               return "Autumn";
           default:
               return "Invalid month";
       }
   }
   ```
- Prøv at udvælge nogle af opgaverne fra `either-or` projektet og implementere dem med enten en `switch` eller en **ternary operator** (`? :`) ligesom ovenfor.