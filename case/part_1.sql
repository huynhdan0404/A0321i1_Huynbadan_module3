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

create table dich_vu_di_kem(
id_dichvudikem int not null,
ten_dichvukemtheo varchar(45) not null,
gia int not null,
don_vi varchar(45) not null,
trang_thai varchar(45) not null,
primary key (id_dichvudikem)
);

create table hop_dong_chi_tiet(
id_hopdongchitiet int not null,
id_hopdong int,
id_dichvudikem int,
so_luong int not null,
primary key (id_hopdongchitiet),
foreign key (id_dichvudikem) references dich_vu_di_kem(id_dichvudikem),
foreign key (id_hopdong) references hop_dong(id_hopdong)
);

select * from nhan_vien where (nhan_vien.ho_ten like "T%") or	(nhan_vien.ho_ten like "H%") or (nhan_vien.ho_ten like "K%") and length(nhan_vien.ho_ten)<15;
	
select * from khach_hang where dia_chi in ("Quảng Trị", "Đà Nẵng") and (curdate() - ngay_sinh > (18 * 30 * 365) and curdate() - ngay_sinh < (50 * 30 * 365)); 

select khach_hang.ho_ten, count(hop_dong.id_hopdong) as so_lan_dat_phong from khach_hang inner join hop_dong on khach_hang.id_khachhang =  hop_dong.id_khachhang
inner join loai_khach on khach_hang.id_loaikhach = loai_khach.id_loaikhach where loai_khach.ten_loai_khach = "diamond"
group by khach_hang.id_khachhang order by so_lan_dat_phong;

select khach_hang.id_khachhang, khach_hang.ho_ten, loai_khach.ten_loai_khach, hop_dong.id_hopdong, dich_vu.ten_dichvu, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, 
sum(dich_vu.chi_phi_thue + hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia) as tong_tien
from khach_hang left join loai_khach on khach_hang.id_loaikhach = loai_khach.id_loaikhach
left join hop_dong on khach_hang.id_khachhang = hop_dong.id_khachhang
left join dich_vu  on hop_dong.id_dichvu = dich_vu.id_dichvu
left join hop_dong_chi_tiet on hop_dong.id_hopdong = hop_dong_chi_tiet.id_hopdong
left join dich_vu_di_kem on hop_dong_chi_tiet.id_dichvudikem = dich_vu_di_kem.id_dichvudikem
group by hop_dong.id_hopdong;

select dich_vu.id_dichvu, dich_vu.ten_dichvu, dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loaidichvu
from dich_vu inner join loai_dich_vu on dich_vu.id_loaidichvu = loai_dich_vu.id_loaidichvu
where not exists (select hop_dong.id_hopdong from hop_dong where (hop_dong.ngay_lam_hop_dong between "2019-01-01" and "2019-03-01") and hop_dong.id_dichvu = dich_vu.id_dichvu);

select dich_vu.id_dichvu, dich_vu.ten_dichvu, dich_vu.dien_tich, dich_vu.so_nguoi_toi_da, dich_vu.chi_phi_thue, loai_dich_vu.ten_loaidichvu
from dich_vu inner join loai_dich_vu on dich_vu.id_loaidichvu = loai_dich_vu.id_loaidichvu
where exists (select hop_dong.id_hopdong from hop_dong where year(hop_dong.ngay_lam_hop_dong) = "2018" and hop_dong.id_dichvu = dich_vu.id_dichvu) 
and not exists (select hop_dong.id_hopdong from hop_dong where year(hop_dong.ngay_lam_hop_dong) = "2019" and hop_dong.id_dichvu = dich_vu.id_dichvu) ;

select khach_hang.ho_ten from khach_hang group by khach_hang.ho_ten;
select distinct khach_hang.ho_ten from khach_hang; 

-- yêu cầu 9------------
select temp.month, count(month(hop_dong.ngay_lam_hop_dong)) as so_khach_hang_dang_ki, sum(hop_dong.tong_tien) as tong_tien from   
(select 1 as month
union select 2 as month
union select 3 as month
union select 4 as month
union select 5 as month
union select 6 as month
union select 7 as month
union select 8 as month
union select 9 as month
union select 10 as month
union select 11 as month
union select 12 as month) as temp
left join hop_dong on month(hop_dong.ngay_lam_hop_dong) = temp.month
left join khach_hang on khach_hang.id_khachhang = hop_dong.id_khachhang
where year(hop_dong.ngay_lam_hop_dong) = "2019" or year(hop_dong.ngay_lam_hop_dong) is null or month(hop_dong.ngay_lam_hop_dong) is null
group by temp.month;

-- yeu cau 10----
select hop_dong.id_hopdong, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, hop_dong.tien_dat_coc, hop_dong_chi_tiet.so_luong
from hop_dong inner join hop_dong_chi_tiet on hop_dong.id_hopdong = hop_dong_chi_tiet.id_hopdong;

-- yeu cau 11----
select khach_hang.ho_ten, loai_khach.ten_loai_khach, dich_vu_di_kem.*
from dich_vu_di_kem inner join hop_dong_chi_tiet on dich_vu_di_kem.id_dichvudikem = hop_dong_chi_tiet.id_dichvudikem
inner join hop_dong on hop_dong_chi_tiet.id_hopdong = hop_dong.id_hopdong
inner join khach_hang on hop_dong.id_khachhang = khach_hang.id_khachhang
inner join loai_khach on khach_hang.id_loaikhach = loai_khach.id_loaikhach
where loai_khach.ten_loai_khach = "diamond" and khach_hang.dia_chi in ("vinh", "quảng ngãi");    

-- yeu cau 12---



