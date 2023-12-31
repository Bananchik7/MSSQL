CREATE TABLE Страны (
Название NVARCHAR(255) NOT NULL,
Столица NVARCHAR(255) NOT NULL,
Площадь INT NOT NULL,
Население INT NOT NULL,
Континент NVARCHAR(255) NOT NULL);

INSERT INTO Страны (Название, Столица, Площадь, Население, Континент)
VALUES (N'Австрия',N'Вена', 83858, 8741753, N'Европа'),
(N'Азербайджан', N'Баку', 86600, 9705600, N'Азия'),
(N'Албания',N'Тирана', 28748, 2866026, N'Европа'),
(N'Алжир', N'Алжир', 2381740, 39813722, N'Африка'),
(N'Ангола', N'Луанда', 1246700, 25831000, N'Африка'),
(N'Аргентина', N'Буэнос-Айрес', 2766890, 43847000, N'Южная Америка'),
(N'Афганистан', N'Кабул', 647500, 29822848, N'Азия'),
(N'Бангладеш', N'Дакка', 144000, 160221000, N'Азия'),
(N'Бахрейн', N'Манама', 701, 1397000, N'Азия'),
(N'Белиз', N'Бельмопан', 22966, 377968, N'Северная Америка'),
(N'Белоруссия', N'Минск', 207595, 9498400, N'Европа'),
(N'Бельгия', N'Брюссель', 30528, 11250585, N'Европа'),
(N'Бенин', N'Порто-Ново', 112620, 11167000, N'Африка'),
(N'Болгария', N'София', 110910, 7153784, N'Европа'),
(N'Боливия', N'Сукре',1098580,10985059, N'Южная Америка'),
(N'Ботсвана', N'Габороне', 600370, 2209208, N'Африка'),
(N'Бразилия', N'Бразилиа', 8511965, 206081432, N'Южная Америка'),
(N'Буркина-Фасо', N'Уагадугу', 274200, 19034397, N'Африка'),
(N'Бутан', N'Тхимпху', 47000, 784000, N'Азия'),
(N'Великобритания', N'Лондон', 244820, 65341183, N'Европа'),
(N'Венгрия', N'Будапешт', 93030, 9830485, N'Европа'),
(N'Венесуэла',N'Каракас',912050, 31028637, N'Южная Америка'),
(N'Восточный Тимор',N'Дили', 14874, 1167242, N'Азия'),
(N'Вьетнам', N'Ханой', 329560, 91713300, N'Азия');

--Задание №1. Вывести названия и столицы пяти наибольших стран по площади.

SELECT TOP 5 Название, Столица FROM Страны ORDER BY Площадь DESC;

--Задание №2. Вывести список африканских стран, население которых не превышает 1 млн. чел.

SELECT * FROM Страны WHERE (Население !>1000000) AND (Континент='Африка');

--Задание №3. Вывести список стран, население которых больше 5 млн. чел., а площадь меньше 100 тыс. кв. км, и они расположены не в Европе.

SELECT * FROM Страны WHERE (Население > 5000000) AND (Площадь < 100000) AND (Континент!=N'Европа');

--Задание №4. Вывести список стран Северной и Южной Америки, население которых больше 20 млн. чел., или стран Африки, у которых население больше 30 млн. чел.

SELECT * FROM Страны WHERE (Континент=N'Южная Америка') AND (Континент=N'Южная Америка') AND (Население > 20000000) 
OR (Континент=N'Африка') AND (Население > 30000000);

--Задание №5. Вывести список стран, население которых составляет от 10 до 100 млн. чел., а площадь не больше 500 тыс. кв. км.

SELECT * FROM Страны WHERE (Население BETWEEN 1000000 AND 10000000)  AND (Площадь !> 500000);

--Задание №6. Вывести список стран, названия которых не начинаются с буквы «К».

SELECT * FROM Страны WHERE Название NOT LIKE N'К%';

--Задание №7. Вывести список стран, в названии которых третья буква – «а», а предпоследняя – «и».

SELECT * FROM Страны WHERE Название LIKE N'__а%и_';

--Задание №8. Вывести список стран, в названии которых вторая буква – гласная.

SELECT * FROM Страны WHERE Название LIKE N'_[ауеыоэяию]%';

--Задание №9. Вывести список стран, названия которых начинаются с букв от «К» до «П».

SELECT * FROM Страны WHERE Название LIKE N'[К-П]%';

--Задание №10. Вывести список стран, названия которых начинаются с букв от «А» до «Г», но не с буквы «Б».

SELECT * FROM Страны WHERE Название LIKE N'[А, В-Г]%';

--Задание №11. Вывести список стран, столицы которых есть в базе.

SELECT * FROM Страны WHERE Столица IS NOT NULL;

--Задание №12. Вывести список стран Африки, Северной и Южной Америки.

SELECT * FROM Страны WHERE Континент IN (N'Африка',N'Северная Америка', N'Южная Америка');