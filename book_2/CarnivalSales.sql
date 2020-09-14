-- Write a query that shows the total purchase sales income per dealership.

SELECT d.business_name as dealership, sum(s.price) as num_purchases
FROM sales s
    JOIN dealerships d ON s.dealership_id = d.dealership_id
WHERE s.sales_type_id = 1
GROUP BY dealership
ORDER BY num_purchases DESC;

-- Write a query that shows the purchase sales income per dealership for the current month.

SELECT d.business_name as dealership, sum(s.price) as total_income
FROM sales s
    JOIN dealerships d ON s.dealership_id = d.dealership_id
WHERE s.sales_type_id = 1 AND s.purchase_date >= current_date - 30
GROUP BY dealership
ORDER BY total_income DESC;

-- Write a query that shows the purchase sales income per dealership for the current year

SELECT d.business_name as dealership, sum(s.price) as total_income
FROM sales s
    JOIN dealerships d ON s.dealership_id = d.dealership_id
WHERE s.sales_type_id = 1 AND s.purchase_date >= current_date - 365
GROUP BY dealership
ORDER BY total_income DESC;

-- Write a query that shows the total income (purchase and lease) per employee.

SELECT 
	CONCAT(e.first_name, ' ', e.last_name) as employee_name, 
	sum(s.price) as total_income
FROM sales s
	JOIN employees e ON s.employee_id = e.employee_id
GROUP BY
	employee_name
ORDER BY
	total_income DESC;