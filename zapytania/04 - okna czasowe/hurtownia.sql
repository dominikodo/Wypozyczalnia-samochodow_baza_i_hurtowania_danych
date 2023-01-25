--OKNA 



SELECT miesiac, rok, AVG(kwota) OVER (ORDER BY rok DESC, miesiac DESC ROWS BETWEEN 11 PRECEDING AND CURRENT ROW) as srednia_kwota_ostatnie_12_miesiecy
FROM fakty; 

--zapytanie ma na celu zrobienie raportu zwracającego średnią kwotę z ostanich 12 miesiecu


SELECT model, COUNT(*) OVER (PARTITION BY model ORDER BY rok DESC, miesiac DESC ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) as liczba_wynajmow_ostatnie_3_miesiace
FROM fakty;

--zapytanie ma na celu zrobienie raportu zwracającego liczbę wynajmów dla danego modelu samochodu w ciągu ostatnich 3 miesięcy


SELECT klient_hur_id, rok, SUM(kwota) OVER (PARTITION BY klient_hur_id ORDER BY rok DESC, miesiac DESC ROWS BETWEEN 5 PRECEDING AND CURRENT ROW) as laczna_kwota_ostatnie_6_miesiecy
FROM fakty ORDER by klient_hur_id,rok;

--zapytanie ma na celu zrobienie raportu zwracającego łączną kwotę wynajmu dla danego klienta w ciągu ostatnich 6 miesięcy
