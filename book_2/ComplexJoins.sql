-- Produce a report that lists every dealership, the number of purchases done by each, and the number of leases done by each.

SELECT
	d.business_name,
	COUNT(st.sales_type_id = 1) Purchases,
	COUNT(st.sales_type_id = 2) Leases
FROM dealerships d
	JOIN sales s on d.dealership_id = s.dealership_id
	JOIN salestypes st on s.sales_type_id = st.sales_type_id
	GROUP BY d.dealership_id;