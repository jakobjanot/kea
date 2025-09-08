# Enten eller... med ternary operator, switch og guard

1. Lad os genbesøge opgaverne i `either-or` projektet og implementere dem med enten en `switch`, en guard eller en **ternary operator**.
- Eksempel på brug af en guard:
   ```java
   public static boolean canDrive(int age, boolean hasLicense) {
        if (age < 18) return false;

        return hasLicense;
   }
   ```
- Eksempel på brug af ternary operator:
   ```java
   public static double applyDiscount(double price, 
                                      boolean isMember, 
                                      double couponDiscount) {
       return isMember ? price * 0.8 - couponDiscount : price - couponDiscount;
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
- Prøv at udvælge nogle af opgaverne fra `either-or` projektet og implementere dem med enten en `switch` eller en **ternary operator** ligesom ovenfor.