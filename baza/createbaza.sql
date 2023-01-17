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


CREATE TABLE adres_klienta (
    id             INTEGER NOT NULL,
    ulica          VARCHAR2(30),
    nr_domu        VARCHAR2(5),
    nr_lokalu      VARCHAR2(5),
    kod_pocztowy   VARCHAR2(6),
    wojewodztwo_id INTEGER NOT NULL,
    miasto_id      INTEGER NOT NULL
);

ALTER TABLE adres_klienta ADD CONSTRAINT adres_klienta_pk PRIMARY KEY ( id );

CREATE TABLE adres_placowki (
    id             INTEGER NOT NULL,
    ulica          VARCHAR2(30),
    nr_domu        VARCHAR2(5),
    nr_lokalu      VARCHAR2(5),
    kod_pocztowy   VARCHAR2(6),
    wojewodztwo_id INTEGER NOT NULL,
    miasto_id      INTEGER NOT NULL
);

ALTER TABLE adres_placowki ADD CONSTRAINT adres_placowki_pk PRIMARY KEY ( id );

CREATE TABLE adres_pracownika (
    id             INTEGER NOT NULL,
    ulica          VARCHAR2(30),
    nr_domu        VARCHAR2(5),
    nr_lokalu      VARCHAR2(5),
    kod_pocztowy   VARCHAR2(6),
    wojewodztwo_id INTEGER NOT NULL,
    miasto_id      INTEGER NOT NULL
);

ALTER TABLE adres_pracownika ADD CONSTRAINT adres_pracownika_pk PRIMARY KEY ( id );

CREATE TABLE cennik (
    id           INTEGER NOT NULL,
    cena_za_dobe NUMBER
);

ALTER TABLE cennik ADD CONSTRAINT cennik_pk PRIMARY KEY ( id );

CREATE TABLE data_wypozyczenia (
    id                INTEGER NOT NULL,
    data_wypozyczenia DATE
);

ALTER TABLE data_wypozyczenia ADD CONSTRAINT data_wypozyczenia_pk PRIMARY KEY ( id );

CREATE TABLE data_zwrotu (
    id          INTEGER NOT NULL,
    data_zwrotu DATE NOT NULL
);

ALTER TABLE data_zwrotu ADD CONSTRAINT data_zwrotu_pk PRIMARY KEY ( id );

CREATE TABLE klienci (
    id               INTEGER NOT NULL,
    imie             VARCHAR2(20),
    nazwisko         VARCHAR2(30),
    pesel            VARCHAR2(11),
    nr_dowodu        VARCHAR2(9),
    nr_telefonu      VARCHAR2(9),
    nr_prawa_jazdy   VARCHAR2(9),
    adres_klienta_id INTEGER NOT NULL
);

CREATE UNIQUE INDEX klienci__idx ON
    klienci (
        adres_klienta_id
    ASC );

ALTER TABLE klienci ADD CONSTRAINT klienci_pk PRIMARY KEY ( id );

CREATE TABLE kolor (
    id    INTEGER NOT NULL,
    nazwa VARCHAR2(20)
);

ALTER TABLE kolor ADD CONSTRAINT kolor_pk PRIMARY KEY ( id );

CREATE TABLE marka (
    id    INTEGER NOT NULL,
    nazwa VARCHAR2(20)
);

ALTER TABLE marka ADD CONSTRAINT marka_pk PRIMARY KEY ( id );

CREATE TABLE miasto (
    id    INTEGER NOT NULL,
    nazwa VARCHAR2(20)
);

ALTER TABLE miasto ADD CONSTRAINT miasto_pk PRIMARY KEY ( id );

CREATE TABLE model (
    id    INTEGER NOT NULL,
    nazwa VARCHAR2(20)
);

ALTER TABLE model ADD CONSTRAINT model_pk PRIMARY KEY ( id );

CREATE TABLE placowka (
    id                INTEGER NOT NULL,
    nazwa             VARCHAR2(20),
    adres_placowki_id INTEGER NOT NULL
);

CREATE UNIQUE INDEX placowka__idx ON
    placowka (
        adres_placowki_id
    ASC );

ALTER TABLE placowka ADD CONSTRAINT placowka_pk PRIMARY KEY ( id );

CREATE TABLE pracownicy (
    id                  INTEGER NOT NULL,
    imie                VARCHAR2(20),
    nazwisko            VARCHAR2(30),
    pesel               VARCHAR2(11),
    nr_telefonu         VARCHAR2(9),
    wynagrodzenie       NUMBER,
    stanowisko_id       INTEGER NOT NULL,
    adres_pracownika_id INTEGER NOT NULL
);

CREATE UNIQUE INDEX pracownicy__idx ON
    pracownicy (
        adres_pracownika_id
    ASC );

ALTER TABLE pracownicy ADD CONSTRAINT pracownicy_pk PRIMARY KEY ( id );

CREATE TABLE rejestracja (
    nr_rejestracyjny VARCHAR2(8) NOT NULL,
    samochody_id     INTEGER NOT NULL
);

CREATE UNIQUE INDEX rejestracja__idx ON
    rejestracja (
        samochody_id
    ASC );

ALTER TABLE rejestracja ADD CONSTRAINT rejestracja_pk PRIMARY KEY ( nr_rejestracyjny );

CREATE TABLE samochody (
    id                INTEGER NOT NULL,
    pojemnosc_silnika NUMBER,
    cennik_id         INTEGER NOT NULL,
    typ_paliwa_id     INTEGER NOT NULL,
    marka_id          INTEGER NOT NULL,
    kolor_id          INTEGER NOT NULL,
    typ_id            INTEGER NOT NULL,
    model_id          INTEGER NOT NULL,
    wolny             VARCHAR2(5)
);

ALTER TABLE samochody ADD CONSTRAINT samochody_pk PRIMARY KEY ( id );

CREATE TABLE stanowisko (
    id    INTEGER NOT NULL,
    nazwa VARCHAR2(20)
);

ALTER TABLE stanowisko ADD CONSTRAINT stanowisko_pk PRIMARY KEY ( id );

CREATE TABLE typ (
    id    INTEGER NOT NULL,
    nazwa VARCHAR2(20)
);

ALTER TABLE typ ADD CONSTRAINT typ_pk PRIMARY KEY ( id );

CREATE TABLE typ_paliwa (
    id     INTEGER NOT NULL,
    paliwo VARCHAR2(20)
);

ALTER TABLE typ_paliwa ADD CONSTRAINT typ_paliwa_pk PRIMARY KEY ( id );

CREATE TABLE wojewodztwo (
    id    INTEGER NOT NULL,
    nazwa VARCHAR2(20)
);

ALTER TABLE wojewodztwo ADD CONSTRAINT wojewodztwo_pk PRIMARY KEY ( id );

CREATE TABLE wypozyczenie (
    id                   INTEGER NOT NULL,
    placowka_id          INTEGER NOT NULL,
    pracownicy_id        INTEGER NOT NULL,
    klienci_id           INTEGER NOT NULL,
    samochody_id         INTEGER NOT NULL,
    data_wypozyczenia_id INTEGER NOT NULL
);

ALTER TABLE wypozyczenie ADD CONSTRAINT wypozyczenie_pk PRIMARY KEY ( id );

CREATE TABLE zwrot (
    id              INTEGER NOT NULL,
    kwota_zaplaty   NUMBER,
    placowka_id     INTEGER NOT NULL,
    pracownicy_id   INTEGER NOT NULL,
    klienci_id      INTEGER NOT NULL,
    samochody_id    INTEGER NOT NULL,
    wypozyczenie_id INTEGER NOT NULL,
    data_zwrotu_id  INTEGER NOT NULL
);

CREATE UNIQUE INDEX zwrot__idx ON
    zwrot (
        wypozyczenie_id
    ASC );

ALTER TABLE zwrot ADD CONSTRAINT zwrot_pk PRIMARY KEY ( id );

ALTER TABLE adres_klienta
    ADD CONSTRAINT adres_klienta_miasto_fk FOREIGN KEY ( miasto_id )
        REFERENCES miasto ( id );

ALTER TABLE adres_klienta
    ADD CONSTRAINT adres_klienta_wojewodztwo_fk FOREIGN KEY ( wojewodztwo_id )
        REFERENCES wojewodztwo ( id );

ALTER TABLE adres_placowki
    ADD CONSTRAINT adres_placowki_miasto_fk FOREIGN KEY ( miasto_id )
        REFERENCES miasto ( id );

ALTER TABLE adres_placowki
    ADD CONSTRAINT adres_placowki_wojewodztwo_fk FOREIGN KEY ( wojewodztwo_id )
        REFERENCES wojewodztwo ( id );

ALTER TABLE adres_pracownika
    ADD CONSTRAINT adres_pracownika_miasto_fk FOREIGN KEY ( miasto_id )
        REFERENCES miasto ( id );

ALTER TABLE adres_pracownika
    ADD CONSTRAINT adres_pracownika_wojewo_fk FOREIGN KEY ( wojewodztwo_id )
        REFERENCES wojewodztwo ( id );

ALTER TABLE klienci
    ADD CONSTRAINT klienci_adres_klienta_fk FOREIGN KEY ( adres_klienta_id )
        REFERENCES adres_klienta ( id );

ALTER TABLE placowka
    ADD CONSTRAINT placowka_adres_placowki_fk FOREIGN KEY ( adres_placowki_id )
        REFERENCES adres_placowki ( id );

ALTER TABLE pracownicy
    ADD CONSTRAINT pracownicy_adres_pracownika_fk FOREIGN KEY ( adres_pracownika_id )
        REFERENCES adres_pracownika ( id );

ALTER TABLE pracownicy
    ADD CONSTRAINT pracownicy_stanowisko_fk FOREIGN KEY ( stanowisko_id )
        REFERENCES stanowisko ( id );

ALTER TABLE rejestracja
    ADD CONSTRAINT rejestracja_samochody_fk FOREIGN KEY ( samochody_id )
        REFERENCES samochody ( id );

ALTER TABLE samochody
    ADD CONSTRAINT samochody_cennik_fk FOREIGN KEY ( cennik_id )
        REFERENCES cennik ( id );

ALTER TABLE samochody
    ADD CONSTRAINT samochody_kolor_fk FOREIGN KEY ( kolor_id )
        REFERENCES kolor ( id );

ALTER TABLE samochody
    ADD CONSTRAINT samochody_marka_fk FOREIGN KEY ( marka_id )
        REFERENCES marka ( id );

ALTER TABLE samochody
    ADD CONSTRAINT samochody_model_fk FOREIGN KEY ( model_id )
        REFERENCES model ( id );

ALTER TABLE samochody
    ADD CONSTRAINT samochody_typ_fk FOREIGN KEY ( typ_id )
        REFERENCES typ ( id );

ALTER TABLE samochody
    ADD CONSTRAINT samochody_typ_paliwa_fk FOREIGN KEY ( typ_paliwa_id )
        REFERENCES typ_paliwa ( id );

ALTER TABLE wypozyczenie
    ADD CONSTRAINT wypozyczenie_data_wypozy_fk FOREIGN KEY ( data_wypozyczenia_id )
        REFERENCES data_wypozyczenia ( id );

ALTER TABLE wypozyczenie
    ADD CONSTRAINT wypozyczenie_klienci_fk FOREIGN KEY ( klienci_id )
        REFERENCES klienci ( id );

ALTER TABLE wypozyczenie
    ADD CONSTRAINT wypozyczenie_placowka_fk FOREIGN KEY ( placowka_id )
        REFERENCES placowka ( id );

ALTER TABLE wypozyczenie
    ADD CONSTRAINT wypozyczenie_pracownicy_fk FOREIGN KEY ( pracownicy_id )
        REFERENCES pracownicy ( id );

ALTER TABLE wypozyczenie
    ADD CONSTRAINT wypozyczenie_samochody_fk FOREIGN KEY ( samochody_id )
        REFERENCES samochody ( id );

ALTER TABLE zwrot
    ADD CONSTRAINT zwrot_data_zwrotu_fk FOREIGN KEY ( data_zwrotu_id )
        REFERENCES data_zwrotu ( id );

ALTER TABLE zwrot
    ADD CONSTRAINT zwrot_klienci_fk FOREIGN KEY ( klienci_id )
        REFERENCES klienci ( id );

ALTER TABLE zwrot
    ADD CONSTRAINT zwrot_placowka_fk FOREIGN KEY ( placowka_id )
        REFERENCES placowka ( id );

ALTER TABLE zwrot
    ADD CONSTRAINT zwrot_pracownicy_fk FOREIGN KEY ( pracownicy_id )
        REFERENCES pracownicy ( id );

ALTER TABLE zwrot
    ADD CONSTRAINT zwrot_samochody_fk FOREIGN KEY ( samochody_id )
        REFERENCES samochody ( id );

ALTER TABLE zwrot
    ADD CONSTRAINT zwrot_wypozyczenie_fk FOREIGN KEY ( wypozyczenie_id )
        REFERENCES wypozyczenie ( id );
