USE res;

-- 1. Which restaurant of abohar is visited by least number of people?
SELECT name , rating_count 
FROM restaurants
WHERE city = 'abohar'
AND rating_count = (SELECT MIN(rating_count) 
FROM restaurants
WHERE City ='abohar'); 

-- 2. Which restaurant has generated maximum revenue all over india?

SELECT *, rating_count*cost AS revenue
 FROM restaurants
WHERE rating_count*cost = (SELECT MAX(rating_count*cost) FROM restaurants);

 -- 3.How many restaurants are having rating more than the average rating?
 
SELECT COUNT(*)
FROM restaurants
WHERE rating > ( SELECT AVG(rating) FROM restaurants);
 
-- 4. Which restaurant of Delhi has generated most revenue?
SELECT * FROM restaurants
WHERE city = 'Delhi'
AND rating_count*cost = (SELECT MAX(rating_count*cost) FROM restaurants WHERE city = "Delhi");

-- 5. Which restaurant chain has maximum number of restaurants?
SELECT name , COUNT(*) AS num_of_res FROM restaurants
GROUP BY name
ORDER BY  num_of_res DESC
LIMIT 1 ;

-- 6. Which restaurant chain has generated maximum revenue?

SELECT name , COUNT(*) AS num_of_res , 
SUM(rating_count*cost) AS revenue FROM restaurants
GROUP BY name
ORDER BY revenue DESC
LIMIT 1 ;

-- 7. Which city has maximum number of restaurants?
SELECT city , COUNT(*) AS num_of_rest
 FROM restaurants
GROUP BY city 
ORDER BY num_of_rest DESC 
LIMIT 1;

-- 8. Which city has generated maximum revenue all over india?

SELECT city , SUM(rating_count*cost)
 FROM restaurants
GROUP BY city 
ORDER BY SUM(rating_count*cost) DESC 
LIMIT 1;

-- 9. List 10 least expensive cuisines?

SELECT cuisine , MIN(cost) 
FROM restaurants
GROUP BY cuisine
ORDER BY MIN(cost) ASC
LIMIT 10;


-- 10. List 10 most expensive cuisines?
SELECT cuisine , MAX(cost) 
FROM restaurants
GROUP BY cuisine
ORDER BY MAX(cost) DESC
LIMIT 10;

-- 11. What is the city is having Biryani as most popular cuisine

SELECT city , SUM(rating_count)
 FROM restaurants
 WHERE cuisine = 'Biryani'
 GROUP BY city
 ORDER BY SUM(rating_count) DESC
 LIMIT 1 ;

-- 12. List top 10 unique restaurants with unique name only thorughout the dataset as
-- per generate maximum revenue (Single restaurant with that name)

SELECT DISTINCT name , rating_count*cost AS revenue
FROM restaurants
WHERE rating_count*cost = (SELECT MAX(rating_count*cost) FROM restaurants)
ORDER BY name DESC
LIMIT 10;

