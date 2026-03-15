# Databricks-Project

## Project Overview
- This project demonstrates how to build a governed, secure, and scalable data platform using Azure Databricks, Unity Catalog, Azure SQL Database, and Azure Event Hub.
- The goal is to solve common enterprise data challenges like:
  * Data scattered across multiple systems
  * Inconsistent access control
  * Difficulty discovering trusted data
  * Compliance and auditing issues
- This solution brings everything into one unified, governed data platform.

## Business Problems
* **1️⃣ Data Sprawl:** Data was stored in different systems and locations, There was no single, unified view of tables, models, or storage.
* **2️⃣ Inconsistent Access Control:**
    * Each system (cloud storage, database, workspace) had its own security model.
    * Permissions were managed separately, causing: Security gaps, Users seeing inconsistent data, Risk of unauthorized access
* **3️⃣ Data Discovery Challenges:** 
    * Teams struggled to: Search datasets, Understand data lineage, Track data quality
* **4️⃣ Compliance & Monitoring Challenges:** 
    * There was no centralized way to: Track user activity, Monitor data access, Audit usage logs

## Solution Architecture
This project uses Unity Catalog to provide:
* Centralized governance
* Role-based access control
* Data discovery (search, tags, lineage)
* Compliance monitoring through system tables
All data is organized into Bronze, Silver, and Gold layers.

## 🥉 Bronze Layer – Data Ingestion
    Two data sources were used:
* **1. Batch Processing – Azure SQL Database**
 Connected using Databricks Lakeflow Connect, Data loaded into Unity Catalog -> Catalog
 * workspace_databricksproject_catalog,
 * Schema: 01_bronze
 * Tables: Tables: customer_reviews, customers, historical_orders, menu_items, restaurants.csv

* **2. Stream Processing – Azure Event Hub**
 Connected using Databricks Lakeflow Declarative Pipeline, Real-time order data streamed into -> Catalog
 * workspace_databricksproject_catalog,
 * Schema: 01_bronze
 * Tables: Tables: orders.csv
 * Then: Merged real-time orders with historical_orders

## 🥈 Silver Layer – Data Transformation
Implemented using Databricks Declarative Pipeline
* **1. Purpose:**
  * Clean raw data
  * Standardize formats
  * Apply business rules
  * Merge streaming + batch data
  * Prepare structured analytical tables
* **2. Transformations include:**
  * Data validation
  * Deduplication
  * Joins between customers, restaurants, and orders
  * Schema standardization
  * This layer prepares data for business-level analytics.

## 🥇 Gold Layer – Business-Level Aggregations
Also built using Declarative Pipeline
1. Purpose: Create analytics-ready datasets for dashboards.
2. Includes:
  * Revenue calculations
  * Customer metrics
  * Sales performance
  * Aggregated KPIs
  * Sentiment analysis from reviews, This layer powers executive dashboards.

## Architecture

<img width="5371" height="2685" alt="image" src="https://github.com/user-attachments/assets/8fa2d491-4b0c-41a0-be19-e2c347845698" />

## Repository Structure
```
Databricks-Project
│
├── 📂 00_synthetic_data
│   ├── 📂 data 
│   │   ├── 📄 customer_reviews.csv
│   │   ├── 📄 customers.csv
│   │   ├── 📄 historical_orders.csv
│   │   ├── 📄 menu_items.csv
│   │   └── 📄 restaurants.csv
│   │
│   ├── 📂 sql
│   │   ├── 📄 Dashboard.sql
│   │   ├── 📄 azuresqldatabase_setup.sql
│   │   ├── 📄 dlt_eventlog.sql
│   │   ├── 📄 gold_schemas.md
│   │   ├── 📄 silver_schemas.md
│   │   ├── 📄 sql_helper.sql
│   │   └── 📄 utility_script.sql
│   │
│   ├── 📄 .gitignore
│   ├── 📄 00_sql_db.py
│   ├── 📄 01_historical_orders.py
│   ├── 📄 02_reviews.py
│   ├── 📄 03_run.py
│   ├── 📄 04_eventhub_orders.py
│   └── 📄 requirements.txt
│
├── 📂 Bronze
│   ├── 📄 pipeline_policy_update.json
│   └── 📄 raw_ingestion.ipynb
│
├── 📂 Workflow_Daily_Pipeline-Job
│   ├── 📄 Job.json
│   ├── 📄 Job.py
│   └── 📄 job.yaml
│
├── 📂 dashboard
│   ├── 📄 Customer Reviews Dashboard.pdf
│   ├── 📄 Dashboard_Metrics.md
│   └── 📄 Restaurant Performance Dashboard.pdf
│
├── 📂 pipeline_transformation_silver - Lakeflow Declarative Pipeline
│   ├── 📄 pipeline_transformation_gold.py
│   └── 📄 pipeline_transformation_silver.py
│
├── 📄 Azure_Overallcharge_CostAnalysis.png
└── 📄 README.md
```

## Dashboards
Two interactive dashboards were created:
* **1️⃣ Restaurant Performance Dashboard**
  * 1. Filters: Date Range (Start Date – End Date)
  * 2. KPIs & Metrics: Total Orders, Total Revenue, Active Customers, AOV (Average Order Value) Unique Customers, Daily Sales, Best Selling Items, Order Volume by Day of Week, Peak Hour Analysis (Heatmap
                     by Day/Hour) Revenue by Order Type, Revenue by Food Category
    👉 Helps business understand sales trends and operational performance.

* **2️⃣ Customer Reviews Dashboard**
  * **1. Filter:** Restaurant Name
  * **2. KPIs & Insights:** Review Volume Over Time, Average Rating, City-wise Insights, Positive Review Count, Neutral Review Count, Negative Review Count, Sentiment Trend (Positive / Neutral / Negative
                          over time), Ratings Distribution
  * **3. Issue Categorization:** Delivery, Food Quality, Pricing, Portion Size, Recent Review Feedback
    👉 Helps improve customer satisfaction and service quality.

## Governance with Unity Catalog
* **1. This project demonstrates:**
  * Central Role-Based Access Control
  * Unified Data Governance
  * Data Lineage Tracking
  * Search & Discovery
  * Audit Logs via System Tables
  * Compliance Monitoring
* **2. Unity Catalog ensures:**
  * The right people see the right data
  * Security is consistent across systems
  * Full observability of data usage

## Technologies Used
| Layer / Tool | Purpose |
|--------------|---------|
| **![GitHub](https://img.shields.io/badge/GitHub-181717?logo=github&logoColor=white)** | Source code repository |
| **![Azure Databricks](https://img.shields.io/badge/Azure%20Databricks-FF3621?logo=databricks&logoColor=white)** | Distributed data engineering & analytics |
| **![Unity Catalog](https://img.shields.io/badge/Unity%20Catalog-0072C6?logo=microsoftazure&logoColor=white)** | Centralized governance for data & AI assets |
| **![Azure SQL Database](https://img.shields.io/badge/Azure%20SQL%20Database-0072C6?logo=microsoftazure&logoColor=white)** | Relational database for structured data |
| **![Azure Event Hub](https://img.shields.io/badge/Azure%20Event%20Hub-0072C6?logo=microsoftazure&logoColor=white)** | Real-time data ingestion & streaming |
| **![Lakeflow Connect](https://img.shields.io/badge/Lakeflow%20Connect-5C2D91?logo=microsoftazure&logoColor=white)** | Data connectivity across cloud storage |
| **![Lakeflow Declarative Pipeline](https://img.shields.io/badge/Lakeflow%20Declarative%20Pipeline-5C2D91?logo=microsoftazure&logoColor=white)** | Declarative orchestration of data workflows |
| **![SQL](https://img.shields.io/badge/SQL-336791?logo=postgresql&logoColor=white)** | Querying & managing structured data |
| **![PySpark](https://img.shields.io/badge/PySpark-E25A1C?logo=apachespark&logoColor=white)** | Processing & transformation |

## Key Outcomes
* Unified data governance
* Secure access control
* Real-time + batch data integration
* Business-ready dashboards
* Improved compliance monitoring
* Better decision-making with trusted data

## Business Impact
This solution enables:
* Faster decision-making
* Improved data security
* Better customer insights
* Operational efficiency
* Centralized governance

## **Video link for Azure Event Hub Live streaming:**
* **1️⃣ Source to Azure EventHub** --> https://drive.google.com/file/d/1jng299B_VZDpiaOL4sFEvP9tt6ykr5cQ/view?usp=sharing
* **2️⃣ Azure EventHub to Databricks** --> https://drive.google.com/file/d/10rTyHUEMaa0WrpStV46G7MlMfxa68rns/view?usp=sharing

## Conclusion
This project demonstrates how organizations can use: Azure Databricks, Unity Catalog, Lakehouse architecture to build a secure, scalable, and business-ready data platform.
It solves real-world enterprise challenges around:
* Data sprawl,
* Security,
* Compliance,
* Analytics

![Static Badge](https://img.shields.io/badge/Happy-DataEngineering!-blue)

