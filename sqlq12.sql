--q12 — Product contribution tiers. Columns item, total_revenue, contribution_tier for completed orders grouped by item, ordered by total_revenue descending. contribution_tier is High when the item's total revenue is at least 60000, Medium when it is at least 15000 but below 60000, and Low otherwise.
  
 select item, sum(amount) as total_revenue,
 CASE 
     WHEN SUM(amount)>= 60000 THEN 'High'
     WHEN SUM(amount)>= 15000 THEN 'Medium'
     ELSE 'Low'
    end as contribution_tier
from orders
where status = 'completed'
group BY item
order BY total_revenue desc;