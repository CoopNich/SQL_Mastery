-- Produce a report that lists every dealership, the number of purchases done by each, and the number of leases done by each.

SELECT
	d.business_name,
	COUNT(st.sales_type_id = 1) Purchases,
	COUNT(st.sales_type_id = 2) Leases
FROM dealerships d
	JOIN sales s on d.dealership_id = s.dealership_id
	JOIN salestypes st on s.sales_type_id = st.sales_type_id
	GROUP BY d.dealership_id;

-- Produce a report that determines the most popular vehicle model that is leased.

SELECT
	vm.name,
	COUNT(s.sale_id) amount_leased
FROM sales s
	JOIN salestypes st on s.sales_type_id = st.sales_type_id
	JOIN vehicles v ON v.vehicle_id = s.vehicle_id
	JOIN vehicletypes vt ON vt.vehicle_type_id = v.vehicle_type_id
	JOIN vehiclemodel vm ON vm.vehicle_model_id = vt.vehicle_model_id
	WHERE st.sales_type_id = 2
	GROUP BY vm.name
	ORDER BY amount_leased DESC
	LIMIT 1;

-- What is the most popular vehicle make in terms of number of sales?

SELECT
	vm.name,
	COUNT(s.sale_id) amount_sold
FROM sales s
	JOIN vehicles v ON v.vehicle_id = s.vehicle_id
	JOIN vehicletypes vt ON vt.vehicle_type_id = v.vehicle_type_id
	JOIN vehiclemake vm ON vm.vehicle_make_id = vt.vehicle_make_id
	GROUP BY vm.name
	ORDER BY amount_sold DESC
	LIMIT 1;

-- Which employee type sold the most of that make?

SELECT
	et.name,
	COUNT(s.sale_id) AS chevrolets_sold
FROM sales s
	JOIN vehicles v ON v.vehicle_id = s.vehicle_id
	JOIN vehicletypes vt ON vt.vehicle_type_id = v.vehicle_type_id
	JOIN vehiclemake vm ON vm.vehicle_make_id = vt.vehicle_make_id
	JOIN employees e ON e.employee_id = s.employee_id
	JOIN employeetypes et ON e.employee_type_id = et.employee_type_id
	WHERE vm.vehicle_make_id = 1
	GROUP BY et.name
	ORDER BY chevrolets_sold DESC
	LIMIT 1;