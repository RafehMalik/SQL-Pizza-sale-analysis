create database piza_sale;

use piza_sale;

create table orders (
order_id int primary key not null,
order_date date,
order_time time);


create table order_detail (
order_detail_id int primary key not null,
order_id int,
pizza_id text,
quantity int);

-- All the orders
SELECT * FROM piza_sale.orders;

-- order details
SELECT * FROM piza_sale.order_detail;

-- pizza types
SELECT * FROM piza_sale.pizza_types;

-- Pizzas
SELECT * FROM piza_sale.pizzas;


-- Retrieve the total number of orders placed.
select count(order_id) from orders;

-- Calculate the total revenue generated from pizza sales.
SELECT SUM(order_detail.quantity * pizzas.price) AS total_revenue
FROM order_detail
JOIN pizzas ON pizzas.pizza_id = order_detail.pizza_id;

-- Identify the highest-priced pizza.
select pizza_types.name,pizzas.price 
from pizza_types join pizzas 
on pizza_types.pizza_type_id = pizzas.pizza_type_id
order by pizzas.price desc limit 1;

-- Identify the most common pizza size ordered.
select pizzas.size, count(order_detail.order_detail_id) as order_count
from order_detail join pizzas
on pizzas.pizza_id = order_detail.pizza_id
group by pizzas.size order by order_count desc;

-- List the top 5 most ordered pizza types along with their quantities.
SELECT pizza_types.name, SUM(order_detail.quantity) AS quantity
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_detail ON order_detail.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY quantity DESC
LIMIT 5;

-- Determine the distribution of orders by hour of the day.
select hour(order_time) as hour, count(order_id) as order_numbers from orders 
group by hour(order_time);

-- Join relevant tables to find the category-wise distribution of pizzas.
select category, count(name) from pizza_types 
group by category;

-- Group the orders by date and calculate the average number of pizzas ordered per day.
select avg(quantity) from
(select orders.order_date, sum(order_detail.quantity) as quantity
from orders join order_detail 
on orders.order_id = order_detail.order_id
group by orders.order_date) as order_quantity;

-- Determine the top 3 most ordered pizza types based on revenue.
select pizza_types.name, sum(order_detail.quantity * pizzas.price) as revenue
from pizza_types join pizzas on pizzas.pizza_type_id = pizza_types.pizza_type_id
join order_detail on order_detail.pizza_id = pizzas.pizza_id
group by pizza_types.name order by revenue desc limit 3;
