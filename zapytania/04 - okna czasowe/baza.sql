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