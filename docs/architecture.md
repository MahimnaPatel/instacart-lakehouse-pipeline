# Architecture

This project follows a Lakehouse architecture using Databricks, PySpark, Delta Lake, and SQL.

## Pipeline Flow

Raw Instacart CSV files
↓
Bronze Delta tables
↓
Silver cleaned tables
↓
Gold analytics tables
↓
Dashboard pages

## Bronze Layer

The Bronze layer stores raw Instacart source data with minimal transformation. This preserves the original structure of the source files.

## Silver Layer

The Silver layer cleans and standardizes the raw data. This includes type casting, duplicate handling, joining product metadata, and preparing usable order-product records.

## Gold Layer

The Gold layer contains business-ready analytics tables used by the dashboard. These tables summarize order behavior, reorder patterns, department performance, customer behavior, and product pairs.

## Dashboard Layer

The dashboard uses Gold tables only. It includes three pages:
1. Overview
2. Product & Department Performance
3. Market Basket & Customer Behavior