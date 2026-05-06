CREATE DATABASE right_join_task;
USE right_join_task;

---------------------------------------------------
-- CUSTOMERS
---------------------------------------------------

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO customers VALUES
(1, 'Abhiram', 'abhiram@gmail.com'),
(2, 'Anjali', 'anjali@gmail.com'),
(3, 'Rahul', 'rahul@gmail.com'),
(4, 'Sneha', 'sneha@gmail.com');


---------------------------------------------------
-- ORDERS
---------------------------------------------------

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO orders VALUES
(101, 1, '2024-04-01', 5000),
(102, 2, '2024-04-05', 12000),
(103, 3, '2024-04-10', 3000);


---------------------------------------------------
-- PAYMENTS
---------------------------------------------------

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(30),
    amount_paid DECIMAL(10,2),
    payment_date DATE
);

INSERT INTO payments VALUES
(1, 101, 'UPI', 5000, '2024-04-01'),
(2, 102, 'Credit Card', 12000, '2024-04-05'),
(3, NULL, 'Net Banking', 4500, '2024-04-07'),
(4, 999, 'Cash', 2000, '2024-04-11');


---------------------------------------------------
-- TRANSACTIONS
---------------------------------------------------

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    transaction_amount DECIMAL(10,2),
    transaction_date DATE
);

INSERT INTO transactions VALUES
(201, 1, 1500, '2024-05-01'),
(202, 2, 2200, '2024-05-02'),
(203, NULL, 5000, '2024-05-03'),
(204, 999, 3000, '2024-05-04');


---------------------------------------------------
-- INVOICES
---------------------------------------------------

CREATE TABLE invoices (
    invoice_id INT PRIMARY KEY,
    order_id INT,
    invoice_amount DECIMAL(10,2),
    invoice_date DATE
);

INSERT INTO invoices VALUES
(301, 101, 5000, '2024-04-02'),
(302, 102, 12000, '2024-04-06'),
(303, NULL, 2500, '2024-04-08'),
(304, 888, 7000, '2024-04-09');


---------------------------------------------------
-- EMPLOYEES
---------------------------------------------------

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'Kiran', 'IT'),
(2, 'Meena', 'HR'),
(3, 'Ravi', 'Finance');


---------------------------------------------------
-- ATTENDANCE
---------------------------------------------------

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    emp_id INT,
    attendance_date DATE,
    status VARCHAR(20)
);

INSERT INTO attendance VALUES
(401, 1, '2024-05-01', 'Present'),
(402, 2, '2024-05-01', 'Absent'),
(403, NULL, '2024-05-01', 'Present'),
(404, 999, '2024-05-02', 'Present');


---------------------------------------------------
-- SHIPMENTS
---------------------------------------------------

CREATE TABLE shipments (
    shipment_id INT PRIMARY KEY,
    order_id INT,
    shipment_status VARCHAR(30),
    shipped_date DATE
);

INSERT INTO shipments VALUES
(501, 101, 'Delivered', '2024-04-03'),
(502, 102, 'In Transit', '2024-04-07'),
(503, NULL, 'Pending', '2024-04-08'),
(504, 777, 'Dispatched', '2024-04-09');


---------------------------------------------------
-- REFUNDS
---------------------------------------------------

CREATE TABLE refunds (
    refund_id INT PRIMARY KEY,
    order_id INT,
    refund_amount DECIMAL(10,2),
    refund_date DATE
);

INSERT INTO refunds VALUES
(601, 101, 1000, '2024-04-10'),
(602, NULL, 500, '2024-04-11'),
(603, 999, 700, '2024-04-12');


---------------------------------------------------
-- SYSTEMS
---------------------------------------------------

CREATE TABLE systems (
    system_id INT PRIMARY KEY,
    system_name VARCHAR(50),
    server_location VARCHAR(50)
);

INSERT INTO systems VALUES
(1, 'Auth Server', 'Hyderabad'),
(2, 'Payment Gateway', 'Bangalore'),
(3, 'Analytics Engine', 'Mumbai');


---------------------------------------------------
-- LOGS
---------------------------------------------------

CREATE TABLE logs (
    log_id INT PRIMARY KEY,
    system_id INT,
    log_message VARCHAR(255),
    created_at DATETIME
);

INSERT INTO logs VALUES
(701, 1, 'User login success', '2024-05-01 10:00:00'),
(702, 2, 'Payment failed', '2024-05-01 10:30:00'),
(703, NULL, 'Unknown access attempt', '2024-05-01 11:00:00'),
(704, 999, 'Missing system reference', '2024-05-01 11:30:00');


---------------------------------------------------
-- USERS
---------------------------------------------------

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO users VALUES
(1, 'abhi_21', 'abhi@gmail.com'),
(2, 'anjali_dev', 'anjali@gmail.com'),
(3, 'rahul_codes', 'rahul@gmail.com');


---------------------------------------------------
-- BOOKINGS
---------------------------------------------------

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    user_id INT,
    booking_date DATE,
    booking_status VARCHAR(30)
);

INSERT INTO bookings VALUES
(801, 1, '2024-06-01', 'Confirmed'),
(802, 2, '2024-06-02', 'Cancelled'),
(803, NULL, '2024-06-03', 'Pending'),
(804, 999, '2024-06-04', 'Confirmed');


-- 1. Show all payments, even if there is no matching order.
SELECT orders.order_id, payments.payment_id, payments.amount_paid
FROM orders
RIGHT JOIN payments
ON orders.order_id = payments.order_id;

-- 2.Display all transactions even if customer details are missing.
SELECT customers.customer_name, transactions.transaction_id,
transactions.transaction_amount
FROM customers
RIGHT JOIN transactions
ON customers.customer_id = transactions.customer_id;

-- 3. List all invoices, even if invoice is not linked to any order.
SELECT orders.order_id, invoices.invoice_id, invoices.invoice_amount
FROM orders
RIGHT JOIN invoices
ON orders.order_id = invoices.order_id;

