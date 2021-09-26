create database demo;
create table product(
id int,
product_code varchar(45),
product_name varchar(45),
product_price int,
product_amount int,
product_description text,
product_status varchar(45),
primary key(id)
);

alter table product add index code_product(product_code);
explain select * from product where product_code = "b";

alter table product add index name_price(product_name,product_price);
explain select * from product where product_name = "cafe" or product_price = 500;