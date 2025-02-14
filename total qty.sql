-- total quantity sold
select sum(quantity) as Total_Qty
from pizza_shop_sales
where
month(order_date)= 6; -- month of june


select 
month(order_date) as month, -- number of month
round(sum(quantity)) as total_qty, -- total qty columns
(sum(quantity) - lag(sum(quantity),1) -- month qty diff
over (order by month(order_date))) / lag(sum(quantity),1) -- divison of pm qty
over (order by  month(order_date)) * 100 as MoM_increase_percenatage  -- percentage 

from
pizza_shop_sales
where
month(order_date) in (4,5) -- for month april (Pm) and may (Cm)

group by
month(order_date)
order by
month(order_date);