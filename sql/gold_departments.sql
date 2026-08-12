CREATE OR REPLACE TABLE resume_project.gold.gold_departments AS
SELECT D.department_name, COUNT(PP.order_id) AS total_orders, COUNT(CASE WHEN PP.reordered = 1 THEN PP.order_id END) AS Reorders, ROUND((SUM(PP.reordered) / COUNT(PP.order_id)) * 100, 2) AS reorder_rate_percent
FROM resume_project.default.departments D
INNER JOIN resume_project.default.products P ON D.department_id = P.department_id
INNER JOIN resume_project.default.prodprior PP ON PP.product_id = P.product_id
GROUP BY D.department_name
ORDER BY COUNT(PP.order_id) DESC
