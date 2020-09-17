-- Write a transaction to:
-- Add a new role for employees called Automotive Mechanic
-- Add five new mechanics, their data is up to you
-- Each new mechanic will be working at all three of these dealerships: Sollowaye Autos of New York, Hrishchenko Autos of New York and Cadreman Autos of New York
BEGIN;
INSERT INTO public.employeetypes(name)
VALUES ('Automotive Mechanic');
INSERT INTO public.employees(
        first_name,
        last_name,
        email_address,
        phone,
        employee_type_id
    )
VALUES ('Ed', 'Edston', 'ed@ed.com', '111-222-1212', 8),
    (
        'Rick',
        'Edston',
        'rick@ed.com',
        '111-222-4543',
        8
    ),
    (
        'Bobbi',
        'Edston',
        'bobbi@ed.com',
        '111-222-2345',
        8
    ),
    (
        'Bipimbap',
        'Edston',
        'bib@ed.com',
        '111-222-1234',
        8
    ),
    (
        'Sharkeisha',
        'Edston',
        'shark@ed.com',
        '111-222-6543',
        8
    );
select *
from employees
where employees.employee_type_id = 8;
-- employeeids = 1001-1005
select *
from dealerships d
where d.business_name LIKE ('Sollowaye%')
    OR d.business_name LIKE ('Hrishchenko%')
    OR d.business_name LIKE ('Cadreman%');
-- dealershipids = 50, 128, 322
INSERT INTO dealershipemployees(dealership_id, employee_id)
VALUES (50, 1001),
    (50, 1002),
    (50, 1003),
    (50, 1004),
    (50, 1005),
    (128, 1001),
    (128, 1002),
    (128, 1003),
    (128, 1004),
    (128, 1005),
    (322, 1001),
    (322, 1002),
    (322, 1003),
    (322, 1004),
    (322, 1005);
ROLLBACK;
COMMIT;
-- Creating a new dealership in Washington, D.C. called Felphun Automotive
-- Hire 3 new employees for the new dealership: Sales Manager, General Manager and Customer Service.
-- All employees that currently work at Scrogges Autos of District of Columbia will now start working at Felphun Automotive instead.
BEGIN;
INSERT INTO dealerships(
        business_name,
        city,
        state,
        tax_id,
        phone,
        website
    )
VALUES (
        'Felphun Automotive',
        'Washington',
        'D.C.',
        '23-u70-5t-5689',
        '123-111-4321',
        'www.felphunauto.com'
    );
-- select * from employeetypes;
-- employeetypeids = 3, 4, 6
INSERT INTO public.employees(
        first_name,
        last_name,
        email_address,
        phone,
        employee_type_id
    )
VALUES ('Joe', 'Mayne', 'joe@ed.com', '111-222-6767', 3),
    ('Jim', 'Bruh', 'jim@ed.com', '111-222-9990', 4),
    (
        'Yancy',
        'Yeet',
        'yancy@ed.com',
        '111-222-0098',
        6
    );
-- select * from dealerships
-- where dealerships.business_name LIKE ('Felphun%');
-- dealershipid = 1001
INSERT INTO dealershipemployees(dealership_id, employee_id)
VALUES (1001, 1006),
    (1001, 1007),
    (1001, 1008);
-- select * from dealerships
-- where dealerships.business_name LIKE ('Scrogges%');
-- dealershipid = 129
UPDATE public.dealershipemployees
SET dealership_id = 1001
WHERE dealership_id = 129;
ROLLBACK;
COMMIT;