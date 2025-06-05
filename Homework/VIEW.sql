--VIEW

--1
CREATE VIEW CostumerDetails
AS
   SELECT C.*,O.OrdDate,O.OrderNum,O.ProdID,O.Qty
   FROM Customer_tbl C FULL JOIN Orders_tbl O
   ON C.CustID=O.CustID
GO

--2
CREATE VIEW EmpSalary
AS
   SELECT AVG(EP.Salary) AS 'm',E.City
   FROM Employee_tbl E JOIN Employee_pay_tbl EP
   ON E.EmpID=EP.EmpID
   GROUP BY City
GO


--3
SELECT  TOP 2 City 
FROM EmpSalary
ORDER BY m DESC
