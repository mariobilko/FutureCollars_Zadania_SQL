	-- 1. Tworzę Bazę Pracownicy
CREATE DATABASE Pracownicy;
USE Pracownicy;
	-- 2. Tworzę Tabelę Pracownicy
CREATE TABLE Pracownicy (
	ID INTEGER PRIMARY KEY,
	Imię VARCHAR (25), 
	Nazwisko VARCHAR (25),
	Wiek TINYINT UNSIGNED,
	Kurs VARCHAR(25)
						);
	-- 3. Zaczytuje bazę z pliku Dane_Zadanie_2.csv
		-- W wartościach wieku (dane typu TINYINT UNSIGNED) dodałem wartość NULL, gdzie występuje pusty rekord,
		-- inaczej MySQL Workbench nie zaczyta takiej pozycji z pliku csv
		-- reszta danych zgodna ze zródłem pliku Bazy_danych_i_manipulacja_danymi_cd_zadania_1-5_-_dane.xlsx
-- Loading...
	-- 4. Wyświetlam listę pracowników w wieku 28 lat.
SELECT * FROM pracownicy.pracownicy
WHERE Wiek = 28;
	-- 5. Wyświetlam listę pracowników w wieku 30 lat i młodszych.
SELECT * FROM pracownicy.pracownicy
WHERE Wiek <= 30;
	-- 6. Wyświetlam Wyświetl listę pracowników, których nazwisko zawiera „ski”.
SELECT * FROM pracownicy.pracownicy
WHERE Nazwisko LIKE "%ski";
	-- 7. Wyświetlam listę pracowników z ID: 1,4,7,18,20.
SELECT * FROM pracownicy.pracownicy
WHERE ID IN (1,4,7,18,20);
	-- 8. Wyświetlam listę pracowników z wprowadzonymi kompletnymi danymi.
	   -- PS pomijam wartości puste typu "" oraz NULL w kolumnie Wiek
SELECT * FROM pracownicy.pracownicy
WHERE ID <> "" AND Imię <> "" AND Nazwisko <> "" AND WIEK IS NOT NULL AND Kurs <>"" ;
	-- 9. Wyświetlam wszystkich pracowników, którzy nie prowadzą kursu DS
SELECT * FROM pracownicy.pracownicy
WHERE Kurs NOT LIKE  "DS%";