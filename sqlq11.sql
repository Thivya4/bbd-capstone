--q11 — Region and month report. Columns region, order_month, number_of_orders, number_of_customers (distinct customers), total_revenue, average_revenue for completed orders, grouped by the customer's region and the order month, ordered by region then order_month. Add a SQL comment stating why you chose the join type you used and why the distinct count is necessary.

 select customer.region, orders.order_month, count(orders.order_id) as Number_of_orders, 
 count(distinct orders.customer_id)as Number_of_Customers,sum(orders.amount)as total_revenue,
 avg(orders.amount)as avg_revenue
 from orders as orders
 left join customers as customer
 on orders.customer_id=customer.customer_id
 where orders.status = "completed"
 group by customer.region, orders.order_month
 order by customer.region, orders.order_month

-- I choose left join becasue here order table contains relevant details. customer_id is the 
-- common column for orders table and cusotmers table.
-- distinct count for identify the unique cusotmer. because one single person order multiple items.
--for that reason distinct keyword used