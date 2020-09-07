-- Get a list of the sales that was made for each sales type.

SELECT name sales_type, invoice_number FROM salestypes
INNER JOIN sales
ON salestypes.sales_type_id = sales.sales_type_id;

