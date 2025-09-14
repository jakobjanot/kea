

# Om String og char

# Mere String

# Karaktersæt - ASCII og Unicode

Nogle bud på hvad der bliver udskrevet:

```java
char c1 = 74;
char c2 = 65;
char c3 = 86;
System.out.println("Jeg elsker " + c1 + c2 + c3 + c2);
```

--

Derfor kan vi også printe fra `'A'` til `'Z'`:

```java
for (char c = 'A'; c <= 'Z'; c++) {
    System.out.print(c);
}
```

giver 

"**A**BCDEFGHIJKLMNOPQRSTUVXYABCDEFGHIJKLMNOPQRSTUVWXY**Z**"

--

... og fra `'A'` til `'Å'`, men:

```java
for (char c = 'A'; c <= 'Å'; c++) {
    System.out.print(c);
}
```

giver derimod

"**A**BCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~ ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄ**Å**"

# 🤔

--

## I gamle dage 



Notes:
I gamle var det ikke helt ualmindeligt at få en mail der 