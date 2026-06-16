# Retail Sales & Customer Segmentation Analysis

## Overview
End-to-end data analytics project analyzing 541,909 e-commerce 
transactions from a UK-based online retailer (UCI ML Repository, 
2010-2011). Identifies customer segments using RFM Analysis (SQL) 
and K-Means Clustering (Python) to support marketing decisions.

## Tech Stack
| Tool | Usage |
|:-----|:------|
| MySQL | Data storage, cleaning, CTEs, Window Functions, RFM |
| Python | EDA, RFM calculation, K-Means clustering (Scikit-learn) |
| Power BI | 3-page interactive dashboard |
| GitHub | Version control and documentation |

## Key Business Insights
- Analyzed 541,909 transactions worth £8.9M revenue
- Champions segment = 16% of customers → 64.7% of total revenue
- Peak sales hours: 10AM-12PM on weekdays
- UK drives 83% of total revenue across 38 countries
- 4 customer segments identified using K-Means clustering (K=4)

## SQL Highlights
- 3-CTE RFM pipeline classifying 4,338 customers into segments
- Window Functions: RANK(), LAG(), NTILE(), SUM() OVER()
- Data cleaning reduced 541,909 rows to 397,880 valid records

## Machine Learning
- Algorithm: K-Means Clustering (K=4)
- Preprocessing: Log transform + StandardScaler
- Validation: Elbow Method + Silhouette Score
- Output: 4 segments — Champions, Loyal, New, Lost Customers

## Project Structure
| Folder | Contents |
|:-------|:---------|
| sql/ | 4 SQL scripts — create, clean, EDA, RFM |
| notebooks/ | Jupyter notebook with EDA and K-Means |
| data/processed/ | Cleaned CSV outputs |
| powerbi/ | Power BI dashboard file |

## How to Run
1. Run sql/01_create_db.sql in MySQL Workbench
2. Copy CSV to MySQL secure folder, run sql/02_clean_data.sql
3. Run sql/03_eda_queries.sql and sql/04_rfm_analysis.sql
4. Open notebooks/retail_analysis.ipynb and run all cells
5. Open powerbi/retail_dashboard.pbix in Power BI Desktop
