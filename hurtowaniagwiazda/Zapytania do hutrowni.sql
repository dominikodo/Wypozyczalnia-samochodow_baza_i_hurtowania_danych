--ROLLUP

SELECT rok, SUM(kwota), marka
FROM fakty
JOIN data_zwrotu_hur ON data_zwrotu_hur.id = fakty.data_zwrotu_hur_id
JOIN samochod_hur ON samochod_hur.id = fakty.samochod_hur_id
GROUP BY ROLLUP (rok, marka) ORDER BY rok;

--zapytanie ma na celu zrobienie raportu rocznych dochodów z danej marki samochodu 


SELECT SUM(kwota), marka, nazwa, miasto
FROM fakty
JOIN samochod_hur ON samochod_hur.id = fakty.samochod_hur_id
JOIN placowka_hur ON placowka_hur.id = fakty.placowka_hur_id
GROUP BY ROLLUP (marka, nazwa, miasto);

--zapytanie ma na celu zrobienie raportu z wynajmu danej marki w poszczegulnej placówce 


SELECT AVG(kwota),rok, nazwa, miasto
FROM fakty
JOIN data_zwrotu_hur ON data_zwrotu_hur.id = fakty.data_zwrotu_hur_id
JOIN placowka_hur ON placowka_hur.id = fakty.placowka_hur_id
GROUP BY ROLLUP (rok, nazwa, miasto) order by rok;

--zapytanie ma na celu zrobienie raportu średnich dodochów w ciągu roku 


--CUBE
SELECT miesiac, SUM(kwota), marka
FROM fakty
JOIN data_zwrotu_hur ON data_zwrotu_hur.id = fakty.data_zwrotu_hur_id
JOIN samochod_hur ON samochod_hur.id = fakty.samochod_hur_id
GROUP BY CUBE (miesiac, marka) ORDER BY miesiac;

--zapytanie ma na celu zrobienie raportu miesiecznechy dochodów z danej marki samochodu jaka marka sprzededaje się najlepiej 

SELECT rok, count(marka), marka
FROM fakty
JOIN data_zwrotu_hur ON data_zwrotu_hur.id = fakty.data_zwrotu_hur_id
JOIN samochod_hur ON samochod_hur.id = fakty.samochod_hur_id
GROUP BY CUBE (rok, marka);

--zapytanie ma na celu zrobienie raportu ile było wynajc danej marki samochodu w roku 

SELECT rok,miesiac, count(typ_paliwa), typ_paliwa 
FROM fakty
JOIN data_zwrotu_hur ON data_zwrotu_hur.id = fakty.data_zwrotu_hur_id
JOIN samochod_hur ON samochod_hur.id = fakty.samochod_hur_id
GROUP BY CUBE (rok,miesiac, typ_paliwa);

--zapytanie ma na celu zrobienie raportu ile było wynajetych samochodów z danym typem pawliwa w miesiacy 



--lita rankingowa 

SELECT rok, RANK() OVER (PARTITION BY rok ORDER BY SUM(kwota) DESC), typ_paliwa
FROM fakty
JOIN data_zwrotu_hur ON data_zwrotu_hur.id = fakty.data_zwrotu_hur_id
JOIN samochod_hur ON samochod_hur.id = fakty.samochod_hur_id
GROUP BY rok, typ_paliwa

--zapytanie ma na celu zrobienie raportu samochody z jakim typem paliwa są najbardziej dochodowe w danym roku 


SELECT RANK() OVER (PARTITION BY rok ORDER BY SUM(kwota) DESC), rok, imie, nazwisko  
FROM fakty
JOIN data_zwrotu_hur ON data_zwrotu_hur.id = fakty.data_zwrotu_hur_id
JOIN klient_hur ON klient_hur.id = fakty.klient_hur_id
GROUP BY rok, imie, nazwisko;

--tworzy ranking klientów którzy najwieceij wydali w roku 

SELECT RANK() OVER (PARTITION BY rok ORDER BY SUM(kwota) DESC), typ, rok 
FROM fakty
JOIN data_zwrotu_hur ON data_zwrotu_hur.id = fakty.data_zwrotu_hur_id
JOIN samochod_hur ON samochod_hur.id = fakty.samochod_hur_id
GROUP BY rok, typ

--zapytanie ma na celu zrobienie raportu typow samochodow są najbardziej dochodowe w danym roku 




                     