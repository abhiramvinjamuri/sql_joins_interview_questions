CREATE DATABASE join_practice_db;
USE join_practice_db;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    dept_id INT,
    salary INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_amount INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(50)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(50)
);

CREATE TABLE enrollments (
    enroll_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50),
    price INT
);

CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO departments (dept_name, location) VALUES
('IT', 'Hyderabad'),
('HR', 'Mumbai'),
('Finance', 'Delhi');

INSERT INTO employees (emp_name, dept_id, salary, manager_id) VALUES
('Abhiram', 1, 60000, NULL),
('Anjali', 2, 40000, 1),
('Ravi', 1, 55000, 1),
('Sneha', 3, 70000, NULL);

INSERT INTO customers (customer_name, city) VALUES
('Rahul', 'Delhi'),
('Priya', 'Mumbai'),
('Kiran', 'Hyderabad');

INSERT INTO orders (customer_id, order_amount, order_date) VALUES
(1, 6000, '2025-01-01'),
(2, 3000, '2025-01-02'),
(1, 7000, '2025-01-03'),
(3, 8000, '2025-01-04');

INSERT INTO students (student_name) VALUES
('Amit'), ('Neha'), ('Raj');

INSERT INTO courses (course_name) VALUES
('Python'), ('Java'), ('SQL');

INSERT INTO enrollments (student_id, course_id) VALUES
(1,1),(2,2),(3,1);

INSERT INTO products (product_name, price) VALUES
('Laptop', 50000),
('Phone', 20000),
('Tablet', 15000);

INSERT INTO order_details (order_id, product_id, quantity) VALUES
(1,1,1),(1,2,2),(2,3,1),(3,1,1),(4,2,3);




SELECT * FROM departments;
SELECT * FROM employees;

SELECT * FROM customers;
SELECT * FROM orders;

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

SELECT * FROM products;
SELECT * FROM order_details;


-- 1. Show employee names along with their department names.
SELECT e.emp_name,d.dept_name
FROM employees e
INNER JOIN departments d 
ON e.dept_id = d.dept_id;

-- 2.Display all orders with their corresponding customer names.
SELECT o.order_id, c.customer_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- 3. List students who are enrolled in any course.
SELECT s.student_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id;

-- 4. Show products that are present in orders.
SELECT DISTINCT p.product_name
FROM products p
JOIN order_details od ON p.product_id = od.product_id;

-- 5. Display employees along with their salary details.
SELECT emp_name, salary
FROM employees;


-- 6. Find employees who belong to the 'IT' department.
SELECT e.emp_name,d.dept_name
FROM employees e 
INNER JOIN departments d 
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'IT';

-- 7. Show customers who have placed orders worth more than ₹5000.
SELECT c.customer_name
FROM customers c 
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_amount > 5000;

SELECT DISTINCT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_amount > 5000;

-- 8. Count the number of orders placed by each customer.
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM customers c 
INNER JOIN orders o 
ON c.customer_id = o.order_id 
GROUP BY c.customer_name;

-- 9. List employees whose salary is greater than 50,000.
SELECT emp_name
FROM employees
WHERE salary > 50000

-- 10. Display students who are enrolled in the 'Python' course.
SELECT s.student_name
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
INNER JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Python';

-- 11. Find employees who work in departments located in 'Hyderabad'.
SELECT e.emp_name
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id
WHERE d.location = 'Hyderabad';

-- 12.Get the highest-paid employee in each department.
SELECT dept_id, MAX(salary) AS highest_salary
FROM employees
GROUP BY dept_id;

-- 13. List customers who have placed more than 3 orders.
SELECT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 3;

-- 14. Show each product along with the total quantity sold.
SELECT p.product_name, SUM(od.quantity) AS total_sold
FROM products p
JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.product_name;

-- 15. Find employees whose salary is above the average salary.
SELECT emp_name
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);