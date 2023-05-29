create table HocSinh (
MaHS varchar(20) Primary key,
TenHS varchar(50),
NgaySinh Datetime,
Lop varchar(20),
GioiTinh varchar(20));



Create table MonHoc (
MaMH varchar(20) primary key,
TenMH varchar(50));


create table giaovien (
MaGV varchar(20) primary key,
TenGV varchar(20),
SDT varchar(12));

Alter table monhoc add magv varchar(20);
Alter table monhoc add constraint FK_MaGV Foreign key ( magv) references giaovien (magv);