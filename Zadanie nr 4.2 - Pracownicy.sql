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
	-- 3. Zaczytuje bazę z pliku Dane_Zadanie_4.csv
		-- W wartościach wieku (dane typu TINYINT UNSIGNED) dodałem wartość NULL, gdzie występuje pusty rekord,
		-- inaczej MySQL Workbench nie zaczyta takiej pozycji z pliku csv
		-- reszta danych zgodna ze zródłem pliku Bazy_danych_i_manipulacja_danymi_cd_zadania_1-5_-_dane.xlsx
-- Loading...
	-- 4. Wyświetlam listę pracowników o Imieniu: Anna.
SELECT * FROM pracownicy.pracownicy
WHERE Imię Like "Anna";
	-- 5. Wyświetlam listę pracowników z brakującą daną w kolumnie Imię.
SELECT * FROM pracownicy.pracownicy
WHERE Imię = "";
	-- 6. Wyświetlam kursy prowadzone przez pracowników w wieku od 30 lat do 40 lat.
SELECT * FROM pracownicy.pracownicy
WHERE Wiek BETWEEN 30 AND 40 And Kurs <>"";
	-- 7. Wyświetl kolumnę wiek pracowników z ID od 1 do 7.
SELECT Wiek FROM pracownicy.pracownicy
WHERE ID BETWEEN 1 AND 7;
	-- 8. Wyświetl listę pracowników z brakującymi danymi w kolumnie wiek.
SELECT * FROM pracownicy.pracownicy
WHERE WIEK IS NULL;
	-- 9. Zmieniam nazwę kolumny „Kurs” na „Szkolenie”.
ALTER TABLE pracownicy.pracownicy
RENAME COLUMN Kurs to Szkolenie;