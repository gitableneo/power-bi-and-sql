select * from pizza_shop_sales;
describe pizza_shop_sales;
set SQl_SAFE_UPDATES = 0;


-- heat map
select 
sum(unit_price*quantity) as total_sales,
sum(quantity) as total_qty,
count(order_id) as total_order
from pizza_shop_sales
where 
order_date = '2015-05-18';


-- top 10 
select pizza_name,
round(sum(unit_price*quantity)) as total_sales
from pizza_shop_sales
where month(order_date)= 5
group by pizza_name
order by sum(unit_price*quantity)desc
limit 10 ;  -- by pizza name

-- by pizza category
select pizza_category,
round(sum(unit_price*quantity)) as total_sales
from pizza_shop_sales
where month(order_date)= 5
group by pizza_category
order by sum(unit_price*quantity)desc
limit 10;

