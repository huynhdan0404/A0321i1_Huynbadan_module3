create database bai_tap_3;
use bai_tap_3;
create table loai_sach(
id_loai_sach int not null,
loai_sach varchar(45) not null,
so_luong int not null,
primary key(id_loai_sach)
);

create table sach(
id_sach int not null,
ten_sach varchar(45) not null,
so_luong int not null,
id_loai_sach int,
primary key(id_sach),
foreign key (id_loai_sach) references loai_sach(id_loai_sach)
);

create table sinh_vien(
id_sinh_vien int not null,
ho_ten varchar(45) not null,
ngay_sinh date not null,
primary key(id_sinh_vien)
);

create table phieu_muon(
id_phieu_muon int not null,
ngay_muon date not null,
ngay_tra date not null,
id_sach int,
id_sinh_vien int,
primary key(id_phieu_muon),
foreign key (id_sach) references sach(id_sach),
foreign key (id_sinh_vien) references sinh_vien(id_sinh_vien)
);

insert into loai_sach
values(1,"khoa hoc",50);
insert into loai_sach
values(2,"hoa hoc",50),(3,"lich su",50);

insert into sach
values(1,"hoa hoc dai cuong",10,2),
(2,"khoa hoc dien tu",10,1);

