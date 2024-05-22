-- ЗАДАНИЕ 1
-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER $$
CREATE FUNCTION TimeFormat(seconds INT UNSIGNED) RETURNS VARCHAR(250) DETERMINISTIC
BEGIN
	DECLARE daysVol INT UNSIGNED;
    DECLARE hoursVol INT UNSIGNED;
    DECLARE minutsVol INT UNSIGNED;
    DECLARE res VARCHAR(255) DEFAULT '';
    
    SET daysVol = FLOOR(seconds / (3600*24));
    SET seconds = seconds % (3600*24);
    SET hoursVol = FLOOR(seconds / 3600);
    SET seconds = seconds % 3600;
    SET minutsVol = FLOOR(seconds / 60);
    SET seconds = seconds % 60;
    IF daysVol > 0 THEN
		SET res = CONCAT(daysVol, ' days');
	END IF;
	IF hoursVol > 0 THEN
		SET res = CONCAT(res,' ',hoursVol,' hours');
	END IF;
	IF minutsVol > 0 THEN
		SET res = CONCAT(res, ' ', minutsVol, ' minutes');
	END IF;
	IF seconds > 0 THEN
		SET res = CONCAT(res,' ', seconds, ' seconds');
	END IF;
	return res;
END $$
DELIMITER ;

select TimeFormat(123456);

-- ЗАДАНИЕ 2
-- Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10 

DELIMITER $$
CREATE PROCEDURE EvenNumbers(IN N INT)
BEGIN
	DECLARE count INT DEFAULT 1;
	WHILE count <= N DO
		IF count % 2 = 0 THEN
			SELECT count AS Num;
		END IF;
        SET count = count + 1;
    END WHILE;    
END $$
DELIMITER ;

CALL EvenNumbers(10);