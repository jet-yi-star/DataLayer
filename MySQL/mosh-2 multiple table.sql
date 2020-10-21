--
select p.product_id, p.name, o.quantity, o.unit_price
from order_items o
join products p
on o.product_id = p.product_id;

--
USE sql_invoicing;
select p.payment_id, c.name, ps.name
from payments p
join payment_methods ps
on p.payment_method = ps.payment_method_id
join clients c 
on p.client_id = c.client_id;

-- product outer join oder-item
USE sql_store;
SELECT p.product_id, p.name, oi.quantity
from products p
Left join order_items oi
on p.product_id = oi.product_id;

-- outer join, customer | orders | shippers
select o.order_date, o.order_id, c.first_name as customer, s.name as shipper, os.name as status
from orders o 
left join customers c
on o.customer_id = c.customer_id
left join shippers s 
on o.shipper_id = s.shipper_id
left join order_statuses os 
on o.status = os.order_status_id;

-- using,
use sql_invoicing;
select p.date, c.name, p.amount, ps.name
from payments p
join clients c
using (client_id)
left join payment_methods ps
on p.payment_method = ps.payment_method_id;

-- cross join
use sql_store;
select *
from shippers s 
cross join products p;

select *
from shippers s, products p;

-- union
select c.customer_id, c.first_name, c.points, 'Gold' as type
from customers c
where c.points > 3000
UNION
select c.customer_id, c.first_name, c.points, 'Silver' as type
from customers c
where c.points > 2000 AND c.points < 3000
UNION
select c.customer_id, c.first_name, c.points, 'Bronze' as type
from customers c
where c.points < 2000
order by first_name;

