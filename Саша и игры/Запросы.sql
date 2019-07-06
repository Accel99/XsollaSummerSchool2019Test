--Задача 2
SELECT `игры`.`Название`, `игры`.`ГодВыпуска`
FROM `игры`
WHERE `игры`.`Код` NOT IN (SELECT `отзывы`.`КодИгры` FROM `отзывы`);

--Задача 3
SELECT `игры`.`Название`, `отзывы`.`Оценка`
FROM `игры`, `отзывы` 
WHERE `игры`.`Код`=`отзывы`.`КодИгры` AND `игры`.`Жанр` LIKE '%Шутер%' 
ORDER BY `Оценка` DESC 
LIMIT 3;

--Задача 4
SELECT `игры`.`Серия`, COUNT(*)
FROM `игры` 
WHERE `игры`.`Серия` IS NOT NULL AND `игры`.`Издатель`='2K Games'
GROUP BY `игры`.`Серия`