
-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------BUSINESS QUESTIONS AND ANSWERS ---------------------------------------------------------------------------


--  What is the total revenue generated from all orders?

SELECT FORMAT(SUM([revenue]), 'N0')AS total_revenue
FROM [dbo].[customer_shopping_data]


--  What is the total revenue for each year?

SELECT FORMAT(SUM([revenue]), 'N0')AS total_revenue
FROM [dbo].[customer_shopping_data]
WHERE [year]=2021


--  How many unique shopping malls does the data have?

SELECT DISTINCT ([shopping_mall]) 
FROM[dbo].[customer_shopping_data]


--  Which shopping mall generated the most revenue?

SELECT [shopping_mall] , FORMAT(SUM ([revenue]), 'N0') AS 'revenue generated'
FROM [dbo].[customer_shopping_data]
GROUP BY [shopping_mall]
ORDER BY 'revenue generated' DESC


-- What is the total quantity sold in each shopping mall?

SELECT [shopping_mall] , FORMAT(SUM ([quantity]), 'N0') AS 'total quantity sold'
FROM [dbo].[customer_shopping_data]
GROUP BY [shopping_mall]
ORDER BY 'total quantity sold' DESC


--  Which mall sold more products than the average product sold?

SELECT[shopping_mall], FORMAT (SUM([quantity])/ COUNT (DISTINCT [shopping_mall]),'N0')  AS 'avg products sold'
FROM [dbo].[customer_shopping_data]
GROUP BY[shopping_mall]
HAVING SUM([quantity])/ COUNT (DISTINCT [shopping_mall]) >29871
ORDER BY 'avg products sold'DESC


--  What is the total revenue by month for each year?

SELECT  [month_name],FORMAT(SUM([revenue]),'N0') AS total_revenue
FROM[dbo].[customer_shopping_data]
GROUP BY[month_name]
ORDER BY total_revenue DESC


--  What is the total number of sales per weekday?

SELECT [day_of_week],FORMAT(SUM ([quantity]),'N0') AS 'total quantity sold'
FROM [dbo].[customer_shopping_data]
GROUP BY[day_of_week]
ORDER BY 'total quantity sold' DESC


--	Which day of the week recorded the highest revenue?

SELECT [day_of_week],FORMAT(SUM ([revenue]),'N0') AS 'total revenue'
FROM [dbo].[customer_shopping_data]
GROUP BY[day_of_week]
ORDER BY 'total revenue' DESC


--  How many unique payment methods does the data have?

SELECT DISTINCT([payment_method]) 
FROM[dbo].[customer_shopping_data]


--  What is the most common payment method?

SELECT[payment_method], COUNT([payment_method]) AS 'no of times used'
FROM [dbo].[customer_shopping_data]
GROUP BY [payment_method]
ORDER BY 'no of times used' DESC


-- Busiest shopping days

SELECT [day_of_week], COUNT(*) AS total_transactions
FROM [dbo].[customer_shopping_data]
GROUP BY [day_of_week]
ORDER BY [day_of_week] DESC


--   How many unique product categories does the data have?

SELECT DISTINCT[category] AS product_category
FROM [dbo].[customer_shopping_data]

-- Average price per product category

SELECT category, ROUND (AVG(price), 2) AS avg_price
FROM [dbo].[customer_shopping_data]
GROUP BY category
ORDER BY avg_price DESC;

-- What product category has the highest revenue?

SELECT [category], SUM([revenue]) AS 'total revenue'
FROM[dbo].[customer_shopping_data]
GROUP BY[category] 
ORDER BY 'total revenue' DESC


--  What is the total quantity sold for each product category?

SELECT [category], SUM([quantity]) AS 'total quantity sold'
FROM[dbo].[customer_shopping_data]
GROUP BY[category] 
ORDER BY 'total quantity sold' DESC


--  What product category has the highest number of quantities sold in each shopping mall?

SELECT DISTINCT([category]),[shopping_mall], SUM([quantity]) AS 'total quantity sold'
FROM[dbo].[customer_shopping_data]
WHERE [category] ='clothing'
GROUP BY[category],[shopping_mall]
ORDER BY 'total quantity sold' DESC

 
--  What is the average order quantity for each product? 

SELECT[category], AVG([quantity]) AS 'avg order quant'
FROM[dbo].[customer_shopping_data]
GROUP BY [category]


--  What is the average age of customers?

SELECT AVG([age]) AS 'average age'
FROM[dbo].[customer_shopping_data]


--  What is the distribution of customers by age group?

SELECT [age_group], COUNT([age_group]) AS 'population'
FROM[dbo].[customer_shopping_data]
GROUP BY[age_group]
ORDER BY 'population' DESC


-- Average purchase amount by age group

SELECT [age_group], AVG(quantity * price) AS avg_purchase_amount
FROM [dbo].[customer_shopping_data]
GROUP BY [age_group]
ORDER BY avg_purchase_amount DESC


--  What is the most common product category by age group?

SELECT[age_group],[category],COUNT([age_group]) AS total_transactions
FROM[dbo].[customer_shopping_data]
WHERE [age_group]= '55-69'
GROUP BY[age_group],[category]
ORDER BY total_transactions DESC


--  What is the distribution of gender among customers?

SELECT [gender], COUNT([gender]) AS 'population'
FROM[dbo].[customer_shopping_data]
GROUP BY [gender]
ORDER BY 'population' DESC

-- Average purchase amount by gender

SELECT gender, AVG(quantity * price) AS avg_purchase_amount
FROM [dbo].[customer_shopping_data]
GROUP BY gender
ORDER BY avg_purchase_amount


--  What is the most common product category by gender?

SELECT gender, category, COUNT(*) AS total_transactions
FROM [dbo].[customer_shopping_data]
GROUP BY gender, category
ORDER BY gender, total_transactions DESC






-----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------FEATURE ENGINEERING--------------------------------------------------------------

--Add year column---------------------------------------------------------------------------------------------------------------------------------

SELECT
       invoice_date, 
       DATEPART (YYYY, invoice_date) AS 'year' 
FROM [dbo].[customer_shopping_data]

ALTER TABLE[dbo].[customer_shopping_data] 
ADD year INT

UPDATE [dbo].[customer_shopping_data]
SET year = DATEPART (YYYY, invoice_date)


--Add month_name column----------------------------------------------------------------------------------------------------------------------------

SELECT
       invoice_date, 
       DATENAME(MONTH, invoice_date) AS 'month_name' 
FROM [dbo].[customer_shopping_data]

ALTER TABLE[dbo].[customer_shopping_data]
ADD month_name NVARCHAR(15)

UPDATE [dbo].[customer_shopping_data]
SET month_name= DATENAME(MONTH, invoice_date)


-- Add day of week column--------------------------------------------------------------------------------------------------------------------------

SELECT
       invoice_date, 
       DATENAME(WEEKDAY, invoice_date) AS 'day_of_week' 
FROM [dbo].[customer_shopping_data]

ALTER TABLE[dbo].[customer_shopping_data]
ADD day_of_week NVARCHAR (15)

UPDATE[dbo].[customer_shopping_data]
SET day_of_week = DATENAME(WEEKDAY, invoice_date)


--Add age_group column-----------------------------------------------------------------------------------------------------------------------------

SELECT [age],
           CASE
           WHEN [age]<25 THEN '18-24'
		   WHEN [age]<35 THEN '25-34'
		   WHEN [age]<45 THEN '35-44'
		   WHEN [age]<55 THEN '45-54'
		   ELSE '55-69'
		   END AS 'age_group'
		   FROM [dbo].[customer_shopping_data]

ALTER TABLE [dbo].[customer_shopping_data]
ADD age_group NVARCHAR (15)

UPDATE [dbo].[customer_shopping_data]
SET age_group = (CASE
           WHEN [age]<25 THEN '18-24'
		   WHEN [age]<35 THEN '25-34'
		   WHEN [age]<45 THEN '35-44'
		   WHEN [age]<55 THEN '45-54'
		   ELSE '55-69'
		   END)

-- Add revenue column-----------------------------------------------------------------------------------------------------------------------------

SELECT ROUND([price], 0) AS product_price
FROM[dbo].[customer_shopping_data]

ALTER TABLE[dbo].[customer_shopping_data]
ADD product_price FLOAT

UPDATE [dbo].[customer_shopping_data]
SET product_price = ROUND([price], 0)

                                 SELECT [product_price]*[quantity] AS revenue
                                 FROM[dbo].[customer_shopping_data]

								 ALTER TABLE[dbo].[customer_shopping_data] 
								 ADD revenue INT

								 UPDATE[dbo].[customer_shopping_data]
								 SET revenue= [product_price]*[quantity]

