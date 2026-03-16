USE res;

SELECT * FROM restaurants;

-- 2. Rank every restaurant from most expensive to least expensive.
SELECT * , DENSE_RANK() OVER ( ORDER BY cost DESC ) FROM restaurants;



-- 3. Rank every restaurant from most visited to least visited.
SELECT * , DENSE_RANK() OVER ( ORDER BY rating_count DESC ) FROM restaurants;


-- 4. Rank every restaurant from most expensive to least expensive as per their city.

SELECT * , DENSE_RANK() OVER (PARTITION BY city ORDER BY cost DESC ) FROM restaurants;

-- 5. Dense-rank every restaurant from most expensive to least expensive as per their city.

SELECT * , DENSE_RANK() OVER (PARTITION BY city ORDER BY cost DESC ) FROM restaurants;

-- 6. Row-number every restaurant from most expensive to least expensive as per their city.

SELECT * , ROW_NUMBER() OVER (PARTITION BY city ORDER BY cost DESC ) FROM restaurants;

-- 7. Rank the restaurant based on their prices (most to least expensive) as per cuisine using rank, dense_rank, and row_number.

SELECT * , ROW_NUMBER() OVER (PARTITION BY cuisine ORDER BY cost DESC ) FROM restaurants;

SELECT * , RANK() OVER (PARTITION BY cuisine ORDER BY cost DESC ) FROM restaurants;

SELECT * , DENSE_RANK() OVER (PARTITION BY cuisine ORDER BY cost DESC ) FROM restaurants;

-- 8. Find top 5 restaurants of every city as per their revenue.

SELECT *
 FROM (SELECT*,ROW_NUMBER() OVER (PARTITION BY city ORDER BY rating_count*cost DESC) AS rn
FROM restaurants) t
WHERE rn<=5;

-- 9. Find top 5 restaurants of every cuisine as per their revenue.

SELECT *
FROM (SELECT * ,ROW_NUMBER () OVER ( PARTITION BY cuisine ORDER BY rating_count*cost) AS rn
FROM restaurants) t
WHERE rn <= 5;


