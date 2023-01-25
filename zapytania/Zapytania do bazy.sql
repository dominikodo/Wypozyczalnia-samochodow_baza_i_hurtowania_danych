-- ROLLUP BAZA DANYCH



SELECT EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu), marka.nazwa, SUM(zwrot.kwota_zaplaty) as suma
FROM ZWROT
JOIN data_zwrotu ON data_zwrotu.id = zwrot.data_zwrotu_id
JOIN samochody ON samochody.id = zwrot.samochody_id
JOIN marka ON marka.id = samochody.marka_id
GROUP BY ROLLUP ( EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu),  marka.nazwa) ORDER BY EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu);

--zapytanie ma na celu zrobienie raportu z sumuy kwoty przychodów z danej marki 


SELECT zwrot.placowka_id, EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu) as rok, SUM(zwrot.kwota_zaplaty) as suma
FROM ZWROT
JOIN data_zwrotu ON data_zwrotu.id = zwrot.data_zwrotu_id
GROUP BY ROLLUP (zwrot.placowka_id, EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu)) ORDER BY  zwrot.placowka_id;


--zapytanie ma na celu zrobienie raportu zliczenie sumy zarobków z danej placówki 


SELECT  zwrot.placowka_id, EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu) as rok, round(AVG(zwrot.kwota_zaplaty),2) as srednia
FROM ZWROT
JOIN data_zwrotu ON data_zwrotu.id = zwrot.data_zwrotu_id
GROUP BY ROLLUP (zwrot.placowka_id,  EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu)) order by zwrot.placowka_id;


--zapytanie ma na celu zrobienie raportu średnich dodochów w w danej placówce 






--CUBE


SELECT  marka.id, count(marka.id) as ilosc, EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu)as rok
FROM ZWROT
JOIN data_zwrotu ON data_zwrotu.id = zwrot.data_zwrotu_id
JOIN samochody ON samochody.id = zwrot.samochody_id
JOIN marka ON marka.id = samochody.marka_id
GROUP BY CUBE (marka.id, EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu));

--zapytanie ma na celu zrobienie raportu ile było wynajc danej marki samochodu w roku 


SELECT EXTRACT(MONTH FROM DATA_ZWROTU.Data_zwrotu)as miesiec, EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu)as rok, count(typ_paliwa.id) as ilosc, typ_paliwa.id
FROM ZWROT
JOIN data_zwrotu ON data_zwrotu.id = zwrot.data_zwrotu_id
JOIN samochody ON samochody.id = zwrot.samochody_id
JOIN typ_paliwa ON typ_paliwa.id = samochody.typ_paliwa_id
GROUP BY CUBE (EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu),EXTRACT(MONTH FROM DATA_ZWROTU.Data_zwrotu), typ_paliwa.id);

--zapytanie ma na celu zrobienie raportu ile było wynajetych samochodów z danym typem pawliwa w miesiacy 

SELECT EXTRACT(MONTH FROM DATA_ZWROTU.Data_zwrotu)as miesiec, EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu)as rok, typ.id, SUM(zwrot.kwota_zaplaty) as suma
FROM ZWROT
JOIN data_zwrotu ON data_zwrotu.id = zwrot.data_zwrotu_id
JOIN samochody ON samochody.id = zwrot.samochody_id
JOIN typ ON typ.id = samochody.typ_id
GROUP BY CUBE (EXTRACT (MONTH FROM DATA_ZWROTU.Data_zwrotu), EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu), typ.id);

--zapytanie ma na celu zrobienie raportu miesiecznechy dochodów z danego typu samochodu 




--PARTYCJE OBLICZENIOWE

SELECT DISTINCT SUM(zwrot.kwota_zaplaty) OVER (PARTITION BY EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu), miasto.id) as laczna_kwota, EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu)as rok, miasto.id
FROM ZWROT
JOIN data_zwrotu ON data_zwrotu.id = zwrot.data_zwrotu_id
JOIN placowka ON placowka.id = zwrot.placowka_id
JOIN adres_placowki ON adres_placowki.id = placowka.adres_placowki_id
JOIN miasto ON miasto.id = adres_placowki.miasto_id;


--zapytanie ma na celu zrobienie raportu zwracającego łączną kwotę wszystkich z wynajmów w danym  miasta w każdym roku


SELECT DISTINCT model.id, miasto.id, COUNT(*) OVER (PARTITION BY model.id, miasto.id) as liczba_wynajmow
FROM ZWROT
JOIN samochody ON samochody.id = zwrot.samochody_id
JOIN model ON model.id = samochody.model_id
JOIN placowka ON placowka.id = zwrot.placowka_id
JOIN adres_placowki ON adres_placowki.id = placowka.adres_placowki_id
JOIN miasto ON miasto.id = adres_placowki.miasto_id;
--zapytanie ma na celu zrobienie raportu  zwracającego liczbę wynajmów dla danego modelu samochodu w danym mieście



SELECT klienci.id, EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu) as rok, AVG(zwrot.kwota_zaplaty) OVER (PARTITION BY klienci.id, EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu) ) as srednia_kwota
FROM ZWROT 
JOIN data_zwrotu ON data_zwrotu.id = zwrot.data_zwrotu_id
JOIN klienci ON klienci.id = zwrot.klienci_id;

--zapytanie ma na celu zrobienie raportu zwracającego średnią kwotęjaki dany klient wydał w danym roku




--OKNA 
SELECT EXTRACT(MONTH FROM DATA_ZWROTU.Data_zwrotu)as miesiec, EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu)as rok,  AVG(kwota_zaplaty) OVER (ORDER BY EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu) DESC, EXTRACT(MONTH FROM DATA_ZWROTU.Data_zwrotu) DESC ROWS BETWEEN 11 PRECEDING AND CURRENT ROW) as srednia_kwota_ostatnie_12_miesiecy
FROM ZWROT
JOIN data_zwrotu ON data_zwrotu.id = zwrot.data_zwrotu_id; 

--zapytanie ma na celu zrobienie raportu zwracającego średnią kwotę z ostanich 12 miesiecu


SELECT model.id, COUNT(*) OVER (PARTITION BY model.id ORDER BY EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu) DESC, EXTRACT(MONTH FROM DATA_ZWROTU.Data_zwrotu) DESC ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) as liczba_wynajmow_ostatnie_3_miesiace
FROM ZWROT
JOIN data_zwrotu ON data_zwrotu.id = zwrot.data_zwrotu_id
JOIN samochody ON samochody.id = zwrot.samochody_id
JOIN model ON model.id = samochody.model_id;

--zapytanie ma na celu zrobienie raportu zwracającego liczbę wynajmów dla danego modelu samochodu w ciągu ostatnich 3 miesięcy


SELECT klienci.id, EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu)as rok , SUM(kwota_zaplaty) OVER (PARTITION BY klienci.id ORDER BY EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu) DESC, EXTRACT(MONTH FROM DATA_ZWROTU.Data_zwrotu) DESC ROWS BETWEEN 5 PRECEDING AND CURRENT ROW) as laczna_kwota_ostatnie_6_miesiecy
FROM ZWROT 
JOIN data_zwrotu ON data_zwrotu.id = zwrot.data_zwrotu_id
JOIN klienci ON klienci.id = zwrot.klienci_id
ORDER by klienci.id,EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu);

--zapytanie ma na celu zrobienie raportu zwracającego łączną kwotę wynajmu dla danego klienta w ciągu ostatnich 6 miesięcy



--lita rankingowa 

SELECT RANK() OVER (PARTITION BY EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu) ORDER BY SUM(kwota_zaplaty) DESC) as miejsce_w_rankingu, EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu)as rok, typ_paliwa.id
FROM ZWROT
JOIN data_zwrotu ON data_zwrotu.id = zwrot.data_zwrotu_id
JOIN samochody ON samochody.id = zwrot.samochody_id
JOIN typ_paliwa ON typ_paliwa.id = samochody.typ_paliwa_id
GROUP BY EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu), typ_paliwa.id;

--zapytanie ma na celu zrobienie raportu samochody z jakim typem paliwa są najbardziej dochodowe w danym roku 


SELECT RANK() OVER (PARTITION BY EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu) ORDER BY SUM(kwota_zaplaty) DESC) as miejsce_w_rankingu, EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu)as rok, klienci_id, SUM(kwota_zaplaty) 
FROM ZWROT
JOIN klienci ON klienci.id = zwrot.klienci_id
JOIN data_zwrotu ON data_zwrotu.id = zwrot.data_zwrotu_id
GROUP BY EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu), klienci_id;

--tworzy ranking klientów którzy najwieceij wydali w roku 

SELECT RANK() OVER (PARTITION BY EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu) ORDER BY SUM(kwota_zaplaty) DESC)as miejsce_w_rankingu, typ.id, EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu) as rok 
FROM ZWROT
JOIN data_zwrotu ON data_zwrotu.id = zwrot.data_zwrotu_id
JOIN samochody ON samochody.id = zwrot.samochody_id
JOIN typ ON typ.id = samochody.typ_id
GROUP BY EXTRACT(YEAR FROM DATA_ZWROTU.Data_zwrotu), typ.id

--zapytanie ma na celu zrobienie raportu typow samochodow są najbardziej dochodowe w danym roku 


                     