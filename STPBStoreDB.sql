CREATE DATABASE STPBStoreDB
--COLLATE Thai_CI_AS

USE STPBStoreDB

CREATE TABLE Customer
(
    CustomerID VARCHAR(5) NOT NULL PRIMARY KEY,
    CustomerName VARCHAR(50) NOT NULL,
    CustomerLastname VARCHAR(50) NOT NULL,
    Gender VARCHAR(5) NULL,
    Telephone INT NULL,
    AddressProvince VARCHAR(200) NULL 
)

CREATE TABLE Employee
(
    EmpID VARCHAR(5) NOT NULL PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    EmpLastname VARCHAR(50) NOT NULL,
    Gender VARCHAR(5) NULL,
    Telephone INT NULL,
    AddressProvince VARCHAR(200) NULL
)

CREATE TABLE ProductType
(
    ProductTypeID VARCHAR(5) NOT NULL PRIMARY KEY,
    ProductTypeName VARCHAR(50) NOT NULL,
    ProductTypeDetail VARCHAR(200) NULL
)

CREATE TABLE Product
(
    ProductID INT NOT NULL PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    Price INT NOT NULL,
    Qty INT NULL,
    ProductTypeID VARCHAR(5) FOREIGN KEY REFERENCES ProductType(ProductTypeID)
)


CREATE TABLE OrderProduct
(
    OrderID VARCHAR(5) NOT NULL PRIMARY KEY,
    OrderDate DATE NOT NULL,
    CustomerID VARCHAR(5) FOREIGN KEY REFERENCES Customer(CustomerID),
    EmpID VARCHAR(5) FOREIGN KEY REFERENCES Employee(EmpID)
)

CREATE TABLE OrderDetail
(
    OrderDetailID INT identity(100,1) not null PRIMARY KEY,
    ProductID  INT NOT NULL FOREIGN KEY REFERENCES Product(ProductID),
    Qty INT NOT NULL,
    OrderID VARCHAR(5) FOREIGN KEY REFERENCES OrderProduct(OrderId)
)

INSERT INTO Customer
VALUES
('C0001','สมปอง','คนดี','ชาย',0845563456,'เชียงใหม่'),
('C0002','สมศรี','คนดี','หญิง',0833363456,'กรุงเทพ'),
('C0003','สมชาย','ดีเลิศ','ชาย',080903456,'กรุงเทพ'),
('C0004','สมหญิง','ดีทรัพย์','หญิง',085403456,'ภูเก็ต'),
('C0005','สมรัก','จิตมั่น','ชาย',085403456,'ขอนแก่น');

INSERT INTO Employee
VALUES
('E0001','คำหล้า','ศรีสุข','หญิง',088863456,'เชียงใหม่'),
('E0002','คำสิงห์','ทวีกุล','ชาย',083883456,'กรุงเทพ'),
('E0003','วรรรณดี','ดีแสน','หญิง',080903456,'กรุงเทพ'),
('E0004','ยิ่งยศ','ทรัพย์เลิศ','ชาย',085403488,'ภูเก็ต'),
('E0005','กรกวิน','ศรีไพศาล','ชาย',085403886,'ขอนแก่น');


INSERT INTO Product
VALUES
(23456,'โค้ก',10,500,'T0002'),
(38654,'เลย์',20,300,'T0003'),
(48665,'ซันซิล',39,100,'T0004'),
(23455,'สไปซ์',10,200,'T0002'),
(25677,'แฟนต้า',10,100,'T0002'),
(15677,'เสื้อยืด',200,50,'T0001'),
(15673,'กระโปรง',150,20,'T0001'),
(55673,'ครีมกันแดด',300,50,'T0005'),
(55333,'รองพื้น',350,20,'T0005'),
(37733,'ปาปิก้า',20,100,'T0003'),
(35993,'ลูกอม',10,70,'T0003');


INSERT INTO ProductType
VALUES
('T0001','เครื่องแต่งกาย',Null),
('T0002','น้ำดื่ม',Null),
('T0003','ขนม',Null),
('T0004','ของใช้',Null),
('T0005','เครื่องสำอาง',Null);


INSERT INTO OrderProduct
VALUES
('OP001','2024/3/1','C0002','E0001'),
('OP002','2024/3/2','C0001','E0004'),
('OP003','2024/3/3','C0004','E0001'),
('OP004','2024/3/4','C0003','E0003'),
('OP005','2024/3/5','C0003','E0003');

INSERT INTO OrderDetail
VALUES
(37733,2,'OP004'),
(55673,1,'OP004'),
(25677,1,'OP004'),
(38654,1,'OP004'),
(15673,1,'OP004'),
(48665,2,'OP002'),
(15677,1,'OP002');
