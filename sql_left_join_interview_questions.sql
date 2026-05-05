CREATE DATABASE left_join_task;
USE left_join_task;
show databases;



-- DEPARTMENTS


CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'IT', 'Hyderabad'),
(2, 'HR', 'Chennai'),
(3, 'Finance', 'Bangalore'),
(4, 'Marketing', 'Mumbai'),
(5, 'Operations', 'Pune');



-- EMPLOYEES


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    hire_date DATE
);

INSERT INTO employees VALUES
(101, 'Abhiram', 1, '2023-01-10'),
(102, 'Anjali', 2, '2022-03-15'),
(103, 'Rahul', 1, '2021-06-20'),
(104, 'Sneha', NULL, '2024-01-05'),
(105, 'Kiran', 3, '2020-11-11'),
(106, 'Meena', NULL, '2024-02-12'),
(107, 'Ravi', 4, '2021-08-08');



-- EMPLOYEE SALARY HISTORY


CREATE TABLE employee_salary (
    salary_id INT PRIMARY KEY,
    emp_id INT,
    salary INT,
    effective_date DATE
);

INSERT INTO employee_salary VALUES
(1, 101, 70000, '2023-01-10'),
(2, 101, 80000, '2024-01-01'),
(3, 102, 45000, '2022-03-15'),
(4, 103, 90000, '2024-02-01'),
(5, 105, 60000, '2023-07-01');



-- PROJECTS


CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50)
);

INSERT INTO projects VALUES
(1, 'Banking App'),
(2, 'E-Commerce Platform'),
(3, 'AI Chatbot'),
(4, 'ERP System');



-- EMPLOYEE PROJECTS


CREATE TABLE employee_projects (
    emp_id INT,
    project_id INT
);

INSERT INTO employee_projects VALUES
(101, 1),
(101, 2),
(102, 3),
(103, 1),
(103, 4),
(105, 2);



-- CUSTOMERS


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    phone_number VARCHAR(15),
    signup_date DATE
);

INSERT INTO customers VALUES
(1, 'Pooja', '9876543210', '2024-01-01'),
(2, 'Suresh', NULL, '2024-01-10'),
(3, 'Divya', '9123456780', '2024-02-15'),
(4, 'Arjun', NULL, '2024-03-01'),
(5, 'Kavya', '9988776655', '2024-03-18');



-- ORDERS


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO orders VALUES
(1001, 1, '2024-04-01', 5000),
(1002, 1, '2024-04-05', 7000),
(1003, 2, '2024-04-08', 2000),
(1004, 3, '2024-04-12', 9000),
(1005, 5, '2024-04-20', 3000);



-- PAYMENTS


CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_status VARCHAR(20),
    amount_paid DECIMAL(10,2)
);

INSERT INTO payments VALUES
(1, 1001, '2024-04-01', 'Completed', 5000),
(2, 1002, '2024-04-06', 'Completed', 7000),
(3, 1004, '2024-04-13', 'Pending', 4000);



-- CATEGORIES


CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

INSERT INTO categories VALUES
(1, 'Electronics'),
(2, 'Furniture'),
(3, 'Fashion'),
(4, 'Books');



-- PRODUCTS


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category_id INT,
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(1, 'Laptop', 1, 65000),
(2, 'Chair', 2, 5000),
(3, 'T-Shirt', 3, 1200),
(4, 'Desk', NULL, 8000),
(5, 'Monitor', 1, 15000),
(6, 'Notebook', 4, 200),
(7, 'Keyboard', NULL, 2500);



-- SUPPLIERS


CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(50)
);

INSERT INTO suppliers VALUES
(1, 'ABC Traders'),
(2, 'Tech Supplies'),
(3, 'Global Furnitures');



-- PRODUCT SUPPLIERS


CREATE TABLE product_suppliers (
    product_id INT,
    supplier_id INT
);

INSERT INTO product_suppliers VALUES
(1, 1),
(2, 3),
(5, 2);


-- PRODUCT SALES


CREATE TABLE product_sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(10,2)
);

INSERT INTO product_sales VALUES
(1, 1, 2, 130000),
(2, 2, 5, 25000),
(3, 5, 3, 45000),
(4, 1, 1, 65000);



-- STUDENTS


CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

INSERT INTO students VALUES
(1, 'Akhil'),
(2, 'Nandhini'),
(3, 'Rohit'),
(4, 'Keerthi'),
(5, 'Varun');



-- ATTENDANCE


CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    student_id INT,
    attendance_date DATE,
    status VARCHAR(20)
);

INSERT INTO attendance VALUES
(1, 1, '2024-05-01', 'Present'),
(2, 1, '2024-05-02', 'Absent'),
(3, 2, '2024-05-01', 'Present'),
(4, 4, '2024-05-01', 'Present');



-- USERS


CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    signup_date DATE
);

INSERT INTO users VALUES
(1, 'abhiram_21', '2024-01-01'),
(2, 'anjali_dev', '2024-01-10'),
(3, 'rahul_codes', '2024-02-01'),
(4, 'sneha_ui', '2024-03-01'),
(5, 'kiran_sql', '2024-03-15');



-- USER LOGINS


CREATE TABLE user_logins (
    login_id INT PRIMARY KEY,
    user_id INT,
    login_time DATETIME
);

INSERT INTO user_logins VALUES
(1, 1, '2024-04-01 10:00:00'),
(2, 1, '2024-04-05 08:30:00'),
(3, 3, '2024-04-10 09:00:00');


show tables;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM employee_salary;
SELECT * FROM projects;
SELECT * FROM employee_projects;


SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM payments;


SELECT * FROM products;
SELECT * FROM categories;
SELECT * FROM suppliers;
SELECT * FROM product_suppliers;
SELECT * FROM product_sales;


SELECT * FROM students;
SELECT * FROM attendance;


SELECT * FROM users;
SELECT * FROM user_logins;

-- 1. Show all employees along with their department names, even if some employees are not assigned to any department.
SELECT * FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- 2. Display all orders and their corresponding payment details, even if payment has not been made.
SELECT * FROM orders o
LEFT JOIN payments p 
ON o.order_id = p.order_id;

-- 3. List all customers and their contact details, even if some customers have not provided phone numbers.
SELECT customer_name, phone_number
FROM customers;

-- 4.Show all products and their categories, even if some products are not assigned to any category.
SELECT products.product_name, categories.category_name
FROM products
LEFT JOIN categories
ON products.category_id = categories.category_id;

-- 5. Display all students and their attendance records, even if attendance is missing.
SELECT students.student_name, attendance.status, attendance.attendance_date
FROM students
LEFT JOIN attendance
ON students.student_id = attendance.student_id;

-- 6. Find all employees who do NOT have a department assigned.
SELECT *
FROM employees
LEFT JOIN departments
ON employees.dept_id = departments.dept_id
WHERE departments.dept_id IS NULL;

-- 7. Display all orders where payment has NOT been completed.
SELECT orders.order_id, payments.payment_status
FROM orders
LEFT JOIN payments
ON orders.order_id = payments.order_id
WHERE payments.payment_status != 'Completed' OR payments.payment_status IS NULL;

-- 8. List all customers who have never placed an order.
SELECT customers.customer_name
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.order_id IS NULL;

-- 9. Show all products that are NOT linked to any supplier.
SELECT * FROM products
LEFT JOIN product_suppliers
ON products.product_id = product_suppliers.product_id
WHERE product_suppliers.supplier_id IS NULL;

-- 10. Display all employees and count how many projects they are assigned to, including employees with zero projects.
SELECT employees.emp_name, COUNT(employee_projects.project_id) AS total_projects
FROM employees
LEFT JOIN employee_projects
ON employees.emp_id = employee_projects.emp_id
GROUP BY employees.emp_name;

-- 11. Find all customers who placed orders but never made any payment.
SELECT customers.customer_name
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
LEFT JOIN payments
ON orders.order_id = payments.order_id
WHERE payments.payment_id IS NULL;

-- 12. Display all employees and their latest salary, even if some employees don’t have salary records.
SELECT * FROM employees
LEFT JOIN employee_salary
ON employees.emp_id = employee_salary.emp_id;

-- 13. List all products along with total sales amount, including products that were never sold.
SELECT products.product_name, SUM(product_sales.total_amount) AS total_sales
FROM products
LEFT JOIN product_sales
ON products.product_id = product_sales.product_id
GROUP BY products.product_name;

-- 14. Find all users who signed up but never logged in.
SELECT users.username
FROM users
LEFT JOIN user_logins
ON users.user_id = user_logins.user_id
WHERE user_logins.login_time IS NULL;

-- 15. Display all departments and the number of employees in each department, including departments with zero employees.
SELECT departments.dept_name, COUNT(employees.emp_id) AS total_employees
FROM departments
LEFT JOIN employees
ON departments.dept_id = employees.dept_id
GROUP BY departments.dept_name;