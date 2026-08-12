# Data Dictionary - Kaggle E-commerce Gold Layer

**Schema:** `resume_project.gold`  
**Source:** Silver layer tables from `resume_project.default`

---

## gold_daily_orders

Purpose: Tracks order activity by day of week to identify weekly ordering patterns.

| Column | Description |
|---|---|
| order_dow | Day of week encoded as 0-6 (0=Sunday, 6=Saturday) |
| Total_Sales_per_day | Number of distinct orders placed on that day of week |
| Unique_Customers | Number of distinct users who ordered on that day of week |
| avg_days_since_prior_order | Average number of days between orders for customers ordering on this day |

---

## gold_hourly_sales

Purpose: Tracks order activity by hour of day to identify peak ordering times.

| Column | Description |
|---|---|
| order_hour_of_day | Hour of day from 0-23 (24-hour format) |
| Total_Sales_per_hour | Number of distinct orders placed during that hour |
| Unique_Customers | Number of distinct users who ordered during that hour |

---

## gold_reorders

Purpose: Analyzes product reorder behavior to identify most frequently repurchased items.

| Column | Description |
|---|---|
| product_name | Name of the product |
| Times_Reordered | Total count of times this product was reordered (not first purchase) |
| total_orders | Total number of times this product was ordered (including first purchases) |
| reorder_rate_percent | Percentage of orders that were reorders (Times_Reordered / total_orders * 100) |

---

## gold_departments

Purpose: Aggregates department-level performance metrics including popularity and reorder rates.

| Column | Description |
|---|---|
| department_name | Name of the department |
| total_orders | Total number of product orders from this department |
| Reorders | Count of reordered products from this department |
| reorder_rate_percent | Percentage of department orders that were reorders |

---

## gold_user_behavior

Purpose: Analyzes customer loyalty and purchasing frequency patterns at the user level.

| Column | Description |
|---|---|
| user_id | Unique customer identifier |
| total_reorders | Total number of products this user has reordered |
| total_orders | Total number of distinct orders placed by this user |
| avg_days_between_orders | Average number of days between consecutive orders for this user |
| reorder_rate_percent | Percentage of this user's product purchases that were reorders |

---

## gold_product_pairs

Purpose: Market basket analysis identifying products frequently purchased together in the same order.

| Column | Description |
|---|---|
| product_1 | First product in the pair |
| product_2 | Second product in the pair |
| times_bought_together | Number of orders containing both products |

**Note:** Each product pair appears once (product_1 < product_2 to avoid duplicates).

---

## Notes

* All tables are materialized gold layer aggregations designed for dashboard and analytics consumption
* Tables are created with `CREATE OR REPLACE TABLE` for idempotent execution
* Source data flows from bronze → silver → gold in a medallion architecture
* Reorder metrics track whether a product was previously purchased by the same user