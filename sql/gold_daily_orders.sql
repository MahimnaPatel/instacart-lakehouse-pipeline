CREATE OR REPLACE TABLE resume_project.gold.gold_daily_orders AS
SELECT 
  order_dow,
  COUNT(order_id) AS Total_Sales_per_day,
  COUNT(DISTINCT user_id) AS Unique_Customers,
  ROUND(AVG(days_since_prior_order), 2) as avg_days_since_prior_order
FROM resume_project.default.orders
GROUP BY order_dow
ORDER BY order_dow