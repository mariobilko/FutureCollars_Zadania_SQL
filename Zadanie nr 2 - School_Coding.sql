CREATE DATABASE School_Coding; -- Utworzenie bazy danych School_Coding
USE School_Coding; -- Wybranie bieżącej bazy, z którą będziemy pracować jak domyślną do wykonywania operacji
-- Utworzenie tabeli Mentors w bazie danych School_Coding z kolumnami ID, Imię, Nazwisko, Specjalizacja, Data_Zatrudnienia, Data_Zwolnienia * Nie używam spacji tylko podkreślnika
CREATE TABLE Mentors (
ID INTEGER PRIMARY KEY, -- Wartość danych typu Integer. Kolumna z danymi służącymi do jednoznacznej identyfikacji każdego rekordu w tabeli (Ogranicznik <<Klucz podstawowy>> "PRIMARY KEY")
Imię TEXT NOT NULL, -- Wartość danych to tekst, kolumna ma ogranicznik "NOT NULL" - wartość kolumny nie może być pusta
Nazwisko TEXT NOT NULL, -- Wartość danych to tekst, kolumna ma ogranicznik "NOT NULL" - wartość kolumny nie może być pusta
Specjalizacja TEXT NOT NULL, -- Wskazane dodatkowo użycie (Ogranicznika) Constraints:"UNIQUE" niestety wtedy występuje błąd:
-- Error Code: 1170. BLOB/TEXT column 'Specjalizacja' used in key specification without a key length
Data_Zatrudnienia DATE NOT NULL, -- Wartość danych to data typu YYYY-MM-DD, kolumna ma ogranicznik "NOT NULL" - wartość kolumny nie może być pusta
Data_Zwolnienia DATE -- Wartość danych to data typu YYYY-MM-DD, BEZ NOT NULL Data zwolnienia mogła jeszcze nie zaistnieć
);
-- Zasilenie Tabeli Mentors danymi w kolumnach ID, Imię, Nazwisko, Specjalizacja, Data_Zatrudnienia, Data_Zwolnienia
INSERT INTO Mentors (ID, Imię, Nazwisko, Specjalizacja, Data_Zatrudnienia, Data_Zwolnienia)
VALUES
(1, 'Jan', 'Kowalski', 'Sieci Komputerowe', '2000-05-02', '2025-10-11'),
(2, 'Kazimierz', 'Nowakowski', 'Bazy Danych', '2001-07-21', '2015-02-05'),
(3, 'Roman', 'Nowicki', 'Data Scientist', '2002-04-13', '2016-08-11'),
(4, 'Anna', 'Głowacka', 'Grafika Komputerowa', '2003-03-15', '2017-11-30'),
(5, 'Dominik', 'Kałuża', 'Bezpieczeństwo IT', '2004-08-08', '2018-07-30'),
(6, 'Sylwia', 'Osowska', 'Programowanie C++', '2005-09-22', '2019-04-26'),
(7, 'Mariusz', 'Zasada', 'Programowanie SQL', '2006-12-30', '2020-12-16'),
(8, 'Ryszard', 'Śliwiński', 'Bioinżynieria', '2007-06-11', '2021-05-09'),
(9, 'Ewa', 'Sosna', 'Programowanie aplikacji webowych', '2008-09-07', '2022-08-21'),
(10, 'Aleksander', 'Gruszka', 'Sztuczna inteligencja', '2009-11-18', '2023-04-15');
-- -- Wyświetlenie wszystkich pozycji z danych
SELECT * FROM School_Coding.Mentors;
-- Zmiana nazwiska mentora w tabeli Mentors w kolumnie Nazwisko w pozycji (ID) nr 5 wartości bieżącej: "Kałuża" na: "Burza"
SET SQL_SAFE_UPDATES = 0; -- Odblokowanie zapytania UPDATE
UPDATE Mentors
SET Nazwisko = 'Burza'
WHERE ID = 5;
-- Wyświetlenie zmienionej pozycji tj. nr 5
SELECT * FROM School_Coding.Mentors
WHERE ID = 5;
-- Zmiana specjalizacji mentora w tabeli Mentors w kolumnie Specjalizacja w pozycji (ID) nr 9 wartości bieżącej: "Programowanie aplikacji webowych" na: "Programowanie aplikacji mobilnych"
UPDATE Mentors
SET Specjalizacja = 'Programowanie aplikacji mobilnych'
WHERE ID = 9;
-- Wyświetlenie zmienionej pozycji tj. nr 9
SELECT * FROM School_Coding.Mentors
WHERE ID = 9;
-- Dodanie kolumny Wynagrodzenie w tabeli Mentors
ALTER TABLE Mentors
ADD COLUMN Wynagrodzenie DECIMAL(8, 2) NOT NULL; -- Użyłem dla kolumny Wynagrodzenie danych typu Decimal. Ten typ danych pozwala na przechowywanie kwoty po przecinku, co w przypadku wynagrodzenia
-- dosyć często ma miejsce. W tym przypadku Decimal pozwala na przechowanie liczby składającej się z 8 cyfr przed i po przecinku <<Wartość wystarczająca na dane typu wynagrodzenie.
-- Decimal określa też 2 liczby po przecinku - np. na kwotę groszy >> przykład kwoty: 123456,78
-- kolumna ma ogranicznik "NOT NULL" - wartość kolumny nie może być pusta.
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Uzupełnienie wynagrodzenia o kwotę 1000.00 dla (ID) pozycji nr: 1,2,3
UPDATE Mentors
SET Wynagrodzenie = 1000.00
WHERE ID IN (1,2,3);
-- Wyświetlenie (ID) pozycji nr: 1,2,3 po dodaniu kwot wynagrodzenia
SELECT * FROM School_Coding.Mentors
WHERE ID IN (1,2,3);