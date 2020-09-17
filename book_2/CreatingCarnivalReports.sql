CREATE TABLE AccountsReceivable (
    accounts_receivable_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    credit_amount INT,
    debit_amount INT,
    sales_id INT REFERENCES Sales (sale_id)
);
CREATE OR REPLACE FUNCTION new_ar_record () RETURNS TRIGGER LANGUAGE PLPGSQL AS $$ BEGIN
INSERT INTO accountsreceivable (
        credit_amount,
        debit_amount,
        date_received,
        sales_id
    )
VALUES (
        NEW.deposit,
        ABS(new.price - new.deposit),
        NOW(),
        new.sale_id
    );
RETURN NULL;
END;
$$ CREATE TRIGGER new_sale_made
AFTER
INSERT ON sales FOR EACH ROW EXECUTE PROCEDURE new_ar_record ();
INSERT INTO sales (
        sales_type_id,
        vehicle_id,
        employee_id,
        dealership_id,
        price,
        invoice_number,
        purchase_date,
        pickup_date,
        deposit
    )
VALUES (
        1,
        11,
        111,
        111,
        10111,
        101010101,
        CURRENT_DATE,
        CURRENT_DATE,
        500
    );