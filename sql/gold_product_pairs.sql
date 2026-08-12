CREATE OR REPLACE TABLE resume_project.gold.gold_product_pairs AS
SELECT 
  P1.product_name as product_1, 
  P2.product_name as product_2, 
  COUNT(*) as times_bought_together
FROM resume_project.default.prodprior PP1
JOIN resume_project.default.prodprior PP2 ON PP1.order_id = PP2.order_id
JOIN resume_project.default.products P1 ON PP1.product_id = P1.product_id
JOIN resume_project.default.products P2 ON PP2.product_id = P2.product_id
WHERE PP1.product_id < PP2.product_id
GROUP BY P1.product_name, P2.product_name
ORDER BY times_bought_together DESC
