--1
SELECT * 
FROM Employee_tbl
WHERE Phone IS NULL OR City = 'ירושלים'

--2
SELECT FirstName +' '+ LastName 
FROM Employee_tbl
WHERE EmpID =301120514

--3
SELECT ProdID,ProdDesc,Cost
FROM Products_tbl
WHERE Cost>20

--4
SELECT Address+' '+City AS 'Address' ,FirstName +' '+ LastName AS 'Full Name'
FROM Employee_tbl
WHERE EmpID=123987456

--5
SELECT Zip ,FirstName +' '+ LastName AS 'Full Name',City
FROM Employee_tbl
where City='תל אביב'

--6
SELECT*
FROM Products_tbl
WHERE cost not between 5 and 10

--7
select ProdID,Cost
from Products_tbl
where cost between 2 and 5

--8
select Zip,LastName,Phone
from Employee_tbl
where city in ('תל אביב','רמת גן','ירושלים')

--9
select Zip,FirstName,LastName
from Employee_tbl
where Zip like '123%'

--10
select ProdID, ProdDesc
from Products_tbl
where not ProdID in (100, 102)

--11
select FirstName, City
from Employee_tbl
where Phone is null

--12
select top 2 ProdDesc, Cost
from Products_tbl
order by cost desc

--13
select OrderNum, qty, OrdDate
from Orders_tbl
where OrdDate>='2005-11-01'

--14
select CustName, CustCity
from Customer_tbl
where CustName like '%[י,ד]'

--15
select ProdDesc
from Products_tbl
where ProdDesc like '%ר_'

--16
select CustID, CustName, custcity, CustPhone
from Customer_tbl
where CustCity like '[ב,ת,י]%' and custfax is null

--17
select ProdDesc, cost
from Products_tbl
where cost>10 and ProdID in (100,102)
