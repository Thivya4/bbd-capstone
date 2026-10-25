--q06 — Orders by status. Columns status, number_of_orders, total_amount for all orders, grouped by status and ordered by number_of_orders descending.

 select status, count(order_id)as Number_of_Orders, sum(amount)total_amount
 
 from orders
 group by status
 order by Number_of_Orders desc
 