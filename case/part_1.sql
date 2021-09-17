create database case_study;
use case_study;
create table vi_tri(
id_vitri int not null,
ten_vitri varchar(45) not null,
primary key (id_vitri)
);

create table trinh_do(
id_trinhdo int not null,
trinh_do varchar(45) not null,
primary key (id_trinhdo)
);

create table bo_phan(
id_bophan int not null ,
ten_bophan varchar(45) not null,
primary key (id_bophan)
);

create table nhan_vien(
id_nhanvien int not null ,
ho_ten varchar(50) not null,
id_vitri int,
id_trinhdo int,
id_bophan int,
ngay_sinh date not null,
so_cmnd varchar(45) not null,
luong varchar(45) not null,
sdt varchar(45) not null,
email varchar(45) not null,
dia_chi varchar(45) not null,
primary key (id_nhanvien),
foreign key (id_vitri) references vi_tri(id_vitri),
foreign key (id_trinhdo) references trinh_do(id_trinhdo),
foreign key (id_bophan) references bo_phan(id_bophan)
);

create table kieu_thue(
id_kieuthue int not null,
ten_kieuthue varchar(45) not null,
gia int not null,
primary key (id_kieuthue)
);

create table loai_dich_vu(
id_loaidichvu int not null,
ten_loaidichvu varchar(45) not null,
primary key (id_loaidichvu)
);

create table dich_vu(
id_dichvu int not null,
ten_dichvu varchar(45) not null,
dien_tich int not null,
so_nguoi_toi_da int not null,
chi_phi_thue varchar(45) not null,
id_kieuthue int,
id_loaidichvu int,
trang_thai varchar(45) not null,
primary key (id_dichvu),
foreign key (id_kieuthue) references kieu_thue (id_kieuthue),
foreign key (id_loaidichvu) references loai_dich_vu (id_loaidichvu)
);

create table loai_khach(
id_loaikhach int not null,
ten_loai_khach varchar(45) not null,
primary key (id_loaikhach)
);

create table khach_hang(
id_khachhang int not null,
id_loaikhach int,
ho_ten varchar(45) not null,
ngay_sinh date not null,
so_cmnd varchar(45) not null,
sdt varchar(45) not null,
email varchar(45) not null,
dia_chi varchar(45) not null,
primary key (id_khachhang),
foreign key (id_loaikhach) references loai_khach(id_loaikhach)
);

create table dich_vu_di_kem(
id_dichvudikem int not null,
ten_dichvukemtheo varchar(45) not null,
gia int not null,
don_vi int not null,
trang_thai varchar(45) not null,
primary key (id_dichvudikem)
);

create table hop_dong_chi_tiet(
id_hopdongchitiet int not null,
id_hopdong int,
id_dichvudikem int,
so_luong int not null,
primary key (id_hopdongchitiet),
foreign key (id_dichvudikem) references dich_vu_di_kem(id_dichvudikem)
);

create table hop_dong(
id_hopdong int not null,
id_nhanvien int,
id_khachhang int,
id_dichvu int,
ngay_lam_hop_dong date not null,
ngay_ket_thuc date not null,
tien_dat_coc int not null,
tong_tien int not null,
primary key (id_hopdong),
foreign key (id_nhanvien) references nhan_vien(id_nhanvien),
foreign key (id_khachhang) references khach_hang(id_khachhang),
foreign key (id_dichvu) references dich_vu(id_dichvu)
);

create table hopdong_hopdongchitiet (
id_hopdongchitiet int,
id_hopdong int,
primary key (id_hopdongchitiet,id_hopdong),
foreign key (id_hopdongchitiet) references hop_dong_chi_tiet(id_hopdongchitiet),
foreign key (id_hopdong) references hop_dong(id_hopdong)
);



