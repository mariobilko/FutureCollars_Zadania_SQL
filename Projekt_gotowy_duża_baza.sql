	-- 1. Stwórz Bazę „Sklep odzieżowy”
CREATE DATABASE IF NOT EXISTS
	Sklep_odzieżowy_2;
USE Sklep_odzieżowy_2;  # Ustawienie domyślnej bazy
	-- 2. Utwórz tabelę „Producenci” z kolumnami:
CREATE TABLE IF NOT EXISTS
	Producenci (
		id_producenta INTEGER PRIMARY KEY AUTO_INCREMENT,
		nazwa_producenta VARCHAR(100) NOT NULL,
		adres_producenta VARCHAR(250) NOT NULL,
		nip_producenta VARCHAR(20) NOT NULL UNIQUE,
		data_podpisania_umowy_z_producentem DATE NOT NULL
);
	-- 3. Utwórz tabelę „Produkty” z kolumnami:
CREATE TABLE IF NOT EXISTS
	Produkty (
		id_produktu INTEGER PRIMARY KEY AUTO_INCREMENT,
		id_producenta INTEGER NOT NULL,
		nazwa_produktu VARCHAR(100) NOT NULL,
		opis_produktu VARCHAR(250) NOT NULL,
		cena_netto_zakupu DECIMAL(10,2) NOT NULL,
		cena_brutto_zakupu DECIMAL(10,2) NOT NULL,
		cena_netto_sprzedaży DECIMAL(10,2) NOT NULL,
		cena_brutto_sprzedaży DECIMAL(10,2) NOT NULL,
		procent_VAT_sprzedaży DECIMAL(2) NOT NULL
  );
	-- 4. Utwórz tabelę „Zamówienia” z kolumnami:
CREATE TABLE IF NOT EXISTS
	Zamówienia (
		id_zamówienia INTEGER PRIMARY KEY AUTO_INCREMENT,
		id_klienta INTEGER NOT NULL,
		id_produktu INTEGER NOT NULL,
		data_zamówienia DATE NOT NULL
);
	-- 5. Utwórz tabelę „Klienci” z kolumnami:
CREATE TABLE IF NOT EXISTS Klienci (
  id_klienta INTEGER PRIMARY KEY AUTO_INCREMENT,
  imię VARCHAR(50) NOT NULL,
  nazwisko VARCHAR(50) NOT NULL,
  adres VARCHAR(250) NOT NULL
);
	-- 6. Połącz tabele ze sobą za pomocą kluczy obcych:
		-- Produkty – Producenci
ALTER TABLE Produkty
	ADD CONSTRAINT fk_producenta
	FOREIGN KEY (id_producenta) REFERENCES Producenci(id_producenta)
	ON DELETE RESTRICT -- Zabrania usunięcia wiersza z tabeli nadrzędnej
	ON UPDATE CASCADE; -- Mechanizm zapewniający automatyczną aktualizację wartości klucza obcego (foreign key) we wszystkich wierszach tabeli zależnej
		-- Zamówienia – Produkty
ALTER TABLE Zamówienia
	ADD CONSTRAINT fk_produktu
	FOREIGN KEY (id_produktu) REFERENCES Produkty(id_produktu)
	ON DELETE RESTRICT -- Zabrania usunięcia wiersza z tabeli nadrzędnej
	ON UPDATE CASCADE; -- Mechanizm zapewniający automatyczną aktualizację wartości klucza obcego (foreign key) we wszystkich wierszach tabeli zależnej      
        -- Zamówienia - Klienci
ALTER TABLE Zamówienia
	ADD CONSTRAINT fk_klienta
	FOREIGN KEY (id_klienta) REFERENCES Klienci(id_klienta)
	ON DELETE RESTRICT -- Zabrania usunięcia wiersza z tabeli nadrzędnej
	ON UPDATE CASCADE; -- Mechanizm zapewniający automatyczną aktualizację wartości klucza obcego (foreign key) we wszystkich wierszach tabeli zależnej
	-- 7. Każdą tabelę uzupełnij danymi wg:
		-- Tabela „Producenci” – 4 pozycje
        # Baza w projekcie zwiększona z 4 pozycji do 10
INSERT INTO
	Producenci (
		nazwa_producenta,
		adres_producenta,
		nip_producenta,
		data_podpisania_umowy_z_producentem
)
  VALUES
	("ModaLux","ul. Fabryczna 10, 00-100 Warszawa","5212345678","2020-03-15"),
	("StylArt","ul. Główna 5, 30-200 Kraków","8523456789","2021-06-01"),
	("UrbanWear","ul. Przemysłowa 2, 80-300 Gdańsk","9634567890","2019-11-20"),
	("EcoCloth","ul. Zielona 12, 60-400 Poznań","1472583690","2022-01-10"),
	("ModaTrend","ul. Słoneczna 3, 10-200 Olsztyn","601234987","2018-05-12"),
    ("BellaForma","ul. Różana 7, 20-150 Lublin","602345678","2019-09-30"),
    ("NordicLine","ul. Morska 21, 81-720 Sopot","603456789","2021-02-14"),
    ("ClassicWear","ul. Zamkowa 4, 50-060 Wrocław","604567890","2017-08-01"),
    ("GreenStyle","ul. Leśna 16, 25-900 Kielce","605678901","2023-04-22"),
    ("MetroChic","ul. Kolejowa 9, 01-210 Warszawa","606789012","2020-12-05");
		-- Tabela „Produkty” – 20 pozycji
               # Baza w projekcie zwiększona z 20 pozycji do 200
INSERT INTO
	Produkty (
		id_producenta,
        nazwa_produktu,
        opis_produktu,
        cena_netto_zakupu,
        cena_brutto_zakupu,
        cena_netto_sprzedaży,
        cena_brutto_sprzedaży,
        procent_VAT_sprzedaży
)
  VALUES
(1,"Kurtka damska","Kurtka damska młodzieżowa",162.06,199.33,243.09,299,23),
(2,"Kurtka męska","Kurtka męska klasyczna",162.06,199.33,243.09,299,23),
(3,"Płaszcz damski","Płaszcz damski elegancki",270.46,332.67,405.69,499,23),
(4,"Płaszcz męski","Płaszcz męski wełniany",378.86,466,568.29,699,23),
(5,"Skarpetki bawełniane","Skarpetki bawełniane komfort",8.13,10,12.2,15,23),
(6,"Skarpetki sportowe","Skarpetki sportowe oddychające",8.13,10,12.2,15,23),
(7,"Majtki damskie","Majtki damskie wygodne",18.97,23.33,28.46,35,23),
(8,"Bokserki męskie","Bokserki męskie elastyczne",18.97,23.33,28.46,35,23),
(9,"Koszula damska","Koszula damska casual",42.82,52.67,64.23,79,23),
(10,"Koszula męska","Koszula męska formalna",42.82,52.67,64.23,79,23),
(1,"Spodnie damskie","Spodnie damskie klasyczne",64.5,79.34,96.75,119,23),
(2,"Spodnie męskie","Spodnie męskie uniwersalne",64.5,79.34,96.75,119,23),
(3,"T-shirt damski","T-shirt damski bawełniany",26.56,32.67,39.84,49,23),
(4,"T-shirt męski","T-shirt męski bawełniany",26.56,32.67,39.84,49,23),
(5,"Bluza damska","Bluza damska z kapturem",86.18,106,129.27,159,23),
(6,"Bluza męska","Bluza męska z zamkiem",86.18,106,129.27,159,23),
(7,"Sweter damski","Sweter damski dziany",102.44,126,153.66,189,23),
(8,"Sweter męski","Sweter męski wełniany",102.44,126,153.66,189,23),
(9,"Żakiet damski","Żakiet damski elegancki",134.96,166,202.44,249,23),
(10,"Marynarka męska","Marynarka męska garniturowa",216.26,266,324.39,399,23),
(1,"Sukienka letnia","Sukienka letnia zwiewna",107.86,132.67,161.79,199,23),
(2,"Sukienka wieczorowa","Sukienka wieczorowa ozdobna",216.26,266,324.39,399,23),
(3,"Spódnica midi","Spódnica midi dopasowana",48.24,59.34,72.36,89,23),
(4,"Spódnica mini","Spódnica mini casual",48.24,59.34,72.36,89,23),
(5,"Legginsy damskie","Legginsy damskie elastyczne",42.82,52.67,64.23,79,23),
(6,"Rajstopy","Rajstopy kryjące",13.55,16.67,20.33,25,23),
(7,"Bolerko","Bolerko damskie lekkie",80.76,99.33,121.14,149,23),
(8,"Kamizelka damska","Kamizelka damska casual",64.5,79.34,96.75,119,23),
(9,"Kamizelka męska","Kamizelka męska ocieplana",69.92,86,104.88,129,23),
(10,"Parka damska","Parka damska z kapturem",216.26,266,324.39,399,23),
(1,"Parka męska","Parka męska wodoodporna",216.26,266,324.39,399,23),
(2,"Płaszcz przeciwdeszczowy","Płaszcz przeciwdeszczowy lekki",134.96,166,202.44,249,23),
(3,"Szalik wełniany","Szalik wełniany ciepły",21.14,26,31.71,39,23),
(4,"Czapka zimowa","Czapka zimowa ocieplana",21.14,26,31.71,39,23),
(5,"Rękawiczki skórzane","Rękawiczki skórzane eleganckie",26.56,32.67,39.84,49,23),
(6,"Rękawiczki zimowe","Rękawiczki zimowe termiczne",26.56,32.67,39.84,49,23),
(7,"Buty sportowe","Buty sportowe oddychające",162.06,199.33,243.09,299,23),
(8,"Buty eleganckie","Buty eleganckie skórzane",189.16,232.67,283.74,349,23),
(9,"Klapki","Klapki letnie lekkie",21.14,26,31.71,39,23),
(10,"Sandały","Sandały skórzane",42.82,52.67,64.23,79,23),
(1,"Trampki","Trampki casual",80.76,99.33,121.14,149,23),
(2,"Botki damskie","Botki damskie ocieplane",134.96,166,202.44,249,23),
(3,"Kozaki damskie","Kozaki damskie ponadkolanowe",162.06,199.33,243.09,299,23),
(4,"Kozaki męskie","Kozaki męskie skórzane",162.06,199.33,243.09,299,23),
(5,"Kalesony męskie","Kalesony męskie termo",53.66,66,80.49,99,23),
(6,"Bielizna termiczna","Bielizna termiczna izolująca",53.66,66,80.49,99,23),
(7,"Piżama damska","Piżama damska satynowa",53.66,66,80.49,99,23),
(8,"Piżama męska","Piżama męska bawełniana",53.66,66,80.49,99,23),
(9,"Szlafrok","Szlafrok miękki",80.76,99.33,121.14,149,23),
(10,"Pas skórzany","Pas skórzany klasyczny",42.82,52.67,64.23,79,23),
(1,"Torba materiałowa","Torba materiałowa wielokrotna",107.86,132.67,161.79,199,23),
(2,"Torebka damska","Torebka damska skórzana",107.86,132.67,161.79,199,23),
(3,"Plecak miejski","Plecak miejski funkcjonalny",69.92,86,104.88,129,23),
(4,"Portfel męski","Portfel męski skórzany",42.82,52.67,64.23,79,23),
(5,"Kapelusz letni","Kapelusz letni słomkowy",31.98,39.34,47.97,59,23),
(6,"Beret damski","Beret damski stylowy",31.98,39.34,47.97,59,23),
(7,"Czapka z daszkiem","Czapka z daszkiem sportowa",21.14,26,31.71,39,23),
(8,"Okulary przeciwsłoneczne","Okulary przeciwsłoneczne UV",80.76,99.33,121.14,149,23),
(9,"Opaska do włosów","Opaska do włosów ozdobna",13.55,16.67,20.33,25,23),
(10,"Chusta","Chusta lekka",31.98,39.34,47.97,59,23),
(1,"Apaszka jedwabna","Apaszka jedwabna elegancka",31.98,39.34,47.97,59,23),
(2,"Kolczyki","Kolczyki ozdobne",69.92,86,104.88,129,23),
(3,"Naszyjnik","Naszyjnik delikatny",69.92,86,104.88,129,23),
(4,"Bransoletka","Bransoletka modna",69.92,86,104.88,129,23),
(5,"Krawat męski","Krawat męski jedwabny",42.82,52.67,64.23,79,23),
(6,"Mucha","Mucha formalna",31.98,39.34,47.97,59,23),
(7,"Spodenki męskie","Spodenki męskie letnie",64.5,79.34,96.75,119,23),
(8,"Szorty damskie","Szorty damskie casual",64.5,79.34,96.75,119,23),
(9,"Bermudy","Bermudy męskie",64.5,79.34,96.75,119,23),
(10,"Koszulka polo","Koszulka polo bawełniana",42.82,52.67,64.23,79,23),
(1,"Golf damski","Golf damski ciepły",86.18,106,129.27,159,23),
(2,"Golf męski","Golf męski klasyczny",86.18,106,129.27,159,23),
(3,"Tunika","Tunika damska długa",64.5,79.34,96.75,119,23),
(4,"Kimono","Kimono lekkie",107.86,132.67,161.79,199,23),
(5,"Kombinezon damski","Kombinezon damski elegancki",134.96,166,202.44,249,23),
(6,"Kombinezon roboczy","Kombinezon roboczy ochronny",107.86,132.67,161.79,199,23),
(7,"Ogrodniczki","Ogrodniczki denim",80.76,99.33,121.14,149,23),
(8,"Kurtka skórzana","Kurtka skórzana klasyczna",433.06,532.66,649.59,799,23),
(9,"Ramoneska","Ramoneska skórzana",270.46,332.67,405.69,499,23),
(10,"Dżinsy damskie","Dżinsy damskie slim",86.18,106,129.27,159,23),
(1,"Dżinsy męskie","Dżinsy męskie regular",86.18,106,129.27,159,23),
(2,"Spodnie chino","Spodnie chino eleganckie",80.76,99.33,121.14,149,23),
(3,"Spodnie materiałowe","Spodnie materiałowe komfort",64.5,79.34,96.75,119,23),
(4,"Sukienka koktajlowa","Sukienka koktajlowa stylowa",107.86,132.67,161.79,199,23),
(5,"Sukienka maxi","Sukienka maxi zwiewna",134.96,166,202.44,249,23),
(6,"Body damskie","Body damskie dopasowane",53.66,66,80.49,99,23),
(7,"Gorset","Gorset ozdobny",107.86,132.67,161.79,199,23),
(8,"Kalesony damskie","Kalesony damskie ocieplane",53.66,66,80.49,99,23),
(9,"Bielizna nocna","Bielizna nocna komfort",53.66,66,80.49,99,23),
(10,"Biustonosz","Biustonosz push-up",42.82,52.67,64.23,79,23),
(1,"Majtki sportowe","Majtki sportowe szybkoschnące",18.97,23.33,28.46,35,23),
(2,"Skarpety wełniane","Skarpety wełniane grube",8.13,10,12.2,15,23),
(3,"Stopki","Stopki niewidoczne",13.55,16.67,20.33,25,23),
(4,"Skórzane rękawiczki","Skórzane rękawiczki eleganckie",26.56,32.67,39.84,49,23),
(5,"Rękawiczki dotykowe","Rękawiczki dotykowe funkcjonalne",26.56,32.67,39.84,49,23),
(6,"Kurtka puchowa damska","Kurtka puchowa damska ciepła",324.66,399.33,486.99,599,23),
(7,"Kurtka puchowa męska","Kurtka puchowa męska ciepła",324.66,399.33,486.99,599,23),
(8,"Futro ekologiczne","Futro ekologiczne miękkie",216.26,266,324.39,399,23),
(9,"Kamizelka puchowa","Kamizelka puchowa lekka",107.86,132.67,161.79,199,23),
(10,"Koszulka termoaktywna","Koszulka termoaktywna oddychająca",53.66,66,80.49,99,23),
(1,"Top damski","Top damski na ramiączkach",26.56,32.67,39.84,49,23),
(2,"Kurtka softshell","Kurtka softshell wodoodporna",162.06,199.33,243.09,299,23),
(3,"Bluza z kapturem","Bluza z kapturem sportowa",86.18,106,129.27,159,23),
(4,"Bluza rozpinana","Bluza rozpinana codzienna",86.18,106,129.27,159,23),
(5,"Koszula flanelowa","Koszula flanelowa ciepła",48.24,59.34,72.36,89,23),
(6,"Koszula lniana","Koszula lniana letnia",64.5,79.34,96.75,119,23),
(7,"Koszula jedwabna","Koszula jedwabna elegancka",107.86,132.67,161.79,199,23),
(8,"Kombinezon narciarski","Kombinezon narciarski ocieplany",270.46,332.67,405.69,499,23),
(9,"Spodnie narciarskie","Spodnie narciarskie wodoodporne",162.06,199.33,243.09,299,23),
(10,"Rękawice narciarskie","Rękawice narciarskie izolujące",107.86,132.67,161.79,199,23),
(1,"Gogle narciarskie","Gogle narciarskie antyodblaskowe",107.86,132.67,161.79,199,23),
(2,"Buty narciarskie","Buty narciarskie sztywne",541.47,666.01,812.2,999,23),
(3,"Skarpety narciarskie","Skarpety narciarskie grube",8.13,10,12.2,15,23),
(4,"Okulary korekcyjne","Okulary korekcyjne codzienne",80.76,99.33,121.14,149,23),
(5,"Fartuch kuchenny","Fartuch kuchenny ochronny",42.82,52.67,64.23,79,23),
(6,"Uniform roboczy","Uniform roboczy wielozadaniowy",134.96,166,202.44,249,23),
(7,"Bluza robocza","Bluza robocza wytrzymała",86.18,106,129.27,159,23),
(8,"Spodnie robocze","Spodnie robocze ochronne",107.86,132.67,161.79,199,23),
(9,"Kamizelka odblaskowa","Kamizelka odblaskowa bezpieczeństwo",42.82,52.67,64.23,79,23),
(10,"Buty ochronne","Buty ochronne antyprzebiciowe",216.26,266,324.39,399,23),
(1,"Skarpety kompresyjne","Skarpety kompresyjne regeneracyjne",31.98,39.34,47.97,59,23),
(2,"Płaszcz wełniany","Płaszcz wełniany klasyczny",378.86,466,568.29,699,23),
(3,"Kurtka oversize","Kurtka oversize modna",162.06,199.33,243.09,299,23),
(4,"T-shirt oversize","T-shirt oversize luźny",26.56,32.67,39.84,49,23),
(5,"Sukienka boho","Sukienka boho wzorzysta",102.44,126,153.66,189,23),
(6,"Sukienka sportowa","Sukienka sportowa lekka",107.86,132.67,161.79,199,23),
(7,"Spodnie dresowe","Spodnie dresowe komfortowe",64.5,79.34,96.75,119,23),
(8,"Bluza dresowa","Bluza dresowa miękka",86.18,106,129.27,159,23),
(9,"Komplet dresowy","Komplet dresowy zestaw",162.06,199.33,243.09,299,23),
(10,"Buty do biegania","Buty do biegania amortyzujące",200,246,300,369,23),
(1,"Buty treningowe","Buty treningowe stabilne",189.16,232.67,283.74,349,23),
(2,"Treningowa kamizelka","Treningowa kamizelka oddychająca",69.92,86,104.88,129,23),
(3,"Ręcznik sportowy","Ręcznik sportowy szybkoschnący",26.56,32.67,39.84,49,23),
(4,"Torba sportowa","Torba sportowa pojemna",107.86,132.67,161.79,199,23),
(5,"Czapka sportowa","Czapka sportowa termiczna",21.14,26,31.71,39,23),
(6,"Bokserki sportowe","Bokserki sportowe dopasowane",18.97,23.33,28.46,35,23),
(7,"Stanik sportowy","Stanik sportowy stabilny",69.92,86,104.88,129,23),
(8,"Stopery do butów","Stopery do butów ochronne",13.55,16.67,20.33,25,23),
(9,"Szelki","Szelki regulowane",26.56,32.67,39.84,49,23),
(10,"Plecak turystyczny","Plecak turystyczny wytrzymały",107.86,132.67,161.79,199,23),
(1,"Kurtka softshell męska","Kurtka softshell męska elastyczna",162.06,199.33,243.09,299,23),
(2,"Kurtka softshell damska","Kurtka softshell damska dopasowana",162.06,199.33,243.09,299,23),
(3,"Kamizelka ocieplana","Kamizelka ocieplana lekka",69.92,86,104.88,129,23),
(4,"Polary męskie","Polar męski ciepły",73.17,90,109.76,135,23),
(5,"Polary damskie","Polar damski miękki",73.17,90,109.76,135,23),
(6,"Skarpety antypoślizgowe","Skarpety antypoślizgowe do domu",8.13,10,12.2,15,23),
(7,"Buty wodoodporne","Buty wodoodporne na deszcz",162.06,199.33,243.09,299,23),
(8,"Klapki basenowe","Klapki basenowe antypoślizgowe",21.14,26,31.71,39,23),
(9,"Czarne legginsy","Czarne legginsy elastyczne",42.82,52.67,64.23,79,23),
(10,"Spodnie treningowe damskie","Spodnie treningowe damskie elastyczne",64.5,79.34,96.75,119,23),
(1,"Spodnie treningowe męskie","Spodnie treningowe męskie funkcjonalne",64.5,79.34,96.75,119,23),
(2,"Koszulka z długim rękawem","Koszulka z długim rękawem termiczna",26.56,32.67,39.84,49,23),
(3,"Koszulka z krótkim rękawem","Koszulka z krótkim rękawem oddychająca",26.56,32.67,39.84,49,23),
(4,"Bluza z nadrukiem","Bluza z nadrukiem modna",86.18,106,129.27,159,23),
(5,"Koszulka z nadrukiem","Koszulka z nadrukiem wzorzysta",26.56,32.67,39.84,49,23),
(6,"Kamizelka odzieżowa","Kamizelka odzieżowa lekka",64.5,79.34,96.75,119,23),
(7,"Płaszcz skórzany","Płaszcz skórzany luksusowy",487.26,599.33,730.89,899,23),
(8,"Kurtka motocyklowa","Kurtka motocyklowa ochronna",378.86,466,568.29,699,23),
(9,"Rękawiczki motocyklowe","Rękawiczki motocyklowe wytrzymałe",26.56,32.67,39.84,49,23),
(10,"Buty motocyklowe","Buty motocyklowe stabilne",324.66,399.33,486.99,599,23),
(1,"Koszula nocna","Koszula nocna komfortowa",42.82,52.67,64.23,79,23),
(2,"Halka","Halka delikatna",31.98,39.34,47.97,59,23),
(3,"Ponczo","Ponczo stylowe",107.86,132.67,161.79,199,23),
(4,"Chusta puchowa","Chusta puchowa ocieplająca",107.86,132.67,161.79,199,23),
(5,"Kurtka jeansowa","Kurtka jeansowa klasyczna",134.96,166,202.44,249,23),
(6,"Spodnie cargo","Spodnie cargo funkcjonalne",80.76,99.33,121.14,149,23),
(7,"Koszula biznesowa","Koszula biznesowa formalna",64.5,79.34,96.75,119,23),
(8,"Koszula casual","Koszula casual lekka",42.82,52.67,64.23,79,23),
(9,"Spódnica ołówkowa","Spódnica ołówkowa elegancka",48.24,59.34,72.36,89,23),
(10,"Kombinezon ochronny","Kombinezon ochronny roboczy",107.86,132.67,161.79,199,23),
(1,"Rękawiczki rozgrzewające","Rękawiczki rozgrzewające termiczne",26.56,32.67,39.84,49,23),
(2,"Peleryna","Peleryna stylowa",162.06,199.33,243.09,299,23),
(3,"Cienka koszulka","Cienka koszulka na lato",26.56,32.67,39.84,49,23),
(4,"Gruba bluza","Gruba bluza ocieplana",102.44,126,153.66,189,23),
(5,"Spodnie długie","Spodnie długie uniwersalne",64.5,79.34,96.75,119,23),
(6,"Spodenki krótkie","Spodenki krótkie sportowe",64.5,79.34,96.75,119,23),
(7,"Spodnie lniane damskie","Letnie spodnie lniane",80.76,99.33,121.14,149,23),
(8,"Buty letnie","Buty letnie przewiewne",53.66,66,80.49,99,23),
(9,"Buty zimowe","Buty zimowe izolowane",189.16,232.67,283.74,349,23),
(10,"Kurtka przejściowa","Kurtka przejściowa lekka",162.06,199.33,243.09,299,23),
(1,"Kamizelka sportowa","Kamizelka sportowa oddychająca",69.92,86,104.88,129,23),
(2,"Skarpety bawełniane kolorowe","Skarpety bawełniane kolorowe wzorzyste",8.13,10,12.2,15,23),
(3,"Top sportowy","Top sportowy dopasowany",26.56,32.67,39.84,49,23),
(4,"Top koronkowy","Top koronkowy elegancki",53.66,66,80.49,99,23),
(5,"Koszula oversize","Koszula oversize luźna",42.82,52.67,64.23,79,23),
(6,"Kamizelka robocza","Kamizelka robocza ochronna",80.76,99.33,121.14,149,23),
(7,"Kominiarka","Kominiarka termiczna",31.98,39.34,47.97,59,23),
(8,"Rękawiczki bez palców","Rękawiczki bez palców praktyczne",26.56,32.67,39.84,49,23),
(9,"Pas sportowy","Pas sportowy treningowy",26.56,32.67,39.84,49,23),
(10,"Etui na telefon materiałowe","Etui na telefon materiałowe lekkie",15.72,19.34,23.58,29,23),
(1,"Płaszcz wodoodporny","Płaszcz wodoodporny techniczny",134.96,166,202.44,249,23),
(2,"Kurtka z futerkiem","Kurtka z futerkiem ozdobnym",216.26,266,324.39,399,23),
(3,"Kurtka z kapturem","Kurtka z kapturem codzienna",162.06,199.33,243.09,299,23),
(4,"Bluza z kieszenią","Bluza z kieszenią praktyczna",86.18,106,129.27,159,23),
(5,"Sukienka maxi letnia","Sukienka maxi letnia zwiewna",134.96,166,202.44,249,23),
(6,"Sukienka midi wizytowa","Sukienka midi wizytowa elegancka",134.96,166,202.44,249,23),
(7,"Bluza ortalionowa męska","Wiatrówka wiatroszczelna Retro",29.81,36.67,44.72,55,23),
(8,"Koszulka ekologiczna","T-shirt z materiałów organicznych",53.66,66,80.49,99,23),
(9,"Saszetka męska skórzana","Czarna torba męska na ramię",86.18,106,129.27,159,23),
(10,"Jeansy damskie","Jeansy damskie woskowane push up czarne",53.66,66,80.49,99,23);   
		-- Tabela „Klienci” – 10 pozycji
               # Baza w projekcie zwiększona z 10 pozycji do 100
INSERT INTO
	Klienci (
		imię,
		nazwisko,
		adres
)
  VALUES
	("Anna","Kowalska","ul. Polna 1, 00-001 Warszawa"),
	("Katarzyna","Wiśniewska","ul. Słoneczna 7, 80-003 Gdańsk"),
	("Marek","Wójcik","ul. Kwiatowa 9, 60-004 Poznań"),
	("Ewa","Szymańska","ul. Wolna 10, 00-009 Warszawa"),
	("Piotr","Dąbrowski","ul. Parkowa 2, 30-010 Kraków"),
    ("Agnieszka","Nowicka","ul. Lipowa 12, 01-011 Warszawa"),
    ("Szymon","Kubiak","ul. Brzozowa 5, 30-001 Kraków"),
    ("Barbara","Kowalczyk","ul. Polna 21, 80-002 Gdańsk"),
    ("Grzegorz","Majewski","ul. Leśna 14, 60-003 Poznań"),
    ("Olga","Jankowska","ul. Szkolna 3, 50-004 Wrocław"),
    ("Sebastian","Zawadzki","ul. Leśna 7, 70-005 Szczecin"),
    ("Julia","Stanisławska","ul. Słoneczna 2, 20-006 Lublin"),
    ("Kamil","Jabłoński","ul. Ogrodowa 9, 15-007 Białystok"),
    ("Lucyna","Pawłowska","ul. Rzeczna 8, 40-008 Katowice"),
    ("Wiktor","Walczak","ul. Parkowa 6, 35-009 Rzeszów"),
    ("Marzena","Zielińska","ul. Miodowa 4, 10-010 Olsztyn"),
    ("Patryk","Sikora","ul. Cicha 11, 87-011 Toruń"),
    ("Dorota","Michalska","ul. Piękna 8, 25-012 Kielce"),
    ("Adrian","Król","ul. Kasztanowa 1, 26-013 Radom"),
    ("Renata","Wojciechowska","ul. Morelowa 13, 65-014 Zielona Góra"),
    ("Rafał","Sadowski","ul. Leśna 20, 45-015 Opole"),
    ("Iwona","Borkowska","ul. Główna 17, 81-016 Gdynia"),
    ("Mateusz","Chmielewski","ul. Zielona 10, 81-017 Sopot"),
    ("Beata","Kaczmarek","ul. Polna 7, 90-018 Łódź"),
    ("Piotr","Szymczak","ul. Kolejowa 15, 42-019 Częstochowa"),
    ("Alicja","Zawada","ul. Radosna 22, 30-020 Kraków"),
    ("Dawid","Mazurek","ul. Szmaragdowa 2, 80-021 Gdańsk"),
    ("Halina","Urbańska","ul. Boczna 9, 60-022 Poznań"),
    ("Norbert","Wróbel","ul. Leśna 12, 50-023 Wrocław"),
    ("Sandra","Nowakowska","ul. Nadrzeczna 5, 70-024 Szczecin"),
    ("Łukasz","Kurek","ul. Stawowa 3, 20-025 Lublin"),
    ("Helena","Górska","ul. Leśna 1, 15-026 Białystok"),
    ("Mirosław","Mazur","ul. Słoneczna 14, 40-027 Katowice"),
    ("Kamila","Sokołowska","ul. Żwirowa 6, 35-028 Rzeszów"),
    ("Tadeusz","Czajkowski","ul. Polna 16, 10-029 Olsztyn"),
    ("Antonina","Marciniak","ul. Rumiankowa 11, 87-030 Toruń"),
    ("Oskar","Lewandowski","ul. Wiosenna 7, 25-031 Kielce"),
    ("Natalia","Kowal","ul. Błękitna 4, 26-032 Radom"),
    ("Marek","Kaczor","ul. Szafirowa 19, 65-033 Zielona Góra"),
    ("Ilona","Ziółkowska","ul. Klonowa 8, 45-034 Opole"),
    ("Konrad","Głowacki","ul. Lipowa 2, 81-035 Gdynia"),
    ("Paulina","Szczepańska","ul. Różana 13, 81-036 Sopot"),
    ("Emil","Witkowski","ul. Leśna 9, 90-037 Łódź"),
    ("Wojciech","Kubiński","ul. Leśna 23, 30-039 Kraków"),
    ("Ewelina","Sobolewska","ul. Przemysłowa 6, 80-040 Gdańsk"),
    ("Bernadeta","Krajewska","ul. Rzemieślnicza 12, 50-042 Wrocław"),
    ("Radosław","Polak","ul. Fabryczna 1, 70-043 Szczecin"),
    ("Milena","Czarnecka","ul. Słoneczna 21, 20-044 Lublin"),
    ("Przemysław","Piotrowski","ul. Sportowa 3, 15-045 Białystok"),
    ("Bożena","Mikulska","ul. Leśna 27, 40-046 Katowice"),
    ("Hubert","Kamiński","ul. Ogrodowa 14, 35-047 Rzeszów"),
    ("Angelika","Laskowska","ul. Wrzosowa 9, 10-048 Olsztyn"),
    ("Kamila","Dudek","ul. Mostowa 7, 25-050 Kielce"),
    ("Sławomir","Jaworski","ul. Przyjazna 2, 26-051 Radom"),
    ("Irmina","Kalbarczyk","ul. Malinowa 18, 65-052 Zielona Góra"),
    ("Agneta","Wilk","ul. Leśna 33, 81-054 Gdynia"),
    ("Cezary","Szulc","ul. Szkolna 21, 81-055 Sopot"),
    ("Violetta","Ratajczak","ul. Ogrodowa 30, 90-056 Łódź"),
    ("Karol","Sosnowski","ul. Jesionowa 4, 42-057 Częstochowa"),
    ("Sylwia","Brzezińska","ul. Polna 26, 30-058 Kraków"),
    ("Kornelia","Czajka","ul. Górska 11, 80-059 Gdańsk"),
    ("Jacek","Zieliński","ul. Rzeczna 8, 60-060 Poznań"),
    ("Magda","Wesołowska","ul. Różana 2, 50-061 Wrocław"),
    ("Sergiusz","Bednarek","ul. Leśna 40, 70-062 Szczecin"),
    ("Aurelia","Puchalska","ul. Łąkowa 6, 20-063 Lublin"),
    ("Oliwier","Mazowiecki","ul. Przemysłowa 9, 15-064 Białystok"),
    ("Tamara","Szulborska","ul. Parkowa 11, 40-065 Katowice"),
    ("Filip","Wilczyński","ul. Słoneczna 29, 35-066 Rzeszów"),
    ("Patrycja","Ciesielska","ul. Kolejowa 8, 10-067 Olsztyn"),
    ("Eryk","Kaczmarczyk","ul. Leśna 45, 87-068 Toruń"),
    ("Bartosz","Kowalewski","ul. Szpitalna 12, 26-070 Radom"),
    ("Klaudia","Mielczarek","ul. Rynek 1, 65-071 Zielona Góra"),
    ("Wincenty","Orłowski","ul. Zielona 16, 45-072 Opole"),
    ("Daniela","Pawlak","ul. Leśna 50, 81-073 Gdynia"),
    ("Marcin","Konieczny","ul. Sadowa 7, 81-074 Sopot"),
    ("Izabela","Kulikowska","ul. Polna 35, 90-075 Łódź"),
    ("Sebastian","Mikołajczyk","ul. Świerkowa 4, 42-076 Częstochowa"),
    ("Lidia","Zawisza","ul. Morelowa 21, 30-077 Kraków"),
    ("Tomasz","Ostrowski","ul. Brzozowa 18, 80-078 Gdańsk"),
    ("Monika","Rogalska","ul. Leśna 58, 60-079 Poznań"),
    ("Gracjan","Krzysztofek","ul. Fabryczna 14, 50-080 Wrocław"),
    ("Helena","Bąk","ul. Polna 41, 70-081 Szczecin"),
    ("Sonia","Kmieć","ul. Ogrodowa 27, 20-082 Lublin"),
    ("Ignacy","Maj","ul. Leśna 61, 15-083 Białystok"),
    ("Marcelina","Dobrowolska","ul. Rzemieślnicza 7, 40-084 Katowice"),
    ("Włodzimierz","Cepiel","ul. Krótka 20, 35-085 Rzeszów"),
    ("Róża","Lipowska","ul. Wąska 9, 10-086 Olsztyn"),
    ("Olgierd","Szcześniak","ul. Polna 48, 87-087 Toruń"),
    ("Elżbieta","Tomaszewska","ul. Szkolna 29, 25-088 Kielce"),
    ("Marcel","Nowak","ul. Lazurowa 2, 26-089 Radom"),
    ("Kacper","Lewicki","ul. Leśna 12, 65-090 Zielona Góra"),
    ("Natalia","Polińska","ul. Morska 5, 45-091 Opole"),
    ("Wioletta","Kudelska","ul. Dębowa 3, 81-092 Gdynia"),
    ("Rafał","Górniak","ul. Rynek 9, 81-093 Sopot"),
    ("Kinga","Rogowska","ul. Leśna 7, 90-094 Łódź"),
    ("Marta","Borys","ul. Kwiatowa 10, 30-096 Kraków"),
    ("Arkadiusz","Pietrzak","ul. Wąska 1, 80-097 Gdańsk"),
    ("Beata","Sowa","ul. Ogrodowa 18, 60-098 Poznań"),
    ("Konstanty","Radecki","ul. Polna 14, 50-099 Wrocław"),
    ("Patryk","Gajda","ul. Młyńska 2, 70-100 Szczecin");
        -- Tabela „Zamówienia” – 10 pozycji
INSERT INTO
	Zamówienia (
		id_klienta,
        id_produktu,
        data_zamówienia
)
  VALUES
	(1,78,"2025-01-02"),
	(2,122,"2025-01-03"),
	(3,39,"2025-01-08"),
	(4,166,"2025-01-08"),
	(5,100,"2025-01-15"),
	(6,34,"2025-01-16"),
	(7,155,"2025-01-17"),
	(8,67,"2025-01-20"),
	(9,3,"2025-01-23"),
	(10,144,"2025-01-23"),
	(11,89,"2025-01-23"),
	(12,111,"2025-02-03"),
	(13,56,"2025-02-04"),
	(14,155,"2025-02-04"),
	(15,23,"2025-02-13"),
	(16,12,"2025-02-18"),
	(17,78,"2025-02-19"),
	(18,111,"2025-02-25"),
	(19,27,"2025-02-25"),
	(20,45,"2025-02-25"),
	(21,166,"2025-03-04"),
	(22,39,"2025-03-07"),
	(23,5,"2025-03-10"),
	(24,133,"2025-03-12"),
	(25,67,"2025-03-13"),
	(26,144,"2025-03-18"),
	(27,34,"2025-03-18"),
	(28,100,"2025-03-18"),
	(29,188,"2025-03-27"),
	(30,122,"2025-04-02"),
	(31,15,"2025-04-03"),
	(32,89,"2025-04-08"),
	(33,133,"2025-04-10"),
	(34,27,"2025-04-14"),
	(35,3,"2025-04-15"),
	(36,177,"2025-04-17"),
	(37,45,"2025-04-17"),
	(38,56,"2025-04-17"),
	(39,23,"2025-04-28"),
	(40,12,"2025-04-30"),
	(41,188,"2025-05-02"),
	(42,177,"2025-05-05"),
	(43,5,"2025-05-06"),
	(44,39,"2025-05-08"),
	(45,78,"2025-05-12"),
	(46,144,"2025-05-12"),
	(47,15,"2025-05-12"),
	(48,111,"2025-05-20"),
	(49,166,"2025-05-23"),
	(50,100,"2025-05-26"),
	(51,122,"2025-05-29"),
	(52,155,"2025-06-02"),
	(53,34,"2025-06-04"),
	(54,89,"2025-06-04"),
	(55,133,"2025-06-04"),
	(56,67,"2025-06-16"),
	(57,27,"2025-06-20"),
	(58,3,"2025-06-24"),
	(59,45,"2025-06-25"),
	(60,188,"2025-06-27"),
	(61,5,"2025-07-02"),
	(62,23,"2025-07-04"),
	(63,15,"2025-07-07"),
	(64,177,"2025-07-10"),
	(65,56,"2025-07-10"),
	(66,12,"2025-07-10"),
	(67,133,"2025-07-22"),
	(68,111,"2025-07-23"),
	(69,100,"2025-07-24"),
	(70,122,"2025-07-28"),
	(71,166,"2025-07-30"),
	(72,144,"2025-08-05"),
	(73,89,"2025-08-08"),
	(74,78,"2025-08-12"),
	(75,155,"2025-08-14"),
	(76,67,"2025-08-15"),
	(77,39,"2025-08-18"),
	(78,27,"2025-08-18"),
	(79,3,"2025-08-18"),
	(80,45,"2025-08-29"),
	(81,188,"2025-09-02"),
	(82,5,"2025-09-04"),
	(83,23,"2025-09-09"),
	(84,15,"2025-09-11"),
	(85,177,"2025-09-16"),
	(86,56,"2025-09-16"),
	(87,12,"2025-09-16"),
	(88,133,"2025-09-22"),
	(89,111,"2025-09-24"),
	(90,100,"2025-09-29"),
	(91,122,"2025-09-30"),
	(92,166,"2025-10-01"),
	(93,144,"2025-10-03"),
	(94,89,"2025-10-03"),
	(95,78,"2025-10-03"),
	(96,155,"2025-10-14"),
	(97,67,"2025-10-17"),
	(98,39,"2025-10-20"),
	(99,27,"2025-10-23"),
	(100,3,"2025-10-27");
	-- 8. Wyświetl wszystkie produkty z wszystkimi danymi od producenta, który znajduje się na pozycji 1 w tabeli „Producenci”
		# Dodałem nazwę producenta do wyniku - dodatkowo do zadania
SELECT
	Pr.nazwa_producenta AS Producent,
	Pd.*
 FROM Produkty AS Pd
 JOIN Producenci AS Pr
   ON Pd.id_producenta = Pr.id_producenta
WHERE Pr.id_producenta = 1;
	-- 9. Posortuj te produkty alfabetycznie po nazwie # cd. zadania 8
		# Dodałem nazwę producenta do wyniku - dodatkowo do zadania
SELECT
	Pr.nazwa_producenta AS Producent,
	Pd.*
    FROM Produkty AS Pd
    JOIN Producenci AS Pr ON Pd.id_producenta = Pr.id_producenta
   WHERE Pr.id_producenta = 1
ORDER BY Pd.nazwa_produktu;
	-- 10. Wylicz średnią cenę za produkty od producenta z pozycji 1
		# Wyliczam średnie ceny netto i brutto zarówno dla zakupu jak i sprzedaży
		# Zaokrąglam każdą średnią ceną - cena jako kwota z 2 miejscami po przecinku
SELECT
	ROUND(AVG(cena_netto_zakupu),2) AS Średnia_cena_netto_zakupu,
	ROUND(AVG(cena_brutto_zakupu),2) AS Średnia_cena_brutto_zakupu,
	ROUND(AVG(cena_netto_sprzedaży),2) AS Średnia_cena_netto_sprzedaży,
	ROUND(AVG(cena_brutto_sprzedaży),2) AS Średnia_cena_brutto_sprzedaży
   FROM Produkty
  WHERE id_producenta = 1;  
	-- 11. Wyświetl dwie grupy produktów tego producenta:
		-- Połowa najtańszych to grupa: „Tanie”
		-- Pozostałe to grupa: „Drogie”
        # Wraz z cenami - dodatkowo do zadania
WITH
 Ilość_wierszy AS (
  SELECT
	nazwa_produktu AS Produkt,
	cena_brutto_sprzedaży AS Sprzedaż_Brutto,
    cena_netto_sprzedaży AS Sprzedaż_Netto,
    cena_brutto_zakupu AS Zakup_Brutto,
    cena_netto_zakupu AS Zakup_Netto,
	ROW_NUMBER() OVER (ORDER BY cena_brutto_sprzedaży) AS nr_wiersza
   FROM Produkty
  WHERE id_producenta = 1),
  Połowa AS (
	SELECT AVG(nr_wiersza) AS Mediana
	FROM Ilość_wierszy
  )
  SELECT
	 Produkt,
     Sprzedaż_Brutto,
     Sprzedaż_Netto,
     Zakup_Brutto,
     Zakup_Netto,
	CASE
		WHEN nr_wiersza <= Mediana THEN "Tanie"
		ELSE "Drogie"
    END AS Grupa_Cenowa
   FROM Ilość_wierszy,
	    Połowa;
	-- 12. Wyświetl produkty zamówione, wyświetlając tylko ich nazwę 
SELECT DISTINCT -- Usuwam duplikaty (powtarzające się produkty)
	     Pd.nazwa_produktu as Produkt_zamówiony
	FROM Produkty AS Pd
	JOIN Zamówienia AS Zm
	  ON Pd.id_produktu = Zm.id_produktu;
	-- 13. Wyświetl wszystkie produkty zamówione – ograniczając wyświetlanie do 5 pozycji
SELECT DISTINCT -- Usuwam duplikaty (powtarzające się produkty)
	Pd.nazwa_produktu as Produkt_zamówiony
FROM Produkty AS Pd
JOIN Zamówienia AS Zm
  ON Pd.id_produktu = Zm.id_produktu
LIMIT 5;
	-- 14. Policz łączną wartość wszystkich zamówień # po cenie sprzedaży brutto dla klienta
SELECT
	SUM(Pd.cena_brutto_sprzedaży) AS Łączna_wartość_zamówień
FROM Produkty AS Pd
JOIN Zamówienia AS Zm
  ON Pd.id_produktu = Zm.id_produktu;
	-- 15. Wyświetl wszystkie zamówienia wraz z nazwą produktu sortując je wg daty od najstarszego do najnowszego
SELECT
	    Pd.nazwa_produktu AS Produkty_zamówione,
	    Zm.data_zamówienia AS Data_Zamówienia_Produktu
    FROM Produkty AS Pd
    JOIN Zamówienia AS Zm
	  ON Pd.id_produktu = Zm.id_produktu
ORDER BY Zm.data_zamówienia ASC; # data sortowana rosnąco = sortowanie od najstarszego zamówienie
	-- 16. Sprawdź czy w tabeli produkty masz uzupełnione wszystkie dane – wyświetl pozycje dla których brakuje danych
		 # dodałem sprawdzanie wartości 0-zerowych, gdyż cena nie może być zero <<z reguły>>
         # Rezultat sprawdzania to brak takich pozycji
SELECT *
FROM Produkty
WHERE
	 id_producenta IS NULL
  OR id_produktu IS NULL
  OR nazwa_produktu IS NULL OR TRIM(nazwa_produktu) = "" -- Funkcja TRIM usuwa z obu końców tekstu znaki białe: (spacje, tabulatory, znaki nowej linii - entery)
  OR opis_produktu IS NULL OR TRIM(opis_produktu) = ""
  OR cena_netto_zakupu IS NULL OR cena_netto_zakupu = 0
  OR cena_brutto_zakupu IS NULL OR cena_brutto_zakupu = 0
  OR cena_netto_sprzedaży IS NULL OR cena_netto_sprzedaży = 0
  OR cena_brutto_sprzedaży IS NULL OR cena_brutto_sprzedaży = 0
  OR procent_VAT_sprzedaży IS NULL OR procent_VAT_sprzedaży = 0;
	-- 17. Wyświetl produkt najczęściej sprzedawany wraz z jego ceną
WITH
  Ile_ilości AS ( # Ile było zamówień danego produktu
	SELECT
		nazwa_produktu AS Produkt,
		cena_brutto_sprzedaży AS Sprzedaż_Brutto,
		COUNT(*) AS Ilość_zamówień
	FROM Zamówienia AS Zm
	JOIN Produkty AS PR
      ON Zm.id_produktu = Pr.id_produktu
	GROUP BY
		 Produkt,
         Sprzedaż_Brutto
),
  Maksymalne_zamówienia AS ( # Maksymalna ilość zamówień z tabeli Zamówienia
	SELECT
		MAX(Ilość_zamówień) AS Najwięcej_zamówień
	FROM Ile_ilości
)
SELECT
	Produkt,
    Sprzedaż_Brutto,
    Ilość_zamówień
FROM
	Ile_ilości,
    Maksymalne_zamówienia
WHERE Ilość_zamówień = Najwięcej_zamówień; # Jeśli ilość zamówień danego produktu = maksymalnej ilości wszystkich zamówień >> Jest to produkt najczęściej sprzedawany
	-- 18. Znajdź dzień w którym najwięcej zostało złożonych zamówień
WITH
  Ile_ilości AS ( -- ile było zamówień w danym dniu
	SELECT
		    data_zamówienia AS Data_Zamówienia,
		    COUNT(*) AS Ilość_zamówień
	    FROM Zamówienia
	GROUP BY Data_Zamówienia
),
  Maksymalne_zamówienia AS ( # Maksymalna ilość zamówień z tabeli Zamówienia
	SELECT
		MAX(Ilość_zamówień) AS Najwięcej_zamówień
	FROM Ile_ilości
)
SELECT
	data_zamówienia AS Dzień_z_największą_ilością_zamówień,
    Ilość_zamówień
FROM
	Ile_ilości,
    Maksymalne_zamówienia
WHERE Ilość_zamówień = Najwięcej_zamówień; # Jeśli ilość zamówień w danym dniu = maksymalnej ilości wszystkich zamówień >> Jest to dzień z największą ilością zamówień