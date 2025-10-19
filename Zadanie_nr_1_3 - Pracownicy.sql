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
	-- zadanie a.Policz, ile jest rekordów w tabeli (po id).
SELECT COUNT(ID) AS ID FROM aggregates.batman;
	-- b. Policz, ile jest rekordów z wiekiem.
		-- Wynik 8 rekordów jeden rekord pusty pomijany
SELECT COUNT(AGE) AS AGE FROM aggregates.batman;
	-- c_1. Ilu mężczyzn ma więcej niż 40 lat?
SELECT COUNT(sex) AS Mężczyzni_powyżej_40_lat FROM aggregates.batman
WHERE sex = "M" AND age > 40; 
    -- c_2. ... Dodatkowo poza zadaniem: wyświetlam pozycje z danymi
SELECT first_name, last_name, age FROM aggregates.batman
WHERE sex = "M" AND age > 40;
	-- d. Oblicz sumę wszystkich cen
SELECT SUM(price) AS Suma_wszystkich_cen_wynosi FROM aggregates.batman;
	-- e. Oblicz łączny wiek kobiet.
SELECT SUM(age) AS Łączny_wiek_kobiet_to FROM aggregates.batman
WHERE SEX = "F";
	-- f. Podaj łączną wartość komputera i okna
SELECT SUM(price) AS Wartość_pozycji_Komputer_i_Okno FROM aggregates.batman
WHERE gift = "komputer" OR gift = "okno";
	-- g. Podaj maksymalną cenę.
SELECT MAX(price) AS Maksymalna_cena_to FROM aggregates.batman;
	-- h. Podaj najpóźniejszą datę
SELECT MAX(start_date) AS Najpózniejsza_data_to FROM aggregates.batman;
	-- i. Podaj nazwisko rozpoczynające się literą, która jest najbliżej końca alfabetu
SELECT last_name AS Nazwisko_z_konca_alfabetu FROM aggregates.batman
ORDER BY last_name DESC
Limit 1;
	-- j. Podaj minimalną cenę.
SELECT MIN(price) AS Minimalna_cena_to FROM aggregates.batman;
	-- k. Podaj najwcześniejszą datę
SELECT MIN(start_date) AS Najwcześniejsza_data_to FROM aggregates.batman;
	-- l. Podaj nazwisko rozpoczynające się literą, która jest najbliżej początku alfabetu
SELECT last_name AS Nazwisko_z_początku_alfabetu FROM aggregates.batman
ORDER BY last_name ASC
Limit 1;
	-- m. Jednocześnie podaj cenę minimalną oraz maksymalną. Nadaj odpowiednie aliasy.
SELECT MIN(price) AS Minimalna_cena_to, MAX(price) AS Maksymalna_cena_to FROM aggregates.batman;
	-- n. Oblicz różnicę pomiędzy ceną maksymalną, a minimalną.
SELECT MAX(price) - MIN(price) AS Różnica_ceny_min_i_max_to FROM aggregates.batman;
	-- o. Oblicz średnią wieku. # Bez zaokrągleń
SELECT AVG(age) AS Średni_wiek_to FROM aggregates.batman;
	-- p. Oblicz średnią wieku za pomocą COUNT oraz SUM.
SELECT SUM(age) / COUNT(age) AS Średni_wiek_to FROM aggregates.batman;
	-- q. Oblicz średni wiek dla kobiet oraz średni wiek dla mężczyzn. # Bez zaokrągleń
SELECT
	CASE
		WHEN sex = "F" THEN "Kobiety"
        WHEN sex = "M" THEN "Mężczyźni"
	END AS Płeć,
	AVG(age) AS Średni_wiek
FROM aggregates.batman
GROUP BY Płeć;