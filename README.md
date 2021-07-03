# BazaMuzyczna
Baza Albumów muzycznych jest to spis
najpotrzebniejszych informacji o danych płytach ich
gatunkach artystach itp. Projekt zawiera następujące
tabele:
● plyta
● utwory
● plyta_rodzaj
● gatunek
● kraj
● osoba
● Nagrody
● zespol
● plyta_wykonawca
● zespol_osoba
● nagroda_wykonawca
![image](https://user-images.githubusercontent.com/34864275/124351708-44f3c500-dbfc-11eb-88f4-5dca4c2409cb.png)

DO podstawowej bazy danych zostały dodane zapytania języka PL/SQL takie jak:

*Kursor - Kursor ma na celu pobranie danych z tabeli
“osoba” i wyświetlenie czy dany artysta jest Polskim
artystą czy zagranicznym

*Kursor - Kursor ma na celu pobranie danych z tabeli płyta
i wyświetlenie czy dany album jest nowszy niż z 2005 i czy
jest gatunku “rock” czy innego.

*Wyzwalacz - Wyzwalacz ma na celu sprawdzenie czy
podczas wstawiania danych do tabeli “osoba” data
urodzenia nie jest późniejsza niż aktualna.

*Wyzwalacz - Wyzwalacz ma na celu sprawdzenie czy
podczas wstawiania danych do tabeli “utwory”pole z
nazwa płyty nie jest puste

*Procedura - Procedura służy do dodawania nowych
utworów. Procedura wywołuje wyjątek gdy numer piosenki
jest mniejszy od zera

*Procedura - Procedura służy do dodawania nowych
Gatunków. Procedura wywołuje wyjątek gdy dane id już
istnieje w bazie

*Rekord jawnie zdefiniowany - Zbiór zmiennych różnych
typów, które mają być wstawione do tabeli ,,Gatunek’’

*Wyjątek zdefiniowany przez użytkownika - Wyjątek jest
wywoływany przez procedurę gdy numer piosenki jest
mniejszy od zera

*Wyjątek wbudowany - Wyjątek jest wywoływany przez
procedurę gdy dane id już istnieje w bazie

*Dynamiczny SQL - Procedury mają za zadanie wykonać
INSERT i CREATE (do) nieznanej podczas tworzenia
procedury tabeli/ nieznanych wartości
