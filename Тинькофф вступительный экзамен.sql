--Ќапишите запрос, с помощью которого можно найти дубли в поле email из таблицы Sfaff.

SELECT email, COUNT(*) FROM Staff
GROUP BY email
HAVING COUNT(*) > 1;


--Ќапишите запрос, с помощью которого можно определить возраст каждого сотрудника из таблицы Staff на момент запроса.
--Ѕудем считать, что дата это строка

SELECT name, TRUNC(MONTHS_BETWEEN(SYSDATE, TO_DATE(birthday, 'DD.MM.YYYY')) / 12) AS age
FROM Staff;

--Ќапишите запрос, с помощью которого можно определить должность (Jobtitles.name) со вторым по величине уровнем зарплаты.

SELECT Jobtitles.name
FROM (
  SELECT jobtitle_id, salary, RANK() OVER (ORDER BY salary DESC) AS rank
  FROM Staff
) s
JOIN Jobtitles j ON s.jobtitle_id = j.jobtitle_id
WHERE rank = 2;
