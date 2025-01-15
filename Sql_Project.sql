SELECT * FROM walmart.walmart;  
use walmart;

-- 1 count the number of products by each category?

select category,count( product_name) 
as product_count from walmart
group by category;

-- 2 products with highest unit price (>1000)?
select product_name,unit_price from
walmart where unit_price>1000;

-- 3 distribution of products by gender?

select product_name,customer_gender,count(*) as product_count 
from walmart
group by product_name,customer_gender
order by product_count
desc;

-- 4 Total sales by category
Select category, SUM(quantity_sold * unit_price) as total_sales
from walmart
group by category
order by total_sales desc;

-- 5 Total quantity sold by product
SELECT product_name, SUM(quantity_sold) AS total_quantity_sold
FROM walmart
group by product_name
order by total_quantity_sold desc;

-- 6 top 5 products by unit price
select product_name, SUM(unit_price) as total_unit_price
from walmart
group by product_name
order by total_unit_price desc
limit 5;

-- 7 sales trends by payment method
select payment_method,sum(unit_price*quantity_sold) as Total_sales
from walmart
group by payment_method; 

-- 8 product saled after a certain date and time?
select product_name,transaction_date 
from walmart where 
transaction_date >'3/31/2024 21:46';

-- 9 trend in total sales by weather condition
select weather_conditions,sum(unit_price*quantity_sold) as Totall_sales 
from walmart
group by weather_conditions;

-- 10 Distribution of customers with payment method?
select payment_method,count(*) customer_count from walmart 
group by payment_method; 

-- 11 Average sales on weekdays

select weekday,avg(unit_price*quantity_sold) as avg_sales
from walmart
group by weekday;

-- 12 sales during holidays and non_holidays

select holiday_indicator,sum(unit_price*quantity_sold) 
as total_sales from walmart
group by holiday_indicator;

-- 13 Difference between forecasted demand and actual demand for each product?
select product_name,sum(forecasted_demand),sum(actual_demand),
sum(forecasted_demand)-sum(actual_demand) as demand_difference
from walmart
group by product_name;

-- 14 List the products that were sold with a "Percentage Discount" promotion
select distinct product_name,promotion_type
 from walmart
 where promotion_type = 'Percentage Discount';
 
 -- 15 Which promotion type has led to the highest total revenue
 
 select promotion_type,
 sum(unit_price*quantity_sold) as Total_sales 
 from walmart
 group by promotion_type
 order by Total_sales desc 
 limit 1;
 
 -- 16 find the store with lowest inventory level?
 select store_id,min(inventory_level)as inventory_level
 from walmart
 group by store_id
 order by inventory_level
 limit 1;
 
 -- 17 How many products are sold that have an inventory level below the reorder point?
 
 select COUNT(distinct product_name) as understocked_products
from walmart
where inventory_level < reorder_point;

-- 18 find the number of products by store
select  store_id,count(*) as product_count
 from walmart
group by store_id;

-- 19 find the store locations of a particular product?

select store_location 
from walmart
where product_name='fridge';

-- 20  Customer Demographics and Sales Trends

select customer_age,customer_gender,customer_loyalty_level,
sum(quantity_sold * unit_price) as total_sales,
avg(quantity_sold * unit_price) as avg_sales_per_customer
from walmart
group by customer_age, customer_gender, customer_loyalty_level
order by total_sales desc; 
