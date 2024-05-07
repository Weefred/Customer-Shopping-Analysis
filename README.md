<div align='center'> <h1>  Retail Sales Analysis </div>

#### Tools used: Excel, MS SQL Server, Tableau

**[Dataset used](https://www.kaggle.com/datasets/mehmettahiraslan/customer-shopping-dataset)**

**SQL Analysis-code**

**Tableau Dashboard**- click to view

**Tableau Dashboard**- [click to interact](https://public.tableau.com/app/profile/weefred.momodu/viz/Customershoppingdata/Dashboard1?publish=yes)

## About

This project involves analyzing a sales dataset to uncover insights into customer behavior, sales trends, and purchasing patterns within a retail environment. 

## About Data 

The dataset was obtained from the Customer Shopping Retail Sales Data. This dataset contains shopping information from 10 different shopping malls in Istanbul between 2021 and 2023. The data contains 10 columns and 99,458 rows.

## Approach Used

1.	**Data Wrangling**: This process involved checking for duplicate values, correcting errors, inconsistencies and using the right data types.
   
2.	**Feature Engineering**: This involved creating new columns from existing ones. The new columns created include:
   
a.	**year**:  The different years 2021, 2022, 2023 were extracted from the invoice date column to conduct an annual sales analysis.

b.	**month_name**: The month in which the transaction took place was derived from the date column. This information enables the determination of which month of the year records the 
         highest sales and profit.

c.	**day of week**: Also obtained from invoice date, this information helps to determine which days of the week recorded the highest and lowest sales.

d.	**age_group**: The age brackets (18-24), (25-34), (35-44), etc. was created to allow for a customer- based analysis.

e.	**revenue**: This column was created from the price and quantity columns.

3.	Exploratory Data Analysis (EDA): Exploratory data analysis was done to answer the vital business questions to identify relationships between variables and extract meaningful 
        insights.

## Business Questions and Answers
  Click to view
  
## Insights

1. The older age groups (55-69) have the highest representation for both genders, followed by progressively younger age groups. 

2. Clothing emerges as the top-selling product category for both genders, with 62,039 units sold to females and 41,519 units sold to males, followed by cosmetics and food and beverage. 

3. Females demonstrate a stronger interest in toys and technology, while males show higher sales in categories like Shoes and books.

4. Clothing, Shoes, and Technology stand out as the top revenue-generating categories. Books, toys, food and beverage contribute lower revenue suggesting the need for growth and 
   optimization through targeted marketing efforts or product enhancements.

5. Mall of Istanbul emerges as the top revenue-generating mall, closely followed by Kanyon. On the other hand, Emaar Square Mall, and Viaport Outlet exhibit lower revenue figures, 
  suggesting the need for improvement in marketing strategies or tenant mix to increase foot traffic and sales.

6. Monday, Friday, and Tuesday show slightly higher sales figures compared to other days. This suggests a stable demand across the weekdays, indicating that customers are actively 
   making purchases throughout the week.






 
