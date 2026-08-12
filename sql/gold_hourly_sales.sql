CREATE OR REPLACE TABLE resume_project.gold.gold_hourly_sales AS
SELECT 
order_hour_of_day,
COUNT(order_id) AS Total_Sales_per_hour,
COUNT(DISTINCT user_id) AS Unique_Customers
FROM resume_project.default.orders
GROUP BY order_hour_of_day
ORDER BY order_hour_of_day

