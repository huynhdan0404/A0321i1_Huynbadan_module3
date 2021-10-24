CREATE DATABASE demo1;
USE demo1;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name_users varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);