create database PRO1041_QLNhaThuoc
go
use PRO1041_QLNhaThuoc
go
Create table [NhanVien]
(
	[MaNhanVien] Nvarchar(6) NOT NULL,
	[MatKhau] Nvarchar(500) NOT NULL,
	[Ho] Nvarchar(30) NOT NULL,
	[Ten] Nvarchar(10) NOT NULL,
	[NgaySinh] Nvarchar(30) NULL,
	[GioiTinh] Nvarchar(10) NULL,
	[Email] Nvarchar(100) NULL,
	[DiaChi] Nvarchar(200) NULL,
	[CCCD] Nvarchar(12) NOT NULL,
	[ChucVu] Nvarchar(30) NOT NULL,
	[Hinh] Nvarchar(50) NULL,
	[TrangThai] Nvarchar(30) NULL,
primary Key ([MaNhanVien])
) 
go
Create table [HoaDon]
(
	[MaHoaDon] Nvarchar(6) NOT NULL,
	[MaNhanVien] Nvarchar(6) NOT NULL,
	[NgayBan] date not null,
	[TongTien] Float NOT NULL,
	[KhachHangSDT] Nvarchar(20) NULL,
	[TenKH] Nvarchar(50) NULL,
 Primary Key ([MaHoaDon]),
 foreign key(MaNhanVien) references NhanVien(MaNhanVien)
) 
go
Create table [LoaiThuoc]
(
	[MaLoaiThuoc] Nvarchar(6) NOT NULL,
	[TenLoai] Nvarchar(100) NOT NULL,
	[MoTa] Nvarchar(200) NULL,
Primary Key ([MaLoaiThuoc])
) 
Create table [NhaCungCap]
(
	[MaNhaCungCap] Nvarchar(6) NOT NULL,
	[TenNhaCungCap] Nvarchar(100) NOT NULL,
	[LoaiNhaCungCap] Nvarchar(50) NOT NULL,
	[MoTa] Nvarchar(200) NULL,
Primary Key ([MaNhaCungCap])
) 
go

Create table [NhapThuoc]
(
	[MaNhapThuoc] Integer NOT NULL,
	[MaLoaiThuoc] Nvarchar(6) NOT NULL,
	[MaNhaCungCap] Nvarchar(6) NOT NULL,
	[TenThuoc] Nvarchar(100) NOT NULL,
	[GiaNhap] Float NOT NULL,
	[SoLuong] Integer NOT NULL,
	[NgayNhap] Nvarchar(30) NOT NULL,
	[HanSuDung] Nvarchar(30) NOT NULL,
	[MoTa] Nvarchar(200) NULL,
	[DonVi] Nvarchar(50) NOT NULL,
	[QuyDoi] Nvarchar(50) NOT NULL,
Primary Key ([MaNhapThuoc]),
foreign key(MaLoaiThuoc) references LoaiThuoc(MaLoaiThuoc),
foreign key (MaNhaCungCap) references NhaCungCap(MaNhaCungCap)
) 
go
Create table [Thuoc]
(
	[MaThuoc] Nvarchar(6) NOT NULL,
	[MaLoaiThuoc] Nvarchar(6) NOT NULL,
	[MaNhaCungCap] Nvarchar(6) NOT NULL,
	[TenThuoc] Nvarchar(100) NOT NULL,
	[SoLuong] Integer NOT NULL,
	[Gia] Float NOT NULL,
	[MoTa] Nvarchar(100) NULL,
	[HanSuDung] date not null,
Primary Key ([MaThuoc]),
foreign key(MaLoaiThuoc) references LoaiThuoc(MaLoaiThuoc),
foreign key(MaNhaCungCap) references NhaCungCap(MaNhaCungCap)
) 
go
Create table [DonVi]
(
	[STT] Integer Identity(1,1) NOT NULL,
	[MaThuoc] Nvarchar(6) NOT NULL,
	[DonViTinh] Nvarchar(50) NULL,
	[SoLuong] Integer NULL,
Primary Key ([STT]),
foreign key(MaThuoc) references Thuoc(MaThuoc)
) 
go

Create table [ChiTietHoaDon]
(
	[STT] nvarchar(7) not null,
	[MaHoaDon] Nvarchar(6) NOT NULL,
	[MaThuoc] Nvarchar(6) NOT NULL,
	[SoLuong] Integer NOT NULL,
	[Gia] Float NOT NULL,
	[DonVi] Nvarchar(50) NOT NULL,
Primary Key ([STT]),
foreign key (MaHoaDon) references HoaDon(MaHoaDon),
foreign key (MaThuoc) references Thuoc(MaThuoc)
) 
go

insert into NhanVien(MaNhanVien,MatKhau,Ho,Ten,NgaySinh,GioiTinh,Email,DiaChi,CCCD,ChucVu,Hinh,TrangThai) values
			(N'NV001','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',N'Hoang',N'Thanh','10/10/2004',N'Nam','thanhhh@gmail.com','Q12','012345643',N'Nhân viên','anh1.png',N'Đang làm'),
			(N'NV002','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',N'Vo',N'Thanh','11/10/2004',N'Nam','thanhvt@gmail.com','Q12','012345643',N'Nhân viên','anh6.png',N'Đang làm'),
			(N'NV003','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',N'Phung',N'Phuong','19/10/2004',N'Nam','phuongp@gmail.com','Q4','012345643',N'Nhân viên','anh3.png',N'Đang làm'),
			(N'NV004','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',N'Nguyen',N'Tu','10/01/2004',N'Nam','tun@gmail.com','Q12','012345643',N'Nhân viên','anh4.png',N'Đang làm'),
			(N'NV005','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',N'Nguyen',N'Hung','10/10/2004',N'Nam','hungn@gmail.com','Q12','012345643',N'Nhân viên','anh5.png',N'Đang làm'),
			(N'NV006','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',N'Dieu',N'My','10/10/2004',N'Nữ','myd@gmail.com','Q12','012345643',N'Quản lý','anh7.png',N'Đang làm')

go
insert into LoaiThuoc(MaLoaiThuoc,TenLoai,MoTa) values
			('LT001',N'Kháng sinh',N'Trị viêm'),
			('LT002',N'Bổ Đạm',N''),
			('LT003',N'Bổ dược liệu',N'Ăn ngon'),
			('LT004',N'Giảm đau',N''),
			('LT005',N'Dạ dày',N''),
			('LT006',N'Trị mắt',N'Sáng mắt'),
			('LT007',N'Bổ Sâm',N''),
			('LT008',N'Vitamin',N''),
			('LT009',N'Cảm cúm',N''),
			('LT010',N'Thực phẩm chức năng',N'')
go
insert into NhaCungCap values ('NCC1', N'Công Ty CP Dược Hậu Giang',N'Nhà Sản Xuất',N''),
								('NCC2', N'Giathuochapu.com',N'Đại Lý',N''),
								('NCC3', N'Sanduocpham.vn',N'Đại Lý',N''),
								('NCC4', N'Công Ty CP Traphaco',N'Nhà Sản Xuất',N''),
								('NCC5', N'Công Ty CP Pymapharco',N'Nhà Sản Xuất',N''),
								('NCC6', N'Công Ty CP Dược Phẩm OPC',N'Nhà Sản Xuất',N''),
								('NCC7', N'Công Ty CP Dược Phẩm hà Tây',N'Nhà Sản Xuất',N''),
								('NCC8', N'Công Ty CP Dược Phẩm TV.Pharm',N'Nhà Sản Xuất',N''),
								('NCC9', N'Santhuochapu.vn',N'Đại Lý',N''),
								('NCC10', N'Chosithuoc.com',N'Đại Lý',N''),
								('NCC11', N'Công ty Cổ Phần SANOFI VIỆT NAM',N'Nhà Sản Xuất',N'')
go
insert into Thuoc values('T0001','LT004',N'NCC11', 'Panadol Extra','1800', '2500',N'Còn Thuốc','2025/10/12'),
						('T0002','LT005',N'NCC10', 'Phosphalugel','5000', '2200',N'Còn Thuốc','2026/10/01'),
						('T0003','LT001',N'NCC7', 'Penicilin','1900', '3000',N'Còn Thuốc','2024/09/12'),
						('T0004','LT001',N'NCC11', 'Macrolid','1400', '2220',N'Còn Thuốc','2027/02/01'),
						('T0005','LT006',N'NCC3', 'Blackmores','2000', '2550',N'Còn Thuốc','2025/2/12'),
						('T0006','LT006',N'NCC3', 'Lutein','2500', '2750',N'Còn Thuốc','2025/03/09'),
						('T0007','LT009',N'NCC7', 'Tamiflu ','1800', '1250',N'Còn Thuốc','2027/10/05'),
						('T0008','LT009',N'NCC7', 'Relenza','1500', '2350',N'Còn Thuốc','2026/09/02'),
						('T0009','LT002',N'NCC10', 'Philatop','1000', '2450',N'Còn Thuốc','2025/06/27'),
						('T0010','LT002',N'NCC10', 'Canxium','1000', '2150',N'Còn Thuốc','2025/12/30'),
						('T0011','LT005',N'NCC8', 'gaviscon','1000', '2250',N'Còn Thuốc','2027/09/27'),				
						('T0012','LT005',N'NCC8', 'Yumangel','1100', '2250',N'Còn Thuốc','2026/08/03'),
						('T0013','LT003',N'NCC5', 'Fitobimbi','100', '1150',N'Còn Thuốc','2022/02/10'),
						('T0014','LT003',N'NCC9', 'Ampomin','1500', '2225',N'Còn Thuốc','2023/10/11'),
						('T0015','LT004',N'NCC7', 'Advil','1800', '2250',N'Còn Thuốc','2022/12/14'),
						('T0016','LT004',N'NCC7', 'Hapacol','1600', '2250',N'Còn Thuốc','2023/12/09'),
						('T0017','LT008',N'NCC4', 'Tiffy','800', '500',N'Còn Thuốc','2023/09/12'),
						('T0018','LT009',N'NCC2', 'Coldacmin','1800', '500',N'Còn Thuốc','2026/01/25'),
						('T0019','LT004',N'NCC11', 'Panadol','1800', '2050',N'Còn Thuốc','2025/04/20'),
						('T0020','LT004',N'NCC10', N'Đông Trung hạ thảo Aloha','1800', '22500',N'Còn Thuốc','2025/11/21')


go
SET IDENTITY_INSERT DonVi ON;
insert into DonVi (STT,MaThuoc,DonViTinh,SoLuong) VALUES
('1','T0001',N'Hộp','60'),
('2','T0001',N'Vỉ','10'),
('3','T0001',N'Viên','1'),
('4','T0002',N'Hộp','50'),
('5','T0002',N'Gói','1'),
('6','T0003',N'Hộp','30'),
('7','T0003',N'Vỉ','6'),
('8','T0003',N'Viên','1'),
('9','T0004',N'Hộp','90'),
('10','T0004',N'Vỉ','15'),
('11','T0004',N'Viên','1'),
('12','T0005',N'Hộp','60'),
('13','T0005',N'Vỉ','10'),
('14','T0005',N'Viên','1'),
('15','T0006',N'Hộp','50'),
('16','T0006',N'Viên','1'),
('17','T0007',N'Hộp','30'),
('18','T0007',N'Vỉ','6'),
('19','T0007',N'Viên','1'),
('20','T0008',N'Hộp','30'),
('21','T0008',N'Vỉ','30'),
('22','T0008',N'Viên','30'),
('23','T0009',N'Vỉ','10'),
('24','T0009',N'Tuýp','1'),
('25','T0010',N'Vỉ','10'),
('26','T0010',N'Tuýp','1'),
('27','T0011',N'Hộp','20'),
('28','T0011',N'Gói','1'),
('29','T0012',N'Hộp','20'),
('30','T0012',N'Gói','1'),
('31','T0013',N'Chai','1'),
('32','T0014',N'Hộp','40'),
('33','T0014',N'Vỉ','8'),
('34','T0014',N'Tuýp','1'),
('35','T0010',N'Hộp','50'),
('36','T0009',N'Hộp','50'),
('37','T0015',N'Hộp','120'),
('38','T0015',N'Chai','30'),
('39','T0015',N'Viên','1'),
('40','T0016',N'Hộp','16'),
('41','T0016',N'Viên','1'),
('42','T0017',N'Vỉ','4'),
('43','T0018',N'Hộp','100'),
('44','T0018',N'Vỉ','20'),
('45','T0018',N'Viên','1'),
('46','T0019',N'Hộp','60'),
('47','T0019',N'Vỉ','10'),
('48','T0019',N'Viên','1'),
('49','T0020',N'Chai','1')
go
insert into HoaDon values	 ('HD001','NV001','09/11/2023',35000,N'0398917479',N'Võ Tấn Thành'),
							 ('HD002','NV001','09/11/2023',30000,N'0329894377',N'Hoàng Hữu Thành'),
							 ('HD003','NV002','09/11/2023',100000,N'0998917412',N'Nguyễn Tú'),
							 ('HD004','NV003','09/11/2023',25000,N'0397917430',N'Phùng Thành Phương'),
							 ('HD005','NV005','09/11/2023',27000,N'0398913944',N'Nguyễn Thị Diệu Mỵ'),
							 ('HD006','NV004','10/11/2023',66000,N'0398917439',N'Phạm Thị Kiều Linh'),
							 ('HD007','NV006','10/11/2023',28000,N'0398214439',N'Nguyễn Tú Tài'),
							 ('HD008','NV002','10/11/2023',84000,N'0398917439',N'Cao Văn Hùng'),
							 ('HD009','NV003','10/11/2023',44000,N'0999917496',N'Nguyễn Ngọc Yến Thuy'),
							 ('HD010','NV001','10/11/2023',61000,N'0338917410',N'Lê Văn Kiệt'),
							 ('HD011','NV006','10/11/2023',50000,N'0325917473',N'Trương Cao Thắng'),
							 ('HD012','NV005','11/11/2023',32000,N'0388917963',N'Phạm Anh Tài'),
							 ('HD013','NV005','11/11/2023',62000,N'0967879509',N'Trần Thị Hoài Hương'),
							 ('HD014','NV005','11/11/2023',106000,N'0832040073',N'Bùi Văn Trọng'),
							 ('HD015','NV005','11/11/2023',39000,N'0836524178',N'Trần Văn Cường'),
							 ('HD016','NV005','11/11/2023',53000,N'0963251478',N'Nguyễn Nhật Trường'),
							 ('HD017','NV005','11/11/2023',41000,N'03625879623',N'Trần Thị Kiều Nhi'),
							 ('HD018','NV005','11/11/2023',92000,N'03258412229',N'Võ Thành Trung'),
							 ('HD019','NV005','11/11/2023',52000,N'0863251473',N'Phạm Thị Hồng Hương'),
							 ('HD020','NV005','11/11/2023',110000,N'0963254789',N'Trần Thị Kiều Nhi')

insert into ChiTietHoaDon values
('1','HD020','T0020','2','450000','Chai')

	
  select * from NhaCungCap
  select * from LoaiThuoc
  select * from Thuoc
  select * from HoaDon
  select * from ChiTietHoaDon
  
SELECT * FROM Thuoc WHERE DATEDIFF(DAY, HanSuDung, GETDATE()) > 0;


create procedure sp_chiTietHoaDon @mahd nvarchar(6)
as begin
	select ct.MaThuoc, TenThuoc, ct.SoLuong, ct.Gia, DonVi, ct.SoLuong * ct.Gia as 'ThanhTien' 
	from ChiTietHoaDon ct join Thuoc t on ct.MaThuoc= t.MaThuoc
	where MaHoaDon like @mahd
end

create procedure sp_dataChart @nam int
as begin
	Select 
		YEAR(NgayBan) as nam,
		MONTH(NgayBan) as thang,
		COUNT(*) as soLuongHD,
		SUM(TongTien) as tongTien 
			from HoaDon
		where YEAR(NgayBan) = @nam
		group by YEAR(NgayBan), MONTH(NgayBan)
end


