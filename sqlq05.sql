
--q05 — Headline KPIs. One row with total_orders (count of orders), total_revenue, avg_order_value, min_order_value, max_order_value, computed over completed orders only.

 select count(order_id) as total_orders, sum(amount) as total_revenue, 
 avg(amount) as avg_order_value, min(amount) as min_order_value, max(amount)as max_order_value
 from orders
 where Status ="completed"