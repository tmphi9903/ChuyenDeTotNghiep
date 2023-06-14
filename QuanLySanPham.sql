--tao database
create database QuanLySanPham
use QuanLySanPham
--tao table
go
create table NHANVIEN
(
	MaNV varchar(5),
	HoTenNV nvarchar(50) not null,
	GioiTinhNV  bit not null,
	NgaySinhNV date,
	DiaChiNV nvarchar(100),
	SDTNV varchar(15),
	constraint pk_NHANVIEN primary key (MaNV)
)




go
create table KHACHHANG
(
	MaKH varchar(5),
	HoTenKH nvarchar(50) not null,
	GioiTinhKH nvarchar(5),
	DiaChiKH nvarchar(100),
	NgaySinhKH date,
	STDKH varchar(15),
	Email varchar(50),
	MatKhau varchar(20),
	GhiChu nvarchar(100),

	constraint pk_KHACHHANG primary key (MaKH),
)





go
create table PHANLOAIHANG
(
	MaLoai varchar(5),
	TenLoai nvarchar(50),
	constraint pk_PHANLOAIHANG primary key (MaLoai)
)





go
create table NHACUNGCAP
(
	MaNCC varchar(5),
	TenNCC nvarchar(50),
	DiaChiNCC nvarchar(100),
	SDTNCC varchar(15),
	Email varchar(50),
	constraint pk_NHACUNGCAP primary key (MaNCC)
)


go
create table SANPHAM
(
	MaSP varchar(5),
	TenSP nvarchar(50),
	MaLoai varchar(5),
	NSX nvarchar(50),
	ChatLieu nvarchar(20),
	KichCo tinyint,
	MauSac nvarchar(20),
	HinhAnh varchar(200),
	DonGia money,
	constraint pk_SANPHAM primary key (MaSP),
	constraint fk_SANPHAM_PHANLOAIHANG foreign key (MaLoai) references PHANLOAIHANG(MaLoai),
)
go
create table PHIEUNHAPHANG
(
	MaPNH varchar(5),
	NgayNhapHang date,
	MaNCC varchar(5),
	MaNV varchar(5),
	TongTienNH money,
	constraint pk_PHIEUNHAPHANG	primary key (MaPNH),
	constraint fk_PHIEUNHAPHANG_NHACUNGCAP foreign key (MaNCC) references NHACUNGCAP(MaNCC),
	constraint fk_PHIEUNHAPHANG_NHANVIEN foreign key (MaNV) references NHANVIEN(MaNV)
)
go 
create table CTPNH
(
	MaPNH varchar(5),
	MaSP varchar(5),
	SoLuong smallint
	constraint pk_CTPNH primary key (MaPNH,MaSP),
	constraint fk_CTPNH_SANPHAM foreign key (MaSP) references SANPHAM(MaSP),
	constraint fk_CTPNH_PHIEUNHAPHANG foreign key (MaPNH) references PHIEUNHAPHANG(MaPNH)
)

GO
CREATE TABLE QuanTri
(
	Email varchar(50) PRIMARY KEY,
	Admin bit,
	HoTen nvarchar(50),
	Password nvarchar(50),
	MaTK varchar(5)
)


GO
INSERT INTO QuanTri VALUES('tmphi9903@gmail.com',1,N'Trương Minh Phi','123','KH000')



create table HOADON
(
	MaHD varchar(50) not null,
	NgayLapHD date,
	MaKH varchar(5),
	MaNV varchar(5),
	NgayGiaoHang date, 
	DaThanhToan bit,
	TinhTrangGiaoHang nvarchar(50),
	TongTien money
	constraint pk_HOADON primary key (MaHD),
	constraint fk_HOADON_KHACHHANG foreign key (MaKH) references KHACHHANG(MaKH),
	constraint fk_HOADON_NHANVIEN foreign key (MaNV) references NHANVIEN(MaNV),
)

go
create table CHITIETHD
(
	MaHD varchar(50) not null,
	MaSP varchar(5) not null,
	SoLuong smallint,
	DonGiaBan money
	constraint pk_CHITIETHD primary key (MaHD, MaSP),
	constraint fk_CHITIETHD_HOADON foreign key (MaHD) references HOADON(MaHD),
	constraint fk_CHITIETHD_SANPHAM foreign key (MaSP) references SANPHAM(MaSP)
)






--nhap dữ liệu
go
insert into NHANVIEN(MaNV,HoTenNV,GioiTinhNV,NgaySinhNV,DiaChiNV,SDTNV) values
('NV001',N'Trương Minh Phi',0,CAST(N'2001-1-2' AS Date),N'01 - Nguyễn Đình Chiểu','1000000001'),
('NV002',N'Nguyễn Việt Hưng',0,CAST(N'2001-2-3' AS Date),N'02 - Nguyễn Đình Chiểu','1000000002'),
('NV003',N'Phan Ngọc Thịnh',0,CAST(N'2001-3-4' AS Date),N'03 - Nguyễn Đình Chiểu','1000000003'),
('NV004',N'Văn Tấn Thông',0,CAST(N'2001-11-4' AS Date),N'04 - Nguyễn Đình Chiểu','1000000004'),
('NV005',N'Nguyễn Trương Ngọc Huy',0,CAST(N'2001-5-5' AS Date),N'05 - Nguyễn Đình Chiểu','1000000005'),
('NV006',N'Nguyễn Thị Thu Oanh',1,CAST(N'2001-6-6' AS Date),N'06 - Nguyễn Đình Chiểu','1000000006'),
('NV007',N'Huỳnh Thị Ngọc Nguyên',1,CAST(N'2001-7-7' AS Date),N'07 - Nguyễn Đình Chiểu','1000000007'),
('NV008',N'Phan Thị Huyền Trâm',1,CAST(N'2001-8-8' AS Date),N'08 - Nguyễn Đình Chiểu','1000000008')



go 
insert into PHANLOAIHANG(MaLoai,TenLoai) values
('GTT01','SamSung'),
('GTT02','Cap'),
('GTT03','Dell'),
('GCB01','IBM'),
('DSD01','Panasonic'),
('GCG01','Toshiba')
insert into PHANLOAIHANG(MaLoai,TenLoai) values
('GBDVN','Prada')



go 
insert into NHACUNGCAP(MaNCC,TenNCC,DiaChiNCC,SDTNCC,Email) values
('NCC01','Sony',N'31 - Nguyễn Bỉnh Khiêm','3000000001','NCC1@gmail.com'),
('NCC02','Apple',N'32 - Nguyễn Bỉnh Khiêm','3000000002','NCC2@gmail.com'),
('NCC03','Gucci',N'33 - Nguyễn Bỉnh Khiêm','3000000003','NCC3@gmail.com')
go 
insert into NHACUNGCAP(MaNCC,TenNCC,DiaChiNCC,SDTNCC,Email) values
('NCC04','Chanel',N'34 - Nguyễn Bỉnh Khiêm','3000000004','NCC4@gmail.com')

go
insert into SANPHAM(MaSP,TenSP,MaLoai,NSX,ChatLieu,KichCo,MauSac,HinhAnh,DonGia) values
('SP001','JSneaker Nam 42','GTT01','Sony',N'Da bóng','41',N'Xanh rêu','flash-1.png','20'),
('SP002','Defy Skyline Skeleton','GTT02','Sony',N'Thép nguyên khối','40',N'Xám trắng','flash-2.png','100'),
('SP003','Iphone Xs-Max','GTT03','Sony',N'Thép nguyên khối','38',N'Hồng Đen','flash-3.png','200'),
('SP004','Smart Watch Black','GCB01','Sony',N'Thép nguyên khối','42',N'Trắng Đỏ','flash-4.png','15'),
('SP005','Defy Skyline Skeleton','DSD01','Sony',N'Thép nguyên khối','39',N'Xanh lam','flash-2.png','50'),
('SP006','Iphone Xs-Max 256 Black','Sony',N'Thép nguyên khối',N'Da bò','35',N'Vàng ánh kim','flash-3.png','90')


go
insert into SANPHAM(MaSP,TenSP,MaLoai,NSX,ChatLieu,KichCo,MauSac,HinhAnh,DonGia) values
('SP007','Mapple Earphones','GTT01','Sony',N'Thép nguyên khối','41',N'Xanh rêu','shop-1.png','300'),
('SP008','Vivo android one','GTT02','Sony',N'Thép nguyên khối','41',N'Xanh rêu','shop-2.png','150'),
('SP009','Sony Light','GTT03','Sony',N'Thép nguyên khối','41',N'Xanh rêu','shop-3.png','250'),
('SP010','Iphone','GCB01','Sony',N'Thép nguyên khối','41',N'Xanh rêu','shop-4.png','400'),
('SP011','Ceats wireless earphone','DSD01','Sony',N'Thép nguyên khối','41',N'Xanh rêu','shop-5.png','1000'),
('SP012','Redimi Phone','GCB01','Sony',N'Da bóng','41',N'Thép nguyên khối','shop-7.png','500'),
('SP013','Xeats Bluetooth earphones','GTT01','Sony',N'Thép nguyên khối','41',N'Xanh rêu','shop-8.png','600'),
('SP014','Airpod','DSD01','Sony',N'Da bóng','41',N'Thép nguyên khối','shop-9.png','110')


go



CREATE PROCEDURE NhanVien_TimKiem
    @MaNV varchar(8)=NULL,
	@HoTen nvarchar(40)=NULL,
	@GioiTinh nvarchar(3)= NULL,
	@DiaChi nvarchar(70)=NULL
AS
BEGIN
DECLARE @SqlStr NVARCHAR(4000),
		@ParamList nvarchar(2000)
SELECT @SqlStr = '
       SELECT * 
       FROM NhanVien
       WHERE  (1=1)
       '
IF @MaNV IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (MaNV LIKE ''%'+@MaNV+'%'')
              '
IF @HoTen IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (HoTenNV LIKE ''%'+@HoTen+'%'')
              '
IF @GioiTinh IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
             AND (GioiTinhNV LIKE ''%'+@GioiTinh+'%'')
             '
IF @DiaChi IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (DiaChiNV LIKE ''%'+@DiaChi+'%'')
              '
	EXEC SP_EXECUTESQL @SqlStr
END


GO
CREATE PROCEDURE KhachHang_TimKiem
    @MaNV varchar(8)=NULL,
	@HoTen nvarchar(40)=NULL,
	@GioiTinh nvarchar(3)= NULL,
	@DiaChi nvarchar(70)=NULL
AS
BEGIN
DECLARE @SqlStr NVARCHAR(4000),
		@ParamList nvarchar(2000)
SELECT @SqlStr = '
       SELECT * 
       FROM KhachHang
       WHERE  (1=1)
       '
IF @MaNV IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (MaKH LIKE ''%'+@MaNV+'%'')
              '
IF @HoTen IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (HoTenKH LIKE ''%'+@HoTen+'%'')
              '
IF @GioiTinh IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
             AND (GioiTinhKH LIKE ''%'+@GioiTinh+'%'')
             '
IF @DiaChi IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (DiaChiKH LIKE ''%'+@DiaChi+'%'')
              '
	EXEC SP_EXECUTESQL @SqlStr
END


GO
CREATE PROCEDURE SanPham_TimKiem
    @MaSP varchar(8)=NULL,
	@TenSP nvarchar(40)=NULL,
	@NSX nvarchar(3)= NULL,
	@dgMin varchar(30)=NULL,
	@dgMax varchar(30)=NULL,
	@ChatLieu nvarchar(70)=NULL,
	@MaLoai nvarchar(10)=NULL
AS
BEGIN
DECLARE @SqlStr NVARCHAR(4000),
		@ParamList nvarchar(2000)
SELECT @SqlStr = '
       SELECT * 
       FROM SanPham
       WHERE  (1=1)
       '
IF @MaSP IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (MaSP LIKE ''%'+@MaSP+'%'')
              '
IF @TenSP IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (TenSP LIKE ''%'+@TenSP+'%'')
              '
IF @NSX IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
             AND (NSX LIKE ''%'+@NSX+'%'')
             '
IF @dgMin IS NOT NULL and @dgMax IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
             AND (DonGia Between Convert(int,'''+@dgMin+''') AND Convert(int, '''+@dgMax+'''))
             '
IF @ChatLieu IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (ChatLieu LIKE ''%'+@ChatLieu+'%'')
              '
IF @MaLoai IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (MaLoai LIKE ''%'+@MaLoai+'%'')
              '
	EXEC SP_EXECUTESQL @SqlStr
END

GO
CREATE PROCEDURE NCC_TimKiem
    @MaNCC varchar(8)=NULL,
	@TenNCC nvarchar(40)=NULL,
	@DiaChi nvarchar(70)=NULL,
	@sdt nvarchar(40)=NULL,
	@email nvarchar(40)=NULL

AS
BEGIN
DECLARE @SqlStr NVARCHAR(4000),
		@ParamList nvarchar(2000)
SELECT @SqlStr = '
       SELECT * 
       FROM NHACUNGCAP
       WHERE  (1=1)
       '
IF @MaNCC IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (MaNCC LIKE ''%'+@MaNCC+'%'')
              '
IF @TenNCC IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (TenNCC LIKE ''%'+@TenNCC+'%'')
              '
IF @DiaChi IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (DiaChiNCC LIKE ''%'+@DiaChi+'%'')
              '
			  IF @sdt IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (SDTNCC LIKE ''%'+@sdt+'%'')
              '
			  IF @email IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (Email LIKE ''%'+@email+'%'')
              '
	EXEC SP_EXECUTESQL @SqlStr
END

GO
CREATE PROCEDURE PHANLOAIHANG_TimKiem
    @MaLoai varchar(8)=NULL,
	@TenLoai nvarchar(40)=NULL

AS
BEGIN
DECLARE @SqlStr NVARCHAR(4000),
		@ParamList nvarchar(2000)
SELECT @SqlStr = '
       SELECT * 
       FROM PHANLOAIHANG
       WHERE  (1=1)
       '
IF @MaLoai IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (MaLoai LIKE ''%'+@MaLoai+'%'')
              '
IF @TenLoai IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (TenLoai LIKE ''%'+@TenLoai+'%'')
              '
	EXEC SP_EXECUTESQL @SqlStr
END

GO


GO
CREATE PROCEDURE HOADON_TimKiem
    @MaHD varchar(8)=NULL,
	@MaKH nvarchar(40)=NULL

AS
BEGIN
DECLARE @SqlStr NVARCHAR(4000),
		@ParamList nvarchar(2000)
SELECT @SqlStr = '
       SELECT * 
       FROM HOADON
       WHERE  (1=1)
       '
IF @MaHD IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (MaHD LIKE ''%'+@MaHD+'%'')
              '
IF @MaKH IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (MaKH LIKE ''%'+@MaKH+'%'')
              '
	EXEC SP_EXECUTESQL @SqlStr
END

