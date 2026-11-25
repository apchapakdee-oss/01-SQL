--1 ให้หาข้อมูลลูกค้าเพศชายที่จังหวัดกรุงเทพและขอนแก่นและลูกค้าเพศหญิงทุกจังหวัดยกเว้นที่อยู่เชียงใหม่
SELECT * FROM Customer
WHERE Gender = 'ชาย' AND (AddressProvince = 'กรุงเทพ' OR AddressProvince = 'เชียงใหม่')

SELECT * FROM Customer
WHERE Gender = 'ชาย' AND AddressProvince IN ('กรุงเทพ','เชียงใหม่')

SELECT * FROM Customer
WHERE Gender = 'หญิง' AND not AddressProvince = 'เชียงใหม่'

--2 ให้หาผลรวมราคาสินค้าของแต่ละออเดอร์โดยใช้คำสั่ง Group by และ sum
SELECT od.OrderID,SUM(p.price * od.Qty) as SUMPrice FROM OrderDetail od  
LEFT JOIN Product p  
ON od.ProductID = p.ProductID
GROUP BY od.OrderID

--3 ให้หาข้อมูลใบสั่งซื้อที่มีการซื้อสินค้าประเภทเครื่องดื่ม และแสดงข้อมูล รหัสการสั่งซื้อ ชื่อสินค้า และชื่อประเภทสินค้า
SELECT od.OrderID,p.ProductName,pt.ProductTypeName FROM OrderDetail od  
LEFT JOIN Product p  
ON od.ProductID = p.ProductID
LEFT JOIN ProductType pt  
ON pt.ProductTypeID = p.ProductTypeID
WHERE pt.ProductTypeName = 'น้ำดื่ม'

--SELECT * FROM OrderProduct