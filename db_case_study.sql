-- Create the database
CREATE DATABASE IF NOT EXISTS `case_study`;

-- Use the newly created database
USE `case_study`;

---

## Bảng Người dùng và Chức vụ

-- Bảng chuc_vu
CREATE TABLE `chuc_vu` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `ten_chuc_vu` VARCHAR(50),
    PRIMARY KEY (`id`)
);

-- Bảng nguoi_dung (đã sửa)
CREATE TABLE `nguoi_dung` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `ten_nguoi_dung` VARCHAR(255),
    `sdt` VARCHAR(15) NOT NULL UNIQUE,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `dia_chi` VARCHAR(255) NOT NULL, -- Cột này đã được đặt là NOT NULL
    `mat_khau` VARCHAR(255) NOT NULL,
    `id_chuc_vu` INT,
    PRIMARY KEY (`id`),
    CONSTRAINT `chk_password_length` CHECK (CHAR_LENGTH(`mat_khau`) = 6),
    FOREIGN KEY (`id_chuc_vu`) REFERENCES `chuc_vu`(`id`)
);

-- Bảng hang
CREATE TABLE `hang` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `ten_hang` VARCHAR(255),
    PRIMARY KEY (`id`)
);

-- Bảng san_pham
CREATE TABLE `san_pham` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `ten_sp` VARCHAR(255),
    PRIMARY KEY (`id`)
);

-- Bảng dung_luong
CREATE TABLE `dung_luong` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `ten_dung_luong` VARCHAR(50),
    PRIMARY KEY (`id`)
);

-- Bảng mau_sac
CREATE TABLE `mau_sac` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `ten_mau_sac` VARCHAR(50),
    PRIMARY KEY (`id`)
);

-- Bảng san_pham_chi_tiet
CREATE TABLE `san_pham_chi_tiet` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `id_hang` INT,
    `id_san_pham` INT,
    `id_dung_luong` INT,
    `id_mau` INT,
    `mo_ta` TEXT,
    `gia` DECIMAL(10, 2),
    `so_luong` INT,
    `trang_thai` INT,
    `anh` VARCHAR(255),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`id_hang`) REFERENCES `hang`(`id`),
    FOREIGN KEY (`id_san_pham`) REFERENCES `san_pham`(`id`),
    FOREIGN KEY (`id_dung_luong`) REFERENCES `dung_luong`(`id`),
    FOREIGN KEY (`id_mau`) REFERENCES `mau_sac`(`id`)
);

-- Bảng hoa_don
CREATE TABLE `hoa_don` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `id_nguoi_dung` INT,
    `ma_hoa_don` VARCHAR(255),
    `ngay_tao` DATETIME,
    `ngay_thanh_toan` DATETIME,
    `trang_thai` INT,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dung`(`id`)
);

-- Bảng hoa_don_chi_tiet
CREATE TABLE `hoa_don_chi_tiet` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `id_san_pham_chi_tiet` INT,
    `id_hoa_don` INT,
    `gia` DECIMAL(10, 2),
    `so_luong` INT,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`id_san_pham_chi_tiet`) REFERENCES `san_pham_chi_tiet`(`id`),
    FOREIGN KEY (`id_hoa_don`) REFERENCES `hoa_don`(`id`)
);

-- Dữ liệu cho bảng `chuc_vu`
INSERT INTO `chuc_vu` (`ten_chuc_vu`) VALUES
('Admin'),
('Nhân viên'),
('Khách hàng');

-- Dữ liệu cho bảng `hang` (hãng sản xuất)
INSERT INTO `hang` (`ten_hang`) VALUES
('Apple'),
('Samsung'),
('Xiaomi'),
('Oppo');

-- Dữ liệu cho bảng `san_pham` (dòng sản phẩm)
INSERT INTO `san_pham` (`ten_sp`) VALUES
('iPhone'),
('Galaxy S'),
('Redmi Note'),
('Watch Series'),
('AirPods');

-- Dữ liệu cho bảng `dung_luong`
INSERT INTO `dung_luong` (`ten_dung_luong`) VALUES
('64GB'),
('128GB'),
('256GB'),
('Không có');

-- Dữ liệu cho bảng `mau_sac`
INSERT INTO `mau_sac` (`ten_mau_sac`) VALUES
('Đen'),
('Trắng'),
('Vàng'),
('Xanh dương'),
('Hồng');

-- Dữ liệu cho bảng `nguoi_dung`
INSERT INTO `nguoi_dung` (`ten_nguoi_dung`, `sdt`, `email`, `dia_chi`, `mat_khau`, `id_chuc_vu`) VALUES
('Nguyễn Văn A', '0912345678', 'vana@example.com', '123 Đường ABC, Hà Nội', '123456', 1),
('Trần Thị B', '0987654321', 'thib@example.com', '456 Đường XYZ, Đà Nẵng', '654321', 2),
('Lê Văn C', '0901112233', 'vanc@example.com', '789 Đường DEF, TP.HCM', 'abcdef', 3);

-- Dữ liệu cho bảng `san_pham_chi_tiet` (biến thể sản phẩm)
INSERT INTO `san_pham_chi_tiet` (`id_hang`, `id_san_pham`, `id_dung_luong`, `id_mau`, `mo_ta`, `gia`, `so_luong`, `trang_thai`, `anh`) VALUES
(1, 1, 2, 1, 'iPhone 15 Pro Max 128GB màu đen', 28000000.00, 50, 1, 'img/iphone15promax_den.jpg'),
(1, 1, 3, 4, 'iPhone 15 Pro Max 256GB màu xanh', 30000000.00, 30, 1, 'img/iphone15promax_xanh.jpg'),
(2, 2, 2, 2, 'Samsung Galaxy S23 Ultra 128GB màu trắng', 25000000.00, 45, 1, 'img/s23ultra_trang.jpg'),
(3, 3, 1, 1, 'Xiaomi Redmi Note 12 Pro 64GB màu đen', 6500000.00, 100, 1, 'img/redminote12pro_den.jpg'),
(1, 5, 4, 2, 'AirPods Pro 2 màu trắng', 5500000.00, 75, 1, 'img/airpodspro2_trang.jpg');

-- Dữ liệu cho bảng `hoa_don`
INSERT INTO `hoa_don` (`id_nguoi_dung`, `ma_hoa_don`, `ngay_tao`, `ngay_thanh_toan`, `trang_thai`) VALUES
(3, 'HD001', '2025-09-01 10:00:00', '2025-09-01 10:05:00', 1),
(3, 'HD002', '2025-09-02 15:30:00', NULL, 0);

-- Dữ liệu cho bảng `hoa_don_chi_tiet`
-- Hóa đơn 1 (HD001): mua iPhone 15 Pro Max và AirPods
INSERT INTO `hoa_don_chi_tiet` (`id_san_pham_chi_tiet`, `id_hoa_don`, `gia`, `so_luong`) VALUES
(1, 1, 28000000.00, 1),
(5, 1, 5500000.00, 2);

-- Hóa đơn 2 (HD002): mua Samsung S23 Ultra
INSERT INTO `hoa_don_chi_tiet` (`id_san_pham_chi_tiet`, `id_hoa_don`, `gia`, `so_luong`) VALUES
(3, 2, 25000000.00, 1);