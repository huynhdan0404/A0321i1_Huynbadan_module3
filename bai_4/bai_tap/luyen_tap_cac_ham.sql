create database bai_tap_4;
use bai_tap_4;
create table hoc_vien(
id int not null,
ten varchar(45) not null,
tuoi int not null,
khoa_hoc varchar(45) not null,
so_tien int not null,
primary key(id)
);

select * from hoc_vien where hoc_vien.ten = "huong";

select sum(hoc_vien.so_tien) from hoc_vien where hoc_vien.ten = "huong";
