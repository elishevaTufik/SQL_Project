--GROUP BY
--1
select sum(salary)as 'sum'
from Employee_pay_tbl
where year(DateLastRaise)>=2000

--2
select min (salary), max (salary)
from Employee_pay_tbl

--3
select CustID,count(CustID), avg(Qty)
from Orders_tbl
group by CustID

--4
select count(OrderNum),avg(Qty)
from Orders_tbl
where ProdID=103

--5
--בהנחה שמדובר במוצר שהזמינו אותוו ביותר מ3 הזמנות שונות, ובנוסף ממוצע היחידות שהוזמנו ממנו הוא יותר מחמש
select ProdID, count (ProdID), avg(qty)
from Orders_tbl
group by ProdID
having count (ProdID)>3 and avg(qty)>5

--6
select COUNT (ProdID)
from Products_tbl

--7
select CustID, COUNT (Qty)
from Orders_tbl
group by CustID

--8
select CustID, COUNT (distinct ProdID)
from Orders_tbl
group by CustID

--9
select city, COUNT(EmpId)
from Employee_tbl
where FirstName like '%[א,י,ד]%' or LastName like '[%א,י,ד]%'
group by City

--10
select city, COUNT(EmpId)
from Employee_tbl
where FirstName like '%[א,י,ד]%' or LastName like '[%א,י,ד]%'
group by City
having count(EmpID)>1