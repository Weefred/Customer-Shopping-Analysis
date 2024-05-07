
-- 1)  Total revenue

SELECT FORMAT(SUM([revenue]), 'N0')AS total_revenue
FROM [dbo].[customer_shopping_data]

-- 2) Total revenue for each year

SELECT [year], FORMAT(SUM([revenue]), 'N0')AS total_revenue
FROM [dbo].[customer_shopping_data]
GROUP BY [year]

-- 3)  Number of shopping malls

SELECT DISTINCT ([shopping_mall]) 
FROM[dbo].[customer_shopping_data]

-- 4) Revenue by shopping mall 

SELECT [shopping_mall] , FORMAT(SUM ([revenue]), 'N0') AS 'revenue generated'
FROM [dbo].[customer_shopping_data]
GROUP BY [shopping_mall]
ORDER BY 'revenue generated' DESC

-- 5) Quantity sold by shopping mall

SELECT [shopping_mall] , FORMAT(SUM ([quantity]), 'N0') AS 'total quantity sold'
FROM [dbo].[customer_shopping_data]
GROUP BY [shopping_mall]
ORDER BY 'total quantity sold' DESC

-- 6) Total quantity sold by day_of_week

SELECT [day_of_week], FORMAT(SUM ([quantity]),'N0') AS 'total quantity sold'
FROM [dbo].[customer_shopping_data]
GROUP BY[day_of_week]
ORDER BY 'total quantity sold' DESC

-- 7) Most common payment method

SELECT[payment_method], COUNT([payment_method]) AS 'no of times used'
FROM [dbo].[customer_shopping_data]
GROUP BY [payment_method]
ORDER BY 'no of times used' DESC

-- 8) Busiest shopping days

SELECT [day_of_week], COUNT(*) AS total_transactions
FROM [dbo].[customer_shopping_data]
GROUP BY [day_of_week]
ORDER BY [day_of_week] DESC

-- 9) Average price per product category

SELECT category, ROUND (AVG(price), 2) AS avg_price
FROM [dbo].[customer_shopping_data]
GROUP BY category
ORDER BY avg_price DESC;

-- 10) Revenue by product category

SELECT [category], SUM([revenue]) AS 'total revenue'
FROM[dbo].[customer_shopping_data]
GROUP BY[category] 
ORDER BY 'total revenue' DESC

-- 11) Total quantity sold by product category

SELECT [category], SUM([quantity]) AS 'total quantity sold'
FROM[dbo].[customer_shopping_data]
GROUP BY[category] 
ORDER BY 'total quantity sold' DESC

-- 12) Average order quantity by product category 

SELECT[category], AVG([quantity]) AS 'avg order quant'
FROM[dbo].[customer_shopping_data]
GROUP BY [category]

-- 13) Gender Distribution 

SELECT [gender], COUNT([gender]) AS 'population'
FROM[dbo].[customer_shopping_data]
GROUP BY [gender]
ORDER BY 'population' DESC

-- 14) Average purchase amount by gender

SELECT gender, AVG(quantity * price) AS avg_purchase_amount
FROM [dbo].[customer_shopping_data]
GROUP BY gender
ORDER BY avg_purchase_amount

-- 15) Most common product category by gender

SELECT gender, category, COUNT(*) AS total_transactions
FROM [dbo].[customer_shopping_data]
GROUP BY gender, category
ORDER BY gender, total_transactions DESC

-- 16) Age group Distribution 

SELECT [age_group], COUNT([age_group]) AS 'population'
FROM[dbo].[customer_shopping_data]
GROUP BY[age_group]
ORDER BY 'population' DESC














