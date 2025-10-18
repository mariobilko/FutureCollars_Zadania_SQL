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
	-- 3. Zaczytuje bazę z pliku Dane_Zadanie_1.csv
-- Loading...
	-- 4. Wyświetlam listę pracowników starszych niż 30
SELECT * FROM pracownicy.pracownicy
WHERE WIEK >30;
	-- 5. Wyświetlam listę pracowników młodszych niż 30
SELECT * FROM pracownicy.pracownicy
WHERE WIEK <30;
	-- 6. Wyświetlam listę pracowników, których nazwisko zaczyna się na „K” i kończy na „ki”
SELECT * FROM pracownicy.pracownicy
WHERE Nazwisko Like "K%ki";
	-- 7. Zmieniam nazwę kolumny „ID” na „NR”
ALTER TABLE pracownicy.pracownicy
RENAME COLUMN ID to NR;
	-- 8. Wyświetlam pozycje, w których są puste pola
	-- PS nie są to wartości NULL i nie ma takich pozycji w tym zadaniu - bazie danych
SELECT * FROM pracownicy.pracownicy
	WHERE NR ="" OR Imię ="" OR Nazwisko ="" OR Wiek ="" or Kurs ="";
	-- 9. Wyświetlam wszystkich pracowników z kursu „Java”.
SELECT * FROM pracownicy.pracownicy
WHERE Kurs Like 'Java';