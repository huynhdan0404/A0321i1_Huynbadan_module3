create database thuc_hanh_1;
use thuc_hanh_1;
CREATE TABLE contacts(
  contact_id INT AUTO_INCREMENT,
  last_name VARCHAR(30),
  first_name VARCHAR(25),
  birthday DATE,
  PRIMARY KEY (contact_id)
);
CREATE TABLE orders(
   id INT AUTO_INCREMENT,
   staff VARCHAR(50),
   PRIMARY KEY(id),
   customer_id INT ,
   FOREIGN KEY (customer_id) REFERENCES customers(id)
);

ALTER TABLE contacts ADD mo_ta varchar(40) NOT NULL;
alter table contacts drop mo_ta;
drop table contacts;
drop database thuc_hanh_1; 
