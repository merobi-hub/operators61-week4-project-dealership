CREATE TABLE inventory_parts(
	part_id SERIAL PRIMARY KEY,
	manufacturer VARCHAR(100),
	OEM BIT,
	OEM_plus BIT,
	aftermarket BIT
);
CREATE TABLE technicians(
	tech_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone1 VARCHAR(20),
	phone2 VARCHAR(20),
	email VARCHAR(75),
	address VARCHAR(150)
);
CREATE TABLE salespeople(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone1 VARCHAR(20),
	phone2 VARCHAR(20),
	email VARCHAR(75),
	address VARCHAR(150)
);
CREATE TABLE customers(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone1 VARCHAR(20),
	phone2 VARCHAR(20),
	email VARCHAR(75),
	address VARCHAR(150)
);
CREATE TABLE service_history(
	serial_number VARCHAR(200) PRIMARY KEY,
	--car_id INTEGER,
	customer_id INTEGER,
	tech_id INTEGER,
	date DATE DEFAULT CURRENT_DATE,
	FOREIGN KEY(tech_id) REFERENCES technicians(tech_id),
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
	--FOREIGN KEY(car_id) REFERENCES cars(car_id)
);
CREATE TABLE cars(
	car_id SERIAL PRIMARY KEY,
	customer_id INTEGER,
	salesperson_id INTEGER NOT NULL,
	manufacturer VARCHAR(100),
	year NUMERIC(4),
	model VARCHAR(100),
	category VARCHAR(20),
	serial_number VARCHAR(200),
	FOREIGN KEY(serial_number) REFERENCES service_history(serial_number),
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
	FOREIGN KEY(salesperson_id) REFERENCES salespeople(salesperson_id)
);
CREATE TABLE invoices(
	invoice_id SERIAL PRIMARY KEY,
	salesperson_id INTEGER NOT NULL,
	serial_number VARCHAR(200),
	car_id INTEGER,
	tech_id INTEGER,
	part_id INTEGER,
	date DATE DEFAULT CURRENT_DATE,
	customer_id INTEGER NOT NULL,
	estimate NUMERIC(7,2),
	subtotal NUMERIC(7,2),
	total NUMERIC(7,2),
	work_done VARCHAR(1000),
	FOREIGN KEY(serial_number) REFERENCES service_history(serial_number),
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
	FOREIGN KEY(car_id) REFERENCES cars(car_id),
	FOREIGN KEY(salesperson_id) REFERENCES salespeople(salesperson_id),
	FOREIGN KEY(tech_id) REFERENCES technicians(tech_id),
	FOREIGN KEY(part_id) REFERENCES inventory_parts(part_id)
)



