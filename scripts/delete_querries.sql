-- DELETE запрос для удаления всех товаров определенной категории:
DELETE FROM marketplace_database.product 
WHERE category = 'Home and Garden';


-- DELETE запрос для удаления всех комментариев покупателя с определенным id:
DELETE FROM marketplace_database.product_comment 
WHERE customer_id = 123;


-- DELETE запрос для удаления всех заказов, по которым оформили возврат:
DELETE FROM marketplace_database."order"
    WHERE status_id = (
        SELECT status_id 
        FROM marketplace_database.order_status 
        WHERE status_nm = 'Reterned'
    )
;

-- DELETE запрос для удаления удаления заказов,
-- сделанных раньше определенной даты
DELETE FROM marketplace_database."order" as o
    WHERE o.order_dt < '2021-08-01 12:00:00';