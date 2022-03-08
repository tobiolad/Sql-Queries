/*Question 1*/
SELECT
A.Name as ProductName,
A.ListPrice,
B.Name as ProductSubcategory,
C.Name as ProductCategory
from
[AdventureWorks2019].[Production].[Product] A
join [AdventureWorks2019].[Production].[ProductSubcategory] B on A.ProductSubcategoryID =  B.ProductSubcategoryID
join [AdventureWorks2019].[Production].[ProductCategory] C on B.ProductCategoryID = C.ProductCategoryID

/*Question 2*/
SELECT
A.Name as ProductName,
A.ListPrice,
AvgPriceByCategory = avg(A.ListPrice) over(partition by c.name),
B.Name as ProductSubcategory,
C.Name as ProductCategory
from
[AdventureWorks2019].[Production].[Product] A
join [AdventureWorks2019].[Production].[ProductSubcategory] B on A.ProductSubcategoryID =  B.ProductSubcategoryID
join [AdventureWorks2019].[Production].[ProductCategory] C on B.ProductCategoryID = C.ProductCategoryID

/*Question 3*/
SELECT
A.Name as ProductName,
A.ListPrice,
AvgPriceByCategory = avg(A.ListPrice) over(partition by c.name),
AvgPriceByCategoryAndSubcategory = avg(A.ListPrice) over(partition by b.name , c.name),
B.Name as ProductSubcategory,
C.Name as ProductCategory
from
[AdventureWorks2019].[Production].[Product] A
join [AdventureWorks2019].[Production].[ProductSubcategory] B on A.ProductSubcategoryID =  B.ProductSubcategoryID
join [AdventureWorks2019].[Production].[ProductCategory] C on B.ProductCategoryID = C.ProductCategoryID


/*Question 4*/
SELECT
A.Name as ProductName,
A.ListPrice,
AvgPriceByCategory = avg(A.ListPrice) over(partition by c.name),
AvgPriceByCategoryAndSubcategory = avg(A.ListPrice) over(partition by b.name , c.name),
ProductVsCategoryDelta = A.ListPrice - avg(ListPrice) over(partition by c.name),
B.Name as ProductSubcategory,
C.Name as ProductCategory
from
[AdventureWorks2019].[Production].[Product] A
join [AdventureWorks2019].[Production].[ProductSubcategory] B on A.ProductSubcategoryID =  B.ProductSubcategoryID
join [AdventureWorks2019].[Production].[ProductCategory] C on B.ProductCategoryID = C.ProductCategoryID

