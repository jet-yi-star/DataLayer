-- insert three rows in the products table
use sql_store;
insert into products (name, quantity_in_stock, unit_price)
values('water',10,1.2), ('coke', 10,2.2), ('milk', 13, 5.5);

-- invoice copy, invoice_archived, client name column, invoice do have payment -- payment_date not null
use sql_invoicing;
create table invoices_archived as
select invoice_id, number, c.name, invoice_total, payment_total, due_date, payment_date 
from invoices i  
join clients c
on i.client_id = c.client_id
where i.payment_date is not null;

-- give customer born before 1990 50 extra points
use sql_store;
update customers
set points = points + 50
where birth_date < '1991-01-01';

-- update comment of orders that customer have points > 3000 as gold customers
update orders
set 
	comments = 'gold customer'
where customer_id IN (
select customer_id
from customers
where points > 3000)
and comments is null;
