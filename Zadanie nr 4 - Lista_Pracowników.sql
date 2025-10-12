Create DATABASE Lista_Pracowników; -- Utworzenie bazy danych Lista_Pracowników
USE Lista_Pracowników; -- Wybranie bieżącej bazy, z którą będziemy pracować jak domyślną do wykonywania operacji
-- Utworzenie tabeli Pracownicy w bazie danych Lista_Pracowników z kolumnami ID, Imię, Stanowisko, Dział * Nie używam spacji tylko podkreślnika
CREATE TABLE Pracownicy (
    ID INTEGER PRIMARY KEY, -- Wartość danych typu Integer. Kolumna z danymi służącymi do jednoznacznej identyfikacji każdego rekordu w tabeli (Ogranicznik <<Klucz podstawowy>> "PRIMARY KEY")
    Imię TEXT NOT NULL, -- Wartość danych to tekst, kolumna ma ogranicznik "NOT NULL" - wartość kolumny nie może być pusta
    Nazwisko TEXT NOT NULL, -- Wartość danych to tekst, kolumna ma ogranicznik "NOT NULL" - wartość kolumny nie może być pusta
    Stanowisko TEXT NOT NULL, -- Wartość danych to tekst, kolumna ma ogranicznik "NOT NULL" - wartość kolumny nie może być pusta
    Dział TEXT NOT NULL -- Wartość danych to tekst, kolumna ma ogranicznik "NOT NULL" - wartość kolumny nie może być pusta
);
-- Zasilenie Tabeli Pracownicy danymi w kolumnach ID, Imię, Stanowisko, Dział
INSERT INTO Pracownicy (ID, Imię, Nazwisko, Stanowisko, Dział)
VALUES
(1,'Jan', 'Kowalski', 'Spawacz', 'Pracownicy fizyczni'),
(2, 'Kazimierz', 'Nowakowski', 'Elektryk', 'Pracownicy fizyczni'),
(3, 'Roman', 'Nowicki', 'Księgowy', 'Pracownicy umysłowi'),
(4, 'Anna', 'Głowacka', 'Kierownik ds. Transportu', 'Stanowiska kierownicze'),
(5, 'Dominik', 'Kałuża', 'Dyrektor finansowy', 'Zarząd'),
(6, 'Sylwia', 'Osowska', 'Prezes Zarządu', 'Zarząd'),
(7, 'Mariusz', 'Zasada', 'Kierowca', 'Pracownicy pracownicyfizyczni'),
(8, 'Ryszard', 'Śliwiński', 'Kierownik ds. Produkcji', 'Stanowiska kierownicze'),
(9, 'Ewa', 'Sosna', 'Specjalista ds. kadr i płac', 'Pracownicy umysłowi'),
(10, 'Aleksander', 'Gruszka', 'Pracownik produkcji', 'Pracownicy fizyczni');
-- Wyświetlenie wszystkich pozycji z danych
SELECT * FROM Lista_Pracowników.Pracownicy;
SET sql_mode = ''; -- Rozwiązanie na problem poniżej: w wierszu ADD COLUMN Data_zatrudnienia DATE NOT NULL; Po dodaniu parametru NOT NULL wyskakiwał błąd: Error Code: 1292. Incorrect date value: '0000-00-00'
-- Dodanie kolumny Data_zatrudnienia w tabeli Pracownicy
ALTER TABLE Pracownicy
ADD COLUMN Data_zatrudnienia DATE NOT NULL; -- Z parametrem NOT NULL występuje błąd: Error Code: 1292. Incorrect date value: '0000-00-00' for column 'Data_zatrudnienia' at row 1
-- Dodanie nowego pracownika do tabeli Pracownicy ze wszystkimi danymi w poszczególnych kolumnach
INSERT INTO Pracownicy (ID, Imię, Nazwisko, Stanowisko, Dział, Data_zatrudnienia)
VALUES
(11, 'Roman', 'Domagała', 'Dozorca', 'Pracownicy fizyczni', '2025-10-01');
-- Wyświetlenie wszystkich pozycji z danych
SELECT * FROM Lista_Pracowników.Pracownicy;
SET SQL_SAFE_UPDATES = 0; -- Odblokowanie zapytania UPDATE
-- Dodanie (aktualizacja) wartości w kolumnie Data_zatrudnienia zawartej w tabeli Pracownicy od (ID) pozycji 1 do 10
UPDATE Pracownicy
SET Data_zatrudnienia = '2014-02-01'
WHERE ID =1;
UPDATE Pracownicy
SET Data_zatrudnienia = '2015-04-01'
WHERE ID =2;
UPDATE Pracownicy
SET Data_zatrudnienia = '2016-08-01'
WHERE ID =3;
UPDATE Pracownicy
SET Data_zatrudnienia = '2017-06-01'
WHERE ID =4;
UPDATE Pracownicy
SET Data_zatrudnienia = '2018-03-01'
WHERE ID =5;
UPDATE Pracownicy
SET Data_zatrudnienia = '2019-12-01'
WHERE ID =6;
UPDATE Pracownicy
SET Data_zatrudnienia = '2020-10-01'
WHERE ID =7;
UPDATE Pracownicy
SET Data_zatrudnienia = '2021-09-01'
WHERE ID =8;
UPDATE Pracownicy
SET Data_zatrudnienia = '2022-11-01'
WHERE ID =9;
UPDATE Pracownicy
SET Data_zatrudnienia = '2023-01-01'
WHERE ID =10;
-- Wyświetlenie wszystkich pozycji z danych
SELECT * FROM Lista_Pracowników.Pracownicy;