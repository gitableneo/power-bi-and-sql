-- kpi requirements 
-- total sales analysis
select round(sum(unit_price * quantity)) as Total_Sales
from pizza_shop_sales
where
month(order_date)= 3; -- march month



select 
month(order_date) as month, -- number of month
round(sum(unit_price*quantity)) as total_sales, -- total sales columns
(sum(unit_price*quantity) - lag(sum(unit_price*quantity),1) -- month sales diff
over (order by month(order_date))) / lag(sum(unit_price* quantity),1) -- divison of pm sales
over (order by  month(order_date)) * 100 as MoM_increase_percenatage  -- percentage 

from
pizza_shop_sales
where
month(order_date) in (4,5) -- for month april (Pm) and may (Cm)

group by
month(order_date)
order by
month(order_date);