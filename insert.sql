-- Thêm dữ liệu mẫu cho bảng Categories
INSERT INTO Categories (Categorie_Name, Description) VALUES 
(N'Thiết bị gia dụng', N'Sản phẩm điện tử gia dụng như tivi, tủ lạnh, máy giặt, điều hòa, bếp ga, quạt điện, bàn là, bếp từ, nồi cơm điện, máy xay sinh tố'),
(N'Thiết bị di động', N'Sản phẩm điện tử di động như điện thoại, máy tính bảng, laptop, máy ảnh, loa, tai nghe, chuột máy tính, bàn phím, màn hình máy tính'),
(N'Thiết bị văn phòng', N'Sản phẩm điện tử văn phòng như máy in, máy chiếu, ổ cứng di động, USB, thẻ nhớ, pin sạc dự phòng, đồng hồ thông minh, camera an ninh, bộ phát wifi, router, bộ lưu điện'),
(N'Thiết bị giải trí', N'Sản phẩm điện tử giải trí như máy chơi game, đầu phát DVD/Blu-ray, TV thông minh, thiết bị ghi hình, thiết bị kết nối không dây'),
(N'Thiết bị công nghiệp', N'Sản phẩm điện tử công nghiệp như máy in 3D, máy in laser, máy in phun, máy in kim, máy in nhiệt, máy in đa chức năng, máy in màu, máy in đen trắng, máy in khổ lớn, máy in khổ nhỏ, máy in công nghiệp, máy in văn phòng, máy in gia đình');

-- Supplier
INSERT INTO Supplier (Supplier_name, Address, Phone) VALUES 
(N'Công ty A', N'Hà Nội', '0123456789'),
(N'Công ty B', N'Hồ Chí Minh', '0987654321'),
(N'Công ty C', N'Đà Nẵng', '0912345678'),
(N'Công ty D', N'Hải Phòng', '0908765432'),
(N'Công ty E', N'Cần Thơ', '0934567890'),
(N'Công ty F', N'Bình Dương', '0923456789'),
(N'Công ty G', N'Đồng Nai', '0919876543'),
(N'Công ty H', N'Quảng Ninh', '0901234567'),
(N'Công ty I', N'Bắc Ninh', '0981234567'),
(N'Công ty J', N'Vĩnh Phúc', '0971234567'),
(N'Công ty K', N'Bắc Giang', '0961234567'),
(N'Công ty L', N'Nam Định', '0951234567'),
(N'Công ty M', N'Thái Nguyên', '0941234567'),
(N'Công ty N', N'Phú Thọ', '0931234567'),
(N'Công ty O', N'Nghệ An', '0921234567'),
(N'Công ty P', N'Hà Tĩnh', '0911234567'),
(N'Công ty Q', N'Quảng Bình', '0902234567'),
(N'Công ty R', N'Quảng Trị', '0903234567'),
(N'Công ty S', N'Thừa Thiên Huế', '0904234567'),
(N'Công ty T', N'Bình Thuận', '0905234567');

-- Customer
INSERT INTO Customer (Customer_name, Address, Phone) VALUES 
(N'Nguyễn Văn A', N'Hà Nội', '0123456789'),
(N'Trần Thị B', N'Hồ Chí Minh', '0987654321'),
(N'Lê Văn C', N'Đà Nẵng', '0912345678'),
(N'Phạm Thị D', N'Hải Phòng', '0908765432'),
(N'Hoàng Văn E', N'Cần Thơ', '0934567890'),
(N'Vũ Thị F', N'Bình Dương', '0923456789'),
(N'Ngô Văn G', N'Đồng Nai', '0919876543'),
(N'Đỗ Thị H', N'Quảng Ninh', '0901234567'),
(N'Bùi Văn I', N'Bắc Ninh', '0981234567'),
(N'Phan Thị J', N'Vĩnh Phúc', '0971234567'),
(N'Đinh Văn K', N'Bắc Giang', '0961234567'),
(N'Nguyễn Thị L', N'Nam Định', '0951234567'),
(N'Trần Văn M', N'Thái Nguyên', '0941234567'),
(N'Lê Thị N', N'Phú Thọ', '0931234567'),
(N'Phạm Văn O', N'Nghệ An', '0921234567'),
(N'Hoàng Thị P', N'Hà Tĩnh', '0911234567'),
(N'Vũ Văn Q', N'Quảng Bình', '0902234567'),
(N'Ngô Thị R', N'Quảng Trị', '0903234567'),
(N'Đỗ Văn S', N'Thừa Thiên Huế', '0904234567'),
(N'Bùi Thị T', N'Bình Thuận', '0905234567');


-- Thêm dữ liệu mẫu cho bảng Product
INSERT INTO Product (Product_Name, Unit, Quantity, Price_Import, Price_Export, Origin, Categorie_id) VALUES 
(N'Tivi Samsung', N'Chiếc', 100, 5000000, 7000000, N'Hàn Quốc', 1),
(N'Tủ lạnh LG', N'Chiếc', 50, 10000000, 12000000, N'Hàn Quốc', 1),
(N'Máy giặt Electrolux', N'Chiếc', 30, 8000000, 10000000, N'Thụy Điển', 1),
(N'Điều hòa Daikin', N'Chiếc', 20, 7000000, 9000000, N'Nhật Bản', 1),
(N'Bếp ga Rinnai', N'Chiếc', 40, 2000000, 3000000, N'Nhật Bản', 1),
(N'Quạt điện Panasonic', N'Chiếc', 200, 500000, 700000, N'Nhật Bản', 1),
(N'Bàn là Philips', N'Chiếc', 150, 300000, 500000, N'Hà Lan', 1),
(N'Bếp từ Sunhouse', N'Chiếc', 60, 1500000, 2000000, N'Việt Nam', 1),
(N'Nồi cơm điện Sharp', N'Chiếc', 80, 1000000, 1500000, N'Nhật Bản', 1),
(N'Máy xay sinh tố Bluestone', N'Chiếc', 90, 800000, 1200000, N'Mỹ', 1),
(N'Điện thoại iPhone', N'Chiếc', 120, 7000000, 9000000, N'Mỹ', 2),
(N'Máy tính bảng iPad', N'Chiếc', 70, 10000000, 12000000, N'Mỹ', 2),
(N'Laptop Dell', N'Chiếc', 50, 15000000, 18000000, N'Mỹ', 2),
(N'Máy ảnh Canon', N'Chiếc', 40, 12000000, 15000000, N'Nhật Bản', 2),
(N'Loa JBL', N'Chiếc', 100, 2000000, 3000000, N'Mỹ', 2),
(N'Tai nghe Sony', N'Chiếc', 200, 500000, 700000, N'Nhật Bản', 2),
(N'Chuột máy tính Logitech', N'Chiếc', 150, 300000, 500000, N'Thụy Sĩ', 2),
(N'Bàn phím Razer', N'Chiếc', 100, 500000, 700000, N'Mỹ', 2),
(N'Màn hình máy tính Samsung', N'Chiếc', 60, 3000000, 4000000, N'Hàn Quốc', 2),
(N'Máy in HP', N'Chiếc', 30, 5000000, 7000000, N'Mỹ', 3),
(N'Máy chiếu Epson', N'Chiếc', 20, 10000000, 12000000, N'Nhật Bản', 3),
(N'Ổ cứng di động Seagate', N'Chiếc', 80, 2000000, 3000000, N'Mỹ', 3),
(N'USB Kingston', N'Chiếc', 200, 500000, 700000, N'Mỹ', 3),
(N'Thẻ nhớ SanDisk', N'Chiếc', 150, 300000, 500000, N'Mỹ', 3),
(N'Pin sạc dự phòng Anker', N'Chiếc', 100, 500000, 700000, N'Mỹ', 3),
(N'Đồng hồ thông minh Apple Watch', N'Chiếc', 70, 3000000, 4000000, N'Mỹ', 3),
(N'Camera an ninh Hikvision', N'Chiếc', 50, 5000000, 7000000, N'Trung Quốc', 3),
(N'Bộ phát wifi TP-Link', N'Chiếc', 60, 1000000, 1500000, N'Trung Quốc', 3),
(N'Router Asus', N'Chiếc', 40, 2000000, 3000000, N'Taiwan', 3),
(N'Bộ lưu điện APC', N'Chiếc', 30, 3000000, 4000000, N'Mỹ', 3),
(N'Máy chơi game PlayStation', N'Chiếc', 50, 10000000, 12000000, N'Nhật Bản', 4),
(N'Đầu phát Blu-ray Sony', N'Chiếc', 40, 5000000, 7000000, N'Nhật Bản', 4),
(N'TV thông minh LG', N'Chiếc', 30, 15000000, 18000000, N'Hàn Quốc', 4),
(N'Thiết bị ghi hình GoPro', N'Chiếc', 20, 8000000, 10000000, N'Mỹ', 4),
(N'Thiết bị kết nối không dây Netgear', N'Chiếc', 60, 2000000, 3000000, N'Mỹ', 4),
(N'Máy in 3D Creality', N'Chiếc', 20, 20000000, 25000000, N'Trung Quốc', 5),
(N'Máy in laser Brother', N'Chiếc', 30, 3000000, 4000000, N'Nhật Bản', 5),
(N'Máy in phun Canon', N'Chiếc', 40, 5000000, 7000000, N'Nhật Bản', 5),
(N'Máy in kim Epson', N'Chiếc', 50, 10000000, 12000000, N'Nhật Bản', 5),
(N'Máy in nhiệt Zebra', N'Chiếc', 60, 15000000, 18000000, N'Mỹ', 5),
(N'Máy in đa chức năng Ricoh', N'Chiếc', 70, 20000000, 25000000, N'Nhật Bản', 5),
(N'Máy in màu HP', N'Chiếc', 80, 3000000, 4000000, N'Mỹ', 5),
(N'Máy in đen trắng Xerox', N'Chiếc', 90, 5000000, 7000000, N'Mỹ', 5),
(N'Máy in khổ lớn Mimaki', N'Chiếc', 100, 10000000, 12000000, N'Nhật Bản', 5),
(N'Máy in khổ nhỏ Roland', N'Chiếc', 110, 15000000, 18000000, N'Nhật Bản', 5),
(N'Máy in công nghiệp Durst', N'Chiếc', 120, 20000000, 25000000, N'Đức', 5),
(N'Máy in văn phòng Kyocera', N'Chiếc', 130, 3000000, 4000000, N'Nhật Bản', 5),
(N'Máy in gia đình Brother', N'Chiếc', 140, 5000000, 7000000, N'Nhật Bản', 5);


-- Department
INSERT INTO Department (Dep_Name, Phone, Address, Manager_id) VALUES 
(N'Phòng 1', '0123456789', N'Tầng 1', NULL),
(N'Phòng 2', '0987654321', N'Tầng 2', NULL),
(N'Phòng 3', '0912345678', N'Tầng 3', NULL),
(N'Phòng 4', '0908765432', N'Tầng 4', NULL),
(N'Phòng 5', '0934567890', N'Tầng 5', NULL);

-- Employee
INSERT INTO Employee (Employee_name, Address, Gender, Position, Phone, Department_id) VALUES 
(N'Nguyễn Văn A', N'Hà Nội', 'M', N'Nhân viên', '0123456789', 1),
(N'Trần Thị B', N'Hồ Chí Minh', 'F', N'Nhân viên', '0987654321', 2),
(N'Lê Văn C', N'Đà Nẵng', 'M', N'Nhân viên', '0912345678', 3),
(N'Phạm Thị D', N'Hải Phòng', 'F', N'Nhân viên', '0908765432', 4),
(N'Hoàng Văn E', N'Cần Thơ', 'M', N'Nhân viên', '0934567890', 5),
(N'Vũ Thị F', N'Bình Dương', 'F', N'Nhân viên', '0923456789', 1),
(N'Ngô Văn G', N'Đồng Nai', 'M', N'Nhân viên', '0919876543', 2),
(N'Đỗ Thị H', N'Quảng Ninh', 'F', N'Nhân viên', '0901234567', 3),
(N'Bùi Văn I', N'Bắc Ninh', 'M', N'Nhân viên', '0981234567', 4),
(N'Phan Thị J', N'Vĩnh Phúc', 'F', N'Nhân viên', '0971234567', 5),
(N'Đinh Văn K', N'Bắc Giang', 'M', N'Nhân viên', '0961234567', 1),
(N'Nguyễn Thị L', N'Nam Định', 'F', N'Nhân viên', '0951234567', 2),
(N'Trần Văn M', N'Thái Nguyên', 'M', N'Nhân viên', '0941234567', 3),
(N'Lê Thị N', N'Phú Thọ', 'F', N'Nhân viên', '0931234567', 4),
(N'Phạm Văn O', N'Nghệ An', 'M', N'Nhân viên', '0921234567', 5),
(N'Hoàng Thị P', N'Hà Tĩnh', 'F', N'Nhân viên', '0911234567', 1),
(N'Vũ Văn Q', N'Quảng Bình', 'M', N'Nhân viên', '0902234567', 2),
(N'Ngô Thị R', N'Quảng Trị', 'F', N'Nhân viên', '0903234567', 3),
(N'Đỗ Văn S', N'Thừa Thiên Huế', 'M', N'Nhân viên', '0904234567', 4),
(N'Bùi Thị T', N'Bình Thuận', 'F', N'Nhân viên', '0905234567', 5);

-- Import_History
INSERT INTO Import_History (Date_import, Employee_id, Supplier_id) VALUES 
('2023-01-01', 1, 1),
('2023-02-01', 2, 2),
('2023-03-01', 3, 3),
('2023-04-01', 4, 4),
('2023-05-01', 5, 5),
('2023-06-01', 6, 6),
('2023-07-01', 7, 7),
('2023-08-01', 8, 8),
('2023-09-01', 9, 9),
('2023-10-01', 10, 10);

-- Export_History
INSERT INTO Export_History (Date_Export, Employee_id, Customer_id) VALUES 
('2023-01-15', 1, 1),
('2023-02-15', 2, 2),
('2023-03-15', 3, 3),
('2023-04-15', 4, 4),
('2023-05-15', 5, 5),
('2023-06-15', 6, 6),
('2023-07-15', 7, 7),
('2023-08-15', 8, 8),
('2023-09-15', 9, 9),
('2023-10-15', 10, 10);

-- Import_Detail
INSERT INTO Import_Detail (Price_Import, Quantity, Imp_id, Product_id) VALUES 
(5000000, 10, 1, 1),
(10000000, 5, 2, 2),
(8000000, 3, 3, 3),
(7000000, 2, 4, 4),
(2000000, 4, 5, 5),
(500000, 20, 6, 6),
(300000, 15, 7, 7),
(1500000, 6, 8, 8),
(1000000, 8, 9, 9),
(800000, 9, 10, 10),
(7000000, 12, 1, 11),
(10000000, 7, 2, 12),
(15000000, 5, 3, 13),
(12000000, 4, 4, 14),
(2000000, 10, 5, 15),
(500000, 20, 6, 16),
(300000, 15, 7, 17),
(500000, 10, 8, 18),
(3000000, 6, 9, 19),
(5000000, 3, 10, 20),
(10000000, 8, 1, 21),
(2000000, 20, 2, 22),
(500000, 15, 3, 23),
(300000, 10, 4, 24),
(1500000, 5, 5, 25);

-- Export_Detail
INSERT INTO Export_Detail (Price_Export, Quantity, Exp_id, Product_id) VALUES 
(7000000, 10, 1, 1),
(12000000, 5, 2, 2),
(10000000, 3, 3, 3),
(9000000, 2, 4, 4),
(3000000, 4, 5, 5),
(700000, 20, 6, 6),
(500000, 15, 7, 7),
(2000000, 6, 8, 8),
(1500000, 8, 9, 9),
(1200000, 9, 10, 10),
(9000000, 12, 1, 11),
(12000000, 7, 2, 12),
(18000000, 5, 3, 13),
(15000000, 4, 4, 14),
(3000000, 10, 5, 15),
(700000, 20, 6, 16),
(500000, 15, 7, 17),
(700000, 10, 8, 18),
(4000000, 6, 9, 19),
(7000000, 3, 10, 20),
(12000000, 8, 1, 21),
(3000000, 20, 2, 22),
(700000, 15, 3, 23),
(500000, 10, 4, 24),
(2000000, 5, 5, 25);

-- Cập nhật thông tin quản lý cho các phòng ban
UPDATE Department SET Manager_id = 1 WHERE Dep_Name = N'Phòng 1';
UPDATE Department SET Manager_id = 2 WHERE Dep_Name = N'Phòng 2';
UPDATE Department SET Manager_id = 3 WHERE Dep_Name = N'Phòng 3';
UPDATE Department SET Manager_id = 4 WHERE Dep_Name = N'Phòng 4';
UPDATE Department SET Manager_id = 5 WHERE Dep_Name = N'Phòng 5';
