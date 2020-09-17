-- Get a list of the sales that was made for each sales type.
SELECT name sales_type,
	invoice_number
FROM salestypes
	INNER JOIN sales ON salestypes.sales_type_id = sales.sales_type_id;
-- Get a list of sales with the VIN of the vehicle, the first name and last name of the customer, first name and last name of the employee who made the sale and the name, city and state of the dealership.
SELECT s.invoice_number,
	v.vin car_vin,
	c.first_name customer_first_name,
	c.last_name customer_last_name,
	e.first_name employee_first_name,
	e.last_name employee_last_name,
	d.business_name dealership,
	d.city dealership_city,
	d.state dealership_state
FROM sales s
	INNER JOIN customers c ON s.customer_id = c.customer_id
	INNER JOIN vehicles v ON s.vehicle_id = v.vehicle_id
	INNER JOIN employees e ON s.employee_id = e.employee_id
	INNER JOIN dealerships d ON s.dealership_id = d.dealership_id;
-- Get a list of all the dealerships and the employees, if any, working at each one.
SELECT d.business_name dealership,
	e.first_name employee_first_name,
	e.last_name employee_last_name
FROM dealerships d
	LEFT JOIN employees e ON d.dealership_id = e.employee_id
ORDER BY d.business_name ASC;
-- Get a list of vehicles with the names of the body type, make, model and color.
SELECT v.vin vin_number,
	v.exterior_color color,
	body.name body,
	model.name model,
	make.name make
FROM vehicles v
	INNER JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
	INNER JOIN vehiclebodytype body ON vt.vehicle_body_type_id = body.vehicle_body_type_id
	INNER JOIN vehiclemake make ON vt.vehicle_make_id = make.vehicle_make_id
	INNER JOIN vehiclemodel model ON vt.vehicle_model_id = model.vehicle_model_id;