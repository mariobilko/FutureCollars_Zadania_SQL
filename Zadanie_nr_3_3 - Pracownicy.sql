CREATE DATABASE aggregates;
CREATE TABLE aggregates.batman(
  id INTEGER PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  sex CHAR(1),
  age INTEGER,
  price DOUBLE,
  start_date DATE,
  gift TEXT
);
INSERT INTO aggregates.batman VALUES (1, 'Alicja', 'Rogal', 'F', 16, 100.25,'2020-01-02', 'rower' );
INSERT INTO aggregates.batman VALUES (2, 'Iwona', 'Kowalska', 'F', 33, 56.58, '2020-01-03', 'komputer');
INSERT INTO aggregates.batman VALUES (3, 'Igor', 'Kowalski', 'M', 50, 68.00, '2020-01-04', 'karty');
INSERT INTO aggregates.batman VALUES (4, 'Kamil', 'Juszczak', 'M', 50, 40.87, '2020-01-05', 'piłka'); 
INSERT INTO aggregates.batman VALUES (5, 'Konrad', 'Kowal', 'M', 18, 32.63, '2020-01-06', 'herbata' );
INSERT INTO aggregates.batman VALUES (6, 'Iwona', 'Feniks', 'F', 35, 78.98, '2020-01-07', 'okno' );
INSERT INTO aggregates.batman VALUES (7, 'Robert', 'Lew', 'M', 40, 120.32, '2020-01-08', 'drzwi');
INSERT INTO aggregates.batman VALUES (8, 'Tomasz', 'Nowak', 'M', 60, 150.00, '2020-01-09', 'korona');
INSERT INTO aggregates.batman VALUES (9, 'Aldona', 'Buk', NULL, NULL, 121.25, '2020-01-10', 'wycieczka');
	-- a. Wyświetl imię i nazwisko w jednej kolumnie. Kolumnie nadaj alias „Pracownik”
SELECT CONCAT(first_name, " ", last_name) AS Pracownik
FROM aggregates.batman;
	-- b. Złącz kolumny gift i price tak, aby powstał napis: „rower – cena: ”. Kolumnie nadaj alias: cennik.
SELECT CONCAT(gift, " - cena: ", price) AS Cennik
FROM aggregates.batman;
	-- c. Ponownie wykonaj zadanie 2b – doklej imię i nazwisko pracownika
SELECT CONCAT(gift, " - cena: ", price, " ",first_name, " ", last_name) AS Obdarowani_Pracownicy
FROM aggregates.batman;
	-- d. Wyświetl prezenty. Ich nazwy mają być wyświetlane wielkimi literami.
SELECT UPPER(gift) AS Prezenty_WIELKĄ_literą
FROM aggregates.batman;
	-- e. Wyświetl imiona. Mają być wyświetlane małymi literami.
SELECT LOWER(first_name) AS Imiona_małą_literą
FROM aggregates.batman;
	-- f. Wyświetl nazwiska oraz dodatkową kolumnę „długość” zawierającą informację o liczbie liter w nazwisku.
Select
	last_name AS nazwisko,
	LENGTH(last_name) AS długość
FROM aggregates.batman;
	-- g. Wyświetl pierwsze dwie litery imion.
SELECT SUBSTRING(first_name, 1,2) AS Dwie_pierwsze_litery_imion
FROM aggregates.batman;
	-- h. Wyświetl imię, nazwisko i login użytkownika w formacie: mała litera imienia + 3 pierwsze, małe litery nazwiska.
SELECT
	first_name AS Imię,
	last_name AS Nazwisko,
    CONCAT(
			LOWER(SUBSTRING(first_name, 1,1)),
            LOWER(SUBSTRING(last_name, 1,3))
		  ) AS Login
FROM aggregates.batman;