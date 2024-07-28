-- UPDATE запрос для изменения статуса заказа
-- с определенным id:
UPDATE marketplace_database."order"
    SET status_id = (
        SELECT status_id 
        FROM marketplace_database.order_status 
        WHERE status_nm = 'Доставлен'
    ) 
    WHERE order_id = 456
;

-- UPDATE запрос для изменения цены товара с определенным id:
UPDATE marketplace_database.product
    SET price = 49.99 
    WHERE product_id = 2
;

-- UPDATE запрос для изменения персональных данных пользователя
UPDATE marketplace_database.customer
    SET e_mail = 'test_email@smthmail.com'
    WHERE customer_id = 2
;

