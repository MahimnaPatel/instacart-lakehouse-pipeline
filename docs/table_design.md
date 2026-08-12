# Table Design

## Bronze Layer

Bronze tables mirror the raw source files. They are used as the ingestion layer and preserve the original dataset structure.

## Silver Layer

Silver tables clean and standardize the raw data. Product, aisle, and department metadata are joined where needed to make downstream analytics easier.

## Gold Layer

Gold tables are designed for dashboard and business analysis.

### gold_daily_order_activity
Used to analyze ordering patterns by day of week.

### gold_hourly_order_activity
Used to identify peak ordering hours.

### gold_product_reorder_performance
Used to compare product purchase volume and reorder loyalty.

### gold_department_reorder_performance
Used to compare department demand and reorder behavior.

### gold_user_behavior
Used to analyze customer loyalty and repeat ordering patterns.

### gold_product_pairs
Used for market basket analysis by identifying products frequently purchased together.