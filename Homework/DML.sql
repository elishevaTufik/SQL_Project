--1
DELETE FROM Orders_tbl
WHERE CustID IN (SELECT CustID FROM Orders_tbl WHERE OrdDate<GETDATE())

--2
DELETE FROM Employee_pay_tbl
WHERE (Salary IS NULL OR Salary=0) AND 

--3