create database accout_manage;
use accout_manage;
create table customer(
customer_number int,
fullname  varchar(50),
address varchar(200),
email varchar(50),
phone int,
primary key (customer_number)
);

create table accounts (
account_number int,
account_type varchar(50),
dates  date,
balance int,
primary key (account_number),
customer_number int, 
foreign key (customer_number) references customers (customer_number)
);

create table transactions (
tran_number int,
account_number int,
dates date,
amounts  int,
descriptions  varchar(100),
primary key (tran_number),
account_number int,
foreign key (account_number) references accouts(account_number)
);


