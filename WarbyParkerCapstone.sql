--Slide 2--

SELECT *
FROM survey
LIMIT 10;



--Slide 3--

SELECT question, COUNT(DISTINCT user_id) as 'number of responses'
FROM survey
GROUP BY question;



--Slide 5--

SELECT *
FROM quiz
LIMIT 5;

SELECT *
FROM home_try_on
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5;




--Slide 7--

SELECT DISTINCT quiz.user_id,
	home_try_on.user_id IS NOT NULL AS 'is_home_try_on',
	home_try_on.number_of_pairs as number_of_pairs,
  purchase.user_id IS NOT NULL AS 'is_purchase'
FROM quiz
LEFT JOIN home_try_on on quiz.user_id = home_try_on.user_id
LEFT JOIN purchase on home_try_on.user_id = purchase.user_id
LIMIT 10;





--Slide 8--

SELECT DISTINCT shape, COUNT(shape) as 'responses'
FROM quiz
GROUP BY shape
ORDER BY COUNT(shape) desc;

SELECT DISTINCT fit, COUNT(fit) as 'responses'
FROM quiz
GROUP BY fit
ORDER BY COUNT(fit) desc;

SELECT color, COUNT(color) as 'responses'
FROM quiz
GROUP BY color
ORDER BY COUNT(color) desc;




--Slide 9--

SELECT model_name, COUNT(model_name)
FROM purchase
GROUP BY model_name
ORDER BY COUNT(model_name) desc;

SELECT color, COUNT(color)
FROM purchase
GROUP BY color
ORDER BY COUNT(color) desc;

SELECT price, COUNT(price)
FROM purchase
GROUP BY price
ORDER BY COUNT(price) desc;




--Slide 11--

SELECT COUNT(user_id) as 'quiz'
FROM quiz;

SELECT COUNT(user_id) as 'home try ons'
FROM home_try_on;





--Slide 12--

SELECT COUNT(user_id) as 'Try Ons'
FROM home_try_on;

SELECT COUNT(user_id) as 'Purchases'
FROM purchase;




--Slide 13--

WITH purchase_funnel AS
(SELECT DISTINCT quiz.user_id,
	home_try_on.user_id IS NOT NULL AS 'is_home_try_on',
	home_try_on.number_of_pairs as number_of_pairs,
  purchase.user_id IS NOT NULL AS 'is_purchase'
FROM quiz
LEFT JOIN home_try_on on quiz.user_id = home_try_on.user_id
LEFT JOIN purchase on home_try_on.user_id = purchase.user_id
)
SELECT number_of_pairs, COUNT(is_purchase)
FROM purchase_funnel
WHERE is_purchase = 1
GROUP BY number_of_pairs;






