-- 1)
SELECT * FROM `users` 
WHERE `Name` LIKE 'Reza%';


-- 2)
SELECT * FROM `users` 
ORDER BY Trophies DESC;


-- 3)
SELECT * FROM `users` INNER JOIN quizes
ON `users`.UserId = quizes.UserId
WHERE `Date` BETWEEN '2020_8_21 00:00:00' AND '2020_8_21 23:59:59';


-- 4)
SELECT DISTINCT(UserId), `Name`, PhoneNumber FROM users NATURAL JOIN quizes
WHERE Topic = 'sports';


-- 5)
SELECT Topic, COUNT(*) FROM quizes
GROUP BY Topic;


-- 6)
SELECT Answer FROM questions_quizes NATURAL JOIN quizes
WHERE Topic = 'sports'
GROUP BY Answer
ORDER BY COUNT(Answer) DESC
LIMIT 1;


-- 7)
SELECT Answer FROM questions_quizes NATURAL JOIN quizes
GROUP BY Answer
ORDER BY COUNT(Answer) DESC
LIMIT 1;


-- 8)
SELECT Topic, COUNT(Answer) FROM questions NATURAL JOIN questions_quizes
GROUP BY Topic;


-- 9)
SELECT UserId, COUNT(QuizId) FROM users NATURAL JOIN quizes
GROUP BY UserId;


-- 10)
SELECT UserId, SUM(`point`) AS emtiaz
FROM(SELECT UserId, CASE
					WHEN Answer = RightAnswer THEN 1
					ELSE 0
					END AS `point`
	 FROM quizes
	 INNER JOIN questions_quizes ON quizes.QuizId = questions_quizes.QuizId
	 INNER JOIN questions ON questions_quizes.QId = questions.QId) R1
GROUP BY UserId
ORDER BY emtiaz DESC;

-- or:
-- SELECT UserId, COUNT(Answer) FROM quizes
-- INNER JOIN questions_quizes ON quizes.QuizId = questions_quizes.QuizId
-- INNER JOIN questions ON questions_quizes.QId = questions.QId
-- WHERE RightAnswer = Answer
-- GROUP BY UserId
-- ORDER BY COUNT(Answer) DESC;


-- 11)
SELECT QuizId, SUM(`point`) AS emtiaz
FROM(SELECT QuizId, CASE
					WHEN Answer = RightAnswer THEN 1
					ELSE 0
					END AS `point`
	 FROM users
	 NATURAL JOIN quizes
	 NATURAL JOIN questions_quizes
	 NATURAL JOIN questions
	 WHERE `Name` = 'Reza Irani') R1
GROUP BY QuizId;


-- 12)
SELECT UserId, QuizId, SUM(`point`)/COUNT(`point`)*100 AS emtiaz
FROM(SELECT UserId, QuizId, CASE
					WHEN Answer = RightAnswer THEN 1
					ELSE 0
					END AS `point`
	 FROM quizes
	 NATURAL JOIN questions_quizes 
	 NATURAL JOIN questions) R1
GROUP BY UserId, QuizId
ORDER BY emtiaz DESC;

-- or use: SUM(`point`)/5*100


-- 13)
SELECT UserId, SUM(`point`) AS emtiaz
FROM(SELECT UserId, CASE
					WHEN Answer = RightAnswer THEN 1
					ELSE 0
					END AS `point`
	 FROM users
	 NATURAL JOIN quizes
	 NATURAL JOIN questions_quizes
	 NATURAL JOIN questions) R1
GROUP BY UserId
ORDER BY emtiaz DESC;


-- 14)
SELECT UserId, QuizId, SUM(`point`) AS emtiaz
FROM(SELECT UserId, QuizId, CASE
					WHEN Answer = RightAnswer THEN 1
					ELSE 0
					END AS `point`
	 FROM quizes
	 NATURAL JOIN questions_quizes 
	 NATURAL JOIN questions) R1
GROUP BY UserId, QuizId
HAVING SUM(`point`) = 5
ORDER BY UserId;

-- Because the max mark on each quiz is 5 at most; Therfore, SUM(`point`) = 5.


-- 15)
SELECT Topic, COUNT(QuizId) FROM quizes
GROUP BY Topic
ORDER BY COUNT(QuizId) DESC
LIMIT 1;


-- 16)
SELECT UserId, MIN(`Date`) FROM quizes
GROUP BY UserId;


-- 17)
SELECT UserId FROM quizes 
WHERE `DATE` BETWEEN '2020_10_22 00:00:00' AND '2020_10_22 23:59:59'
GROUP BY UserId
HAVING COUNT(QuizId) >= 3;