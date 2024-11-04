CREATE TABLE Phim748 (ID int(10) NOT NULL AUTO_INCREMENT, tenPhim varchar(255) NOT NULL, theLoai varchar(255) NOT NULL, thoiLuong float NOT NULL, moTa varchar(255), PRIMARY KEY (ID)) ENGINE=InnoDB CHARACTER SET UTF8;
CREATE TABLE PhongChieu748 (ID int(10) NOT NULL AUTO_INCREMENT, soGhe int(10) NOT NULL, PRIMARY KEY (ID)) ENGINE=InnoDB CHARACTER SET UTF8;
CREATE TABLE SuatChieu748 (ID int(10) NOT NULL AUTO_INCREMENT, gioChieu varchar(255) NOT NULL, ngayChieu date NOT NULL, ghiChu varchar(255), phongChieu748ID int(10) NOT NULL, Phim748ID int(10) NOT NULL, PRIMARY KEY (ID)) ENGINE=InnoDB CHARACTER SET UTF8;
CREATE TABLE Ghe748 (ID int(10) NOT NULL AUTO_INCREMENT, loaiGhe varchar(255) NOT NULL, conTrong bit(1) NOT NULL, phongChieu748ID int(10) NOT NULL, PRIMARY KEY (ID)) ENGINE=InnoDB CHARACTER SET UTF8;
CREATE TABLE Ve748 (ID int(10) NOT NULL AUTO_INCREMENT, theLoai varchar(255) NOT NULL, giaVe float NOT NULL, Ghe748ID int(10) NOT NULL, HoaDon748ID int(10) NOT NULL, SuatChieu748ID int(10) NOT NULL, PRIMARY KEY (ID)) ENGINE=InnoDB CHARACTER SET UTF8;
CREATE TABLE HoaDon748 (ID int(10) NOT NULL AUTO_INCREMENT, ngay date NOT NULL, tongSoVe int(10) NOT NULL, tongTien float NOT NULL, loaiHoaDon varchar(255) NOT NULL, PRIMARY KEY (ID)) ENGINE=InnoDB CHARACTER SET UTF8;
CREATE TABLE NguoiDung748 (ID int(10) NOT NULL AUTO_INCREMENT, taiKhoan varchar(255), matKhau varchar(255), hoVaTen varchar(255) NOT NULL, loaiNguoiDung varchar(255) NOT NULL, diem int(11), PRIMARY KEY (ID)) ENGINE=InnoDB CHARACTER SET UTF8;
CREATE TABLE NguoiDung_HoaDon748 (ID int(10) NOT NULL AUTO_INCREMENT, vaiTro varchar(255) NOT NULL, HoaDon748ID int(10) NOT NULL, NguoiDung748ID int(10) NOT NULL, PRIMARY KEY (ID)) ENGINE=InnoDB CHARACTER SET UTF8;


ALTER TABLE Ghe748 ADD CONSTRAINT FKGhe748457628 FOREIGN KEY (phongChieu748ID) REFERENCES PhongChieu748 (ID);
ALTER TABLE SuatChieu748 ADD CONSTRAINT FKSuatChieu7676771 FOREIGN KEY (phongChieu748ID) REFERENCES PhongChieu748 (ID);
ALTER TABLE SuatChieu748 ADD CONSTRAINT FKSuatChieu7704351 FOREIGN KEY (Phim748ID) REFERENCES Phim748 (ID);
ALTER TABLE Ve748 ADD CONSTRAINT FKVe748173868 FOREIGN KEY (Ghe748ID) REFERENCES Ghe748 (ID);
ALTER TABLE Ve748 ADD CONSTRAINT FKVe748409063 FOREIGN KEY (HoaDon748ID) REFERENCES HoaDon748 (ID);
ALTER TABLE Ve748 ADD CONSTRAINT FKVe748625268 FOREIGN KEY (SuatChieu748ID) REFERENCES SuatChieu748 (ID);
ALTER TABLE NguoiDung_HoaDon748 ADD CONSTRAINT FKNguoiDung_708987 FOREIGN KEY (NguoiDung748ID) REFERENCES NguoiDung748 (ID);
ALTER TABLE NguoiDung_HoaDon748 ADD CONSTRAINT FKNguoiDung_506507 FOREIGN KEY (HoaDon748ID) REFERENCES HoaDon748 (ID);


-- Insert data into Phim748
INSERT INTO Phim748 (tenPhim, theLoai, thoiLuong, moTa) VALUES 
('Bố Già', 'Hài hước', 120, 'Bộ phim xoay quanh gia đình ông Ba Sang và những câu chuyện thường nhật.'),
('Mắt Biếc', 'Lãng mạn', 130, 'Câu chuyện tình cảm giữa Ngạn và Hà Lan.'),
('Hai Phượng', 'Hành động', 100, 'Cuộc hành trình giải cứu con gái của Hai Phượng.'),
('Tháng Năm Rực Rỡ', 'Tâm lý', 118, 'Hành trình tìm lại quá khứ và bạn bè cũ của một nhóm bạn.'),
('Em Chưa 18', 'Hài hước, Lãng mạn', 95, 'Câu chuyện tình cảm của một cô gái chưa 18 tuổi.');

-- Insert data into PhongChieu748
INSERT INTO PhongChieu748 (soGhe) VALUES 
(50),
(100),
(75),
(120),
(150);

-- Insert data into SuatChieu748
INSERT INTO SuatChieu748 (gioChieu, ngayChieu, ghiChu, phongChieu748ID, Phim748ID) VALUES 
('18:30', '2024-11-01', 'Suất tối', 1, 1),
('20:00', '2024-11-01', 'Suất tối', 2, 2),
('14:00', '2024-11-02', 'Suất chiều', 3, 3),
('10:00', '2024-11-02', 'Suất sáng', 4, 4),
('17:00', '2024-11-03', 'Suất tối', 5, 5);

-- Insert data into Ghe748
INSERT INTO Ghe748 (loaiGhe, conTrong, phongChieu748ID) VALUES 
('Thường', 1, 1),
('VIP', 1, 1),
('Thường', 1, 2),
('VIP', 1, 2),
('Thường', 1, 3),
('VIP', 0, 3),
('Thường', 1, 4),
('VIP', 1, 4),
('Thường', 1, 5),
('VIP', 0, 5);

-- Insert data into Ve748
INSERT INTO Ve748 (theLoai, giaVe, Ghe748ID, HoaDon748ID, SuatChieu748ID) VALUES 
('Thường', 50000, 1, 1, 1),
('VIP', 80000, 2, 1, 1),
('Thường', 50000, 3, 2, 2),
('VIP', 80000, 4, 2, 2),
('Thường', 50000, 5, 3, 3),
('VIP', 80000, 6, 3, 3),
('Thường', 50000, 7, 4, 4),
('VIP', 80000, 8, 4, 4),
('Thường', 50000, 9, 5, 5),
('VIP', 80000, 10, 5, 5);

-- Insert data into HoaDon748
INSERT INTO HoaDon748 (ngay, tongSoVe, tongTien, loaiHoaDon) VALUES 
('2024-11-01', 2, 130000, 'off'),
('2024-11-01', 2, 130000, 'onl'),
('2024-11-02', 2, 130000, 'off'),
('2024-11-02', 2, 130000, 'off'),
('2024-11-03', 2, 130000, 'off');

-- Insert data into NguoiDung748
INSERT INTO NguoiDung748 (taiKhoan, matKhau, hoVaTen, loaiNguoiDung, diem) VALUES 
('nguyenvana', 'matkhau1', 'Nguyễn Văn A', 'Khách hàng', 100),
('tranthib', 'matkhau2', 'Trần Thị B', 'Khách hàng', 200),
('lethic', 'matkhau3', 'Lê Thị C', 'Khách hàng', 150),
('phamvand', 'matkhau4', 'Phạm Văn D', 'Nhân viên', 0),
('nguyenthie', 'matkhau5', 'Nguyễn Thị E', 'Quản lý', 0);

-- Insert data into NguoiDung_HoaDon748
INSERT INTO NguoiDung_HoaDon748 (vaiTro, HoaDon748ID, NguoiDung748ID) VALUES 
('KH', 1, 1),
('KH', 2, 2),
('KH', 3, 3),
('NV', 4, 4),
('NV', 5, 5);
