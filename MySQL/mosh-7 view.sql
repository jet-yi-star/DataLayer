-- create a view to see the balance for each client
use sql_invoicing;
create view clients_balance as
select c.client_id, c.name, SUM(i.invoice_total - i.payment_total) as balance
from clients c
join invoices i using (client_id)
group by c.client_id, c.name;

select c.client_id, c.name, SUM(i.invoice_total - i.payment_total) as balance
from clients c
join invoices i using (client_id)
group by c.client_id, c.name;
