
SELECT * 
FROM products
WHERE quantity_in_stock IN (49,38,72);

SELECT * 
FROM customers
WHERE birth_date BETWEEN '1990-1-1' AND '2000-1-1';

-- like
SELECT * 
FROM customers
WHERE address like '%TRail%' OR address like '%avenue%';

select *
from customers
where phone not like '%9';

-- regex
select *
from customers
where first_name regexp 'elka|ambur';

select *
from customers
where last_name regexp 'ey$|on$';

select *
from customers
where last_name regexp '^my|se';

select *
from customers
where last_name regexp 'b[ru]';

-- get the orders that are not shipped
select *
from orders
where shipped_date is null;

-- 
select *
from order_items
where order_id = 2
order by quantity*unit_price desc;

-- get the top three loyal customers
select *
from customers
order by points desc
limit 3;
