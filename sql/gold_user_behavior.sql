CREATE OR REPLACE TABLE resume_project.gold.gold_user_behavior AS
SELECT 
  O.user_id,
  COUNT(CASE WHEN P.reordered = 1 THEN P.order_id END) as total_reorders,
  COUNT(DISTINCT O.order_id) as total_orders,
  ROUND(AVG(O.days_since_prior_order), 2) as avg_days_between_orders,
  ROUND(COUNT(CASE WHEN P.reordered = 1 THEN P.order_id END) * 100.0 / COUNT(P.order_id), 2) as reorder_rate_percent
FROM resume_project.default.orders O
JOIN resume_project.default.prodprior P ON P.order_id = O.order_id
GROUP BY O.user_id
ORDER BY total_reorders DESC
