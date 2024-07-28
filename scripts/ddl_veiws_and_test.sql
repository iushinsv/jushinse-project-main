-- Представление, скрывающее персональные данные покупателей:

CREATE VIEW customer_info AS 
SELECT customer_id, fst_name, snd_name, birhtday, genger, since_dt
FROM marketplace_database.customer;

-- Тестирование данного представления
SELECT * FROM customer_info;

-- Представление, скрывающее персональные данные покупателей
-- и продавцов:

CREATE VIEW order_info AS
SELECT o.order_id, o.customer_id, os.status_nm, ds.delivery_service_nm, o.order_dt, o.delivery_dt, o.payment_method, o.delivery_address, o.notes
FROM marketplace_database."order" o
JOIN marketplace_database.order_status os ON o.status_id = os.status_id
JOIN marketplace_database.delivery_service ds ON o.delivery_service_id = ds.delivery_service_id;

-- Тестирование данного представления
SELECT * FROM order_info;

-- Представление, сводящее в единую таблицу данные о продажах
-- товаров по категориям:

CREATE VIEW sales_by_category AS
SELECT p.category, SUM(c.product_amt) AS total_sales, AVG(p.price) AS avg_price
FROM marketplace_database.cart c
JOIN marketplace_database.product p ON c.product_id = p.product_id
GROUP BY p.category;

-- Тестирование данного представления
SELECT * FROM sales_by_category;

-- Представление, сводящее в единую таблицу данные о продажах товаров по продавцам:

CREATE VIEW sales_by_seller AS
SELECT s.full_nm, SUM(c.product_amt) AS total_sales, AVG(p.price) AS avg_price
FROM marketplace_database.cart c
JOIN marketplace_database.product p ON c.product_id = p.product_id
JOIN marketplace_database.seller s ON p.seller_id = s.seller_id
GROUP BY s.full_nm;

-- Тестирование данного представления
SELECT * FROM sales_by_seller;

-- Представление, сводящее в единую таблицу данные
-- о количестве заказов и среднем чеке по каждому покупателю:

CREATE VIEW customer_orders AS
SELECT c.customer_id, c.e_mail, COUNT(o.order_id) AS total_orders, AVG(p.price * c.product_amt) AS avg_order_amount
FROM marketplace_database.customer c
JOIN marketplace_database."order" o ON c.customer_id = o.customer_id
JOIN marketplace_database.cart c ON o.order_id = c.order_id
JOIN marketplace_database.product p ON c.product_id = p.product_id
GROUP BY c.customer_id, c.e_mail;

-- Тестирование данного представления
SELECT * FROM customer_orders;

-- Представление, сводящее в единую таблицу
-- данные о количестве заказов и среднем чеке по каждому продавцу:

CREATE VIEW seller_orders AS
SELECT s.full_nm, COUNT(o.order_id) AS total_orders, AVG(p.price * c.product_amt) AS avg_order_amount
FROM marketplace_database.seller s
JOIN marketplace_database.product p ON s.seller_id = p.seller_id
JOIN marketplace_database.cart c ON p.product_id = c.product_id
JOIN marketplace_database."order" o ON c.order_id = o.order_id
GROUP BY s.full_nm;

-- Тестирование данного представления
SELECT * FROM seller_orders;