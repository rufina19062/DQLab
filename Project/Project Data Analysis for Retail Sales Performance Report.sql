-- DQLab Store Overall Performance
--Overall Performance by Year
SELECT 
	YEAR(order_date) AS years,
	SUM(sales) AS sales,
	COUNT(order_id) AS number_of_order
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
GROUP BY years

-- Overall Performance by Product Sub Category
SELECT
	YEAR(order_date) AS years,
	product_sub_category,
	SUM(sales) as sales
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
	AND (YEAR(order_date) = 2011
	OR YEAR(order_date) = 2012)
GROUP BY 1, 2
ORDER BY 1, 3 DESC

-- DQLab Store Promotion Effectiveness and Efficiency
-- Promotion Effectiveness and Efficiency by Years
SELECT
	YEAR(order_date) AS years,
	SUM(sales) AS sales,
	SUM(discount_value) AS promotion_value,
	ROUND(((SUM(discount_value)/SUM(sales))*100), 2) AS burn_rate_percentage
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
GROUP BY YEAR(order_date)

-- Promotion Effectiveness and Efficiency by Product Sub Category
SELECT 
	  YEAR(order_date) AS years,
	  product_sub_category,
	  product_category,
	  SUM(sales) AS sales,
	  SUM(discount_value) AS promotion_value,
	  ROUND(((SUM(discount_value)/sum(sales))*100), 2) AS burn_rate_percentage
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
	AND YEAR(order_date) = 2012
GROUP BY 1, 2, 3
ORDER BY 4 DESC

-- Customer Analytics
-- Customers Transactions per Year
SELECT
	YEAR(order_date) AS years,
	COUNT( DISTINCT customer) AS number_of_customer
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
GROUP BY 1
ORDER BY 1