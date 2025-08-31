# Phone Home

- Kode er for mennesker - så navngivning af metoder er vigtigt! 
- Lav et nyt Java-projekt `phone-home` hvori du tilføjer koden herunder. 
- **Ret navnene** på variable, metoder og parametre, så koden bliver mere forståelig - `num`, `check`, `x`, osv. er der jo ingen der forstår.

```java
public class PhoneHome {
    public static void main(String[] args) {
        String num = "004512345678";

        System.out.println("Gyldigt dansk telefonnummer? " +
                           check(num));
    }

    public static boolean check(String x) {
        return checkThis(x) && checkThat(x);
    }

    public static boolean checkThis(String thing) {
        return thing.startsWith("0045");
    }

    public static boolean checkThat(String thing) {
        return thing.length() == 12;
    }
}
```

- Er der mere du kan gøre? Hint: "0045" og 12, hvad med at lave dem til konstanter med sigende navne?