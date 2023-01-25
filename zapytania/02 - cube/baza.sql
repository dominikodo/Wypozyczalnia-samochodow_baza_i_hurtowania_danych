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