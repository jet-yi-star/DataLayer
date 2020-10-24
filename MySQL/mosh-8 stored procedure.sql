-- create a stored procedure
use sql_invoicing;
delimiter $$
create procedure get_invoices_with_balance()
begin
select *
from invoices
where invoice_total - payment_total > 0;
end$$
delimiter ;

-- stored procedure with parameter
delimiter $$
create procedure get_invoices_by_client(client_id INT)
begin
select * 
from invoices i
where i.client_id = client_id;
end$$
delimiter ;

-- with two parameters and default
-- both null, all the payment in db

delimiter $$
create procedure get_payments(client_id INT(4), payment_method_id TINYINT(1))
begin
select *
from payments p
where p.client_id = IFNULL(client_id, p.client_id) 
and p.payment_method = IFNULL(payment_method_id, p.payment_method);
end$$
delimiter ;

