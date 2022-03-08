SELECT
    SalesOrderID,
	OrderDate,
	CustomerID,
	TotalDue,
	NextTotalDue = LEAD(TotalDue,1) OVER(Partition by customerid Order by SalesOrderID),
    PrevTotalDue = LAG(TotalDue,1) OVER(Partition by customerid Order by SalesOrderID)

FROM AdventureWorks2019.Sales.SalesOrderHeader
Order by customerid, SalesOrderID

/*Exercise 1*/
select
 o.PurchaseOrderID,
 o.OrderDate,
 o.TotalDue,
 v.Name as VendorName
   
from
AdventureWorks2019.Purchasing.PurchaseOrderHeader o
join AdventureWorks2019.Purchasing.Vendor v
on o.VendorID = v.BusinessEntityID

where year(o.OrderDate) >= 2013 and o.TotalDue > 500;

/*Exercise 2*/

select
 o.PurchaseOrderID,
 o.OrderDate,
 o.TotalDue,
 v.Name as VendorName,
 PrevOrderFromVendorAmt = lag(o.totaldue,1)  OVER(Partition by o.vendorID Order by o.orderdate)

from
AdventureWorks2019.Purchasing.PurchaseOrderHeader o
join AdventureWorks2019.Purchasing.Vendor v
on o.VendorID = v.BusinessEntityID

where year(o.OrderDate) >= 2013 and o.TotalDue > 500

order by o.VendorID, o.OrderDate;

/*Exercise 3*/

select
 o.PurchaseOrderID,
 o.OrderDate,
 o.TotalDue,
 v.Name as VendorName,
 PrevOrderFromVendorAmt = lag(o.totaldue,1)  OVER(Partition by o.vendorID Order by o.orderdate),
 NextOrderByEmployeeVendor = LEAD(V.Name,1) over(partition by o.employeeid order by o.orderdate)

from
AdventureWorks2019.Purchasing.PurchaseOrderHeader o
join AdventureWorks2019.Purchasing.Vendor v
on o.VendorID = v.BusinessEntityID

where year(o.OrderDate) >= 2013 and o.TotalDue > 500

order by o.EmployeeID, o.OrderDate;
 
/*Exercise 4*/
select
 o.PurchaseOrderID,
 o.OrderDate,
 o.TotalDue,
 v.Name as VendorName,
 PrevOrderFromVendorAmt = lag(o.totaldue,1)  OVER(Partition by o.vendorID Order by o.orderdate),
 NextOrderByEmployeeVendor = LEAD(V.Name,1) over(partition by o.employeeid order by o.orderdate),
 Next2OrderByEmployeeVendor = lead(v.name,2) over(partition by o.employeeid order by o.orderdate)

from
AdventureWorks2019.Purchasing.PurchaseOrderHeader o
join AdventureWorks2019.Purchasing.Vendor v
on o.VendorID = v.BusinessEntityID

where year(o.OrderDate) >= 2013 and o.TotalDue > 500

order by o.EmployeeID, o.OrderDate;