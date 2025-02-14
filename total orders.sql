-- total order analysis
select count(order_id) as Total_orders
from pizza_shop_sales
where
month(order_id)= 5; -- month of may


select 
month(order_date) as month, -- number of month
round(count(order_id)) as total_orders, -- total orders columns
(count(order_id) - lag(count(order_id),1) -- month order diff
over (order by month(order_date))) / lag(count(order_id),1) -- divison of pm orders
over (order by  month(order_date)) * 100 as MoM_increase_percenatage  -- percentage 

from
pizza_shop_sales
where
month(order_date) in (4,5) -- for month april (Pm) and may (Cm)

group by
month(order_date)
order by
month(order_date);