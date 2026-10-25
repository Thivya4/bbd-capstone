--q10 — Customers who never ordered. Columns customer_id, first_name, last_name, region for customers that have no order at all, ordered by customer_id. Use a LEFT JOIN from customers to orders and test for the unmatched side.

 select customers.customer_id, customers.first_name, customers.last_name, 
 customers.region
 from customers as customers
 left join orders as orders
 on orders.customer_id=customers.customer_id
 where orders.customer_id is NULL
 order by customers.customer_id

