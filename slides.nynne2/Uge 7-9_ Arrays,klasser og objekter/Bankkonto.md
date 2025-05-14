**Bankkonto**

Opgaven involverer:

* Egen klasse
* Instansvariable
* Konstruktør\-metode
* Metoder med parametre og returværdi

Lav en klasse med navn Konto.

Klassen skal have flg. instansvariable og tilhørende get og set metoder:

* Kontonummer
* Ejernavn
* Saldo

Det skal være muligt at indsætte og hæve penge på kontoen. Derfor har vi brug for flg. metoder:

* En metode indsaet, som modtager et beloeb, sætter det ind på kontoen og returnerer den ny saldo.
* En metode haev, som modtager et beløb, hæver beløbet fra kontoen, og returnerer den ny saldo. Det er ikke muligt at hæve flere penge, end der er på kontoen. Hvis dette forsøges skal metoden returnere \-1\.
* En toString metode, som kan udskrive information om en konto.

Du kan også lave navne på metoder og filer på engelsk. Bar du undgår at bruge æ, ø og å andre steder end inde i strings. Java kan fejle på uforudsigelige måder hvis du bruger de her tegn i diun kode, så hellere vænne dig til ikke at gøre det