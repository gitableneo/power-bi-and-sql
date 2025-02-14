-- data cleaning 
ALTER TABLE pizza_shop_sales 
ADD COLUMN new_order_date DATE;

UPDATE pizza_shop_sales
SET new_order_date = STR_TO_DATE(order_date, '%d-%m-%Y');


ALTER TABLE pizza_shop_sales 
DROP COLUMN order_date;

ALTER TABLE pizza_shop_sales 
CHANGE COLUMN new_order_date order_date DATE;

UPDATE pizza_shop_sales
SET  order_time = STR_TO_DATE(order_time, '%H:%i:%s');

alter table pizza_shop_sales
modify column order_time TIME;


Alter	table pizza_shop_sales
change column order_id Order_id int;
