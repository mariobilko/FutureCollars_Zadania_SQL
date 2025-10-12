CREATE DATABASE Moje_zainteresowania; -- Utworzenie bazy danych Moje_zainteresowania
USE Moje_zainteresowania; -- Wybranie bieżącej bazy, z którą będziemy pracować jak domyślną do wykonywania operacji
-- Utworzenie tabeli Zainteresowania w bazie danych Moje_zainteresowania z kolumnami ID, Nazwa, Opis, Data_realizacji * Nie używam spacji tylko podkreślnika
CREATE TABLE Zainteresowania (
ID INTEGER, -- Na potrzeby zadania nie ma paremetru PRIMARY KEY. Z tym parametrem nie możliwe jest dodanie tylko wartości w kolumnach Nazwa i Opis
-- Poza tym zostawienie wg zaleceń zadania kolumny ID bez wartości wprowadza chaos do wprowadzonych danych co zostanie wykazane w następnych komentarzach
Nazwa TEXT,
Opis TEXT,
Data_realizacji DATE
);
-- Zasilenie Tabeli Zainteresowania danymi (5 pozycji) "tylko" w kolumnach Nazwa i Opis. Dane w kolumnach ID i Data_realizacji przyjmują wartość "NULL"
INSERT INTO Zainteresowania (Nazwa, Opis)
VALUES
('Historia', 'II Wojna Światowa'),
('Biologia', 'Fauna i Flora w Afryce'),
('Informatyka', 'Bezpieczeństwo'),
('Informatyka', 'Programowanie'),
('Muzyka', 'Muzyka klasyczna');
-- Wyświetlenie wszystkich pozycji z danych
SELECT * FROM moje_zainteresowania.zainteresowania;
-- Dodanie nowej pozycji z wartościami do wszystkich kolumn w tym przypadku ID przyjmuje wartość 6 oraz wartość w kolumnie Data_realizacji ma wartość inną niż NULL
INSERT INTO Zainteresowania (ID, Nazwa, Opis, Data_realizacji)
VALUES
(6,'Film', 'Filmy sensacyjne', '2026-01-31');
SET SQL_SAFE_UPDATES = 0; -- Odblokowanie zapytania UPDATE
-- Dodanie pozostałych wartości w kolumnach ID i Data_realizacji w wierszu nr 4 co w tym przypadku jest to pozycja z danymi: Nazwa: Informatyka, Opis: Programowanie
UPDATE Zainteresowania
SET ID = 4 -- Najpierw uzupełniam ID pozycji
WHERE Nazwa = 'Informatyka' AND Opis = 'Programowanie'; -- Posługuję się do tego warunkiem, który określa pozycję nr 4 poprzez Nazwę: Informatyka i Opis: Programowanie.
-- W pozycji nr "3" jest również nazwa Informatyka, dlatego aby dokładnie jedno ID przyjęło wartość 4 doprecyzowuje
-- poprzez dodanie drugie warunku a mianowicie: Opis = 'Programowanie'
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Zainteresowania -- Następnie mając ustalone ID nr 4 uzupełniam dane Data_realizacji wartością: '2026-02-15'
SET Data_realizacji = '2026-02-15'
WHERE ID=4; -- Gdyby zakładając dane Nazwy i opisu zarówno w pozycji 3 i 4 z jakiś przyczyn miały te same wartości określenie ID z wartością 4 byłoby niemożliwe, a wartość ID=4 przybrałoby w kilku pozycjach
-- Wyświetlenie wszystkich pozycji z danych
SELECT * FROM moje_zainteresowania.zainteresowania;
-- Usuwanie pozycji z pustymi wartościami <<w naszym przypadku dotyczy to kolumn ID i Data_realizacji>>
DELETE FROM Zainteresowania
WHERE ID IS NULL OR Data_realizacji IS null;
-- Wyświetlenie wszystkich pozycji z danych pozostałych po usunięciu
SELECT * FROM moje_zainteresowania.zainteresowania;