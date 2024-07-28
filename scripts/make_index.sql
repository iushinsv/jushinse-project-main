-- marketplace_database.customer:
-- для этой таблицы целесообразно создать индекс по полю e_mail,
-- так как это поле используется в качестве уникального
-- идентификатора покупателя при регистрации и авторизации.

CREATE UNIQUE INDEX customer_email_idx 
    ON marketplace_database.customer (e_mail)
;

-- marketplace_database.product:
-- для этой таблицы целесообразно
-- создать индексы по полям category и seller_id,
-- так как эти поля используются в запросах для поиска
-- товаров по категории и по продавцу.

CREATE INDEX product_category_idx 
    ON marketplace_database.product (category)
;

CREATE INDEX product_seller_id_idx 
    ON marketplace_database.product (seller_id)
;


-- marketplace_database.cart:
-- для этой таблицы целесообразно создать индекс
-- по полю order_id, так как это поле используется
-- для связи с таблицей заказов.

CREATE INDEX cart_order_id_idx 
    ON marketplace_database.cart (order_id)
;


-- marketplace_database.order:
-- для этой таблицы целесообразно создать индексы
-- по полям customer_id и status_id, так как эти поля
-- используются в запросах для поиска заказов по покупателю
-- и по статусу.

CREATE INDEX order_customer_id_idx 
    ON marketplace_database."order" (customer_id)
;

CREATE INDEX order_status_id_idx 
    ON marketplace_database."order" (status_id)
;


-- marketplace_database.product_comment:
-- для этой таблицы целесообразно создать
-- индексы по полям customer_id и product_id,
-- так как эти поля используются в запросах для поиска
-- комментариев по покупателю и по товару.

CREATE INDEX comment_customer_id_idx 
    ON marketplace_database.product_comment (customer_id)
;

CREATE INDEX comment_product_id_idx 
    ON marketplace_database.product_comment (product_id)
;
