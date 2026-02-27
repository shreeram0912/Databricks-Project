# Databricks-Project


## Architecture


<img width="5371" height="2685" alt="image" src="https://github.com/user-attachments/assets/8fa2d491-4b0c-41a0-be19-e2c347845698" />
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
https://drive.google.com/file/d/1jng299B_VZDpiaOL4sFEvP9tt6ykr5cQ/view?usp=sharing
https://drive.google.com/file/d/10rTyHUEMaa0WrpStV46G7MlMfxa68rns/view?usp=sharing
