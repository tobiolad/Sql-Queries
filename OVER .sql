/*QUESTION 1*/
SELECT 
A.FirstName,
A.LastName,
B.JobTitle,
C.Rate,
AverageRate = Avg(C.Rate) OVER()
FROM [AdventureWorks2019].[Person].[Person] A
join [AdventureWorks2019].[HumanResources].[Employee] B on A.BusinessEntityID = B.BusinessEntityID
join [AdventureWorks2019].[HumanResources].[EmployeePayHistory] C on B.BusinessEntityID = C.BusinessEntityID;

/*QUESTION 2*/
SELECT 
A.FirstName,
A.LastName,
B.JobTitle,
C.Rate,
AverageRate = Avg(C.Rate) OVER(),
MaximumRate = Max(C.Rate) OVER()
FROM [AdventureWorks2019].[Person].[Person] A
join [AdventureWorks2019].[HumanResources].[Employee] B on A.BusinessEntityID = B.BusinessEntityID
join [AdventureWorks2019].[HumanResources].[EmployeePayHistory] C on B.BusinessEntityID = C.BusinessEntityID;

/*QUESTION 3*/
SELECT 
A.FirstName,
A.LastName,
B.JobTitle,
C.Rate,
AverageRate = Avg(C.Rate) OVER(),
MaximumRate = Max(C.Rate) OVER(),
DiffFromAvgRate = (C.Rate) - Avg(C.Rate) OVER() 
FROM [AdventureWorks2019].[Person].[Person] A
join [AdventureWorks2019].[HumanResources].[Employee] B on A.BusinessEntityID = B.BusinessEntityID
join [AdventureWorks2019].[HumanResources].[EmployeePayHistory] C on B.BusinessEntityID = C.BusinessEntityID;

/*QUESTION 4*/
SELECT 
A.FirstName,
A.LastName,
B.JobTitle,
C.Rate,
AverageRate = Avg(C.Rate) OVER(),
MaximumRate = Max(C.Rate) OVER(),
DiffFromAvgRate = (C.Rate) - Avg(C.Rate) OVER(),
PercentofMaxRate = (C.Rate/Max(C.Rate) OVER()) * 100
FROM [AdventureWorks2019].[Person].[Person] A
join [AdventureWorks2019].[HumanResources].[Employee] B on A.BusinessEntityID = B.BusinessEntityID
join [AdventureWorks2019].[HumanResources].[EmployeePayHistory] C on B.BusinessEntityID = C.BusinessEntityID;




