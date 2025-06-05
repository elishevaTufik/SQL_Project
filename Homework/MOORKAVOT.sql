--שאילתות מורכבות
--1
SELECT City
FROM Employee_tbl
EXCEPT
SELECT CustCity
FROM Customer_tbl

--2
SELECT City
FROM Employee_tbl
INTERSECT
SELECT CustCity
FROM Customer_tbl

--3
SELECT City
FROM Employee_tbl
UNION
SELECT CustCity
FROM Customer_tbl
ORDER BY City

--4
SELECT City, FirstName
FROM Employee_tbl
UNION
SELECT CustCity, CustName
FROM Customer_tbl

--5
SELECT CAST(CustID AS varchar)
FROM Orders_tbl
EXCEPT
SELECT CAST(CustID AS varchar)
FROM Customer_tbl
UNION ALL
(
SELECT CAST(ProdID AS varchar)
FROM Orders_tbl
EXCEPT
SELECT CAST(ProdID AS varchar)
FROM Products_tbl
)
UNION ALL
(
SELECT EmpID
FROM Customer_tbl
EXCEPT
SELECT EmpID
FROM Employee_tbl)