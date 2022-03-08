SELECT 
SalesOrderID,
SalesOrderDetailID,
LineTotal,
ranking = row_number() over(partition by SalesOrderID order by LineTotal DESC),
rankingwithrank = rank() over(partition by SalesOrderID order by LineTotal DESC),
rankingwithdenserank = dense_rank() over(partition by SalesOrderID order by LineTotal DESC)

FROM AdventureWorks2019.Sales.SalesOrderDetail
order by SalesOrderID,LineTotal desc

/*Exercise 1*/
SELECT 
  ProductName = A.Name,
  A.ListPrice,
  ProductSubcategory = B.Name,
  ProductCategory = C.Name,
  [Price Rank] = ROW_NUMBER() OVER(ORDER BY A.ListPrice DESC),
  CategoryPriceRankWithRank = rank()  OVER(PARTITION BY C.Name ORDER BY A.ListPrice DESC),
  [Category Price Rank] = ROW_NUMBER() OVER(PARTITION BY C.Name ORDER BY A.ListPrice DESC),
  [Top 5 Price In Category] = 
	CASE 
		WHEN ROW_NUMBER() OVER(PARTITION BY C.Name ORDER BY A.ListPrice DESC) <= 5 THEN 'Yes'
		ELSE 'No'
	END


FROM AdventureWorks2019.Production.Product A
  JOIN AdventureWorks2019.Production.ProductSubcategory B
    ON A.ProductSubcategoryID = B.ProductSubcategoryID
  JOIN AdventureWorks2019.Production.ProductCategory C
    ON B.ProductCategoryID = C.ProductCategoryID

/*Exercise 2*/
SELECT 
  ProductName = A.Name,
  A.ListPrice,
  ProductSubcategory = B.Name,
  ProductCategory = C.Name,
  [Price Rank] = ROW_NUMBER() OVER(ORDER BY A.ListPrice DESC),
  CategoryPriceRankWithRank = rank()  OVER(PARTITION BY C.Name ORDER BY A.ListPrice DESC),
  [Category Price Rank] = ROW_NUMBER() OVER(PARTITION BY C.Name ORDER BY A.ListPrice DESC),
 CategoryPriceRankWithDenseRank = DENSE_RANK()OVER(PARTITION BY C.Name ORDER BY A.ListPrice DESC), [Top 5 Price In Category] = 
	CASE 
		WHEN ROW_NUMBER() OVER(PARTITION BY C.Name ORDER BY A.ListPrice DESC) <= 5 THEN 'Yes'
		ELSE 'No'
	END


FROM AdventureWorks2019.Production.Product A
  JOIN AdventureWorks2019.Production.ProductSubcategory B
    ON A.ProductSubcategoryID = B.ProductSubcategoryID
  JOIN AdventureWorks2019.Production.ProductCategory C
    ON B.ProductCategoryID = C.ProductCategoryID

/*Exercise 3*/
SELECT 
  ProductName = A.Name,
  A.ListPrice,
  ProductSubcategory = B.Name,
  ProductCategory = C.Name,
  [Price Rank] = ROW_NUMBER() OVER(ORDER BY A.ListPrice DESC),
  CategoryPriceRankWithRank = rank()  OVER(PARTITION BY C.Name ORDER BY A.ListPrice DESC),
  [Category Price Rank] = ROW_NUMBER() OVER(PARTITION BY C.Name ORDER BY A.ListPrice DESC),
 CategoryPriceRankWithDenseRank = DENSE_RANK()OVER(PARTITION BY C.Name ORDER BY A.ListPrice DESC), 
 [Top 5 Price In Category] = 
	CASE 
		WHEN DENSE_RANK() OVER(PARTITION BY C.Name ORDER BY A.ListPrice DESC) <= 5 THEN 'Yes'
		ELSE 'No'
	END


FROM AdventureWorks2019.Production.Product A
  JOIN AdventureWorks2019.Production.ProductSubcategory B
    ON A.ProductSubcategoryID = B.ProductSubcategoryID
  JOIN AdventureWorks2019.Production.ProductCategory C
    ON B.ProductCategoryID = C.ProductCategoryID
