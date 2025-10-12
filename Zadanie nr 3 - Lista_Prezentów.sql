CREATE DATABASE Lista_Prezentów; -- Utworzenie bazy danych Lista_Prezentów
USE Lista_Prezentów; -- Wybranie bieżącej bazy, z którą będziemy pracować jak domyślną do wykonywania operacji
-- Utworzenie tabeli Prezenty_2020 w bazie danych Lista_Prezentów z kolumnami ID, Imię_obdarowanego, Pomysł_na_prezent, Cena, Miejsce_zakupu * Nie używam spacji tylko podkreślnika
CREATE TABLE Prezenty_2020 (
ID INTEGER PRIMARY KEY, -- Wartość danych typu Integer. Kolumna z danymi służącymi do jednoznacznej identyfikacji każdego rekordu w tabeli (Ogranicznik <<Klucz podstawowy>> "PRIMARY KEY")
Imię_obdarowanego TEXT NOT NULL, -- Wartość danych to tekst, kolumna ma ogranicznik "NOT NULL" - wartość kolumny nie może być pusta
Pomysł_na_prezent TEXT NOT NULL, -- Wartość danych to tekst, kolumna ma ogranicznik "NOT NULL" - wartość kolumny nie może być pusta
Cena DECIMAL(8, 2) NOT NULL, -- - Użyłem dla kolumny Cena danych typu Decimal. Ten typ danych pozwala na przechowywanie kwoty po przecinku, co w przypadku ceny
-- dosyć często ma miejsce. W tym przypadku Decimal pozwala na przechowanie liczby składającej się z 8 cyfr przed i po przecinku <<Wartość wystarczająca na dane typu cena.
-- Decimal określa też 2 liczby po przecinku - np. na kwotę groszy >> przykład kwoty: 123456,78
-- kolumna ma ogranicznik "NOT NULL" - wartość kolumny nie może być pusta
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Miejsce_zakupu TEXT NOT NULL -- Wartość danych to tekst, kolumna ma ogranicznik "NOT NULL" - wartość kolumny nie może być pusta
);
-- Zasilenie Tabeli Prezenty_2020 danymi w kolumnach ID, Imię_obdarowanego, Pomysł_na_prezent, Cena, Miejsce_zakupu
INSERT INTO Prezenty_2020 (ID, Imię_obdarowanego, Pomysł_na_prezent, Cena, Miejsce_zakupu)
VALUES 
(1, 'Mariusz', 'Samochód', 150000, 'Warszawa'),
(2, 'Agnieszka', 'Wycieczka zagraniczna', 25000, 'Kraków'),
(3, 'Sylwia', 'Bon towarowy', 5000, 'Poznań'),
(4, 'Krzysztof', 'Komputer', 10000, 'Olsztyn'),
(5, 'Andrzej', 'Telewizor', 8000, 'Szczecin'),
(6, 'Izabela', 'Laptop', 7000, 'Wrocław'),
(7, 'Sebastian', 'Projektor', 5000, 'Opole'),
(8, 'Iwona', 'Poby w SPA', 6500, 'Bydgoszcz'),
(9, 'Dominika', 'Słodycze', 250, 'Toruń'),
(10, 'Grzegorz', 'Skarpetki', 50, 'Białystok');
-- Wyświetlenie wszystkich pozycji z danych
SELECT * FROM lista_prezentów.prezenty_2020;
-- Zmiana w tabeli Prezenty_2020 w kolumnie Pomysł_na_prezent w pozycji (ID) nr 3 wartości bieżącej: "Bon towarowy" na: "Rower" 
SET SQL_SAFE_UPDATES = 0; -- Odblokowanie zapytania UPDATE
UPDATE Prezenty_2020
SET Pomysł_na_prezent = 'Rower'
WHERE ID = 3;
-- Wyświetlenie tylko zmienionej pozycji tj. (ID) nr 3
SELECT * FROM lista_prezentów.prezenty_2020
WHERE ID = 3;
-- Usunięcie pozycji (ID) nr 1 
DELETE FROM Prezenty_2020
WHERE ID = 1;
-- Wyświetlenie wszystkich pozostałych pozycji z danych
SELECT * FROM lista_prezentów.prezenty_2020;
-- Usunięcie kolumny Miejsce_zakupu z tabeli Prezenty_2020
ALTER TABLE Prezenty_2020
DROP COLUMN Miejsce_zakupu;
-- Wyświetlenie kolumny Imię_obdarowanego z ograniczeniem do pozycji nr 3,4,5
SELECT Imię_obdarowanego FROM lista_prezentów.Prezenty_2020
WHERE ID IN (3,4,5);