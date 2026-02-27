
SELECT name FROM sys.schemas;
select * from dbo.reviews;
select * from dbo.reviews1;

-- dbo.customers
insert into dbo.customers (customer_id, name, email, phone, city, join_date)
select * from dbo.customers1;

-- dbo.reviews
insert into dbo.reviews (review_id, order_id, customer_id, restaurant_id, review_text, rating, review_timestamp)
select * from dbo.customer_reviews1;

-- dbo.historical_orders
select name from sys.key_constraints
where type = 'PK' and parent_object_id = object_id('historical_orders');
Alter table [dbo].[historical_orders]
drop constraint PK__historic__4659622961D6B800

insert into dbo.historical_orders (order_id, order_timestamp, restaurant_id, customer_id, order_type, items, 
total_amount, payment_method, order_status) 
select order_id, timestamp, restaurant_id, customer_id, order_type, items, total_amount, payment_method, order_status 
from dbo.historical_orders1;

-- dbo.menu_items
insert into dbo.menu_items (restaurant_id, item_id, name, category, price, ingredients, is_vegetarian, spice_level) 
select * from dbo.menu_items1;

-- dbo.restaurants
insert into dbo.restaurants (restaurant_id, name, city, country, address, opening_date, phone) 
select * from dbo.restaurants1;

