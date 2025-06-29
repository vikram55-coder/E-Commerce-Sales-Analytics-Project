create database  Sales_Analytics;
use Sales_Analytics;
SELECT 
    *
FROM
    customers;

-- 2. Orders table
SELECT 
    *
FROM
    orders;

-- 3. Products table
SELECT 
    *
FROM
    products;

-- 4. Sales table
SELECT 
    *
FROM
    sales;

-- 5. Employees table
SELECT 
    *
FROM
    employees;

-- 6. Returns table
SELECT 
    *
FROM
    returns;


-- Q1: What is the total revenue from all sales?
SELECT 
    SUM(total_price) AS total_revenue
FROM
    sales;

-- Q2: How many orders were placed each year?
SELECT 
    YEAR(order_date) AS order_year, COUNT(*) AS total_orders
FROM
    orders
GROUP BY YEAR(order_date);

-- Q3: Who are the top 5 customers by total purchase?
SELECT 
    o.customer_id, SUM(s.total_price) AS total_spent
FROM
    sales s
        JOIN
    orders o ON s.order_id = o.order_id
GROUP BY o.customer_id
ORDER BY total_spent DESC
LIMIT 5;


-- Q4: What is the average order value?
SELECT 
    ROUND(SUM(total_price), 2) AS average_order_value
FROM
    sales;


-- Q5: Get the number of products sold per category.
SELECT 
    p.category, SUM(s.quantity) AS total_quantity
FROM
    sales s
        JOIN
    products p ON s.product_id = p.product_id
GROUP BY p.category;

 -- Q6: What is the return rate of sales?
SELECT 
    (SELECT 
            COUNT(*)
        FROM
            returns) / (SELECT 
            COUNT(*)
        FROM
            sales) * 100 AS return_rate;

-- Q7: List the top 3 cities by total sales revenue.
SELECT 
    c.city, SUM(s.total_price) AS city_revenue
FROM
    sales s
        JOIN
    orders o ON s.order_id = o.order_id
        JOIN
    customers c ON o.customer_id = c.customer_id
GROUP BY c.city
ORDER BY city_revenue DESC
LIMIT 3;

-- Q8: Which product has the most returns?
SELECT 
    s.product_id, COUNT(*) AS return_count
FROM
    returns r
        JOIN
    sales s ON r.sale_id = s.sale_id
GROUP BY s.product_id
ORDER BY return_count DESC
LIMIT 1;


-- Q8: Which product has the most returns?
SELECT 
    s.product_id, COUNT(*) AS return_count
FROM
    returns r
        JOIN
    sales s ON r.sale_id = s.sale_id
GROUP BY s.product_id
ORDER BY return_count DESC
LIMIT 1;

-- Q9: How many distinct products were sold?
SELECT 
    COUNT(DISTINCT product_id) AS unique_products
FROM
    sales;

-- Q10: Count of orders handled by each employee.
SELECT 
    employee_id, COUNT(*) AS total_orders
FROM
    orders
GROUP BY employee_id;

-- Q11: What is the total quantity sold each year?
SELECT 
    YEAR(order_date) AS year, SUM(quantity) AS total_quantity
FROM
    sales
        JOIN
    orders ON sales.order_id = orders.order_id
GROUP BY year;

-- Q12: Which country has the most customers?
SELECT 
    country, COUNT(*) AS total_customers
FROM
    customers
GROUP BY country
ORDER BY total_customers DESC
LIMIT 1;

-- Q13: Find all orders with more than 3 items.
SELECT 
    order_id, SUM(quantity) AS total_items
FROM
    sales
GROUP BY order_id
HAVING total_items > 3;

-- Q14: What is the monthly sales trend?
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_price) AS revenue
FROM
    sales
        JOIN
    orders USING (order_id)
GROUP BY month
ORDER BY month;

-- Q15: How many employees joined each year?
SELECT 
    YEAR(hire_date) AS year, COUNT(*) AS new_employees
FROM
    employees
GROUP BY year;


