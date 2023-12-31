--Задание №1. Вывести список стран и процентное соотношение площади каждой из них к общей площади всех стран мира.

SELECT Название, Столица, Площадь, Население, Континент,
ROUND(CAST(Площадь AS FLOAT) * 100 / (SELECT SUM(Площадь) FROM Страны), 3)  AS Процент 
FROM Страны
ORDER BY Процент DESC;

--Задание №2. Вывести список стран мира, плотность населения которых больше, чем средняя плотность населения всех стран мира.

SELECT Название, Столица, Площадь, Население, Континент FROM Страны 
WHERE Население > (SELECT AVG(Население) FROM Страны);

--Задание №3. С помощью подзапроса вывести список европейских стран, население которых меньше 5 млн. чел.

SELECT Название, Столица, Площадь, Население, Континент FROM
(SELECT Название, Столица, Площадь, Население, Континент FROM Страны WHERE Континент = N'Европа') A
WHERE Население < 5000000;

--Задание №4. Вывести список стран и процентное соотношение их площади к суммарной площади той части мира, где они находятся.

SELECT Название, Столица, Площадь, Население, Континент, ROUND(CAST(Население AS FLOAT) * 100 / (SELECT SUM(Население) FROM Страны Б
WHERE А.Континент = Б.Континент), 3) AS Процент
FROM Страны А ORDER BY Процент DESC;

--Задание №5. Вывести список стран мира, площадь которых больше, чем средняя площадь стран той части света, где они находятся.

SELECT Название, Столица, Площадь, Население, Континент FROM Страны А 
WHERE Площадь > (SELECT AVG(Площадь) FROM Страны Б
WHERE Б.Континент = А.Континент);

--Задание №6. Вывести список стран мира, которые находятся в тех частях света, средняя плотность населения которых превышает общемировую.

SELECT Название, Столица, Площадь, Население, Континент FROM Страны 
WHERE Континент IN (SELECT Континент FROM Страны
GROUP BY Континент HAVING AVG(Население) > (SELECT AVG(Население) FROM Страны));

--Задание №7. Вывести список южноамериканских стран, в которых живет больше людей, чем в любой африканской стране.

SELECT Название, Столица, Площадь, Население, Континент FROM Страны
WHERE Континент = N'Южная Америка' AND Население > ALL (SELECT Население FROM Страны
WHERE Континент = N'Африка');

--Задание №8. Вывести список африканских стран, в которых живет больше людей, чем хотя бы в одной южноамериканской стране.

SELECT Название, Столица, Площадь, Население, Континент FROM Страны 
WHERE Континент = N'Африка' AND Население > ANY (SELECT Население FROM Страны
WHERE Континент = N'Южная Америка');

--Задание №9. Если в Африке есть хотя бы одна страна, площадь которой больше 2 млн. кв. км, вывести список всех африканских стран.

SELECT Название, Столица, Площадь, Население, Континент FROM Страны  
WHERE Континент = N'Африка' AND EXISTS (SELECT * FROM Страны
WHERE Континент = N'Африка' AND Площадь > 2000000);

--Задание №10. Вывести список стран той части света, где находится страна «Фиджи».

SELECT Название, Столица, Площадь, Население, Континент FROM Страны  
WHERE Континент = (SELECT Континент FROM Страны
WHERE Название = N'Фиджи');


--Задание №11. Вывести список стран, население которых не превышает население страны «Фиджи».

SELECT Название, Столица, Площадь, Население, Континент FROM Страны 
WHERE Население !> (SELECT Население FROM Страны
WHERE Название = N'Фиджи');

--Задание №12. Вывести название страны с наибольшим населением среди стран с наименьшей площадью на каждом континенте.

SELECT Название, Столица, Площадь, Население, Континент FROM Страны 
WHERE Население = (SELECT MAX(Мин_Нас) FROM (SELECT MIN(Площадь) AS Мин_Нас FROM Страны)A);

