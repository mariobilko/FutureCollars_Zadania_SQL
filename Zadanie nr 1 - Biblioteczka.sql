CREATE DATABASE moje_ksiazki; -- Utworzenie bazy danych moje_ksiazki
USE moje_ksiazki; -- Wybranie bieżącej bazy, z którą będziemy pracować jak domyślną do wykonywania operacji
CREATE TABLE Biblioteczka ( -- Utworzenie Tabeli Biblioteczka
ID INTEGER PRIMARY KEY, -- Dodanie kolumny ID, Wartość danych typu Integer. Kolumna z danymi służącymi do jednoznacznej identyfikacji każdego rekordu w tabeli (Ogranicznik <<Klucz podstawowy>> "PRIMARY KEY")
Tytuł TEXT NOT NULL, -- Dodanie kolumny Tytuł, -- Wartość danych to tekst, kolumna ma ogranicznik "NOT NULL" - wartość kolumny nie może być pusta
Data_Zakupu DATE NOT NULL -- Dodanie kolumny Data_Zakupu, Wartość danych to data typu YYYY-MM-DD, kolumna ma ogranicznik "NOT NULL" - wartość kolumny nie może być pusta
);
-- Zasilenie Tabeli Biblioteczka danymi w kolumnach ID, Tytuł, Data_Zakupu
INSERT INTO Biblioteczka (ID, Tytuł, Data_Zakupu) 
VALUES (1, 'Pan Tadeusz', '2025-10-08');
SELECT * FROM moje_ksiazki.biblioteczka; -- Wyświetlenie dodanej ksiązki (jako, że jest jedna użyłem *)
-- Zasilenie Tabeli Biblioteczka pozostałymi danymi w kolumnach ID, Tytuł, Data_Zakupu
INSERT INTO Biblioteczka (ID, Tytuł, Data_Zakupu)
VALUES
(2, 'Chłopcy z Placu Broni', '2025-10-09'),
(3, 'Lalka', '2025-10-10');
SET SQL_SAFE_UPDATES = 0; -- Odblokowanie polecenia UPDATE
-- Zamiana wierszy z książką ulubioną na najmniej ulubioną w tabeli Biblioteczka
UPDATE Biblioteczka
SET Tytuł = 'Lalka'
WHERE ID = 1;
UPDATE Biblioteczka
SET Data_Zakupu = '2025-10-10'
WHERE ID = 1;
-- Zamiana wierszy z książką najmniej ulubioną na ulubioną w tabeli Biblioteczka
UPDATE Biblioteczka
SET Tytuł = 'Pan Tadeusz'
WHERE ID = 3;
UPDATE Biblioteczka
SET Data_Zakupu = '2025-10-08'
WHERE ID = 3;
-- Dodanie Kolumny Autor do tabeli Biblioteczka
ALTER TABLE Biblioteczka
ADD COLUMN Autor TEXT NOT NULL; -- Wartość danych to tekst, kolumna ma ogranicznik "NOT NULL" - wartość kolumny nie może być pusta
-- Dopisanie wartości w kolumnie Autor do wszystkich pozycji książek w bazie danych moje_ksiazki w tabeli Biblioteczka
UPDATE Biblioteczka
SET Autor = 'Bolesław Prus'
WHERE ID = 1;
UPDATE Biblioteczka
SET Autor = 'Ferenc Molnar'
WHERE ID = 2;
UPDATE Biblioteczka
SET Autor = 'Adam Mickiewicz'
WHERE ID = 3;
-- Usunięcie ulubiopnych książek czyli pozycja 2 i 3 (po zamianie) w tabeli Biblioteczka
DELETE FROM Biblioteczka
WHERE ID = 2;
DELETE FROM Biblioteczka
WHERE ID = 3;
-- Wyświetlenie pozycji dane autora (jaka pozostała w bazie danych moje_ksiazki) w tabeli Biblioteczka
SELECT Autor FROM moje_ksiazki.biblioteczka;