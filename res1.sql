CREATE DATABASE res;
USE res;

-- 1.Select all columns from the restaurant table.
SELECT* FROM restaurants;

-- 2.Display the names and cities of all restaurants.
SELECT restaurants.name , restaurants.city 
FROM restaurants;

-- 3.Find all restaurants located in Bangalore. 
SELECT * FROM restaurants
WHERE restaurants.city = 'Bangalore';

-- 4.List the names and ratings of restaurants with a rating greater than 4.0. 
SELECT restaurants.name ,  restaurants.rating 
FROM restaurants
WHERE restaurants.rating > 4;

-- 5.Find restaurants where the cost is less than or equal to 300.
SELECT restaurants.name , restaurants.cost
FROM restaurants 
WHERE restaurants.cost <= 300;

-- 6.Display all distinct cuisine types available in the dataset.
SELECT DISTINCT cuisine
 FROM restaurants ;
 
 -- 7.Find all restaurants serving Biryani cuisine.
 SELECT name , cuisine
 FROM restaurants
 WHERE cuisine = 'Biryani';
 
--  8.Show the top 5 restaurants with the highest ratings.
SELECT name , rating 
FROM restaurants
ORDER BY rating DESC
  LIMIT 5;
  
 -- 9.List restaurants with a rating count greater than 1000.
 SELECT name , rating_count
FROM restaurants
WHERE rating_count >1000;

-- 10.Count the total number of restaurants in the dataset. 
SELECT COUNT(*) AS restaurants_count
FROM restaurants;

-- 11.Find the average cost of all restaurants.
SELECT name , AVG(cost) AS average_cost
FROM restaurants
GROUP BY name;

-- 12.Display restaurant names and costs ordered by cost in ascending order.
SELECT name , cost 
FROM restaurants
ORDER BY cost ASC;

-- 13.Find the average rating of restaurants for each city.
SELECT city , AVG(rating) AS average_rating
FROM restaurants
GROUP BY city;

 -- 14.Count the number of restaurants available in each city.
 SELECT city , COUNT(name) AS no_of_restaurants
FROM restaurants
GROUP BY city;

-- 15.Find the maximum and minimum cost of restaurants for each cuisine.
SELECT cuisine , MAX(cost), MIN(cost)
FROM restaurants
GROUP BY cuisine;

-- 16.List cuisines that have more than 10 restaurants.
SELECT cuisine 
FROM restaurants
WHERE name > 10
GROUP BY cuisine;

-- 17.Find the top 3 cities with the highest number of restaurants.
SELECT city , COUNT(name)
FROM restaurants
GROUP BY city
ORDER BY city ASC
 LIMIT 3;

-- 18.Display the average cost of restaurants for each cuisine. 
SELECT cuisine, AVG(cost) AS average_cost
FROM restaurants
GROUP BY cuisine;

-- 19.Find cities where the average restaurant rating is greater than 4.0. 
SELECT city , AVG(rating) AS average_rating
FROM restaurants 
WHERE rating > 4
GROUP BY city;

-- 20.List restaurants whose cost is higher than the average cost of all restaurants.
SELECT name 
FROM restaurants
WHERE cost > (SELECT AVG(cost) FROM restaurants);

 