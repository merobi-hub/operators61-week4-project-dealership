CREATE OR REPLACE FUNCTION add_inventory(
	_part_id INTEGER,
	_manufacturer VARCHAR(100),
	_OEM BIT,
	_OEM_plus BIT,
	_aftermarket BIT
)
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO inventory_parts(part_id,manufacturer,OEM,OEM_plus,aftermarket)
	VALUES(_part_id,_manufacturer,_OEM,_OEM_plus,_aftermarket);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_inventory(1000000,'BMW',bit '0',bit '1',bit '0')
SELECT add_inventory(1000001,'Bosch',bit '1',bit '0',bit '0')

SELECT * 
FROM inventory_parts

CREATE OR REPLACE FUNCTION add_technicians(
	_tech_id INTEGER,
	_first_name VARCHAR(100),
	_last_name VARCHAR(100),
	_phone1 VARCHAR(20),
	_phone2 VARCHAR(20),
	_email VARCHAR(75),
	_address VARCHAR(150)
)
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO technicians(tech_id,first_name,last_name,phone1,phone2,email,address)
	VALUES(_tech_id,_first_name,_last_name,_phone1,_phone2,_email,_address);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_technicians(1,'Martin','Short','777-777-7777','888-888-8888','martin.short@gmail.com','22 Easy St Easily SD 00000')
SELECT add_technicians(2,'Harold','Ramis','999-999-9999','111-111-1111','harold.ramis@gmail.com','24 Easy St Easily SD 00000')

SELECT *
FROM technicians

CREATE OR REPLACE FUNCTION add_salespeople(
	_salesperson_id INTEGER,
	_first_name VARCHAR(100),
	_last_name VARCHAR(100),
	_phone1 VARCHAR(20),
	_phone2 VARCHAR(20),
	_email VARCHAR(75),
	_address VARCHAR(150)
)
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO salespeople(salesperson_id,first_name,last_name,phone1,phone2,email,address)
	VALUES(_salesperson_id,_first_name,_last_name,_phone1,_phone2,_email,_address);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_salespeople(1,'John','Candy','444-444-4444','555-555-5555','john.candy@gmail.com','25 Easy St Easily SD 00000')
SELECT add_salespeople(2,'Eugene','Levy','333-333-3333','222-222-2222','eugene.levy@gmail.com','21 Easy St Easily SD 00000')

SELECT *
FROM salespeople

CREATE OR REPLACE FUNCTION add_customers(
	_customer_id INTEGER,
	_first_name VARCHAR(100),
	_last_name VARCHAR(100),
	_phone1 VARCHAR(20),
	_phone2 VARCHAR(20),
	_email VARCHAR(75),
	_address VARCHAR(150)
)
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO customers(customer_id,first_name,last_name,phone1,phone2,email,address)
	VALUES(_customer_id,_first_name,_last_name,_phone1,_phone2,_email,_address);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_customers(1,'Rick','Moranis','666-666-6666','444-444-4444','rick.moranis@gmail.com','20 Easy St Easily SD 00000')
SELECT add_customers(2,'Bill','Murray','111-111-1111','000-000-0000','bill.murray@gmail.com','19 Easy St Easily SD 00000')
					   
SELECT *
FROM customers

CREATE OR REPLACE FUNCTION add_service_history(
	_serial_number VARCHAR(200),
	_customer_id INTEGER,
	_tech_id INTEGER
)
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO service_history(serial_number,customer_id,tech_id)
	VALUES(_serial_number,_customer_id,_tech_id);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_service_history('ZQI99988888456231',1,1)						   
SELECT add_service_history('UIY77743214325341',2,2)

SELECT *
FROM service_history

DROP FUNCTION add_service_history

CREATE OR REPLACE FUNCTION add_car(
	_car_id INTEGER,
	_customer_id INTEGER,
	_salesperson_id INTEGER,
	_manufacturer VARCHAR(100),
	_year NUMERIC(4),
	_model VARCHAR(100),
	_category VARCHAR(20),
	_serial_number VARCHAR(200)
)
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO cars(car_id,customer_id,salesperson_id,manufacturer,year,model,category,serial_number)
	VALUES(_car_id,_customer_id,_salesperson_id,_manufacturer,_year,_model,_category,_serial_number);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_car(1,1,1,'BMW','1976','2002','coupe','ZQI99988888456231')
SELECT add_car(2,2,2,'BMW','1975','3.0CSI','coupe','UIY77743214325341')
					   
SELECT *
FROM cars

CREATE OR REPLACE FUNCTION add_invoice(
	_invoice_id INTEGER,
	_salesperson_id INTEGER,
	_serial_number VARCHAR(200),
	_car_id INTEGER,
	_tech_id INTEGER,
	_part_id INTEGER,
	_customer_id INTEGER,
	_estimate NUMERIC(7,2),
	_subtotal NUMERIC(7,2),
	_total NUMERIC(7,2),
	_work_done VARCHAR(1000)
)
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO invoices(invoice_id,salesperson_id,serial_number,car_id,tech_id,part_id,customer_id,estimate,subtotal,total,work_done)
	VALUES(_invoice_id,_salesperson_id,_serial_number,_car_id,_tech_id,_part_id,_customer_id,_estimate,_subtotal,_total,_work_done);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_invoice(1,1,'ZQI99988888456231',1,1,1000000,1,'1000','950','1017','replace brake lines')
SELECT add_invoice(2,2,'UIY77743214325341',2,2,1000001,2,'750','750','803','replace brake booster')

SELECT *
FROM invoices