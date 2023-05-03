--�������� ������, � ������� �������� ����� ����� ����� � ���� email �� ������� Sfaff.

SELECT email, COUNT(*) FROM Staff
GROUP BY email
HAVING COUNT(*) > 1;


--�������� ������, � ������� �������� ����� ���������� ������� ������� ���������� �� ������� Staff �� ������ �������.
--����� �������, ��� ���� ��� ������

SELECT name, TRUNC(MONTHS_BETWEEN(SYSDATE, TO_DATE(birthday, 'DD.MM.YYYY')) / 12) AS age
FROM Staff;

--�������� ������, � ������� �������� ����� ���������� ��������� (Jobtitles.name) �� ������ �� �������� ������� ��������.

SELECT Jobtitles.name
FROM (
  SELECT jobtitle_id, salary, RANK() OVER (ORDER BY salary DESC) AS rank
  FROM Staff
) s
JOIN Jobtitles j ON s.jobtitle_id = j.jobtitle_id
WHERE rank = 2;
