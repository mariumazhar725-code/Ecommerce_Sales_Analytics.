🛒 𝐄-𝐂𝐨𝐦𝐦𝐞𝐫𝐜𝐞 𝐒𝐚𝐥𝐞𝐬 𝐀𝐧𝐚𝐥𝐲𝐭𝐢𝐜𝐬

<p align="center">
  <img width="1600" height="800" alt="image" src="https://github.com/user-attachments/assets/093c7fc5-b8e3-44ae-93a1-b3052d068702" />

</p>



📖𝐎𝐯𝐞𝐫𝐯𝐢𝐞𝐰

The E-Commerce Sales Analytics project analyzes real-world e-commerce transaction data to understand sales performance, customer behavior, product categories, seller performance, payment trends, customer reviews, and geographic sales patterns.

The project follows an end-to-end data analytics lifecycle, including data cleaning, preprocessing, SQL analysis, KPI analysis, business insights, and interactive Power BI dashboard development.


🎯𝐎𝐛𝐣𝐞𝐜𝐭𝐢𝐯𝐞𝐬

 Clean and preprocess real-world e-commerce data.
 Handle missing values and data quality issues.
 Prepare datasets for relational database analysis.
 Perform SQL-based business analysis.
 Analyze sales, customers, products, sellers, payments, and reviews.
 Identify top-performing product categories and sellers.
 Analyze revenue by city and state.
 Analyze monthly and yearly order trends.
 Calculate important business KPIs.
 Build an interactive Power BI dashboard.
 Generate meaningful business insights.


📂 𝐃𝐚𝐭𝐚𝐬𝐞𝐭

 𝐃𝐚𝐭𝐚𝐬𝐞𝐭: Brazilian E-Commerce Public Dataset by Olist
 𝐃𝐨𝐦𝐚𝐢𝐧: E-Commerce
 𝐅𝐨𝐫𝐦𝐚𝐭: CSV
 𝐃𝐚𝐭𝐚𝐛𝐚𝐬𝐞: PostgreSQL

 𝐌𝐚𝐢𝐧 𝐃𝐚𝐭𝐚 𝐒𝐨𝐮𝐫𝐜𝐞𝐬

- Customers
- Orders
- Order Items
- Products
- Sellers
- Payments
- Reviews
- Product Categories
- Geolocation



🛠️ 𝐓𝐞𝐜𝐡𝐧𝐨𝐥𝐨𝐠𝐢𝐞𝐬 𝐔𝐬𝐞𝐝

 Tool-------------------------------->>Purpose 

 Python------------------------------->>Data Cleaning & Preprocessing
 Pandas------------------------------->>Data Manipulation
 Jupyter Notebook------------------------>>Data Preparation 
 PostgreSQL-------------------------------->>Database Management 
 SQL---------------------------------------->> Business Analysis 
 Power BI------------------------------------>> Dashboard & Visualization
 GitHub--------------------------------------->> Project Documentation 



🔄 𝐏𝐫𝐨𝐣𝐞𝐜𝐭 𝐖𝐨𝐫𝐤𝐟𝐥𝐨𝐰

  text
Raw E-Commerce Data
        │
        ▼
Data Cleaning & Preprocessing
        │
        ▼
Cleaned Datasets
        │
        ▼
PostgreSQL Database
        │
        ▼
SQL Business Analysis
        │
        ▼
KPI & Business Insights
        │
        ▼
Power BI Dashboard
        │
        ▼
Interactive Business Reporting



🧹 𝐃𝐚𝐭𝐚 𝐂𝐥𝐞𝐚𝐧𝐢𝐧𝐠
Python and Pandas were used to prepare the datasets for analysis.
✔ Inspected datasets and data types
✔ Identified missing values
✔ Handled data quality issues
✔ Standardized data
✔ Created useful date-related columns
✔ Prepared cleaned datasets for PostgreSQL
✔ Exported cleaned datasets for further analysis



🗄️ 𝐃𝐚𝐭𝐚𝐛𝐚𝐬𝐞 𝐒𝐭𝐫𝐮𝐜𝐭𝐮𝐫𝐞
The cleaned datasets were loaded into PostgreSQL and organized into related tables.
customers
orders
orderItem
products
sellers
payement
reviews
categories
geolocation

𝐊𝐞𝐲 𝐑𝐞𝐥𝐚𝐭𝐢𝐨𝐧𝐬𝐡𝐢𝐩𝐬:
Customers
    │
    ▼
Orders
    │
    ▼
Order Items
    │
    ├────────► Products
    │              │
    │              ▼
    │          Categories
    │
    └────────► Sellers

Orders ──────► Payments

Orders ──────► Reviews



🔍𝐒𝐐𝐋 𝐀𝐧𝐚𝐥𝐲𝐬𝐢𝐬
The SQL analysis focuses on important business questions and performance metrics.
Customer Analysis
Total number of customers
Customers by state
Customers by city
Revenue by customer state
Revenue by customer city
Sales Analysis
Total revenue
Revenue by state
Revenue by city
Monthly order trends
Yearly order trends
Average payment value
Product Analysis
Top-selling product categories
Product category performance
Products with missing categories
Category-level sales analysis
Seller Analysis
Top-performing sellers
Seller revenue
Orders handled by sellers
Seller performance by city and state
Payment Analysis
Total payments
Average payment value
Payment-related analysis
Order Analysis
Total orders
Delivered orders
Cancelled orders
Processing orders
Invoiced orders
Orders by month
Orders by year
Review Analysis
Review scores
Customer satisfaction
Product/category rating analysis


📈 𝐊𝐞𝐲 𝐊𝐏𝐈𝐬
The project analyzes important business metrics including:
💰 Total Revenue
📦 Total Orders
👥 Total Customers
🏪 Total Sellers
🛍️ Total Items Sold
💳 Average Payment Value
⭐ Customer Review Scores
🌎 Revenue by State
🏙️ Revenue by City
📊 Revenue by Product Category



📊 𝐏𝐨𝐰𝐞𝐫 𝐁𝐈 𝐃𝐚𝐬𝐡𝐛𝐨𝐚𝐫𝐝
The Power BI dashboard transforms the SQL analysis into interactive business reports.


𝐃𝐚𝐬𝐡𝐛𝐨𝐚𝐫𝐝 𝐈𝐧𝐜𝐥𝐮𝐝𝐞𝐬
Revenue Performance
Sales Trends
Order Analysis
Customer Insights
Product Category Performance
Seller Performance
Geographic Revenue Analysis
Payment Analysis
Customer Review Analysis


📷 𝐃𝐚𝐬𝐡𝐛𝐨𝐚𝐫𝐝 𝐏𝐫𝐞𝐯𝐢𝐞𝐰
ᴱˣᵉᶜᵘᵗⁱᵛᵉ ᴰᵃˢʰᵇᵒᵃʳᵈ
<img width="596" height="337" alt="image" src="https://github.com/user-attachments/assets/4f24ff0b-eedb-4ca4-8c66-7183a9832b1c" />

𝖲𝖺𝗅𝖾𝗌 𝖯𝖾𝗋𝖿𝗈𝗋𝗆𝖺𝗇𝖼𝖾
<img width="601" height="330" alt="image" src="https://github.com/user-attachments/assets/a336f8ce-3fd1-42fa-a4fd-15654fc491e0" />

𝖢𝗎𝗌𝗍𝗈𝗆𝖾𝗋 𝖨𝗇𝗌𝗂𝗀𝗁𝗍𝗌
<img width="595" height="338" alt="image" src="https://github.com/user-attachments/assets/49789053-4fd6-4330-880e-44a57163d54c" />


💡𝐊𝐞𝐲 𝐁𝐮𝐬𝐢𝐧𝐞𝐬𝐬 𝐈𝐧𝐬𝐢𝐠𝐡𝐭𝐬
The analysis helps identify:
High-revenue customer states and cities.
Top-performing product categories.
Top-performing sellers by revenue.
Monthly and yearly order trends.
Customer satisfaction patterns based on reviews.
Order-status distribution.
Payment value patterns.
Geographic sales performance.
These insights can help businesses understand sales performance and support data-driven decision-making.


📁 𝐏𝐫𝐨𝐣𝐞𝐜𝐭 𝐒𝐭𝐫𝐮𝐜𝐭𝐮𝐫𝐞:
Ecommerce_Sales_Analytics/
│
├── data/
│   ├── cleaned_customers.csv
│   ├── cleaned_orders.csv
│   ├── cleaned_order_items.csv
│   ├── cleaned_products.csv
│   ├── cleaned_sellers.csv
│   ├── cleaned_payments.csv
│   ├── cleaned_reviews.csv
│   ├── cleaned_categories.csv
│   └── cleaned_geolocation.csv
│
├── Python/
│   └── E-commerce_Data_Cleaning.ipynb
│
├── SQL/
│   └── E-commerce Sales Analytics SQL.sql
│
├── PowerBI/
│   └── E-commerce Sales Analytics.pbix
│
├── Screenshots/
│   ├── banner.png
│   ├── executive_dashboard.png
│   ├── sales_performance.png
│   └── customer_insights.png
│
└── README.md


🎓 𝐏𝐫𝐨𝐣𝐞𝐜𝐭 𝐎𝐮𝐭𝐜𝐨𝐦𝐞:
This project demonstrates an end-to-end approach to solving a real-world data analytics problem.
The workflow transforms raw e-commerce data into cleaned datasets, structured database tables, SQL-based business analysis, and interactive Power BI dashboards.


👩‍💻 𝐀𝐮𝐭𝐡𝐨𝐫
𝑀𝒶𝓇𝓎𝒶𝓂 𝒜𝓏𝒽𝒶𝓇
Student | Aspiring Data Analyst
Skills
SQL Python PostgreSQL Power BI Pandas Data Analytics


