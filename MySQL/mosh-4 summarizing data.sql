-- aggregate functions
use sql_invoicing;
select 'first half of 2019' as 'date_range', 
SUM(invoice_total) as 'total_sales', 
SUM(payment_total) as 'total_payments',
SUM(invoice_total) - SUM(payment_total) as 'what_we_expect'
from invoices
where invoice_date BETWEEN '2019-01-01' AND '2019-06-30'
UNION
select 'second half of 2019', 
SUM(invoice_total), 
SUM(payment_total),
SUM(invoice_total) - SUM(payment_total)
from invoices
where invoice_date BETWEEN '2019-07-01' AND '2019-12-31'
UNION
select 'total', 
SUM(invoice_total), 
SUM(payment_total),
SUM(invoice_total) - SUM(payment_total)
from invoices
where invoice_date BETWEEN '2019-01-01' AND '2019-12-31';

-- group by
use sql_invoicing;
select p.date, ps.name as payment_method, SUM(p.amount)
from payments p
Join payment_methods ps
on p.payment_method = ps.payment_method_id
group by p.date, payment_method
order by p.date;

-- having
use sql_store;
select c.customer_id, SUM(oi.quantity * unit_price) as spend
from customers c
join orders o
on c.customer_id = o.customer_id
join order_items oi 
on o.order_id = oi.order_id
where state = 'VA'
group by customer_id
having spend > 150;

-- rollup
use sql_invoicing;
select pm.name as payment_method, sum(p.amount)
from payments p 
join payment_methods pm
on p.payment_method = pm.payment_method_id
group by pm.name with rollup;

