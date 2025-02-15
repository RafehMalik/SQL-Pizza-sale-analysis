# SQL-Pizza-sale-analysis

Pizza Sale Database

Overview

This project sets up a database to manage pizza sales, including order details, pizza types, and revenue calculations. The SQL script creates tables, inserts relationships, and performs various queries to analyze sales data.

Database Structure

Tables Created:

orders - Stores order details with order ID, date, and time.

order_detail - Links orders to pizzas with quantity information.

pizza_types - Contains pizza type names and categories.

pizzas - Stores pizza pricing and sizes.

Queries Included:

Retrieve all orders and order details.

Fetch pizza types and available pizzas.

Count total orders placed.

Calculate total revenue from sales.

Identify the highest-priced pizza.

Determine the most commonly ordered pizza size.

List the top 5 most ordered pizza types.

Analyze order distribution by hour of the day.

Group pizzas by category.

Compute the average number of pizzas ordered per day.

Find the top 3 most profitable pizza types based on revenue.

How to Use:

Create the Database:

CREATE DATABASE piza_sale;
USE piza_sale;

Run the Table Creation Queries to set up orders, order_detail, pizza_types, and pizzas.

Execute Queries to analyze sales and order trends.

Notes:

Ensure foreign keys are correctly linked for integrity.

Data needs to be inserted before running analytical queries.

Author

This project is developed for understanding database operations related to pizza sales analysis.
