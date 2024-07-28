--GROUP BY + HAVING: запрос выводит список категорий товаров
--и количество товаров в каждой категории,
--где количество товаров больше 5:

SELECT category,
	COUNT(*) AS count 
FROM marketplace_database.product 
GROUP BY category
HAVING COUNT(*) > 1;

--ORDER BY: запрос выводит список товаров конкретной категории,
--отсортированных по цене в порядке убывания:

SELECT * 
FROM marketplace_database.product 
WHERE category = 'Home and Garden'
ORDER BY price DESC;

--<func>(...) OVER(...): запрос выводит список заказов
--с указанием даты и времени заказа, используя оконную функцию
--ROW_NUMBER:

SELECT ROW_NUMBER() OVER (ORDER BY order_dt) AS row_number,
order_id,
order_dt 
FROM marketplace_database."order";

-- PARTITION BY: запрос выводит список товаров с указанием средней цены
-- в каждой категории:

SELECT category,
	"name",
	price, 
	AVG(price) OVER (PARTITION BY category) AS avg_price 
FROM marketplace_database.product;

-- ORDER BY + PARTITION BY:
-- запрос выводит список товаров, отсортированных
-- по цене в каждой категории:

SELECT category,
	"name",
	price,
	ROW_NUMBER() OVER (
		PARTITION BY category 
		ORDER BY price
		) AS row_number 
FROM marketplace_database.product;


-- запрос выводит номер заказа,
-- название товара, лежащего в корзине заказа, его цену,
-- и суммарную цену заказа
with t1 as(
	select c.order_id,
		sum(p.price) as sum
	from marketplace_database.cart as c
	join marketplace_database.product as p
	using(product_id)
	group by order_id
	)
select t2.order_id,
	t3.name,
	t3.price,
	t1.sum as total_sum_of_cart
from marketplace_database.cart as t2
join marketplace_database.product as t3
using(product_id)
join t1
using(order_id)
order by order_id;