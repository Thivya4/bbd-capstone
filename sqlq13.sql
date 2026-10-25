--q13 — Rep performance against target. Columns rep_name, order_month, monthly_target, revenue, performance_tier for completed orders, grouped by rep, month and the rep's monthly_target (join reps, customers, orders), ordered by rep_name then order_month. performance_tier is Below Target when revenue is below the rep's monthly_target, On Target when revenue is at least the target but below 1.1 times the target, and Above Target otherwise. Compute the tier directly from the aggregate expression: an alias of an aggregate or conditional expression cannot be referenced in WHERE (aggregates are not allowed in WHERE), so write the expression out in full.

select sum(orders.amount) as revenue,
  CASE 
      WHEN SUM(orders.amount) < reps.monthly_target THEN 'Below Target'
      WHEN SUM(orders.amount) >= reps.monthly_target AND 
      SUM(orders.amount) < 1.1 * reps.monthly_target THEN 'On Target'
      ELSE 'Above Target'
  END AS performance_tier
FROM reps as reps
JOIN customers as customers
ON reps.rep_id = customers.rep_id
JOIN orders as orders 
ON customers.customer_id = orders.customer_id
where orders.status = 'Completed'
GROUP BY 
  reps.rep_name,orders.order_month,reps.monthly_target
ORDER BY 
  reps.rep_name,  order_month asc