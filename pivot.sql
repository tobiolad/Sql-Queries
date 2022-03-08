select
*

from 
(select
  productcategoryname = d.Name,
  a.*

 from AdventureWorks2019.Sales.SalesOrderDetail a
 join AdventureWorks2019.Production.Product b
 on a.ProductID = b.ProductID
 join AdventureWorks2019.Production.ProductSubcategory c
 on b.ProductSubcategoryID = c.ProductSubcategoryID
 join AdventureWorks2019.Production.ProductCategory d
 on c.ProductCategoryID = d.ProductCategoryID
 )a

pivot(
sum(linetotal)
for productcategoryname in([Bikes],[Clothing],[Accessories],[Components])
)b
order by 1

/*exercise 1*/
select
*

from 
(select
  productcategoryname = d.Name,
  a.*

 from AdventureWorks2019.Sales.SalesOrderDetail a
 join AdventureWorks2019.Production.Product b
 on a.ProductID = b.ProductID
 join AdventureWorks2019.Production.ProductSubcategory c
 on b.ProductSubcategoryID = c.ProductSubcategoryID
 join AdventureWorks2019.Production.ProductCategory d
 on c.ProductCategoryID = d.ProductCategoryID
 )a

pivot(
sum(linetotal)
for productcategoryname in([Bikes],[Clothing],[Accessories],[Components])
)b
order by 1

select
*
from
AdventureWorks2019.HumanResources.Employee