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
	-- 3. Zaczytuje bazę z pliku Dane_Zadanie_3.csv
		-- W wartościach wieku (dane typu TINYINT UNSIGNED) dodałem wartość NULL, gdzie występuje pusty rekord,
		-- inaczej MySQL Workbench nie zaczyta takiej pozycji z pliku csv
		-- reszta danych zgodna ze zródłem pliku Bazy_danych_i_manipulacja_danymi_cd_zadania_1-5_-_dane.xlsx
-- Loading...
	-- 4. Wyświetlam listę pracowników o Nazwisku: KOWALCZYK.
SELECT * FROM pracownicy.pracownicy
WHERE Nazwisko Like "KOWALCZYK";
	-- 5. Wyświetlam listę pracowników w wieku od 30 lat do 40 lat.
SELECT * FROM pracownicy.pracownicy
WHERE Wiek BETWEEN 30 AND 40;
	-- 6. Wyświetlam listę pracowników, których nazwisko nie zawiera „and”.
SELECT * FROM pracownicy.pracownicy
WHERE Nazwisko NOT LIKE "%and%";
	-- 7. Wyświetl listę pracowników z ID od 1 do 7.
SELECT * FROM pracownicy.pracownicy
WHERE ID BETWEEN 1 AND 7;
	-- 8. Wyświetlam listę pracowników z brakującymi danymi.
SELECT * FROM pracownicy.pracownicy
WHERE ID ="" OR Imię = "" OR Nazwisko = "" OR WIEK IS NULL OR Kurs = "" ;
	-- 9. WyświetlAM wszystkich pracowników, którzy nie prowadzą żadnego kursu.
SELECT * FROM pracownicy.pracownicy
WHERE Kurs = "" ;