--PARTYCJE OBLICZENIOWE

SELECT DISTINCT SUM(kwota) OVER (PARTITION BY rok, miasto) as laczna_kwota, rok, miasto
FROM fakty ;

--zapytanie ma na celu zrobienie raportu zwracającego łączną kwotę wszystkich z wynajmów w danym  miasta w każdym roku


SELECT DISTINCT model, miasto, COUNT(*) OVER (PARTITION BY model, miasto) as liczba_wynajmow
FROM fakty; 
--zapytanie ma na celu zrobienie raportu  zwracającego liczbę wynajmów dla danego modelu samochodu w danym mieście



SELECT klient_hur_id, rok, AVG(kwota) OVER (PARTITION BY klient_hur_id, rok ) as srednia_kwota
FROM fakty 
--zapytanie ma na celu zrobienie raportu zwracającego średnią kwotęjaki dany klient wydał w danym roku



