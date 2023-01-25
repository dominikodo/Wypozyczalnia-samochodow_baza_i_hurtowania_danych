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