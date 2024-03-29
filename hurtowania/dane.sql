INSERT INTO PRACOWNIK_HUR (Id, Imie, Nazwisko) 
SELECT Id, Imie, Nazwisko 
FROM PRACOWNICY;

INSERT INTO KLIENT_HUR (Id, Imie, Nazwisko) 
SELECT Id, Imie, Nazwisko 
FROM KLIENCI;

INSERT INTO PLACOWKA_HUR(Id,Nazwa) 
SELECT PLACOWKA.Id, PLACOWKA.Nazwa
FROM PLACOWKA;
 
INSERT INTO FAKTY(Id, Kwota, Marka, Model, Typ, Typ_paliwa, Miasto, Miesiac, Rok, PRACOWNIK_HUR_Id, KLIENT_HUR_Id, PLACOWKA_HUR_Id)
SELECT ZWROT.Id, ZWROT.Kwota_zaplaty, MARKA.Nazwa, MODEL.Nazwa, TYP.Nazwa, TYP_PALIWA.Paliwo, MIASTO.Nazwa, EXTRACT(MONTH FROM DATA_ZWROTU.Data_zwrotu), EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu),  ZWROT.PRACOWNICY_Id, ZWROT.KLIENCI_Id, ZWROT.PLACOWKA_Id
FROM ZWROT, SAMOCHODY, DATA_ZWROTU, MODEL, TYP, MARKA, TYP_PALIWA, PLACOWKA, ADRES_PLACOWKI,MIASTO
WHERE ZWROT.SAMOCHODY_Id=SAMOCHODY.Id AND SAMOCHODY.MARKA_id = MARKA.Id AND SAMOCHODY.MODEL_Id = MODEL.Id AND SAMOCHODY.TYP_id = TYP.Id AND SAMOCHODY.TYP_PALIWA_Id = TYP_PALIWA.Id 
AND ZWROT.PLACOWKA_Id=PLACOWKA.Id AND PLACOWKA.ADRES_PLACOWKI_id= ADRES_PLACOWKI.Id AND ADRES_PLACOWKI.MIASTO_Id=MIASTO.ID AND ZWROT.DATA_ZWROTU_Id=DATA_ZWROTU.Id; 

DROP TABLE zwrot;
DROP TABLE wypozyczenie;
DROP TABLE pracownicy;
DROP TABLE klienci;
DROP TABLE rejestracja;
DROP TABLE samochody;
DROP TABLE placowka; 
DROP TABLE adres_klienta;
DROP TABLE adres_placowki;
DROP TABLE adres_pracownika;
DROP TABLE cennik;
DROP TABLE kolor;
DROP TABLE marka;
DROP TABLE miasto;
DROP TABLE model;
DROP TABLE stanowisko;
DROP TABLE typ;
DROP TABLE typ_paliwa;
DROP TABLE wojewodztwo;
DROP TABLE data_wypozyczenia ;
DROP TABLE data_zwrotu ;   