# Mere om mellemrum (whitespaces)
- Vi har set at indrykning ikke er vigtigt for at Java kan forstå vores kode
- Hvad med andre mellemrum (whitespaces) - er de vigtige? - lad os undersøge det!

1. Fortsæt med at arbejde i dit `MyFirstProgram` projekt
2. Prøv nu at eksperimentere fjerne andre mellemrum, fx alle mellemrum omkring `{` og `}` og efter `;`, så det ligner dette:
    ```java
    public class MyFirstProgram{public static void main(String[] args){System.out.println("Hey there!");...}}
    ```
3. Ok, så Java er tilsyneladede også ligeglad med de mellemrum og linjeskift vi lige har fjernet.
4. Hvorfor synes du ikke vi skal have hele vores kode på en linje?
5. Sæt din **markør** (cursor) på linjen og tryk på 
    - **Ctrl + Alt + L** hvis du er på **Windows** (først Ctrl, så Alt, så L)
    - **Cmd + Option + L** hvis du er på **Mac** for at formattere koden (først Cmd, så Option, så L)
6. Snedigt ikke? - IntelliJ formatterer din kode automatisk, så den bliver mere læsbar
7. Kør programmet igen - alt ok?
8. Prøv at fjerne **alle** mellemrum i din kode, så den ligner dette:
    ```java
    publicclassMyFirstProgram{publicstaticvoidmain(String[]args){System.out.println("Heythere!");System.out.println("IamlearningJava!");}}
    ```
8. Kør programmet - hvad sker der? 
9. Læg mærke til at IntelliJ ikke lægere tilføjer syntax highlighting - det er fordi det ikke længere følger Java's syntaksregler,  og IntelliJ kan derfor ikke forstå koden.
10. Ok, så Java er ikke _helt_ ligeglad med mellemrum - hvordan skulle den - hvordan skal man kende forskel på `public`, `class` og `publicclass` hvis de ikke er adskilt af mellemrum?
11. Prøv at formattere koden igen med **Ctrl + Alt + L** (Windows) eller **Cmd + Option + L** (Mac) - hvad sker der?
12. Ok, så IntelliJ kan kun formattere koden, hvis den kan forstå den - og det kan den ikke når vi har "ødelagt" den ved at fjerne alle mellemrum
13. Tilføj mellemrum indtil du igen kan formattere koden igen, så den ligner dette:
    ```java
    public class MyFirstProgram {
        public static void main(String[] args) {
            System.out.println("Hey there!");
            System.out.println("I am learning Java!");
        }
    }
    ```