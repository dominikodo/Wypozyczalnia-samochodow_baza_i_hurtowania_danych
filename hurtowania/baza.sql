DROP TABLE FAKTY;
DROP TABLE PRACOWNIK_HUR;
DROP TABLE KLIENT_HUR;
DROP TABLE PLACOWKA_HUR;

CREATE TABLE fakty (
    id               INTEGER NOT NULL,
    kwota            NUMBER NOT NULL,
    marka            VARCHAR2(20),
    model            VARCHAR2(20),
    typ              VARCHAR2(20),
    typ_paliwa       VARCHAR2(20),
    miasto           VARCHAR2(20),
    miesiac          INTEGER,
    rok              INTEGER,
    pracownik_hur_id INTEGER NOT NULL,
    klient_hur_id    INTEGER NOT NULL,
    placowka_hur_id  INTEGER NOT NULL
);

ALTER TABLE fakty ADD CONSTRAINT fakty_pk PRIMARY KEY ( id );

CREATE TABLE klient_hur (
    id       INTEGER NOT NULL,
    imie     VARCHAR2(20),
    nazwisko VARCHAR2(30)
);

ALTER TABLE klient_hur ADD CONSTRAINT klient_hur_pk PRIMARY KEY ( id );

CREATE TABLE placowka_hur (
    id    INTEGER NOT NULL,
    nazwa VARCHAR2(20)
);

ALTER TABLE placowka_hur ADD CONSTRAINT placowka_hur_pk PRIMARY KEY ( id );

CREATE TABLE pracownik_hur (
    id       INTEGER NOT NULL,
    imie     VARCHAR2(20),
    nazwisko VARCHAR2(30)
);

ALTER TABLE pracownik_hur ADD CONSTRAINT pracownik_hur_pk PRIMARY KEY ( id );

ALTER TABLE fakty
    ADD CONSTRAINT fakty_klient_hur_fk FOREIGN KEY ( klient_hur_id )
        REFERENCES klient_hur ( id );

ALTER TABLE fakty
    ADD CONSTRAINT fakty_placowka_hur_fk FOREIGN KEY ( placowka_hur_id )
        REFERENCES placowka_hur ( id );

ALTER TABLE fakty
    ADD CONSTRAINT fakty_pracownik_hur_fk FOREIGN KEY ( pracownik_hur_id )
        REFERENCES pracownik_hur ( id );
