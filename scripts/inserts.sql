-- Заполнение таблицы "order_status
 INSERT INTO marketplace_database.order_status(status_nm, "discription") 
VALUES 
('In progress', 'Order is being processed and prepared for shipping'),
('Shipped', 'Order has been shipped and is on its way to the customer'),
('Delivered', 'Order has been successfully delivered to the customer'),
('Cancelled', 'Order has been cancelled by the customer or the seller'),
('Returned', 'Order has been returned to the seller for various reasons, such as defect or incorrect item');

-- Заполнение таблицы "delivery_service"
INSERT INTO marketplace_database.delivery_service(delivery_service_nm, delivery_service_cost, information_for_customer) 
VALUES 
('DHL', 15.00, 'Delivery within 3-5 business days'),
('FedEx', 20.50, 'Delivery within 2-4 business days'),
('UPS', 18.75, 'Delivery within 3-6 business days'),
('USPS', 12.99, 'Delivery within 5-10 business days'),
('Amazon', 10.00, 'Delivery within 2-3 business days');

-- Заполнение таблицы "seller"
INSERT INTO marketplace_database.seller(short_nm, full_nm, phone, e_mail, since_dt, inf_about, "address") 
VALUES 
('ABC', 'ABC Inc.', '555-1234', 'abc.inc@gmail.com', '2020-01-01', 'We sell quality products', '123 Main St.'),
('XYZ', 'XYZ Corp.', '555-5678', 'xyz.corp@gmail.com', '2020-02-01', 'We offer a wide range of products', '456 Elm St.'),
('123', '123 LLC', '555-9876', '123.llc@gmail.com', '2020-03-01', 'We are committed to customer satisfaction', '789 Oak St.'),
('456', '456 Co.', '555-4321', '456.co@gmail.com', '2020-04-01', 'We provide excellent customer service', '321 Pine St.'),
('789', '789 Enterprises', '555-8765', '789.enterprises@gmail.com', '2020-05-01', 'We specialize in high-quality products', '654 Maple St.');

-- Заполнение таблицы "customer"
INSERT INTO marketplace_database.customer(e_mail, phone, "pasword", fst_name, snd_name, birhtday, genger, since_dt) 
VALUES 
('john.doe@gmail.com', '555-1234', 'password1', 'John', 'Doe', '1985-07-15', 'M', '2021-01-01'),
('jane.smith@gmail.com', '555-5678', 'password2', 'Jane', 'Smith', '1990-03-22', 'F', '2021-02-01'),
('bob.johnson@gmail.com', '555-9876', 'password3', 'Bob', 'Johnson', '1978-11-05', 'M', '2021-03-01'),
('amy.williams@gmail.com', '555-4321', 'password4', 'Amy', 'Williams', '1982-09-10', 'F', '2021-04-01'),
('samuel.jackson@gmail.com', '555-8765', 'password5', 'Samuel', 'Jackson', '1970-12-21', 'M', '2021-05-01');

-- Заполнение таблицы "product"
INSERT INTO marketplace_database.product(category, seller_id, name, price, "description", characteristic) 
VALUES 
('Electronics', 1, 'Smartphone', 500.00, 'A high-quality smartphone with advanced features', '5.5-inch screen, 64GB storage, 4GB RAM'),
('Home and Garden', 2, 'Lawn Mower', 250.00, 'A powerful lawn mower for a beautiful lawn', 'Gas-powered, 21-inch blade, 6 cutting heights'),
('Fashion', 3, 'Sneakers', 100.00, 'Comfortable and stylish sneakers for everyday wear', 'Available in various colors and sizes'),
('Sports and Outdoors', 4, 'Camping Tent', 150.00, 'A spacious and durable camping tent for outdoor adventures', 'Sleeps up to 6 people, waterproof, easy to set up'),
('Toys and Games', 5, 'Board Game', 50.00, 'A fun and challenging board game for the whole family', 'For 2-4 players, ages 8 and up'),
('Home and Garden', 2, 'Pressure Washer', 300.00, 'A powerful pressure washer for cleaning outdoor surfaces', 'Gas-powered, 2800 PSI, 2.3 GPM'),
('Toys and Games', 5, 'Puzzle', 20.00, 'A challenging puzzle for rainy days', '500 pieces, scenic landscape'),
('Electronics', 1, 'Wireless Earbuds', 100.00, 'High-quality wireless earbuds for music and phone calls', 'Bluetooth 5.0, noise-cancelling, 5-hour battery life'),
('Sports and Outdoors', 4, 'Hiking Boots', 120.00, 'Durable and comfortable hiking boots for outdoor adventures', 'Waterproof, breathable, available in various sizes'),
('Fashion', 3, 'Sunglasses', 50.00, 'Stylish and protective sunglasses for sunny days', 'UV protection, polarized lenses, various styles');

-- Заполнение таблицы "order"
INSERT INTO marketplace_database."order"(customer_id, status_id, delivery_service_id, order_dt, delivery_dt, execituon_dt, payment_method, delivery_address, notes) 
VALUES 
(1, 1, 5, '2021-07-01 10:00:00', '2021-07-03 10:00:00', NULL, 'Credit card', '123 Main St.', ''),
(1, 2, 1, '2021-07-10 10:00:00', '2021-07-12 10:00:00', NULL, 'PayPal', '123 Main St.', 'Please leave package at front door'),
(2, 1, 3, '2021-07-11 09:00:00', '2021-07-14 09:00:00', NULL, 'Credit card', '456 Elm St.', 'Please call when delivery arrives'),
(3, 1, 4, '2021-07-12 08:00:00', '2021-07-17 08:00:00', NULL, 'Credit card', '789 Oak St.', 'Please deliver to back door'),
(4, 3, 2, '2021-07-13 07:00:00', '2021-07-15 07:00:00', '2021-07-15 07:00:00', 'PayPal', '321 Pine St.', 'Please leave package with neighbor'),
(5, 1, 5, '2021-07-14 11:00:00', '2021-07-16 11:00:00', NULL, 'Credit card', '654 Maple St.', 'Please deliver after 3pm'),
(1, 2, 1, '2021-07-10 10:00:00', '2021-07-12 10:00:00', NULL, 'PayPal', '123 Main St.', 'Please leave package at front door'),
(2, 1, 3, '2021-07-11 09:00:00', '2021-07-14 09:00:00', NULL, 'Credit card', '456 Elm St.', 'Please call when delivery arrives'),
(3, 1, 4, '2021-07-12 08:00:00', '2021-07-17 08:00:00', NULL, 'Credit card', '789 Oak St.', 'Please deliver to back door'),
(4, 3, 2, '2021-07-13 07:00:00', '2021-07-15 07:00:00', '2021-07-15 07:00:00', 'PayPal', '321 Pine St.', 'Please leave package with neighbor'),
(5, 1, 5, '2021-07-14 11:00:00', '2021-07-16 11:00:00', NULL, 'Credit card', '654 Maple St.', 'Please deliver after 3pm'),
(1, 2, 3, '2021-07-15 12:00:00', '2021-07-17 12:00:00', NULL, 'PayPal', '123 Main St.', 'Please deliver to side door'),
(2, 1, 2, '2021-07-16 13:00:00', '2021-07-19 13:00:00', NULL, 'Credit card', '456 Elm St.', 'Please leave package at back door'),
(3, 1, 1, '2021-07-17 14:00:00', '2021-07-20 14:00:00', NULL, 'Credit card', '789 Oak St.', 'Please call when delivery arrives'),
(4, 3, 4, '2021-07-18 15:00:00', '2021-07-21 15:00:00', '2021-07-25 15:00:00', 'PayPal', '321 Pine St.', 'Please deliver to front desk'),
(5, 1, 5, '2021-07-19 16:00:00', '2021-07-22 16:00:00', NULL, 'Credit card', '654 Maple St.', 'Please deliver after 5pm');

-- Заполнение таблицы "cart"
INSERT INTO marketplace_database.cart(order_id, product_id, product_amt) 
VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 2),
(5, 5, 1),
(1, 6, 1),
(2, 7, 1),
(3, 8, 2),
(4, 9, 1),
(5, 10, 3),
(6, 1, 1),
(6, 2, 2),
(7, 3, 1),
(7, 4, 2),
(8, 5, 1),
(8, 6, 1),
(9, 7, 1),
(9, 8, 2),
(10, 9, 1),
(10, 10, 3),
(11, 1, 2),
(11, 2, 1),
(12, 3, 1),
(12, 4, 2),
(13, 5, 2),
(13, 6, 1),
(14, 7, 1),
(14, 8, 3),
(15, 9, 1),
(15, 10, 2),
(16, 1, 1),
(16, 2, 2);

-- Заполнение таблицы "product_comment"
INSERT INTO marketplace_database.product_comment(customer_id, product_id, estimate, dignity, flaws, comment, timedate) 
VALUES 
(1, 1, 4.5, 'Great camera quality', 'None', 'I am very happy with my purchase of this smartphone. The camera quality is excellent and the phone works smoothly.', '2021-07-05 12:00:00'),
(2, 2, 3.0, 'Powerful engine', 'Heavy', 'This lawn mower has a powerful engine and gets the job done, but it is quite heavy and difficult to maneuver up hills.', '2021-07-06 13:00:00'),
(3, 3, 5.0, 'Comfortable and stylish', 'None', 'These sneakers are great! They are very comfortable and stylish, and I have received many compliments on them.', '2021-07-07 14:00:00'),
(4, 4, 4.0, 'Spacious and easy to set up', 'None', 'This camping tent is spacious and easy to set up, and it kept us dry during a rainstorm. The only downside is that it is a bit heavy to carry around.', '2021-07-08 15:00:00'),
(5, 5, 4.5, 'Fun for the whole family', 'None', 'This board game is a lot of fun for the whole family. It is challenging but not too difficult, and we have had many enjoyable evenings playing it together.', '2021-07-09 16:00:00'),
(1, 6, 4.0, 'Powerful cleaning', 'A bit noisy', 'This pressure washer is very powerful and does a great job of cleaning outdoor surfaces. The only downside is that it is a bit noisy.', '2021-07-11 12:00:00'),
(2, 7, 4.5, 'Beautiful landscape', 'None', 'This puzzle is very challenging but also very rewarding to complete. The landscape is beautiful and the pieces fit together well.', '2021-07-12 13:00:00'),
(3, 8, 5.0, 'Great sound quality', 'None', 'These wireless earbuds are amazing! The sound quality is great and they are very comfortable to wear. The noise-cancelling feature is also very effective.', '2021-07-13 14:00:00'),
(4, 9, 4.0, 'Durable and comfortable', 'None', 'These hiking boots are very durable and comfortable, and they provide excellent support on rough terrain.', '2021-07-05 13:00:00');
