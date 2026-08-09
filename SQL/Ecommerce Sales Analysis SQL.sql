SELECT * FROM customers LIMIT 5;
ALTER TABLE customers
ADD PRIMARY KEY (customer_id);

-- Total number of customers
SELECT COUNT(*) FROM customers;
-- Unique coustomer state
SELECT DISTINCT customer_state FROM customers;
-- Customer from Soa paulo
SELECT * FROM customers WHERE customer_city = 'sao paulo';





SELECT * FROM "orderItem";
ALTER TABLE "orderItem"
ADD PRIMARY KEY ("order_id","order_item_id")
ALTER TABLE "orderItem"
ADD CONSTRAINT fk_order
FOREIGN KEY(order_id)
REFERENCES orders(order_id)
ON DELETE CASCADE,

ALTER TABLE "orderItem"
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id)
REFERENCES products(product_id)
ON DELETE CASCADE,

ALTER TABLE "orderItem"
ADD CONSTRAINT fk_seller
FOREIGN KEY (seller_id)
REFERENCES sellers(seller_id)
ON DELETE CASCADE;

-- Total number of rows
SELECT COUNT(*) FROM "orderItem";
-- Top 10 expensive freight value
SELECT freight_value FROM "orderItem" ORDER BY freight_value DESC LIMIT 10;
-- total revenue
SELECT SUM(price + freight_value) FROM "orderItem";





SELECT * FROM orders;
ALTER TABLE orders
ADD PRIMARY KEY (order_id),
ADD CONSTRAINT fk_customer
FOREIGN KEY(customer_id)
REFERENCES customers(customer_id)
ON DELETE CASCADE;

-- Total orders
SELECT COUNT(*) FROM orders;
-- Count delivered orders
SELECT COUNT(*) FROM orders WHERE order_status = 'delivered';
-- Count cancelled orders
SELECT COUNT(*) FROM orders WHERE order_status = 'cancelled';
SELECT COUNT(*) FROM orders WHERE order_status = 'invoiced';
SELECT COUNT(*) FROM orders WHERE order_status = 'processing';
-- Order placed in 2018
SELECT COUNT(*) FROM orders WHERE order_year = '2018' and order_status='delivered';





SELECT * FROM payement LIMIT 5;
ALTER TABLE payement
ADD PRIMARY KEY ("order_id","payment_sequential"),
ALTER TABLE payement
ADD CONSTRAINT fk_order
FOREIGN KEY(order_id)
REFERENCES orders(order_id)
ON DELETE CASCADE;

SELECT COUNT(*) FROM payement;
-- Average payment value
SELECT AVG(payment_value) FROM payement;





SELECT * FROM products LIMIT 5;
ALTER TABLE products
ADD PRIMARY KEY (product_id);

SELECT COUNT(*) FROM products;
-- Products with missing category
SELECT COUNT(*) FROM products WHERE product_category_name IS NULL;

SELECT DISTINCT p.product_category_name FROM products p
LEFT JOIN categories c
ON p.product_category_name = c.product_category_name
WHERE c.product_category_name IS NULL
GROUP BY p.product_category_name
ORDER BY product_category_name DESC;





SELECT * FROM reviews LIMIT 5;
ALTER TABLE reviews
ADD PRIMARY KEY (review_id);
ALTER TABLE reviews
ADD CONSTRAINT fk_order
FOREIGN KEY(order_id)
REFERENCES orders(order_id)
ON DELETE CASCADE;

SELECT COUNT(*) FROM reviews;





SELECT * FROM sellers LIMIT 5;
ALTER TABLE sellers
ADD PRIMARY KEY (seller_id);

SELECT COUNT(*) FROM sellers;





SELECT * FROM geolocation LIMIT 5;
ALTER TABLE geolocation
ADD PRIMARY KEY (geolocation_zip_code_prefix);

SELECT COUNT(*) FROM geolocation;





SELECT * FROM categories LIMIT 5;
ALTER TABLE categories
ADD PRIMARY KEY (product_category_name);
SELECT COUNT(*) FROM categories;



-- Total revenue by custoumer_state
SELECT c.customer_state, SUM(oi.price + oi.freight_value) FROM "orderItem" oi
JOIN orders o
ON o.order_id = oi.order_id
JOIN customers c 
ON o.customer_id = c.customer_id
GROUP BY customer_state
ORDER BY SUM(oi.price + oi.freight_value) DESC;

-- Revenue by custoumer city
SELECT c.customer_city, SUM(oi.price + oi.freight_value) AS total_revenue FROM "orderItem" oi
JOIN orders o
ON o.order_id = oi.order_id
JOIN customers c 
ON o.customer_id = c.customer_id
GROUP BY customer_city
ORDER BY SUM(oi.price + oi.freight_value) DESC;

-- Average payement value
SELECT AVG(payment_value) FROM payement;

CREATE VIEW Average AS
SELECT pr.product_category_name, AVG(payment_value) AS Avg_Payement FROM payement p
JOIN "orderItem" oi 
ON p.order_id = oi.order_id
JOIN products pr
ON pr.product_id = oi.product_id
GROUP BY product_category_name
ORDER BY AVG(payment_value) DESC;

-- Sum of all averages
SELECT 
COALESCE(product_category_name, ' Sum of all averages')
product_category_name , SUM(avg_payement) FROM Average
GROUP BY ROLLUP(product_category_name)
ORDER BY SUM(avg_payement);

-- Order per month
SELECT o.month_name, COUNT(order_id) FROM orders o
GROUP BY (month_name)
ORDER BY COUNT(order_id) DESC;

-- Order per Year
SELECT o.order_year, COUNT(order_id) FROM orders o
GROUP BY (order_year)
ORDER BY COUNT(order_id) DESC;

-- TOP 10 Selling Product
SELECT p.product_category_name, COUNT(p.product_id) AS selling_number FROM products P
JOIN "orderItem" oi
ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY COUNT(p.product_id) DESC
LIMIT 10;

-- Top 10 Sellers city, state
SELECT s.seller_city, s.seller_state, SUM(oi.price + oi.freight_value) AS Revenue, 
COUNT(DISTINCT oi.order_id) AS total_order FROM sellers s 
JOIN "orderItem" oi
ON s.seller_id = oi.seller_id
JOIN orders o
ON oi.order_id = o.order_id
WHERE order_status = 'delivered'
GROUP BY s.seller_city , s.seller_state
ORDER BY Revenue DESC
LIMIT 10;

-- Top product categories
SELECT p.product_category_name ,SUM(oi.price + oi.freight_value) AS Revenue, 
COUNT(DISTINCT oi.order_id) AS total_order FROM products p
JOIN "orderItem" oi
ON p.product_id = oi.product_id
JOIN orders o
ON oi.order_id = o.order_id
WHERE order_status = 'delivered'
GROUP BY p.product_category_name
ORDER BY Revenue DESC
LIMIT 10;

--  Late delivery counts
SELECT COUNT(delivery_gap) FROM orders
WHERE delivery_gap = 'Late';

-- Average freight cost
SELECT AVG(freight_value) FROM "orderItem";

-- Average delivery time
SELECT AVG(delivery_days) FROM orders;

-- Orders by week days
SELECT order_year, COUNT(weekend_order) FROM orders
WHERE weekend_order = 'Yes'
GROUP BY order_year;

-- Average review score
SELECT AVG(review_score) FROM reviews;

SELECT review_score,COUNT(review_score) AS score FROM reviews
GROUP BY review_score
ORDER BY score;

-- Payment distribution(Installement)
SELECT payment_installments, COUNT(payment_installments) AS How_many FROM payement
GROUP BY payment_installments
ORDER BY payment_installments ASC;

-- Average items per order
-- Top 10 Customers by Total spending
SELECT c.customer_id , SUM(p.payment_value) FROM payement p 
JOIN orders o
ON p.order_id = o.order_id
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY SUM(payment_value) DESC
LIMIT 10;

-- Top 10 customer cities
SELECT c.customer_city , SUM(oi.price + oi.freight_value) AS Revenue FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN "orderItem" oi
ON oi.order_id = o.order_id
GROUP BY c.customer_city
ORDER BY Revenue DESC
LIMIT 10;	

-- Monthly Revenue Trend
SELECT o.month_name , SUM(oi.price+oi.freight_value) AS Revenue FROM orders o
JOIN "orderItem" oi
ON o.order_id = oi.order_id
GROUP BY o.month_name,EXTRACT(MONTH FROM order_purchase_timestamp)
ORDER BY EXTRACT(MONTH FROM order_purchase_timestamp);

-- Year over Year revenue comparison
SELECT o.order_year , SUM(oi.price+oi.freight_value) AS Revenue FROM orders o
JOIN "orderItem" oi
ON o.order_id = oi.order_id
GROUP BY o.order_year , EXTRACT(YEAR FROM order_purchase_timestamp)
ORDER BY EXTRACT(YEAR FROM order_purchase_timestamp);

-- Revenue by Product Category
SELECT p.product_category_name , SUM(oi.price + oi.freight_value) AS Revenue FROM "orderItem" oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY Revenue DESC;

-- Average Order Value
WITH total_order AS(
SELECT order_id, SUM(price + freight_value) AS total
FROM "orderItem"
GROUP BY order_id
)
SELECT AVG(total) FROM total_order;

-- Highest Rated Product Categories
SELECT p.product_category_name , AVG(r.review_score) AS average FROM products p
JOIN "orderItem" oi
ON p.product_id = oi.product_id
JOIN reviews r
ON r.order_id = oi.order_id
GROUP BY p.product_category_name
ORDER BY average DESC
LIMIT 1;

-- Lowest Rated Product Categories
SELECT p.product_category_name , AVG(r.review_score) AS average FROM products p
JOIN "orderItem" oi
ON p.product_id = oi.product_id
JOIN reviews r
ON r.order_id = oi.order_id
GROUP BY p.product_category_name
ORDER BY average ASC
LIMIT 1;

-- Top Sellers by Revenue
SELECT s.seller_id , SUM(oi.price + oi.freight_value) AS revenue FROM sellers s
JOIN "orderItem" oi
ON s.seller_id = oi.seller_id
GROUP BY s.seller_id
ORDER BY revenue DESC
LIMIT 10;

-- Sellers whose revenue is above than average
WITH seller_revenue AS(
SELECT seller_id, SUM(price + freight_value) AS Revenue
FROM "orderItem"
GROUP BY seller_id
),
average_revenue AS(
SELECT AVG(Revenue) AS avg_revenue
FROM seller_revenue
)
SELECT s.seller_id, s.revenue
FROM seller_revenue s
CROSS JOIN average_revenue a
WHERE s.Revenue > a.avg_revenue;

-- Customers with Multiple orders
WITH number_of_orders AS(
SELECT customer_unique_id,COUNT(order_id) AS no_of_order
FROM orders
GROUP BY customer_id
)
SELECT customer_id ,no_of_order
FROM number_of_orders
WHERE no_of_order>1;

