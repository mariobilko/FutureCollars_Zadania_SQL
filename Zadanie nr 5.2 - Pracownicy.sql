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
	-- 3. Zaczytuje bazę z pliku Dane_Zadanie_5.csv
		-- W wartościach wieku (dane typu TINYINT UNSIGNED) dodałem wartość NULL, gdzie występują puste rekordy,
		-- inaczej MySQL Workbench nie zaczyta takiej pozycji z pliku csv
		-- reszta danych zgodna ze zródłem pliku Bazy_danych_i_manipulacja_danymi_cd_zadania_1-5_-_dane.xlsx
-- Loading...
	-- 4. Wyświetlam listę pracowników w kolumnie Imię, eliminując powtarzające się pozycje Imion.
    -- Wynik to unikalne rekordy imion
SELECT DISTINCT IMIĘ
FROM pracownicy.pracownicy;
-- 5. Wyświetlam listę pracowników w kolumnie Nazwisko, eliminując powtarzające się pozycje Nazwisk.
-- Wynik to unikalne rekordy Nazwisk
SELECT DISTINCT NAZWISKO
FROM pracownicy.pracownicy;
	-- 6. Wyświetlam kursy prowadzone przez pracowników o Nazwisku: „Kowalczyk”.
SELECT * FROM pracownicy.pracownicy
WHERE Nazwisko LIKE "Kowalczyk" AND Kurs <> "";
	-- 7. Wyświetlam listę pracowników, dla których nie znamy wieku.
SELECT * FROM pracownicy.pracownicy
WHERE Wiek IS NULL;
	-- 8a. Wyświetlam wiek pracowników o Imieniu „Patryk”.
SELECT * FROM pracownicy.pracownicy
WHERE Imię LIKE "Patryk" AND Wiek IS NOT NULL;
	-- 8b. ...lub sam wiek i imię w takiej kolejności
SELECT Wiek, Imię FROM pracownicy.pracownicy
WHERE Imię LIKE "Patryk" AND Wiek IS NOT NULL;
	-- 9. Zmieniam nazwę tabeli z  „Pracownicy” na „Mentorzy”.
ALTER TABLE Pracownicy.pracownicy RENAME TO Mentorzy;