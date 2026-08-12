CREATE OR REPLACE TABLE resume_project.gold.gold_reorders AS
SELECT P.product_name, SUM(PP.reordered) Times_Reordered, COUNT(PP.order_id) AS total_orders, ROUND((SUM(PP.reordered) / COUNT(PP.order_id)) * 100, 2) AS reorder_rate_percent
FROM resume_project.default.products P
JOIN resume_project.default.prodprior PP ON P.product_id = PP.product_id
GROUP BY P.product_name
ORDER BY COUNT(PP.order_id) DESC