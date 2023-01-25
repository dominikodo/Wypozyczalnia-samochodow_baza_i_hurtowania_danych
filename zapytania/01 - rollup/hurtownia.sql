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
