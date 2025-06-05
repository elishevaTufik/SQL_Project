
--1
select *
from products_tbl
--2
select firstname, lastname, city, phone
from Employee_tbl
--3
select custName as 'full name', CustAddress as'address', custcity as 'city'
from customer_tbl
--4
select EmpID, address+' '+ city as 'full adress'
from Employee_tbl
--5
select distinct CustCity 
from Customer_tbl
--6
select distinct LastName
from Employee_tbl
--7 à'
select city, address
from Employee_tbl
--7 á'
select distinct city, address
from Employee_tbl
--8
select ProdDesc, cost, cost*0.25 as 'mechir 25%'
from Products_tbl
--9
select EmpID, 'DateHire'-'DateLastRaise' as 'hefresh',  salary+Bonus as 'final salary', salary + 50 as 'salary+ 50 ils'
from Employee_pay_tbl
--10
select OrderNum, CustID, ProdID, Qty+2 as 'calcute column', OrdDate, OrdDate+10 as 'taarich sipuk hazmana'
from Orders_tbl


