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

