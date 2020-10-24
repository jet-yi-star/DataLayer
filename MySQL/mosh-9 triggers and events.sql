-- create a trigger
use sql_invoicing;
delimiter $$
create trigger payments_after_delete
	after delete on payments
    for each row
begin
	update invoices
	set payment_total = payment_total - old.amount
	where invoice_id = old.invoice_id;
end $$
delimiter ;

delete from payments where payment_id = 10;
-- auditing
USE sql_invoicing; 

CREATE TABLE payments_audit
(
	client_id 		INT 			NOT NULL, 
    date 			DATE 			NOT NULL,
    amount 			DECIMAL(9, 2) 	NOT NULL,
    action_type 	VARCHAR(50) 	NOT NULL,
    action_date 	DATETIME 		NOT NULL
)

