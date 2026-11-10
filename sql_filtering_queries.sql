-- SQL Filtering Practice | Task 22
-- Run sample_northwind_schema_and_data.sql first.
-- 1. Customers from Germany
SELECT customer_id, company_name, city, country FROM customers
WHERE country = 'Germany' ORDER BY customer_id;

-- 2. Products priced above 50
SELECT product_id, product_name, unit_price FROM products
WHERE unit_price > 50 ORDER BY unit_price DESC;

-- 3. Orders placed during 2025
SELECT order_id, customer_id, order_date, status FROM orders
WHERE order_date BETWEEN '2025-01-01' AND '2025-12-31' ORDER BY order_date;

-- 4. Customers in selected countries
SELECT customer_id, company_name, country FROM customers
WHERE country IN ('Germany', 'France', 'UK') ORDER BY country, company_name;

-- 5. Products priced between 20 and 60
SELECT product_id, product_name, unit_price FROM products
WHERE unit_price BETWEEN 20 AND 60 ORDER BY unit_price;

-- 6. Product names beginning with Ch
SELECT product_id, product_name FROM products
WHERE product_name LIKE 'Ch%' ORDER BY product_name;

-- 7. Company names containing Market
SELECT customer_id, company_name, city FROM customers
WHERE company_name LIKE '%Market%' ORDER BY company_name;

-- 8. Orders not yet shipped
SELECT order_id, customer_id, order_date, status FROM orders
WHERE status IN ('Pending', 'Processing') ORDER BY order_date;

-- 9. Products with stock between 10 and 50
SELECT product_id, product_name, units_in_stock FROM products
WHERE units_in_stock BETWEEN 10 AND 50 ORDER BY units_in_stock DESC;

-- 10. Employees in London or Seattle
SELECT employee_id, first_name, last_name, city FROM employees
WHERE city IN ('London', 'Seattle') ORDER BY city, last_name;

-- 11. 2025 orders with total above 500
SELECT o.order_id, o.order_date, c.company_name,
       SUM(od.quantity * od.unit_price) AS order_total
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN order_details od ON od.order_id = o.order_id
WHERE o.order_date BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY o.order_id, o.order_date, c.company_name
HAVING SUM(od.quantity * od.unit_price) > 500
ORDER BY order_total DESC;

-- 12. Tea products priced between 10 and 50
SELECT product_id, product_name, unit_price, units_in_stock FROM products
WHERE product_name LIKE '%Tea%' AND unit_price BETWEEN 10 AND 50
ORDER BY unit_price DESC;
