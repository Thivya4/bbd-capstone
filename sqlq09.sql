--q09 — Order-level fact table. Columns order_id, order_month, first_name, last_name, region (the customer's region), rep_name, item, quantity, amount, status for every order, produced by joining orders, customers and reps on their key columns, ordered by order_id.

 select orders.order_id, orders.order_month, customers.first_name, customers.last_name, 
 customers.region, reps.rep_name, orders.item, orders.quantity, orders.amount,
 orders.status
 from orders as orders
 left join customers as customers
 on customers.customer_id=orders.customer_id
 left join reps as reps
 on reps.rep_id=customers.rep_id

