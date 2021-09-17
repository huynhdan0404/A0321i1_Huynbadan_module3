create database thiet_ke_csdl;
use thiet_ke_csdl;
create table offices (
office_code varchar(10) not null,
city varchar(50) not null,
phone varchar(50) not null,
country varchar(50) not null,
primary key (office_code)
);

create table employees (
emloyee_number int not null,
last_name varchar(50) not null,
fist_name varchar (50) not null,
job_title varchar(50) not null,
primary key (emloyee_number),
office_code varchar(10) not null,
foreign key (office_code) references offices (office_code)
);

create table customers(
customer_number int not null auto_increment,
customer_name varchar(50) not null,
last_name varchar (50) not null,
first_name varchar (50) not null,
phone varchar(50) not null,
address varchar(50) not null,
primary key (customer_number),
emloyee_number int not null,
foreign key (emloyee_number) references employees(emloyee_number)
);

create table payments  (
customer_number int not null,
check_number varchar(50) not null,
pay_date date not null,
amount double not null,
primary key (check_number),
foreign key (customer_number) references customers(customer_number)
);

create table productlines(
productline_code varchar(50) not null,
text_description text not null,
imgs varchar(50),
primary key (productline_code)
);

create table products(
product_code varchar(15) not null,
product_name varchar(20) not null,
product_vendor varchar(70) not null,
product_comment text not null,
primary key (product_code),
productline_code varchar(50) not null,
foreign key (productline_code) references productlines(productline_code)
);

create table orders (
order_number int not null,
order_date date not null,
shippedDate date not null,
comments varchar(200) not null,
primary key (order_number)
);

create table product_order(
order_number int not null,
product_code varchar(15) not null,
primary key(order_number,product_code),
foreign key (order_number) references orders (order_number),
foreign key (product_code) references products (product_code)
);



