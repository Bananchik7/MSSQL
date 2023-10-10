--Задание №1. Вывести объединенный результат выполнения запросов, которые выбирают страны с площадью меньше 500 кв. км и с площадью больше 5 млн. кв. км.

SELECT Название, Столица, Площадь, Население, Континент FROM Страны 
WHERE Площадь < 500 UNION
SELECT Название, Столица, Площадь, Население, Континент FROM Страны 
WHERE Площадь > 5000000;

--Задание №2. Вывести список стран с площадью больше 1 млн. кв. км, исключить страны с населением меньше 100 млн. чел..

SELECT Название, Столица, Площадь, Население, Континент FROM Страны 
WHERE Площадь > 1000000 EXCEPT
SELECT Название, Столица, Площадь, Население, Континент FROM Страны 
WHERE Население < 10000000;


--Задание №3. Вывести список стран с площадью меньше 500 кв. км и с населением меньше 100 тыс. чел.

SELECT Название, Столица, Площадь, Население, Континент FROM Страны 
WHERE Площадь < 500 INTERSECT
SELECT Название, Столица, Площадь, Население, Континент FROM Страны 
WHERE Население < 1000000;