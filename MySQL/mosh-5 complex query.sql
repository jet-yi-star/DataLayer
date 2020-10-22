-- find products that are more expensive than lettuce (id = 3)
use sql_store;
select * 
from products
where unit_price > (
select unit_price
from products 
where product_id = 3
);

-- find employees where earn more than average
use sql_hr;
select *
from employees
where salary > 
	(
		select AVG(salary)
        from employees
    );
    
-- find products that have nerver been ordered

select product_id
from products p 
where product_id NOT IN (
	select product_id 
    from order_items
    group by product_id
);

-- find clients without invoices
use sql_invoicing;
select *
from clients
where client_id not in
(select distinct client_id
from invoices);

select *
 from clients c
 left join invoices i
 on c.client_id = i.client_id
 where i.invoice_id is null;
 
 -- find customers who have ordered lettuce (id =3)
 use sql_store;
 
 select customer_id, first_name, last_name
 from customers
 where customer_id IN (
 select distinct customer_id
 from orders o 
 join order_items oi
 on o.order_id = oi.order_id
 where oi.product_id =3
 );
 
 select distinct c.customer_id, c.first_name, c.last_name
 from customers c
 join orders o using (customer_id)
 left join order_items oi using(order_id)
 where oi.product_id = 3;
 
 -- select invoices larger than all invoices of client 3
 use sql_invoicing;
 select *
 from invoices
 where invoice_total > ALL( select invoice_total
 from invoices
 where client_id = 3);
 
 -- select clients with at least two invoices
 select client_id, COUNT(*)
 from invoices
 group by client_id
 having COUNT(*) > 2;
 
 -- select employees whose salary is above the average in their office
 use sql_hr;
select employee_id, salary
from employees e
where salary > (
	select AVG(salary)
    from employees
    where office_id = e.office_id
);

-- get invoices that are larger than the client's average invoice amount
use sql_invoicing;
select *
from invoices i
where invoice_total > (
	select avg(invoice_total)
    from invoices
    where client_id = i.client_id
);

-- select clients that have an invoice
select distinct client_id
from clients c
left join invoices i using(client_id)
where i.invoice_id is not null;

-- find the products that have never been ordered
USE sql_store;
select *
from products p
where not exists (
	select *
    from order_items
    where product_id = p.product_id);

-- subqueries in the select statement
use sql_invoicing;
select c.client_id, c.name, SUM(i.invoice_total) AS total_sales, 
(SELECT AVG(invoice_total) 
from invoices) as average,
SUM(i.invoice_total) - (select average) as difference
from clients c left join invoices i using(client_id) 
group by c.client_id, c.name;

