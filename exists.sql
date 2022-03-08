select
a.PurchaseOrderID,
a.OrderDate,
a.SubTotal,
a.TaxAmt

from AdventureWorks2019.Purchasing.PurchaseOrderHeader a

where exists(
select
*
from
AdventureWorks2019.Purchasing.PurchaseOrderDetail b
where a.PurchaseOrderID = b.PurchaseOrderID
and OrderQty > 500
)

order by 1

/*exercise 2*/
select
a.*

from AdventureWorks2019.Purchasing.PurchaseOrderHeader a

where exists(
select
1
from
AdventureWorks2019.Purchasing.PurchaseOrderDetail b
where a.PurchaseOrderID = b.PurchaseOrderID
and OrderQty > 500
and UnitPrice > 50.00
)

order by 1

/*exercise 3*/
select
*
from AdventureWorks2019.Purchasing.PurchaseOrderHeader a

where not exists(
 select
 1
 from AdventureWorks2019.Purchasing.PurchaseOrderDetail b
 where a.PurchaseOrderID = b.PurchaseOrderID
 and  b.RejectedQty > 0
)
order by 1