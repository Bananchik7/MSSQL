--Задание №1. Даны числа A и B. Найти и вывести их произведение.

DECLARE @a INT, @b INT, @c INT SET @a = 5
SET @b = 10
SET @c = @a + @b PRINT @c;

--Задание №2. В таблице «Ученики» найти разницу между средними баллами лицеистов и гимназистов.

DECLARE @licey FLOAT, @gimn FLOAT, @diff FLOAT SET @licey = 
(SELECT MAX(Баллы) FROM Ученики
WHERE Школа = 'Лицей')
SET @gimn = (SELECT AVG(Баллы) FROM Ученики
WHERE Школа = 'Гимназия')
SET @diff = ABS(@licey - @gimn) PRINT @diff;

--Задание №3. В таблице «Ученики» проверить на четность количество строк.

DECLARE @stroky INT 
SET @stroky = (SELECT COUNT(ID) FROM Ученики) IF @stroky % 2 = 0
PRINT CAST(@stroky AS VARCHAR(5)) + N'Четное'
ELSE
PRINT CAST(@stroky AS VARCHAR(5)) + N'Не четное';

--Задание №4. Дано четырехзначное число. Вывести сумму его цифр.

DECLARE @a INT, @b INT, @c INT, @d INT, @e INT, @k INT
SET @a = 1234
SET @b = @a / 1000 %10
SET @c = @a / 100 %10
SET @k = @a /10 % 10
SET @d = @a % 10
SET @e = @b + @c + @d + @k PRINT @e;

--Задание №5. Даны случайные целые числа a, b и c. Найти наименьшее из них.

DECLARE @a INT = RAND() * 100, @b INT = RAND() * 100
IF @a < @b
PRINT '@a = ' + CAST(@a AS VARCHAR(3))
ELSE
PRINT '@b = ' + CAST(@b AS VARCHAR(3));

--Задание №6. Дано случайное целое число a. Проверить, делится ли данное число на 11.

DECLARE @a INT = RAND() * 100 IF @a % 11 = 0
PRINT CAST(@a AS VARCHAR(3)) + N'делится на 11'
ELSE
PRINT CAST(@a AS VARCHAR(3)) + N'не делится на 11';

--Задание №7. Дано случайное целое число N (N < 1000). Если оно является степенью числа 3, то вывести «Да», если не является – вывести «Нет».

DECLARE @a INT = RAND() * 1000 WHILE @a % 3 = 0
SET @a = @a / 3 IF @a = 1
PRINT N'Да'
ELSE
PRINT N'Нет';

--Задание №8. Даны случайные целые числа a и b. Найти наибольший общий делитель (НОД).

DECLARE @a INT = RAND() * 1000, @b INT = RAND() * 1000 PRINT '@a = ' + CAST(@a AS VARCHAR(4))
PRINT '@b = ' + CAST(@b AS VARCHAR(4))
WHILE @a != @b BEGIN
IF @a > @b
SET @a = @a - @b
END ELSE
SET @b = @b - @a
PRINT 'НОД = ' + CAST(@a AS VARCHAR(4));

--Задание №9. Даны два целых числа A и B (A<B). Найти сумму квадратов всех целых чисел от A до B включительно.

DECLARE @a INT = 5, @b INT = 10, @s INT = 0
WHILE @a <= @b BEGIN
SET @s = @s + @a * @a SET @a = @a + 1
END PRINT N'Сумма = ' + CAST(@s AS VARCHAR(5));

--Задание №10. Найти первое натуральное число, которое при делении на 2, 3, 4, 5, и 6 дает остаток 1, но делится на 7.

DECLARE @A INT = RAND() * 1000
WHILE @A < 1000 BEGIN
IF (@A % 4 = 1) AND (@A % 3 = 1) AND (@A % 2 = 1) AND (@A % 5 = 1) AND (@A % 6 = 1) AND (@A % 7 = 0) PRINT @A
SET @A = @A + 1
END;

--Задание №11. Вывести свою фамилию на экран столько раз, сколько в нем букв.

DECLARE @L INT, @N CHAR(13) = N'Шамова'
SET @L = LEN(@N)
WHILE @L > 0 BEGIN
PRINT @N
SET @L = @L - 1
END;

