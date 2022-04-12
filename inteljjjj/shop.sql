-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 12, 2022 lúc 03:19 PM
-- Phiên bản máy phục vụ: 10.4.20-MariaDB
-- Phiên bản PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblcategory`
--

CREATE TABLE `tblcategory` (
  `categoryID` int(11) NOT NULL,
  `categoryName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tblcategory`
--

INSERT INTO `tblcategory` (`categoryID`, `categoryName`) VALUES
(1, 'Món Nướng'),
(2, 'Món Luộc'),
(3, 'Món Chay'),
(4, 'Đồ Uống'),
(5, 'Rau');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblorderdetail`
--

CREATE TABLE `tblorderdetail` (
  `detailID` int(11) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `productID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tblorderdetail`
--

INSERT INTO `tblorderdetail` (`detailID`, `price`, `quantity`, `orderID`, `productID`) VALUES
(2, 1000, 1, 7, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblorders`
--

CREATE TABLE `tblorders` (
  `orderID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `orderDate` varchar(200) NOT NULL,
  `total` float NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tblorders`
--

INSERT INTO `tblorders` (`orderID`, `userID`, `orderDate`, `total`, `status`) VALUES
(7, 2, '0', 1000, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblproduct`
--

CREATE TABLE `tblproduct` (
  `productID` int(11) NOT NULL,
  `productName` varchar(200) NOT NULL,
  `image` varchar(500) NOT NULL,
  `price` float NOT NULL,
  `Description` varchar(500) NOT NULL,
  `quantity` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `importDate` varchar(500) NOT NULL,
  `usingDate` varchar(500) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tblproduct`
--

INSERT INTO `tblproduct` (`productID`, `productName`, `image`, `price`, `Description`, `quantity`, `categoryID`, `importDate`, `usingDate`, `status`) VALUES
(1, 'Rau', 'https://anhdep123.com/wp-content/uploads/2020/11/hinh-anh-mot-so-loai-rau.png', 1000, '', 98, 1, '2022-04-07', '10', 1),
(2, 'Rau', 'https://anhdep123.com/wp-content/uploads/2020/11/hinh-anh-mot-so-loai-rau.png', 10, 'ok', 2, 1, '2022-04-12', '10', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblrole`
--

CREATE TABLE `tblrole` (
  `roleID` int(11) NOT NULL,
  `roleName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblusers`
--

CREATE TABLE `tblusers` (
  `userID` int(11) NOT NULL,
  `fullName` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `roleID` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `birthday` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tblusers`
--

INSERT INTO `tblusers` (`userID`, `fullName`, `password`, `roleID`, `address`, `birthday`, `phone`, `mail`, `status`) VALUES
(1, 'admin', '1', 1, 'address', 'dob', '1234567891', 'admin@admin.com', 1),
(2, 'krishna', '1', 2, 'Ha noi', '2022-04-08', '0392221200', 'Lonhvo@gmail.com', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`categoryID`);

--
-- Chỉ mục cho bảng `tblorderdetail`
--
ALTER TABLE `tblorderdetail`
  ADD PRIMARY KEY (`detailID`);

--
-- Chỉ mục cho bảng `tblorders`
--
ALTER TABLE `tblorders`
  ADD PRIMARY KEY (`orderID`);

--
-- Chỉ mục cho bảng `tblproduct`
--
ALTER TABLE `tblproduct`
  ADD PRIMARY KEY (`productID`);

--
-- Chỉ mục cho bảng `tblrole`
--
ALTER TABLE `tblrole`
  ADD PRIMARY KEY (`roleID`);

--
-- Chỉ mục cho bảng `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tblorderdetail`
--
ALTER TABLE `tblorderdetail`
  MODIFY `detailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tblorders`
--
ALTER TABLE `tblorders`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `tblproduct`
--
ALTER TABLE `tblproduct`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tblrole`
--
ALTER TABLE `tblrole`
  MODIFY `roleID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
