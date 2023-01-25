--ROLLUP

SELECT fakty.placowka_hur_id, fakty.rok, SUM(fakty.kwota) as suma
FROM fakty
GROUP BY ROLLUP (fakty.placowka_hur_id, fakty.rok) ORDER BY  fakty.placowka_hur_id;

--zapytanie ma na celu zrobienie raportu zliczenie sumy zarobków z danej placówki 


SELECT fakty.rok, fakty.marka, SUM(fakty.kwota) as suma
FROM fakty
GROUP BY ROLLUP ( fakty.rok,  fakty.marka ) ORDER BY rok;

--zapytanie ma na celu zrobienie raportu z sumuy kwoty przychodów z danej marki 


SELECT  fakty.placowka_hur_id, rok, round(AVG(kwota),2) as srednia
FROM fakty
GROUP BY ROLLUP (fakty.placowka_hur_id, rok) order by placowka_hur_id;


--zapytanie ma na celu zrobienie raportu średnich dodochów w w danej placówce 



--CUBE


SELECT marka, count(marka) as ilosc, rok
FROM fakty
GROUP BY CUBE (marka,rok);

--zapytanie ma na celu zrobienie raportu ile było wynajc danej marki samochodu w roku 


SELECT miesiac, rok, count(typ_paliwa), typ_paliwa 
FROM fakty
GROUP BY CUBE (rok,miesiac, typ_paliwa);

--zapytanie ma na celu zrobienie raportu ile było wynajetych samochodów z danym typem pawliwa w miesiacy 

SELECT miesiac, rok, typ, SUM(kwota) as suma
FROM fakty
GROUP BY CUBE (miesiac,rok, typ);

--zapytanie ma na celu zrobienie raportu miesiecznechy dochodów z danego typu samochodu 




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



--lita rankingowa 

SELECT RANK() OVER (PARTITION BY rok ORDER BY SUM(kwota) DESC) as miejsce_w_rankingu, rok, typ_paliwa
FROM fakty
GROUP BY rok, typ_paliwa

--zapytanie ma na celu zrobienie raportu samochody z jakim typem paliwa są najbardziej dochodowe w danym roku 


SELECT RANK() OVER (PARTITION BY rok ORDER BY SUM(kwota) DESC) as miejsce_w_rankingu, rok, klient_hur_id, SUM(kwota) 
FROM fakty
GROUP BY rok, klient_hur_id;

--tworzy ranking klientów którzy najwieceij wydali w roku 

SELECT RANK() OVER (PARTITION BY rok ORDER BY SUM(kwota) DESC)as miejsce_w_rankingu, typ, rok 
FROM fakty
GROUP BY rok, typ

--zapytanie ma na celu zrobienie raportu typow samochodow są najbardziej dochodowe w danym roku 




                     