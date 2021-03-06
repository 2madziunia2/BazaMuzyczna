CREATE TABLE Kraj 
(id_kraju NUMBER(6) PRIMARY KEY,
panstwo VARCHAR2(60),
kontynent VARCHAR2(20) DEFAULT 'Europa',
kod_numeryczny NUMBER(3) UNIQUE ,
kod_ISO VARCHAR2(13) UNIQUE);


CREATE TABLE Plyta_rodzaj
(id_plyta_rodzaj NUMBER(6) PRIMARY KEY,
nazwa_plyta_rodzaj VARCHAR2(10) DEFAULT 'CD'
);

CREATE TABLE Gatunek
(id_gatunek NUMBER(6) PRIMARY KEY,
nazwa_gatunek VARCHAR2(20)
);

CREATE TABLE Nagrody
(id_nagrody NUMBER(6) PRIMARY KEY,
kategoria_nagrody VARCHAR2(70),
nomianacja_nagrody VARCHAR2(50),
wynik_nagrody VARCHAR(10)  DEFAULT 'NOMINACJA',
rok_nagrody NUMBER(4)
);

CREATE  TABLE Osoba 
(id_osoby NUMBER(6) PRIMARY KEY,
id_kraju NUMBER(6) CONSTRAINT   os_kraj_id_fk REFERENCES Kraj (id_kraju),
id_nagrody NUMBER(6) CONSTRAINT  os_nag_id_fk REFERENCES Nagrody (id_nagrody),
id_gatunek NUMBER(6) CONSTRAINT  os_gat_id_fk REFERENCES Gatunek (id_gatunek),
imie_osoby VARCHAR2(20),
nazwisko_osoby VARCHAR2(30),
data_urodzenia DATE,
opis VARCHAR2(70) 


);

CREATE  TABLE Zespol
(id_zespolu NUMBER(6) PRIMARY KEY,
id_kraju NUMBER(6) CONSTRAINT   zes_kraj_id_fk REFERENCES Kraj (id_kraju),
id_nagrody NUMBER(6) CONSTRAINT  zes_nag_id_fk REFERENCES Nagrody (id_nagrody),
id_gatunek NUMBER(6) CONSTRAINT  zes_gat_id_fk REFERENCES Gatunek (id_gatunek),
nazwa_zespolu VARCHAR2(30),
data_zalozenia_zespolu NUMBER(4),
data_rozwiazania_zespolu NUMBER(4) ,
CONSTRAINT zespol_data_rozwiazania CHECK  (data_rozwiazania_zespolu > data_zalozenia_zespolu)
);

CREATE TABLE zespol_osoba
(id_osoby NUMBER(6) CONSTRAINT   zes_os_id_fk REFERENCES Osoba (id_osoby),
id_zespolu  NUMBER(6) CONSTRAINT   os_zesp_id_fk REFERENCES Zespol (id_zespolu)
);


CREATE TABLE Plyta
(id_plyta NUMBER (6) NOT NULL PRIMARY KEY, 
id_plyta_rodzaj NUMBER (6)CONSTRAINT   plyt_plytrodz_id_fk REFERENCES Plyta_rodzaj (id_plyta_rodzaj), 
id_gatunek NUMBER(6)  CONSTRAINT  plyt_gat_id_fk REFERENCES Gatunek (id_gatunek),
nazwa_plyty VARCHAR2(99),
rok_nagrania NUMBER(4) NOT NULL,
ilosc_nosnikow NUMBER(1) CONSTRAINT plyta_ilosc_nosnikow CHECK  (ilosc_nosnikow <> 0) ,
indeks NUMBER(8) UNIQUE,
dystrybutor VARCHAR2(50)

);

CREATE TABLE plyta_wykonawca
(id_osoby NUMBER(6)  CONSTRAINT   ply_wyk_zes_os_id_fk REFERENCES Osoba (id_osoby),
id_zespolu NUMBER(6) CONSTRAINT  ply_wyk_os_zesp_id_fk REFERENCES Zespol (id_zespolu),
id_plyta NUMBER(6) CONSTRAINT plyta_wyko_plyta_id_fk REFERENCES Plyta(id_plyta)
);

CREATE TABLE Utwory
(id_plyta NUMBER(6) CONSTRAINT utwory_plyta_id_plyt_fk REFERENCES Plyta,
numer_piosenki NUMBER(2) ,
tytul_piosenki VARCHAR2(100)
);




INSERT INTO Plyta_rodzaj
(id_plyta_rodzaj, nazwa_plyta_rodzaj)
VALUES
(1,'CD')
;

INSERT INTO Plyta_rodzaj
(id_plyta_rodzaj, nazwa_plyta_rodzaj)
VALUES
(2,'Winyl')
;

INSERT INTO Gatunek
(id_gatunek, nazwa_gatunek)
VALUES
(1, 'ROCK' );

INSERT INTO Gatunek
(id_gatunek, nazwa_gatunek)
VALUES
(2, 'POP' );

INSERT INTO Gatunek
(id_gatunek, nazwa_gatunek)
VALUES
(3, 'BLUES' );

INSERT INTO Gatunek
(id_gatunek, nazwa_gatunek)
VALUES
(4, 'JAZZ' );

INSERT INTO Gatunek
(id_gatunek, nazwa_gatunek)
VALUES
(5, 'TRASH METAL' );

INSERT INTO Gatunek
(id_gatunek, nazwa_gatunek)
VALUES
(6, 'LATINO POP' );

INSERT INTO Gatunek
(id_gatunek, nazwa_gatunek)
VALUES
(7, 'RAP' );

INSERT INTO Gatunek
(id_gatunek, nazwa_gatunek)
VALUES
(8, 'ROCK AND ROLL' );

INSERT INTO Gatunek
(id_gatunek, nazwa_gatunek)
VALUES
(9, 'REGGAE' );

INSERT INTO Gatunek
(id_gatunek, nazwa_gatunek)
VALUES
(10, 'DISCO POLO' );

INSERT INTO Gatunek
(id_gatunek, nazwa_gatunek)
VALUES
(11, 'POP ROCK' );

INSERT INTO Gatunek
(id_gatunek, nazwa_gatunek)
VALUES
(12, 'BIGBIT' );

INSERT INTO Gatunek
(id_gatunek, nazwa_gatunek)
VALUES
(13, 'SKIFFLE' );

INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(1, 'Best Metal Performance','One' , 'WYGRANA', 1990);

INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(2, 'Latin Music Awards ??? zesp???? i p??yta roku','Empezar Desde Cero' , 'WYGRANA', 2007);

INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(3, 'Album roku hip-hop','Holizm' , 'NOMINACJA', 2016);


INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(4, 'Album roku pop','Jak tam jest' , 'NOMINACJA', 2012);

INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(5, 'Grammy Hall of Fame','What a Wonderful World' , 'WYGRANA', 1967);

INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(6, 'Nagroda Grammy: Nagranie roku ','Strangers in The Night' , 'WYGRANA', 1967);


INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(7, 'Academy Award for Best Original Score ','Let It Be' , 'WYGRANA', 1970);


INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(8, 'VIVA Comet 2012: Przeb??j Roku ','Papieros' , 'NOMINACJA', 2012);


INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(9, '??ret hit ','Fairytales' , 'NOMINACJA', 2009);


INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(10, 'Nagroda Grammy: Hall of Fame ','Back in Black' , 'WYGRANA', 2013);

INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(11, 'przeboj programu Disco Polo Live ','Przez twe oczy zielone' , 'WYGRANA', 2016);


INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(12, 'Nagroda NME: Najlepszy utw??r ','Shake It Out' , 'WYGRANA', 2012);

INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(13, 'Latin Grammy Award for Best Pop Vocal Album','Tu Veneno' , 'NOMINACJA', 2001);


INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(14, 'Nagroda iHeartRadio Much Music Video: Best Artist','livin la vida loca' , 'WYGRANA', 1999);

INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(15, 'Best rap song from Encore','Mockingbird' , 'NOMINACJA', 2006);


INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(16, 'Nagroda Grammy: Najlepsza piosenka roku','Thinking out loud' , 'WYGRANA', 2016);

INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(17, ' Billboard Music Awards Album of the Year','Let Go' , 'NOMINACJA', 2002);


INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(18, '  World Music Award  Bestselling Spanish Artist','Amar es lo que quiero' , 'WYGRANA', 2014);

INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(19, '  Nagroda Super Jedynek Zesp??l :','Dziewczyny z byle kim nie ta??cz??' , 'NOMINACJA', 2016);

INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(20, 'g????wna nagroda na Festiwalu w Opolu :','Bia??y krzy??' , 'WYGRANA', 1969);

INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(21, 'Nagrody Prezydenta Miasta Gda??ska','Dziedzinia Kultury' , 'WYGRANA', 2010);

INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(22, 'Fryderyki : Autor roku','Nic nie mo??e wiecznie trwa??' , 'NOMINACJA', 1997);

INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(23, 'Fryderyki : Album roku -rock','Nic nie boli tak jak ??ycie' , 'NOMINACJA', 1997);

INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(24, ' Fryderyki:Album roku pop ','Inside Story' , 'NOMINACJA', 2005);

INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(25, 'Nuestro Award Artist of the Year ','Extranjera' , 'WYGRANA', 2012);

INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(26, 'TVyNovelas Award for Best Young Lead Actress ','Nie igraj z Anio??em' , 'WYGRANA', 2009);

INSERT INTO Nagrody
(id_nagrody, kategoria_nagrody, nomianacja_nagrody, wynik_nagrody, rok_nagrody)
VALUES
(27, 'Nagroda Grammy: Najlepsze m??skie wokalne wykonanie  ','Double Fantasy' , 'WYGRANA', 1982);

INSERT INTO Kraj
(id_kraju, panstwo, kontynent, kod_numeryczny, kod_ISO )
VALUES
(1, 'Stany Zjednoczone','Ameryka P????nocna',840,'ISO 3166-2:US');

INSERT INTO Kraj
(id_kraju, panstwo, kontynent, kod_numeryczny, kod_ISO )
VALUES
(2, 'Meksyk','Ameryka P????nocna',484,'ISO 3166-2:MX');

INSERT INTO Kraj
(id_kraju, panstwo, kontynent, kod_numeryczny, kod_ISO )
VALUES
(3, 'Wielka Brytania','Europa',826,'ISO 3166-2:GB');

INSERT INTO Kraj
(id_kraju, panstwo, kontynent, kod_numeryczny, kod_ISO )
VALUES
(4, 'Australia','Australia',936,'ISO 3166-2:AU');

INSERT INTO Kraj
(id_kraju, panstwo, kontynent, kod_numeryczny, kod_ISO )
VALUES
(5, 'Urugwaj','Ameryka Po??udniowa',858,'ISO 3166-2:UY');

INSERT INTO Kraj
(id_kraju, panstwo, kontynent, kod_numeryczny, kod_ISO )
VALUES
(6, 'Portoryko','Ameryka ??rodkowa',630,'ISO 3166-2:PR');

INSERT INTO Kraj
(id_kraju, panstwo, kontynent, kod_numeryczny, kod_ISO )
VALUES
(7, 'Kanada','Ameryka P????nocna',124,'ISO 3166-2:CA');

INSERT INTO Kraj
(id_kraju, panstwo, kontynent, kod_numeryczny, kod_ISO )
VALUES
(8, 'Hiszpania','Europa',724,'ISO 3166-2:ES');


INSERT INTO Kraj
(id_kraju, panstwo, kontynent, kod_numeryczny, kod_ISO )
VALUES
(9, 'Rosja','Europa',643,'ISO 3166-2:RU');

INSERT INTO Kraj
(id_kraju, panstwo, kontynent, kod_numeryczny, kod_ISO )
VALUES
(10, 'W??ochy','Europa',380,'ISO 3166-2:IT');

INSERT INTO Kraj
(id_kraju, panstwo, kontynent, kod_numeryczny, kod_ISO )
VALUES
(11, 'Polska','Europa',616,'ISO 3166-2:PL');



INSERT INTO Osoba
(id_osoby, id_kraju, id_nagrody, id_gatunek,imie_osoby, nazwisko_osoby, data_urodzenia, opis)
VALUES
(1,11,3,7,'Tomasz','Iwanca','28-Jan-1986','Raper znany jako Grubson');


INSERT INTO Osoba
(id_osoby, id_kraju, id_nagrody, id_gatunek,imie_osoby, nazwisko_osoby, data_urodzenia, opis)
VALUES
(2,11,4,2,'Seweryn','Krajewski', '03-Jan-1947',' kompozytor, piosenkarz');

INSERT INTO Osoba
(id_osoby, id_kraju, id_nagrody, id_gatunek,imie_osoby, nazwisko_osoby, data_urodzenia, opis)
VALUES
(3,1,5,4,'Louis Daniel','Armstrong', '04-Aug-1901','tr??bacz , wokalista');


INSERT INTO Osoba
(id_osoby, id_kraju, id_nagrody, id_gatunek,imie_osoby, nazwisko_osoby, data_urodzenia, opis)
VALUES
(4,1,6,4,'Francis Albert','Sinatra', '12-Dec-1915','piosenkarz');

INSERT INTO Osoba
(id_osoby, id_kraju, id_nagrody, id_gatunek,imie_osoby, nazwisko_osoby, data_urodzenia, opis)
VALUES
(5,5,13,6,' Natalia Marisa','Oreiro', '19-May-1977',' aktorka, piosenkarka ');

INSERT INTO Osoba
(id_osoby, id_kraju, id_nagrody, id_gatunek,imie_osoby, nazwisko_osoby, data_urodzenia, opis)
VALUES
(6,6,14,2,' Enrique Mart??n','Morales', '19-Dec-1971','wokalista i aktor znany jako Ricki Martin');

INSERT INTO Osoba
(id_osoby, id_kraju, id_nagrody, id_gatunek,imie_osoby, nazwisko_osoby, data_urodzenia, opis)
VALUES
(7,1,15,7,' Marshall Bruce','Mathers III', '17-Oct-1972','raper, producent oraz aktor znany jako Eminem');

INSERT INTO Osoba
(id_osoby, id_kraju, id_nagrody, id_gatunek,imie_osoby, nazwisko_osoby, data_urodzenia, opis)
VALUES
(8,3,16,2,' Edward Christopher','Sheeran', '17-Feb-1991','piosenkarz, autor tekst??w i producent');


INSERT INTO Osoba
(id_osoby, id_kraju, id_nagrody, id_gatunek,imie_osoby, nazwisko_osoby, data_urodzenia, opis)
VALUES
(9,7,17,1,'Avril Ramona','Lavigne', '27-Sep-1984','piosenkarka, gitarzystka, autorka tekst??w, kompozytorka');



INSERT INTO Osoba
(id_osoby, id_kraju, id_nagrody, id_gatunek,imie_osoby, nazwisko_osoby, data_urodzenia, opis)
VALUES
(10,8,18,6,'David','Bisbal Ferr??', '05-Jun-1979','piosenkarz, autor tekst??w i aktor');

INSERT INTO Osoba
(id_osoby, id_kraju, id_nagrody, id_gatunek,imie_osoby, nazwisko_osoby, data_urodzenia, opis)
VALUES
(11,11,21,12,'Jerzy','Skrzypczyk', '04-Jan-1946','perkusista, kompozytor, wokalista');

INSERT INTO Osoba
(id_osoby, id_kraju, id_nagrody, id_gatunek,imie_osoby, nazwisko_osoby, data_urodzenia, opis)
VALUES
(12,11,22,1,'Andrzej','Mogielnicki', '15-Dec-1948','autor tekst??w piosenek, cz??onek Akademii Fonograficznej ');

INSERT INTO Osoba
(id_osoby, id_kraju, id_nagrody, id_gatunek,imie_osoby, nazwisko_osoby, data_urodzenia, opis)
VALUES
(13,3,24,11,'John Frederick','Porter', '15-Aug-1950','muzyk, kompozytor i tek??ciarz ');

INSERT INTO Osoba
(id_osoby, id_kraju, id_nagrody, id_gatunek,imie_osoby, nazwisko_osoby, data_urodzenia, opis)
VALUES
(14,2,25,6,'Dulce Mar??a','Espinosa Savi????n', '06-Dec-1985','piosenkarka, autorka tekst??w i aktorka');

INSERT INTO Osoba
(id_osoby, id_kraju, id_nagrody, id_gatunek,imie_osoby, nazwisko_osoby, data_urodzenia, opis)
VALUES
(15,2,26,6,'Maite','Perroni Beorlegui', '09-Mar-1983','piosenkarka, autorka tekst??w i aktorka');

INSERT INTO Osoba
(id_osoby, id_kraju, id_nagrody, id_gatunek,imie_osoby, nazwisko_osoby, data_urodzenia, opis)
VALUES
(16,3,27,1,'John Winston Ono','Lennon', '08-Dec-1980',' muzyk, kompozytor, piosenkarz i autor tekst??w');





INSERT INTO Zespol
(id_zespolu, id_kraju, id_nagrody, id_gatunek, nazwa_zespolu, data_zalozenia_zespolu, data_rozwiazania_zespolu)
VALUES
(1,1,1,5,'Metallica',1981,NULL);

INSERT INTO Zespol
(id_zespolu, id_kraju, id_nagrody, id_gatunek, nazwa_zespolu, data_zalozenia_zespolu, data_rozwiazania_zespolu)
VALUES
(2,2,2,6,'RBD',2004,2009);

INSERT INTO Zespol
(id_zespolu, id_kraju, id_nagrody, id_gatunek, nazwa_zespolu, data_zalozenia_zespolu, data_rozwiazania_zespolu)
VALUES
(3,11,NULL,1,'Maanam',1975,2008);

INSERT INTO Zespol
(id_zespolu, id_kraju, id_nagrody, id_gatunek, nazwa_zespolu, data_zalozenia_zespolu, data_rozwiazania_zespolu)
VALUES
(4,11,19,1,'Lady Pank',1981,NULL);

INSERT INTO Zespol
(id_zespolu, id_kraju, id_nagrody, id_gatunek, nazwa_zespolu, data_zalozenia_zespolu, data_rozwiazania_zespolu)
VALUES
(5,1,NULL,3,'The Blues Brothers',1978,NULL);

INSERT INTO Zespol
(id_zespolu, id_kraju, id_nagrody, id_gatunek, nazwa_zespolu, data_zalozenia_zespolu, data_rozwiazania_zespolu)
VALUES
(6,3,7,1,'The Beatles',1960,1970);

INSERT INTO Zespol
(id_zespolu, id_kraju, id_nagrody, id_gatunek, nazwa_zespolu, data_zalozenia_zespolu, data_rozwiazania_zespolu)
VALUES
(7,11,8,11,'Video',2007,NULL);

INSERT INTO Zespol
(id_zespolu, id_kraju, id_nagrody, id_gatunek, nazwa_zespolu, data_zalozenia_zespolu, data_rozwiazania_zespolu)
VALUES
(8,4,10,1,'AC/DC',1973,NULL);

INSERT INTO Zespol
(id_zespolu, id_kraju, id_nagrody, id_gatunek, nazwa_zespolu, data_zalozenia_zespolu, data_rozwiazania_zespolu)
VALUES
(9,11,11,1o,'Akcent',1989,NULL);

INSERT INTO Zespol
(id_zespolu, id_kraju, id_nagrody, id_gatunek, nazwa_zespolu, data_zalozenia_zespolu, data_rozwiazania_zespolu)
VALUES
(10,3,12,11,'Florence and the Machin',2007,NULL);

INSERT INTO Zespol
(id_zespolu, id_kraju, id_nagrody, id_gatunek, nazwa_zespolu, data_zalozenia_zespolu, data_rozwiazania_zespolu)
VALUES
(11,11,20,12,'Czerwone Gitary',1965,NULL);

INSERT INTO Zespol
(id_zespolu, id_kraju, id_nagrody, id_gatunek, nazwa_zespolu, data_zalozenia_zespolu, data_rozwiazania_zespolu)
VALUES
(12,11,23,1,'Budka Suflera',1974,2014);

INSERT INTO Zespol
(id_zespolu, id_kraju, id_nagrody, id_gatunek, nazwa_zespolu, data_zalozenia_zespolu, data_rozwiazania_zespolu)
VALUES
(13,11,24,1,'Porter Band',1979,2002);


INSERT INTO Zespol
(id_zespolu, id_kraju, id_nagrody, id_gatunek, nazwa_zespolu, data_zalozenia_zespolu, data_rozwiazania_zespolu)
VALUES
(14,3,NULL,13,'The Quarrymen',1956,1960);

INSERT INTO zespol_osoba
(id_osoby, id_zespolu)
VALUES
(11,11);

INSERT INTO zespol_osoba
(id_osoby, id_zespolu)
VALUES
(2,11);

INSERT INTO zespol_osoba
(id_osoby, id_zespolu)
VALUES
(12,12);

INSERT INTO zespol_osoba
(id_osoby, id_zespolu)
VALUES
(12,4);

INSERT INTO zespol_osoba
(id_osoby, id_zespolu)
VALUES
(13,13);

INSERT INTO zespol_osoba
(id_osoby, id_zespolu)
VALUES
(13,3);

INSERT INTO zespol_osoba
(id_osoby, id_zespolu)
VALUES
(14,2);

INSERT INTO zespol_osoba
(id_osoby, id_zespolu)
VALUES
(15,2);

INSERT INTO zespol_osoba
(id_osoby, id_zespolu)
VALUES
(16,14);

INSERT INTO zespol_osoba
(id_osoby, id_zespolu)
VALUES
(16,6);



INSERT INTO Plyta
(id_plyta,  id_plyta_rodzaj,  id_gatunek, nazwa_plyty, rok_nagrania, ilosc_nosnikow,indeks,dystrybutor)
VALUES
(1,2,5,'Death Magnetic',2008,2,17771382,'Universal Music Polska');

INSERT INTO Plyta
(id_plyta,  id_plyta_rodzaj,  id_gatunek, nazwa_plyty,  rok_nagrania, ilosc_nosnikow,indeks,dystrybutor)
VALUES
(2,1,6,'Rebels',2008,1,65377468,'Warner Music Poland');

INSERT INTO Plyta
(id_plyta,  id_plyta_rodzaj,  id_gatunek, nazwa_plyty,  rok_nagrania, ilosc_nosnikow,indeks,dystrybutor)
VALUES
(3,1,1,'Z??ota kolekcja: Kocham ci?? kochanie moje / Raz-dwa, raz-dwa',2008,2,65313671,'Warner Music Poland');

INSERT INTO Plyta
(id_plyta, id_plyta_rodzaj,  id_gatunek, nazwa_plyty,  rok_nagrania, ilosc_nosnikow,indeks,dystrybutor)
VALUES
(4,1,1,'Mi??o???? i w??adza ',2016,1,19313436,'Universal Music Polska');

INSERT INTO Plyta
(id_plyta,  id_plyta_rodzaj,  id_gatunek, nazwa_plyty,  rok_nagrania, ilosc_nosnikow,indeks,dystrybutor)
VALUES
(5,1,2,'Jak tam jest',2011,1,12003341,'Sony');

INSERT INTO Plyta
(id_plyta,  id_plyta_rodzaj,  id_gatunek, nazwa_plyty,  rok_nagrania, ilosc_nosnikow,indeks,dystrybutor)
VALUES
(6,2,3,'Briefcase Full Of Blues ',1978,1,19459011,'Jawi');


INSERT INTO Plyta
(id_plyta,  id_plyta_rodzaj,  id_gatunek, nazwa_plyty,  rok_nagrania, ilosc_nosnikow,indeks,dystrybutor)
VALUES
(7,1,4,'The Essential Louis Armstrong',1970,1,67996148,'CD-Contact Grzegorz Jasi??ski');

INSERT INTO Plyta
(id_plyta,  id_plyta_rodzaj,  id_gatunek, nazwa_plyty,  rok_nagrania, ilosc_nosnikow,indeks,dystrybutor)
VALUES
(8,2,4,'The Very Best Of Frank Sinatra',2016,1,19836010,'Universal Music Polska');

INSERT INTO Plyta
(id_plyta,  id_plyta_rodzaj,  id_gatunek, nazwa_plyty,  rok_nagrania, ilosc_nosnikow,indeks,dystrybutor)
VALUES
(9,1,1,'Love',2006,1,67816866,'Universal Music Polska');

INSERT INTO Plyta
(id_plyta,  id_plyta_rodzaj,  id_gatunek, nazwa_plyty,  rok_nagrania, ilosc_nosnikow,indeks,dystrybutor)
VALUES
(10,1,7,'Holizm',2015,1,16718180,'Mystic Production');


INSERT INTO Plyta
(id_plyta,  id_plyta_rodzaj,  id_gatunek, nazwa_plyty,  rok_nagrania, ilosc_nosnikow,indeks,dystrybutor)
VALUES
(11,1,2,'Doskonale wszystko jedno ',2016,1,19526478,'Universal Music Polska');


INSERT INTO Plyta
(id_plyta,  id_plyta_rodzaj,  id_gatunek, nazwa_plyty,  rok_nagrania, ilosc_nosnikow,indeks,dystrybutor)
VALUES
(12,2,1,'Back In Black',2009,1,67317530,'Sony Music Entertainment');

INSERT INTO Plyta
(id_plyta,  id_plyta_rodzaj,  id_gatunek, nazwa_plyty,  rok_nagrania, ilosc_nosnikow,indeks,dystrybutor)
VALUES
(13,1,10,'Diamentowa kolekcja disco polo: Akcent',2014,1,16092198,'Universal Music Polska');

INSERT INTO Plyta
(id_plyta,  id_plyta_rodzaj,  id_gatunek, nazwa_plyty,  rok_nagrania, ilosc_nosnikow,indeks,dystrybutor)
VALUES
(14,2,11,'Ceremonials',2011,1,10783658,'Universal Music Polska');

INSERT INTO Plyta
(id_plyta,  id_plyta_rodzaj,  id_gatunek, nazwa_plyty,  rok_nagrania, ilosc_nosnikow,indeks,dystrybutor)
VALUES
(15,1,2,'Tu Veneno',2001,1,12482399,'Sony');

INSERT INTO Plyta
(id_plyta,  id_plyta_rodzaj,  id_gatunek, nazwa_plyty,  rok_nagrania, ilosc_nosnikow,indeks,dystrybutor)
VALUES
(16,1,6,'La Historia',2001,1,62942928,'Sony Music Entertainment');

INSERT INTO Plyta
(id_plyta,  id_plyta_rodzaj,  id_gatunek, nazwa_plyty,  rok_nagrania, ilosc_nosnikow,indeks,dystrybutor)
VALUES
(17,2,7,'Recovery',2010,2,14134746,'Universal Music Polska');

INSERT INTO Plyta
(id_plyta,  id_plyta_rodzaj,  id_gatunek, nazwa_plyty,  rok_nagrania, ilosc_nosnikow,indeks,dystrybutor)
VALUES
(18,1,2,'Divide ',2017,1,20876630,'Warner Music Poland');

INSERT INTO Plyta
(id_plyta,  id_plyta_rodzaj,  id_gatunek, nazwa_plyty,  rok_nagrania, ilosc_nosnikow,indeks,dystrybutor)
VALUES
(19,1,1,'Goodbye Lullaby',2011,1,60240200,'Sony Music Entertainment');

INSERT INTO Plyta
(id_plyta,  id_plyta_rodzaj,  id_gatunek, nazwa_plyty,  rok_nagrania, ilosc_nosnikow,indeks,dystrybutor)
VALUES
(20,1,6,'David Bisbal',2006,1,15067371,'Universal');

INSERT INTO Plyta
(id_plyta,  id_plyta_rodzaj,  id_gatunek, nazwa_plyty,  rok_nagrania, ilosc_nosnikow,indeks,dystrybutor)
VALUES
(21,1,11,'To W??a??nie My',2011,1,60637543,'Warner Music Poland');


INSERT INTO plyta_wykonawca
(id_osoby,id_zespolu, id_plyta)
VALUES
(NULL,1,1);

INSERT INTO plyta_wykonawca
(id_osoby,id_zespolu, id_plyta)
VALUES
(NULL,2,2);

INSERT INTO plyta_wykonawca
(id_osoby,id_zespolu, id_plyta)
VALUES
(NULL,3,3);

INSERT INTO plyta_wykonawca
(id_osoby,id_zespolu, id_plyta)
VALUES
(NULL,4,4);

INSERT INTO plyta_wykonawca
(id_osoby,id_zespolu, id_plyta)
VALUES
(2,NULL,5);

INSERT INTO plyta_wykonawca
(id_osoby,id_zespolu, id_plyta)
VALUES
(NULL,5,6);

INSERT INTO plyta_wykonawca
(id_osoby,id_zespolu, id_plyta)
VALUES
(3,NULL,7);

INSERT INTO plyta_wykonawca
(id_osoby,id_zespolu, id_plyta)
VALUES
(4,NULL,8);

INSERT INTO plyta_wykonawca
(id_osoby,id_zespolu, id_plyta)
VALUES
(NULL,6,9);

INSERT INTO plyta_wykonawca
(id_osoby,id_zespolu, id_plyta)
VALUES
(1,NULL,10);

INSERT INTO plyta_wykonawca
(id_osoby,id_zespolu, id_plyta)
VALUES
(NULL,7,11);

INSERT INTO plyta_wykonawca
(id_osoby,id_zespolu, id_plyta)
VALUES
(NULL,8,12);

INSERT INTO plyta_wykonawca
(id_osoby,id_zespolu, id_plyta)
VALUES
(NULL,9,13);

INSERT INTO plyta_wykonawca
(id_osoby,id_zespolu, id_plyta)
VALUES
(NULL,10,14);

INSERT INTO plyta_wykonawca
(id_osoby,id_zespolu, id_plyta)
VALUES
(5,NULL,15);

INSERT INTO plyta_wykonawca
(id_osoby,id_zespolu, id_plyta)
VALUES
(6,NULL,16);

INSERT INTO plyta_wykonawca
(id_osoby,id_zespolu, id_plyta)
VALUES
(7,NULL,17);

INSERT INTO plyta_wykonawca
(id_osoby,id_zespolu, id_plyta)
VALUES
(8,NULL,18);

INSERT INTO plyta_wykonawca
(id_osoby,id_zespolu, id_plyta)
VALUES
(9,NULL,19);

INSERT INTO plyta_wykonawca
(id_osoby,id_zespolu, id_plyta)
VALUES
(10,NULL,20);
INSERT INTO plyta_wykonawca
(id_osoby,id_zespolu, id_plyta)
VALUES
(NULL,11,21);

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(1,1,'That Was Just Your Life');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(1,2,'The End Of The Line');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(1,3,'Broken, Beat & Scarred');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(1,4,'The Day That Never Comes');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(1,5,'All Nightmare Long');


INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(2,1,'Tu Amor');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(2,2,'Wanna Play');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(2,3,'My Philosophy');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(2,4,'Connected');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(2,5,'I Wanna Be The Rain');


INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(3,1,'Kocham Ci?? Kochanie Moje');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(3,2,'Opr??cz B????kitnego Nieba');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(3,3,'Luciolla');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(3,4,'Milo???? Od Pierwszego Wejrzenia');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(3,5,'Sza?? Niebieskich Cia??');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(4,1,'Mi??o????');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(4,2,'W??adza');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(4,3,'Troch?? niepami??ci');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(4,4,'Lizusy');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(4,5,'Z niczego co??');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(5,1,'Widok ze wzgorza');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(5,2,'Laweczka');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(5,3,'Dym');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(5,4,'Znowu pada');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(5,5,'Innego dnia');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(6,1,'I Can???t Turn You Loose');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(6,2,'Hey Bartender ')

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(6,3,'Messin??? With The Kid');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(6,4,'Almost');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(6,5,'Rubber Biscuit');


INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(7,1,'Aint Misbehavin');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(7,2,'The Heebie Jeebies Are Rockin')

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(7,3,'Jubilee');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(7,4,'Jazz Lips');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(7,5,'Wild Man Blues');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(8,1,'I???ve Got You Under My Skin');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(8,2,'Cheek To Cheek')

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(8,3,'My Funny Valentine');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(8,4,'April In Paris');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(8,5,'Embraceable You');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(9,1,'Because');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(9,2,'Get Back')

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(9,3,'Glass Onion');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(9,4,'Eleanor Rigby Julia');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(9,5,'I Am The Walrus');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(10,1,'Intro');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(10,2,'Sanepid')

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(10,3,'Ciep??e brzmienie Kalifornii');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(10,4,'Cwaniaczek');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(10,5,'Mam talerz show 1');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(11,1,'Wszystko jedno');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(11,2,'Kto?? nowy')

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(11,3,'Lajtowy');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(11,4,'Na okazj?? lepsz??');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(11,5,'Alay 2016');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(12,1,'Hells Bells');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(12,2,'Shoot To Thrill')

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(12,3,'What Do You Do For Money Honey ');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(12,4,'Givin The Dog A Bone');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(12,5,'Let Me Put My Love Into You');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(13,1,'Tabu Tibu');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(13,2,'Ch??opak z gitar??')

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(13,3,'??ycie to s?? chwile');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(13,4,'Wspomnienie');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(13,5,'To w??a??nie ja');


INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(14,1,'Only If for a Night');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(14,2,'Shake It Out')

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(14,3,'What the Water Gave Me');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(14,4,'Never Let Me Go');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(14,5,'Breaking Down');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(15,1,'Tu Veneno');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(15,2,'Rio De La Plata')

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(15,3,'Como Te Olvido');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(15,4,'Luna Brava');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(15,5,'Aburrida');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(16,1,'maria');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(16,2,'vuelve')

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(16,3,'bella');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(16,4,'la bomba');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(16,5,'a medio vivir');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(17,1,'Cold Wind Blows');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(17,2,'Talkin 2 Myself')

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(17,3,'On Fire');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(17,4,'Wont Back Down');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(17,5,'W.T.P. Eminem');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(18,1,'Eraser');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(18,2,'Castle On The Hill')

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(18,3,'Dive');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(18,4,'Perfect');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(18,5,'Galway Girl');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(19,1,'Black Star');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(19,2,'What the Hell')

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(19,3,'Push');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(19,4,'Wish You Were Here');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(20,5,'Smile');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(20,1,'The Sun Aint Gonna Shine Anymore');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(20,2,'Me Derrumbo')

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(20,3,'Oye El Boom');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(20,4,'Buleria');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(20,5,'D??gale');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(21,1,'To w??a??nie my');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(21,2,'Historia jednej znajomo??ci')

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(21,3,'Kwiaty we w??osach');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(21,4,'P??ona g??ry , p??ona lasy');

INSERT INTO Utwory
(id_plyta, numer_piosenki, tytul_piosenki)
VALUES
(21,5,'Anna Maria');
