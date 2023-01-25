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
