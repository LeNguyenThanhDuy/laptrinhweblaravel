CREATE DATABASE BKE_System;
GO

USE BKE_System;
GO


-- Tạo bảng users
CREATE TABLE users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    user_name NVARCHAR(255) NOT NULL,
    user_email VARCHAR(55) NOT NULL UNIQUE,
    user_pass VARCHAR(255) NOT NULL,
    updated_at DATETIME DEFAULT GETDATE(),
    created_at DATETIME DEFAULT GETDATE()
);

-- Tạo bảng products
CREATE TABLE products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_name NVARCHAR(255) NOT NULL,
    product_price FLOAT NOT NULL,
    product_description NVARCHAR(MAX) NOT NULL,
    updated_at DATETIME DEFAULT GETDATE(),
    created_at DATETIME DEFAULT GETDATE()
);

-- Tạo bảng orders
CREATE TABLE orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    updated_at DATETIME DEFAULT GETDATE(),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Tạo bảng order_details
CREATE TABLE order_details (
    order_detail_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    updated_at DATETIME DEFAULT GETDATE(),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

-- Thêm dữ liệu vào bảng users 
INSERT INTO users (user_name, user_email, user_pass)
VALUES 
('minhnguyen', 'minhnguyen@example.com', 'password123'),
('maianh', 'maianh@example.com', 'password123'),
('manhtruong', 'manhtruong@example.com', 'password123'),
('myduyen', 'myduyen@example.com', 'password123'),
('maiquynh', 'maiquynh@example.com', 'password123'),
('nguyenvanb', 'nguyenvanb@example.com', 'password123'),
('tranthanh', 'tranthanh@example.com', 'password123'),
('phamquoc', 'phamquoc@example.com', 'password123'),
('lehoang', 'lehoang@example.com', 'password123'),
('doanthu', 'doanthu@example.com', 'password123'),
('buihien', 'buihien@example.com', 'password123'),
('hoangmai', 'hoangmai@example.com', 'password123'),
('trinhngoc', 'trinhngoc@example.com', 'password123'),
('dangky', 'dangky@example.com', 'password123'),
('lyhong', 'lyhong@example.com', 'password123'),
('marianguyen', 'marianguyen@gmail.com', 'password123'),
('minhphuong', 'minhphuong@gmail.com', 'password123'),
('maian', 'maian@gmail.com', 'password123'),
('manhcuong', 'manhcuong@gmail.com', 'password123'),
('myhanh', 'myhanh@gmail.com', 'password123'),
('tuananh', 'tuananh@gmail.com', 'password123'),
('hoangson', 'hoangson@gmail.com', 'password123'),
('quanghuy', 'quanghuy@gmail.com', 'password123'),
('trankhang', 'trankhang@gmail.com', 'password123'),
('bachtuyet', 'bachtuyet@gmail.com', 'password123');

-- Thêm dữ liệu vào bảng products
INSERT INTO products (product_name, product_price, product_description) VALUES 
(N'Laptop Dell XPS 15', 1500, N'Laptop Dell XPS 15 inch, CPU Core i7, RAM 16GB'),
(N'Điện thoại iPhone 14 Pro Max', 1200, N'iPhone 14 Pro Max 256GB, màu vàng gold'),
(N'Máy tính bảng Samsung Galaxy Tab S8', 800, N'Samsung Galaxy Tab S8 màn hình 11 inch'),
(N'Tivi Sony Bravia 55 inch', 1000, N'Tivi Sony Bravia 4K, tích hợp Android TV'),
(N'Loa JBL Charge 5', 300, N'Loa bluetooth JBL Charge 5, chống nước IP67'),
(N'Tai nghe AirPods Pro 2', 200, N'Tai nghe không dây AirPods Pro 2 chống ồn'),
(N'Bàn phím cơ Razer BlackWidow', 100, N'Bàn phím cơ Razer BlackWidow V3 RGB'),
(N'Chuột gaming Logitech G502', 50, N'Chuột gaming Logitech G502 HERO 25K DPI'),
(N'Ổ cứng SSD Samsung 1TB', 150, N'SSD Samsung 1TB NVMe tốc độ cao'),
(N'Camera an ninh Xiaomi Mi Home', 400, N'Camera giám sát Xiaomi Mi Home Full HD');

-- Thêm dữ liệu vào bảng orders
INSERT INTO orders (user_id) VALUES 
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10),
(11), (12), (13), (14), (15), (16), (17), (18), (19), (20),
(21), (22), (23), (24), (25);
INSERT INTO orders (user_id) VALUES
-- Một số user chỉ có 1 đơn
(1), (2), (3), (4), (5),

-- Một số user có 2 đơn
(6), (6),
(7), (7),
(8), (8),

-- Một số user có 3 đơn
(9), (9), (9),
(10), (10), (10),

-- Một số user có 4 đơn
(11), (11), (11), (11),

-- Một số user có 5 đơn
(12), (12), (12), (12), (12);

-- Thêm dữ liệu vào bảng order_details
INSERT INTO order_details (order_id, product_id) VALUES 
(1, 1), (1, 2), 
(2, 3), (2, 4), 
(3, 5), (3, 6), 
(4, 7), (4, 8), 
(5, 9), (5, 10),
(6, 1), (6, 3),
(7, 5), (7, 7),
(8, 9), (8, 2),
(9, 4), (9, 6),
(10, 8), (10, 10),
(11, 1), (11, 3),
(12, 2), (12, 5),
(13, 4), (13, 7),
(14, 1), (14, 8),
(15, 3), (15, 9),
(16, 2), (16, 6),
(17, 5), (17, 10),
(18, 7), (18, 1),
(19, 8), (19, 4),
(20, 9), (20, 2),
(21, 10), (21, 6),
(22, 1), (22, 3),
(23, 4), (23, 7),
(24, 5), (24, 8),
(25, 6), (25, 10);
INSERT INTO order_details (order_id, product_id) VALUES
-- Đơn hàng có 1 sản phẩm
(1, 2), 
(2, 3), 
(3, 6), 

-- Đơn hàng có 2 sản phẩm
(4, 7), (4, 8),
(5, 9), (5, 10),

-- Đơn hàng có 3 sản phẩm
(6, 1), (6, 3), (6, 5),
(7, 4), (7, 6), (7, 9),

-- Đơn hàng có 4 sản phẩm
(8, 2), (8, 5), (8, 7), (8, 10),
(9, 1), (9, 4), (9, 6), (9, 8),

-- Đơn hàng có 5 sản phẩm
(10, 3), (10, 5), (10, 6), (10, 8), (10, 9);

select * from users
select * from products
select * from orders
select * from order_details
DELETE FROM order_details;
ALTER TABLE users ALTER COLUMN user_name NVARCHAR(255) COLLATE Vietnamese_CI_AS;