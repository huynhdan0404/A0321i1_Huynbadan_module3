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

create view product_view as
select product.product_code, product.product_name, product.product_price, product.product_status 
from product;

create or replace view product_view as
select  product.product_code, product.product_name, product.product_price
from product;

drop view product_view;

DELIMITER //
create procedure product_funtion()
begin
select * from product;
end //
DELIMITER ;

call product_funtion();

DELIMITER //
create procedure product_add()
begin
insert into product (id,product_code,product_name,product_price)
value (4,"d","trứng",400);
end //
DELIMITER ;
drop procedure product_add;
call product_add();


DELIMITER //
create procedure product_delete(a int)
begin
delete from product where product.id = a;
end //
DELIMITER ;
call product_delete(4);


