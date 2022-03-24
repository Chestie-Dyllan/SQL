-- Database: shopping_cart

-- DROP DATABASE IF EXISTS shopping_cart;

CREATE DATABASE shopping_cart
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	
	
	CREATE TABLE price_list(
	item_id serial,
	item_name varchar(20),
	item_price integer ,
	constraint pk_item_id Primary Key (item_id)
	);
	
	Create Table Users(
	user_id serial,
	first_name varchar(20),
	last_name varchar (30),
	email varchar(30),
	Constraint emp_email UNIQUE (email),
	constraint pk_user_id Primary Key (user_id)
	);
	
	
	Create Table Cart(
	user_id serial References Users(user_id),
	item_id serial References price_list(item_id)
	);
	
	Insert into price_list (item_name, item_price)
	Values ('Coke', 7.5),
	('Bar One', 8.5),
	('Fanta', 7.5),
	('Kit Kat', 9.5);
	
	create table UserCart(
	user_id integer,
	email varchar(30),
	item_id integer,
	item varchar(50),
	item_price integer
)
	
	Insert into Users (first_name, last_name, email)
	Values ('Dyllan', 'v.d Heever','dyllanvdh@gmail.com'),
	('Alicha', 'v.d Heever', 'a;ichavdh@gmail.com'),
	('Frikkie', 'Viljoen', 'frikvil@gmail.com'),
	('Nina', 'Bothma', 'ninab@gmail.com');
	
	Insert into Cart (item_id, user_id)
	Values (1, 3),
	(3, 4),
	(4, 2),
	(1, 1);
	
	select item_name, item_price from price_list;
	
insert into UserCart(user_id, email, item_id, item, item_price)
select Cart.user_id, Users.email, Cart.item_id, price_list.item_name, price_list.item_price
from Cart 
left join Users
on Cart.user_id = Users.user_id
left join price_list
on Cart.item_id = price_list.item_id;

select * from UserCart;	

select * from UserCart
where user_id = 2;

select user_id, email, count(item) as item_count, sum(item_price) as total
from UserCart
where user_id = 1
group by user_id, email;

create table UserOrder(
	order_id bigserial,
	user_id integer,
	email varchar(50),
	item_count integer,
	total integer
);

select user_id, email, count(item) as item_count, sum(item_price) as total
from UserCart
where user_id = 2
group by user_id, email;

insert into UserOrder(user_id, email, item_count, total)
select user_id, email, count(item) as item_count, sum(item_price) as total
from UserCart
group by user_id, email;

select * from UserOrder;