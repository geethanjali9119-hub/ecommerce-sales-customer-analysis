-- ==========================================================
-- Q-1: What is the total revenue generated from
-- completed sales?
-- ==========================================================

select 
	sum(revenue) as total_revenue
from sales_Ccleaned;

-------------------------------------------------------------
-- Answer: Total revenue is 3,11,111.
-------------------------------------------------------------

-- ==========================================================
-- Q-2: How many completed orders were placed?
-- ==========================================================

select
	count(*) as completed_orders
from orders_cleaned
where status = 'Completed';

-------------------------------------------------------------
-- Answer: There are 805 completed orders.
-------------------------------------------------------------

-- ==========================================================
-- Q-3: What is the average order value?
-- ==========================================================

select
    round(
        avg(cast(order_revenue as decimal(10,2))),
        1
    ) as avg_order_total
from
(
    select
        order_id,
        sum(revenue) as order_revenue
    from sales_Ccleaned
    group by order_id
) as order_totals;

-------------------------------------------------------------
-- Answer: Average order value is 447.6.
-------------------------------------------------------------

-- ==========================================================
-- Q-4: What is the total quantity of products sold?
-- ==========================================================

select
	sum(quantity) as total_quantity_sold
from sales_Ccleaned;

-------------------------------------------------------------
-- Answer: Total quantity of products sold is 4,848.
-------------------------------------------------------------

-- ==========================================================
-- Q-5: How does monthly revenue trend across 2024?
-- ==========================================================

select
	month,
	year,
	sum(revenue) as monthly_revenue
from sales_Ccleaned
where year = 2024
group by 
	month,
	year
order by 
	month,
	year;

-------------------------------------------------------------
-- Answer: This query shows how much revenue was generated,
-- in each month of 2024, allowing us to identify 
-- increasing, decreasing, or peak revenue periods.
--------------------------------------------------------------

-- ===========================================================
-- Q-6: Which products generate the highest revenue?
-- ===========================================================

select
	p.product_id,
	p.product_name,
	sum(s.revenue) as total_revenue
from sales_Ccleaned as s
join products_cleaned as p
	on s.product_id = p.product_id
group by
	p.product_id,
	p.product_name
order by total_revenue desc;

--------------------------------------------------------------
-- Answer: Product_16 generates the highest revenue,
-- followed by Product_45 and Product_25.
--------------------------------------------------------------

-- ===========================================================
-- Q-7: Which products have the highest quantity sold?
-- ===========================================================

select
	p.product_name,
	sum(s.quantity) as total_quantity_sold
from sales_Ccleaned as s
join products_cleaned as p
	on s.product_id = p.product_id
group by p.product_name
order by total_quantity_sold desc;

--------------------------------------------------------------
-- Answer: Product_45 has the highest quantity sold.
--------------------------------------------------------------

-- ===========================================================
-- Q-8: Which product categories generate the highest revenue?
-- ===========================================================

select
	p.category,
	sum(s.revenue) as total_revenue
from sales_Ccleaned as s
join products_cleaned as p
	on s.product_id = p.product_id
group by p.category
order by total_revenue desc;

--------------------------------------------------------------
-- Answer: Category Hair generates the highest revenue.
--------------------------------------------------------------

-- ===========================================================
-- Q-9: Which product categories have the
-- highest quantity sold?
-- ===========================================================

select 
	p.category,
	sum(s.quantity) as total_quantity_sold
from sales_Ccleaned as s
join products_cleaned as p
	on s.product_id = p.product_id
group by p.category
order by total_quantity_sold desc;

--------------------------------------------------------------
-- Answer: Hair has the highest quantity sold.
--------------------------------------------------------------

-- ===========================================================
-- Q-10: Which products have the highest average selling price?
-- ===========================================================

select
	p.product_name,
	round(avg(cast(s.price as decimal(10,2))), 2) as average_selling_price
from sales_Ccleaned as s
join products_cleaned as p
	on s.product_id = p.product_id
group by p.product_name
order by average_selling_price desc;

--------------------------------------------------------------
-- Answer: Product_8 has the highest average selling price.
--------------------------------------------------------------

-- ===========================================================
-- Q-11: Which countries have the highest number of customers?
-- ===========================================================

select
	country,
	count(*) as total_customers
from customers_cleaned
group by country
order by total_customers desc;

--------------------------------------------------------------
-- Answer: Italy had the highest number of customers with 69.
--------------------------------------------------------------

-- ===========================================================
-- Q-12: Which countries generate the highest revenue?
-- ===========================================================

select
	c.country,
	sum(s.revenue) as total_revenue
from sales_Ccleaned as s
join customers_cleaned as c
	on s.customer_id = c.customer_id
group by c.country
order by total_revenue desc;

--------------------------------------------------------------
-- Answer: Italy has the highest revenue with 70,719.
--------------------------------------------------------------

-- ===========================================================
-- Q-13: Who are the top 10 customers by total spending?
-- ===========================================================

select top 10
	c.customer_id,
	sum(s.revenue) as total_spending
from sales_Ccleaned as s
join customers_cleaned as c
	on s.customer_id = c.customer_id
group by c.customer_id
order by total_spending desc;

--------------------------------------------------------------
-- Answer: Customer 13 has the highest total spending with 5,048,
-- followed by Customer 39 (4,564) and Customer 152 (4,309).
--------------------------------------------------------------

-- ===========================================================
-- Q-14: Which customers have placed,
-- the highest number of orders?
-- ===========================================================

select top 10
	customer_id,
	count(distinct order_id) as total_orders
from orders_cleaned
group by customer_id
order by total_orders desc;

--------------------------------------------------------------
-- Answer:Customer 99 placed the highest number of orders, 
-- with 9 orders. Customers 1, 39, 63, and 233 followed 
-- with 8 orders each.
--------------------------------------------------------------

-- ===========================================================
-- Q-15: How many customers have never placed an order?
-- ===========================================================

select
	count(*) as customers_never_order
from customers_cleaned as c
left join orders_cleaned as o
	on c.customer_id = o.customer_id
where o.customer_id is null;

--------------------------------------------------------------
-- Answer: 15 customers have never placed an order.
--------------------------------------------------------------

-- ===========================================================
-- Q-16: What is the distribution of orders by status?
-- ===========================================================

select
	status,
	count(*) as total_orders
from orders_cleaned
group by status
order by total_orders desc;

--------------------------------------------------------------
-- Answer: Most orders are Completed (805), 
-- followed by Cancelled (103) and Returned (92).
--------------------------------------------------------------

-- ===========================================================
-- Q-17: What percentage of orders are completed, 
-- cancelled, and returned?
-- ===========================================================

select
	status,
	count(*) as total_orders,
	round(count(*) * 100.0 / sum(count(*)) over(),2 ) as percentage_of_orders
from orders_cleaned
group by status
order by percentage_of_orders desc;

--------------------------------------------------------------
-- Answer: Completed orders account for 80.50%, 
-- cancelled orders for 10.30%, and 
-- returned orders for 9.20% of all orders.
--------------------------------------------------------------

-- ===========================================================
-- Q-18: Which product categories generate the 
-- highest average revenue per order?
-- ===========================================================

with order_revenue_category as(
	select
		p.category,
		s.order_id,
		sum(s.revenue) as order_revenue
	from sales_Ccleaned as s
	join products_cleaned as p
		on s.product_id = p.product_id
	group by 
		p.category,
		s.order_id
)
select
	category,
	round(avg(order_revenue),2) as average_revenue_per_order
from order_revenue_category
group by category
order by average_revenue_per_order desc;

--------------------------------------------------------------
-- Answer: Body generates the highest average revenue ,
-- per order (258), followed by Makeup (247), 
-- Hair (245), and Skin (219).
--------------------------------------------------------------
