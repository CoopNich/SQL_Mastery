-- Rheta Raymen an employee of Carnival has asked to be transferred to a different dealership location.
--  She is currently at dealership 751. 
--  She would like to work at dealership 20. 
--  Update her record to reflect her transfer.


SELECT
    d.business_name dealership,
    de.dealership_employee_id,
    CONCAT(e.first_name,' ',e.last_name) employee
FROM dealerships d
    JOIN dealershipemployees de ON d.dealership_id = de.dealership_id
    JOIN employees e ON de.employee_id = e.employee_id
WHERE d.dealership_id = 751;

-- employees dealership_employee_id = 10 and Rhetta does not exist

UPDATE dealershipemployees
SET dealership_id = 20
WHERE dealership_employee_id = 10;

-- A Sales associate needs to update a sales record because her customer want to pay with a Mastercard instead of American Express. Update Customer, Layla Igglesden Sales record which has an invoice number of 2781047589.

UPDATE sales
SET payment_method = 'Mastercard'
WHERE invoice_number = '2781047589';