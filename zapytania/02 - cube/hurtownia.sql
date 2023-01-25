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

