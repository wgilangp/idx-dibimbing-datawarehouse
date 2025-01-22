-- ====================================================================================
-- BASIC SELECT --

-- #H1 Select all data
SELECT *
FROM public.customer c ;

-- #H2 Select customer_id, first_name, last_name columns from tracks
SELECT customer_id, first_name, last_name, email 
FROM public.customer c ;

-- #H3 Select customer_id, first_name, last_name columns from tracks
SELECT customer_id, first_name, last_name, create_date 
FROM public.customer c ;

-- #H4 Find unique compose
SELECT DISTINCT first_name
FROM public.customer c;

-- EXERCISE ---
--#E1 Select CustomerId, FirstName, LastName, Address columns from customers table
--QUERY HERE!

--#E2 Select CustomerId, FirstName, Address, City, State columns from customers table
--QUERY HERE!

-- ====================================================================================
-- WHERE Clause

-- #H4 Find tracks name that has composer named 'Steve Harris'
SELECT first_name, last_name
FROM public.customer c
WHERE email = 'susan.wilson@sakilacustomer.org' ;

-- #H5 Find tracks name that has UnitPrice not more than 1 Dollar
SELECT customer_id, first_name, last_name, email 
FROM public.customer c
WHERE customer_id <= 5 ;

-- #H6 Find tracks name that has composer named 'Adam Clayton' 
SELECT customer_id, first_name, last_name, email 
FROM public.customer c
WHERE email LIKE '%davis%' ;

-- #H7 Find tracks name and composer that between album from 20 to 40
SELECT customer_id, first_name, last_name, email
FROM public.customer c
WHERE customer_id BETWEEN 20 AND 40;

-- #H8 Find tracks name and composer that media type not in 1 and 4
SELECT customer_id, first_name, last_name, email
FROM public.customer c
WHERE store_id in (1) ;

-- #H9 Find tracks name and composer that composer column is null
SELECT customer_id, first_name, last_name, email
FROM public.customer c
WHERE email IS NULL ;

-- #H9 Find tracks name and composer that composer column is null
SELECT customer_id, first_name, last_name, email
FROM public.customer c
WHERE email IS NOT NULL 
AND customer_id BETWEEN 10 AND 30;

-- EXERCISE ---
--#E1 Select CustomerId, FirstName, LastName, Address columns from customers table
--QUERY HERE!

--#E2 Select CustomerId, FirstName, Address, City, State columns from customers table
--QUERY HERE!

-- ====================================================================================
-- Aggregate Functions



