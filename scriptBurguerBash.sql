CREATE database BurgerRunner;

CREATE TABLE runner_orders(
	order_id INT PRIMARY KEY,
    runner_id INT,
    pickup_time DATETIME,
    distance VARCHAR(8),
    duration VARCHAR(10),
    cancellation VARCHAR(25)
);

-- INSERT INTO runner_orders VALUES(1,1, '2022-01-02 18:14:35', '15KM','20minutes','NOT');
-- INSERT INTO runner_orders VALUES(2,3, '2022-01-02 19:20:02', '30KM','34minutes','NOT');
-- INSERT INTO runner_orders VALUES(3,4, '2022-01-03 22:04:21', '23KM','18minutes','NOT')	
-- INSERT INTO runner_orders VALUES(4,5, '2022-01-04 19:42:16', '18KM','15minutes','NOT')	
-- INSERT INTO runner_orders VALUES(5,6, '2022-01-07 20:48:24', '15KM','20minutes','NOT');
-- INSERT INTO runner_orders VALUES(6,7,NOT NULL,NOT NULL,NOT NULL,'Restaurante Cancellation');
-- INSERT INTO runner_orders VALUES(7,8, '2022-01-09 21:36:04', '20KM','25minutes','NOT');
-- INSERT INTO runner_orders VALUES(8,9, '2022-01-05 19:13:09', '40KM','60minutes','NOT');
-- INSERT INTO runner_orders VALUES(9,10, '2022-01-10 00:24:46', '12KM','15minutes','NOT');
-- INSERT INTO runner_orders VALUES(10,11, '2022-01-09 21:29:10', '26KM','24minutes','NOT');
-- INSERT INTO runner_orders VALUES(11,12,NOT NULL,NOT NULL,NOT NULL,'Customer Cancellation');
-- INSERT INTO runner_orders VALUES(12,13, '2022-01-11 20:48:24', '15KM','20minutes','NOT');

-- SELECT * FROM BurgerRunner.

CREATE TABLE burger_names(
	burger_id INT PRIMARY KEY,
    burger_name VARCHAR(10)
);

-- INSERT INTO burger_names(burger_id, burger_name) VALUES(1, 'MeatLovers');
-- INSERT INTO burger_names(burger_id, burger_name) VALUES(2, 'Vegetarian');


CREATE TABLE burger_runner(
	runner_id INT PRIMARY KEY,
    registration_date DATE
);

-- INSERT INTO burger_runner(runner_id, registration_date) VALUES (1, '2022-01-02' );
-- INSERT INTO burger_runner(runner_id, registration_date)  VALUES (3, '2022-01-02' );
-- INSERT INTO burger_runner(runner_id, registration_date)  VALUES (4, '2022-01-03' );
-- INSERT INTO burger_runner(runner_id, registration_date)  VALUES (5, '2022-01-04' );
-- INSERT INTO burger_runner(runner_id, registration_date)  VALUES (6, '2022-01-07' );
-- INSERT INTO burger_runner(runner_id, registration_date)  VALUES (7, NOT NULL);
-- INSERT INTO burger_runner(runner_id, registration_date)  VALUES (8, '2022-01-09');
-- INSERT INTO burger_runner(runner_id, registration_date)  VALUES (9, '2022-01-05');
-- INSERT INTO burger_runner(runner_id, registration_date)  VALUES (10, '2022-01-10');
-- INSERT INTO burger_runner(runner_id, registration_date)  VALUES (11, '2022-01-09');
-- INSERT INTO burger_runner(runner_id, registration_date)  VALUES (12, NOT NULL);
-- INSERT INTO burger_runner(runner_id, registration_date)  VALUES (13, '2022-01-11');


-- select * from burgerrunner.customer Orders

CREATE TABLE customer_Orders(
	order_id INT PRIMARY KEY,
    customer INT NOT NULL,
    burger_id INT NOT NULL,
    exclusions VARCHAR(4) NOT NULL,
    extras VARCHAR(5) NOT NULL,
    order_time TIMESTAMP NOT NULL
);

-- select * from burgerrunner.customer_orders
  
INSERT INTO customer_orders(order_id, customer, burger_id, exclusions, extras, order_time) VALUES 
(1, 101, 1, 'NOT', 'NOT', '2022-01-02 18:14:35');

INSERT INTO customer_orders(order_id, customer, burger_id, exclusions, extras, order_time) VALUES 
(2, 102, 3, 'NOT', 'NOT', '2022-01-02 19:20:02');

INSERT INTO customer_orders(order_id, customer, burger_id, exclusions, extras, order_time) VALUES 
(3, 103, 2, 'NOT', 'NOT', '2022-01-03 22:04:21');

INSERT INTO customer_orders(order_id, customer, burger_id, exclusions, extras, order_time) VALUES 
(4, 104, 3, 'NOT', 'NOT', '2022-01-04 19:42:16');

INSERT INTO customer_orders(order_id, customer, burger_id, exclusions, extras, order_time) VALUES 
(5, 105, 1, 'NOT', 'NOT', '2022-01-07 20:48:24');

INSERT INTO customer_orders(order_id, customer, burger_id, exclusions, extras, order_time) VALUES 
(6, 106, 3, 'NOT', 'NOT', '2022-01-08 00:00:00');

INSERT INTO customer_orders(order_id, customer, burger_id, exclusions, extras, order_time) VALUES 
(7, 107, 4, 'NOT', 'NOT', '2022-01-09 21:36:04');

INSERT INTO customer_orders(order_id, customer, burger_id, exclusions, extras, order_time) VALUES 
(8, 108, 2, 'NOT', 'NOT', '2022-01-05 19:13:09');

INSERT INTO customer_orders(order_id, customer, burger_id, exclusions, extras, order_time) VALUES 
(9, 109, 5, 'NOT', 'NOT', '2022-01-10 00:24:46');

INSERT INTO customer_orders(order_id, customer, burger_id, exclusions, extras, order_time) VALUES 
(10, 111, 3, 'NOT', 'NOT', '2022-01-09 21:29:10');

INSERT INTO customer_orders(order_id, customer, burger_id, exclusions, extras, order_time) VALUES 
(11, 112, 2, 'NOT', 'NOT', '2022-01-08 00:00:00');

INSERT INTO customer_orders(order_id, customer, burger_id, exclusions, extras, order_time) VALUES 
(12, 113, 1, 'NOT', 'NOT', '2022-01-11 20:48:24');


-- ------------------------------------------------------------------------------------------------------------------------
-- -------------------------------Questions -----------------------------------------------------------------------------

-- How many burgers were ordered?
SELECT 
	COUNT(*) as 'no of orders'
 FROM runner_orders;
 
 -- Answer--
 -- 10 
	
-- How many unique customer orders were made?

SELECT
	COUNT(DISTINCT order_id) AS unique_order_count
FROM customer_orders

-- Anwer--
--  12 

-- How many successful orders were delivered by each runner?

SELECT
	runner_id,
    COUNT(order_id) AS sucessful_orders
FROM runner_orders
WHERE cancellation is NOT NULL
GROUP BY runner_id
ORDER BY sucessful_orders DESC;

-- Answer--  

-- 1	1
-- 3	1
-- 4	1
-- 5	1
-- 6	1
-- 7	1
-- 8	1
-- 9	1
-- 10	1
-- 11	1
-- 12	1
-- 13	1  

-- How many of each type of burger was delivered?

SELECT p.burger_name, COUNT(c.burger_id) AS delivered_burger_count
FROM customer_orders AS c
JOIN runner_orders AS r
 ON c.order_id = r.order_id
JOIN burger_names AS p
 ON c.burger_id = p.burger_id
WHERE r.distance != 0
GROUP BY p.burger_name;

-- -Answer--  
-- MeatLovers	3
-- Vegetarian	2


-- How many Vegetarian and Meatlovers were ordered by each customer?

SELECT
	c.customer,
    p.burger_name,
    count(p.burger_name) AS order_count
FROM customer_orders as c
JOIN burger_names as p
ON c.burger_id=p.burger_id
GROUP BY c.customer, p.burger_name
ORDER BY c.customer; 

-- Answer--  
 
--  101	MeatLovers	1
-- 103	Vegetarian	1
-- 105	MeatLovers	1
-- 108	Vegetarian	1
-- 112	Vegetarian	1
-- 113	MeatLovers	1

-- What was the maximum number of burgers delivered in a single order?

WITH burger_count_cte AS
(
SELECT
	c.order_id,
    count(c.burger_id) AS burger_per_order
FROM customer_orders AS c
JOIN runner_orders AS r
ON c.order_id = r.order_id
WHERE r.distance != 0
GROUP BY c.order_id
)

SELECT MAX(burger_per_order) AS burger_count
FROM burger_count_cte;

-- ANSWER--
-- 1
  

-- For each customer, how many delivered burgers had at least 1 change and how many had no changes?

SELECT
	c.customer,
    SUM(case
WHEN c.exclusions<> ' ' or c.extras<> ' '
then 1
ELSE 0
END) AS at_least_1_change,
SUM(case
WHEN c.exclusions= ' ' AND c.extras=' '
THEN 1
ELSE 0
END) AS no_change
FROM customer_orders as c
JOIN runner_orders as r
ON c.order_id=r.order_id
WHERE r.distance !=0
GROUP BY c.customer
ORDER BY c.customer;

-- Answer--
-- 101	1	0
-- 102	1	0
-- 103	1	0
-- 104	1	0
-- 105	1	0
-- 107	1	0
-- 108	1	0
-- 109	1	0
-- 111	1	0
-- 113	1	0
  


-- What was the total volume of burgers ordered for each hour of the day?

SELECT
	EXTRACT(HOUR from order_time) AS hour_of_day,
    COUNT(order_id) AS burger_count
FROM customer_orders
GROUP BY EXTRACT(HOUR from order_time);

-- Answer--
-- 18	1
-- 19	3
-- 22	1
-- 20	2
-- 0	3
-- 21	2
  
-- How many runners signed up for each 1 week period? 

SELECT
	EXTRACT(week from registration_date) AS registration_week,
        COUNT(runner_id) AS runner_signup
FROM burger_runner
GROUP BY EXTRACT(WEEK from registration_date); 

-- Answer--
-- 1	6
-- 	2
-- 2	4
 
-- What was the average distance travelled for each customer?

SELECT 
	c.customer, 
    AVG(r.distance) AS avg_distance
FROM customer_orders as c
JOIN runner_orders AS r
ON c.order_id = r.order_id
WHERE r.duration != 0
GROUP BY c.customer;

-- Answer --
  
-- 101	15
-- 102	30
-- 103	23
-- 104	18
-- 105	15
-- 107	20
-- 108	40
-- 109	12
-- 111	26
-- 113	15



