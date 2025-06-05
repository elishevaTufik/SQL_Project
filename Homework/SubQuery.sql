--SUB QUERY

--1
 SELECT ProdDesc, Cost
 FROM Products_tbl
 WHERE cost=
	 (
	 SELECT MIN(cost) 
     FROM Products_tbl
	 )

--2
 SELECT O.*
 FROM Orders_tbl O JOIN Products_tbl P
 ON O.ProdID=P.ProdID
 WHERE cost IN
	 (
	 SELECT MAX(cost) 
     FROM Products_tbl
	 )

--3
 SELECT O.*
 FROM Orders_tbl O JOIN Products_tbl P
 ON O.ProdID=P.ProdID
 WHERE cost=
	 (
	 SELECT MAX(cost) 
     FROM Products_tbl
	 )

--4
SELECT FirstName+' '+LastName AS 'FULL NAME'
FROM Employee_tbl E
WHERE LastName IN (SELECT LastName
                   FROM Employee_tbl
				   GROUP BY LastName
				   HAVING COUNT(LastName)>1)

--5
SELECT ProdDesc
FROM Products_tbl
WHERE Cost IN (
               SELECT Cost
               FROM Products_tbl
			   GROUP BY Cost
			   HAVING COUNT(Cost)>1)

--6
SELECT DISTINCT CustID
FROM Orders_tbl
WHERE ProdID NOT IN
     (
	 SELECT ProdID
     FROM Orders_tbl
	 WHERE CustID=3
	 )

--7
SELECT FirstName
FROM Employee_tbl
WHERE EmpID NOT IN(
                  SELECT EmpID
                  FROM Employee_pay_tbl
                  WHERE Salary>0
                  )

--8
SELECT CustName
FROM Customer_tbl
WHERE CustID not in
          (
          SELECT CustID
		  FROM Orders_tbl
		  WHERE MONTH(GETDATE())=MONTH(OrdDate)
		  AND
		  YEAR(GETDATE())= YEAR(OrdDate)
		  )

--9
SELECT ProdDesc
FROM Products_tbl
WHERE ProdID NOT IN
            (
            SELECT ProdID
            FROM Orders_tbl
			WHERE ProdID IS NOT NULL
            ) 

--10

SELECT C.CustName,AVG(P.Cost)
FROM Customer_tbl C 
JOIN Orders_tbl O
ON C.CustID=O.CustID 
JOIN Products_tbl P
ON O.ProdID=P.ProdID
GROUP BY C.CustName
HAVING AVG(P.COST) >(
						SELECT AVG(COST)
						FROM Products_tbl 
						WHERE ProdID= (
										SELECT DISTINCT ProdID
										FROM Orders_tbl
										WHERE CustID= 
													  (SELECT CustID
													   FROM Customer_tbl
													   WHERE CustName='גדעון'
													   )))

--11
SELECT P.ProdDesc, P.Cost
FROM Products_tbl P JOIN Orders_tbl O
ON P.ProdID=O.ProdID
WHERE (Cost BETWEEN 1 AND 6) 
GROUP BY P.ProdDesc,P.Cost
HAVING SUM (O.Qty)<
					(
					SELECT SUM(Qty)
					FROM Orders_tbl
					WHERE ProdID=101)

--12
SELECT C.CustName,P.ProdDesc,O.OrdDate,O.Qty,P.Cost
FROM (Orders_tbl O JOIN Products_tbl P
ON P.ProdID=O.ProdID)
JOIN Customer_tbl C
ON O.CustID=C.CustID
WHERE Cost IN
(SELECT MAX(COST)
FROM Products_tbl P JOIN Orders_tbl O
ON P.ProdID=O.ProdID
GROUP BY O.CustID )

--13
SELECT OrderNum,CustName
FROM Orders_tbl o join Customer_tbl c
ON o.CustID=c.CustID
join (SELECT  CustID,COUNT(CustName) count1
		FROM Customer_tbl
		GROUP BY CustID) g ON g.CustID= c.CustID
WHERE qty>5 and count1=1

--14
SELECT P.ProdDesc 
FROM Products_tbl P LEFT JOIN Orders_tbl O
ON P.ProdID=O.ProdID
WHERE O.Qty IN
		(
		SELECT SUM(Qty)
		FROM Orders_tbl
		WHERE CustID IN(SELECT CustID
						FROM Customer_tbl
						WHERE CustName ='פנחס'))
												OR O.Qty IN(
													SELECT SUM(Qty)
													FROM Orders_tbl
													WHERE CustID in(SELECT CustID
																	FROM Customer_tbl
																	WHERE CustCity ='בני ברק'
																	)
																	GROUP BY CustID)

--15
SELECT A.CustCity, A.CustName
FROM
(SELECT C.CustCity, C.CustName
FROM Customer_tbl C JOIN Orders_tbl O
ON C.CustID=O.CustID
WHERE O.ProdID IN (
								SELECT DISTINCT P.ProdID
								FROM Products_tbl P JOIN Orders_tbl O
								ON P.ProdID = O.ProdID
								WHERE O.CustID IN (
													SELECT CustID
													FROM  Customer_tbl 
													WHERE CustName IN ('גדעון','פנחס')))) AS A
GROUP BY A.CustCity, A.CustName
HAVING COUNT(1) >=2
ORDER BY CustCity
		
--16
SELECT AVG1, SUM1
FROM
(
SELECT AVG (SALARY) AS AVG1, SUM(Salary) AS SUM1, ROW_NUMBER()OVER(ORDER BY E.CITY) AS RWNUM, ROW_NUMBER()OVER(ORDER BY E.CITY DESC) AS RWNUM2
FROM Employee_pay_tbl EP RIGHT JOIN Employee_tbl E
ON EP.EmpID = E.EmpID
GROUP BY E.City) AS E
WHERE E.RWNUM!=1 AND E.RWNUM2!=1 








