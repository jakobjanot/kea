# Never ending story
- Lav et nyt IntelliJ-projekt kaldet `never-ending-story`.
- Fix den fejl der gør at programmerne ikke stopper
1. ```java
   int retries = 3;
   while (retries > 0) {
       System.out.println("This is a never ending story");
   }
   ```
2. ```java
   int count = 1;
   while (count != 10) {
       System.out.println("This is a never ending story");
       count = count + 2;
   }
   ```
3. ```java
   int retries = 3;
   while (retries > 0) {
       System.out.println("This is a never ending story");
       retries = retries + 1;
   }
   ```
4. ```java
   int maxRetries = 3;
   int retries = 0;
   while (true) {
       System.out.println("This is a never ending story");
       if (retries < maxRetries) continue;
       retries++;
   }
   ```

