--1 แสดงรหัส ชื่อ ราคา ของสินค้าที่มีราคามากกว่า 500-1000 บาท
select ProductID,ProductName,Price FROM Product
WHERE price > 500 and price <= 1000

--2 แสดงใบสั่งซื้อสินค้า ชื่อลูกค้า ชื่อพนักงาน ที่เพิ่มข้อมูลเข้าระบบล่าสุด 3ข้อมูล
select top 3 o.OrderID,c.CustomerName,e.EmpName,o.OrderDate FROM OrderProduct o  
LEFT JOIN Customer c  
ON o.CustomerID = c.CustomerID
LEFT JOIN Employee e  
ON o.EmpID = e.EmpID
ORDER BY o.OrderDate DESC

--3 แสดงชื่อพนักงานเพศชายทั้งหมด
SELECT * FROM Employee
WHERE Gender = 'ชาย'

--4 ต้องการทราบว่า ราคาสินค้าสูงสุด-ต่ำสุดและราคารวมของสินค้าทั้งหมด
--SELECT * FROM Product
--ORDER BY Price DESC
SELECT MIN(Price) as min,MAX(price) as max,SUM(price) as sum FROM Product

--5 แสดงชื่อสินค้าทุกชิ้นที่อยู่ในประเภทเครื่องสำอาง
SELECT p.ProductID,p.ProductName,t.ProductTypeName FROM Product p  
LEFT JOIN ProductType t  
ON p.ProductTypeID = t.ProductTypeID
WHERE t.ProductTypeName = 'เครื่องสำอาง'

--6 แสดงชื่อลูกค้าที่ซื้อสินค้าจำนวนมากที่สุดมา 10ลำดับเรียงจากมาก-น้อย
--SELECT * FROM OrderDetail
SELECT c.CustomerName,op.OrderID,SUM(Qty) FROM OrderDetail od  
INNER JOIN OrderProduct op  
ON od.OrderID = op.OrderID
INNER JOIN Customer c  
ON op.CustomerID = c.CustomerID
GROUP BY c.CustomerName,op.OrderID
ORDER BY SUM(Qty) DESC

--7 ลบสินคค้าที่หมดสต๊อค
/*INSERT into Product
VALUES
('12345','เค้ก',30,3,'T0003')
SELECT * FROM Employee*/
DELETE Product WHERE Qty = 0

--8 แก้ไขราคาสินค้าตามเงื่อนไขที่จำนวนสินค้าน้อยกว่า 5ชิ้น โดยให้เพิ่มราคาขึ้นอีก 3บาททุกรายการ
UPDATE Product
SET Price = price+3
WHERE Qty < 5

--9 เพิ่มคอลัมน์เงินเดือนของพนักงานชาย ที่มีเงินเดือนมากกว่า 12000 บาทขึ้นไป
ALTER TABLE Employee ADD Salary INT NULL --เพิ่ม column
UPDATE Employee SET Salary = 12000 WHERE Gender = 'ชาย' -- แก้ไขข้อมูล