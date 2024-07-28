-- 1. Процедура для добавления нового покупателя в базу данных:
CREATE OR REPLACE PROCEDURE add_customer(
    IN p_email VARCHAR(255),
    IN p_password VARCHAR(255),
    IN p_fst_name VARCHAR(255),
    IN p_snd_name VARCHAR(255),
    IN p_birhtday DATE,
    IN p_genger CHAR(1),
    IN p_since_dt DATE
)
LANGUAGE SQL
AS $$
INSERT INTO marketplace_database.customer (e_mail, "pasword", fst_name, snd_name, birhtday, genger, since_dt)
VALUES (p_email, p_password, p_fst_name, p_snd_name, p_birhtday, p_genger, p_since_dt);
$$;

--Пример вызова процедуры add_customer:

CALL add_customer('test@gmail.com', 'password', 'John', 'Doe', '1980-01-01', 'M', '2022-01-01');


-- 2. Функция для вычисления процента скидки на товар в зависимости от количества заказанных единиц:

CREATE OR REPLACE FUNCTION calculate_discount(
    IN p_product_id INTEGER,
    IN p_product_amt INTEGER
)
RETURNS DECIMAL(5,2)
LANGUAGE SQL
AS $$
DECLARE
    discount DECIMAL(5,2);
BEGIN
    SELECT CASE
        WHEN p_product_amt >= 10 THEN 0.2
        WHEN p_product_amt >= 5 THEN 0.1
        ELSE 0
    END INTO discount
    FROM marketplace_database.product
    WHERE product_id = p_product_id;
    
    RETURN discount;
END;
$$;

