DROP TABLE FAKTY;
DROP TABLE PRACOWNIK_HUR;
DROP TABLE KLIENT_HUR;
DROP TABLE PLACOWKA_HUR;
DROP TABLE DATA_ZWROTU_HUR;
DROP TABLE SAMOCHOD_HUR;


CREATE TABLE data_zwrotu_hur (
    id      INTEGER NOT NULL,
    dzien   INTEGER,
    miesiac INTEGER,
    rok     INTEGER
);

ALTER TABLE data_zwrotu_hur ADD CONSTRAINT data_zwrotu_hur_pk PRIMARY KEY ( id );
 
CREATE TABLE data_zwrotu_hur (
    id      INTEGER NOT NULL,
    dzien   INTEGER,
    miesiac INTEGER,
    rok     VARCHAR2(10)
);

ALTER TABLE data_zwrotu_hur ADD CONSTRAINT data_zwrotu_hur_pk PRIMARY KEY ( id );

CREATE TABLE fakty (
    id                 INTEGER NOT NULL,
    kwota              NUMBER NOT NULL,
    samochod_hur_id    INTEGER NOT NULL,
    pracownik_hur_id   INTEGER NOT NULL,
    klient_hur_id      INTEGER NOT NULL,
    data_zwrotu_hur_id INTEGER NOT NULL,
    placowka_hur_id    INTEGER NOT NULL
);

ALTER TABLE fakty ADD CONSTRAINT fakty_pk PRIMARY KEY ( id );

CREATE TABLE klient_hur (
    id       INTEGER NOT NULL,
    imie     VARCHAR2(20),
    nazwisko VARCHAR2(30)
);

ALTER TABLE klient_hur ADD CONSTRAINT klient_hur_pk PRIMARY KEY ( id );

CREATE TABLE placowka_hur (
    id     INTEGER NOT NULL,
    nazwa  VARCHAR2(20),
    miasto VARCHAR2(20)
);

ALTER TABLE placowka_hur ADD CONSTRAINT placowka_hur_pk PRIMARY KEY ( id );

CREATE TABLE pracownik_hur (
    id       INTEGER NOT NULL,
    imie     VARCHAR2(20),
    nazwisko VARCHAR2(30)
);

ALTER TABLE pracownik_hur ADD CONSTRAINT pracownik_hur_pk PRIMARY KEY ( id );

CREATE TABLE samochod_hur (
    id         INTEGER NOT NULL,
    marka      VARCHAR2(20),
    model      VARCHAR2(20),
    typ        VARCHAR2(20),
    typ_paliwa VARCHAR2(20)
);

ALTER TABLE samochod_hur ADD CONSTRAINT samochod_hur_pk PRIMARY KEY ( id );

ALTER TABLE fakty
    ADD CONSTRAINT fakty_data_zwrotu_hur_fk FOREIGN KEY ( data_zwrotu_hur_id )
        REFERENCES data_zwrotu_hur ( id );

ALTER TABLE fakty
    ADD CONSTRAINT fakty_klient_hur_fk FOREIGN KEY ( klient_hur_id )
        REFERENCES klient_hur ( id );

ALTER TABLE fakty
    ADD CONSTRAINT fakty_placowka_hur_fk FOREIGN KEY ( placowka_hur_id )
        REFERENCES placowka_hur ( id );

ALTER TABLE fakty
    ADD CONSTRAINT fakty_pracownik_hur_fk FOREIGN KEY ( pracownik_hur_id )
        REFERENCES pracownik_hur ( id );

ALTER TABLE fakty
    ADD CONSTRAINT fakty_samochod_hur_fk FOREIGN KEY ( samochod_hur_id )
        REFERENCES samochod_hur ( id );


INSERT INTO PRACOWNIK_HUR (Id, Imie, Nazwisko) 
SELECT Id, Imie, Nazwisko 
FROM PRACOWNICY;

INSERT INTO KLIENT_HUR (Id, Imie, Nazwisko) 
SELECT Id, Imie, Nazwisko 
FROM KLIENCI;

INSERT INTO PLACOWKA_HUR(Id,Nazwa,Miasto) 
SELECT PLACOWKA.Id, PLACOWKA.Nazwa, MIASTO.Nazwa 
FROM PLACOWKA, ADRES_PLACOWKI, MIASTO 
WHERE PLACOWKA.ADRES_PLACOWKI_id= ADRES_PLACOWKI.Id AND ADRES_PLACOWKI.MIASTO_Id=MIASTO.ID; 

INSERT INTO SAMOCHOD_HUR(Id,Marka,Model,Typ,Typ_paliwa) 
SELECT SAMOCHODY.Id, MARKA.Nazwa, MODEL.Nazwa, TYP.Nazwa, TYP_PALIWA.Paliwo 
FROM SAMOCHODY, MARKA, MODEL, TYP, TYP_PALIWA 
WHERE SAMOCHODY.MARKA_id = MARKA.Id AND SAMOCHODY.MODEL_Id = MODEL.Id AND SAMOCHODY.TYP_id = TYP.Id AND SAMOCHODY.TYP_PALIWA_Id = TYP_PALIWA.Id;

INSERT INTO DATA_ZWROTU_HUR(Id, Dzien, Rok, Miesiac)
SELECT Id, EXTRACT(DAY FROM Data_zwrotu),  EXTRACT(YEAR FROM Data_zwrotu), EXTRACT(MONTH FROM Data_zwrotu) 
FROM DATA_ZWROTU;

INSERT INTO FAKTY(Id, Kwota, SAMOCHOD_HUR_Id, PRACOWNIK_HUR_Id, KLIENT_HUR_Id, DATA_ZWROTU_HUR_Id, PLACOWKA_HUR_Id)
SELECT Id, Kwota_zaplaty, SAMOCHODY_Id, PRACOWNICY_Id, KLIENCI_Id, DATA_ZWROTU_Id, PLACOWKA_Id  
FROM ZWROT;

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