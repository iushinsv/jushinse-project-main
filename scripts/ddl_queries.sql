- Создание таблиц

-- Создание схемы базы данных торговой площадки
CREATE SCHEMA marketplace_database;

-- Информация о продавце
create table marketplace_database.seller(
    seller_id serial PRIMARY KEY,
    short_nm VARCHAR(255) not null unique,
    full_nm VARCHAR(255) not null unique,
    phone VARCHAR(255),
    e_mail VARCHAR(255),
    since_dt DATE,
    inf_about VARCHAR(255),
    "address" VARCHAR(255)
);

-- Информация о покупателе
create table marketplace_database.customer(
    customer_id serial PRIMARY KEY,
    e_mail VARCHAR(255) not null UNIQUE,
    phone VARCHAR(255),
    "pasword" VARCHAR(255) not null UNIQUE,
    fst_name VARCHAR(255) not null,
    snd_name varchar(255) not null,
    birhtday DATE not null,
    genger CHAR(1),
    since_dt DATE NOT NULL
);

-- Информация о товаре
CREATE TABLE marketplace_database.product(
    product_id serial PRIMARY KEY,
    category VARCHAR(255) NOT NULL,
    seller_id serial NOT NULL,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    "description" VARCHAR(250),
    characteristic VARCHAR(250),
    FOREIGN KEY (seller_id)
        REFERENCES marketplace_database.seller(seller_id)
);

-- Информация о статусе заказа
CREATE TABLE marketplace_database.order_status(
    status_id serial PRIMARY KEY,
    status_nm VARCHAR(250) not null UNIQUE,
    "discription" VARCHAR(250)
);

-- Информация о службе доставки
CREATE TABLE marketplace_database.delivery_service(
    delivery_service_id serial PRIMARY KEY,
    delivery_service_nm VARCHAR(250) not null UNIQUE,
    delivery_service_cost DECIMAL(10, 2),
    information_for_customer varchar(250)
);


-- Если вынести в корзину время когда будет доставлен товар?
-- Информация о заказе
CREATE TABLE marketplace_database."order"(
    order_id serial PRIMARY KEY,
    customer_id serial not null,
    status_id serial NOT NULL,
    delivery_service_id serial NOT NULL,
    order_dt TIMESTAMP NOT NULL,
    delivery_dt TIMESTAMP NOT NULL,
    execituon_dt TIMESTAMP,
    payment_method VARCHAR(255) not null,
    delivery_address VARCHAR(255) not null,
    notes VARCHAR(255),
    FOREIGN KEY(customer_id)
        REFERENCES marketplace_database.customer(customer_id),
    FOREIGN KEY(status_id)
        REFERENCES marketplace_database.order_status(status_id),
    FOREIGN KEY(delivery_service_id)
        REFERENCES marketplace_database.delivery_service(delivery_service_id)
);

-- Информация о корзине заказа
CREATE TABLE marketplace_database.cart(
    order_id serial not null,
    product_id serial not null,
    product_amt INTEGER not null,
    FOREIGN KEY(order_id)
        REFERENCES marketplace_database."order"(order_id),
    FOREIGN KEY(product_id)
        REFERENCES marketplace_database.product(product_id)
);

-- Информация о комментариях к товарам
CREATE TABLE marketplace_database.product_comment(
    comment_id serial PRIMARY KEY,
    customer_id serial NOT NULL,
    product_id serial NOT NULL,
    estimate DECIMAL(3, 2) NOT NULL,
    dignity VARCHAR(255),
    flaws VARCHAR(255),
    comment VARCHAR(255),
    timedate TIMESTAMP,
    FOREIGN KEY(customer_id)
        REFERENCES marketplace_database.customer(customer_id),
    FOREIGN KEY(product_id)
        REFERENCES marketplace_database.product(product_id)
);