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
