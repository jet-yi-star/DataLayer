use sql_store;
select *
from orders
where YEAR(order_date) >= YEAR(now()) - 1;
select  YEAR(now());

-- if null
select CONCAT(first_name, '', last_name) as customer, IFNULL(phone, 'Unknown') AS phone
from customers;

-- if function
select p.product_id, name, count(*) as orders,
 IF( (select count(*) from order_items where product_id = p.product_id group by product_id ) > 1, 'Many times', 'Once') AS frequency
from products p
join order_items oi using(product_id)
group by p.product_id, name;

select p.product_id, name, count(*) as orders,
 IF( COUNT(*)  > 1, 'Many times', 'Once') AS frequency
from products p
join order_items oi using(product_id)
group by p.product_id, name;

-- case operators
select CONCAT(first_name, '', last_name) as customer, points,
	CASE 
		WHEN points > 3000 THEN 'gold'
        when points > 2000 THEN 'silver'
        else 'bronze'
	END as category
from customers
order by points desc
