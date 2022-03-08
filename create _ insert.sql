create table #sales
(
    orderdate date,
	ordermonth date,
	totaldue money,
	orderrank int
)
insert into #sales(
  orderdate,
  ordermonth,
  totaldue,
  orderrank
)
SELECT 
       OrderDate
	  ,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1)
      ,TotalDue
	  ,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC)
FROM AdventureWorks2019.Sales.SalesOrderHeader


create table #AvgSalesMinusTop10
(
ordermonth date,
totalsales money
)
insert into #AvgSalesMinusTop10
(
ordermonth,
totalsales
)
SELECT
OrderMonth,
TotalSales = SUM(TotalDue)
FROM #Sales
WHERE OrderRank > 10
GROUP BY OrderMonth



create table #Purchases(
       OrderDate date
	  ,OrderMonth date
      ,TotalDue money
	  ,OrderRank int
)
 insert into #Purchases
 (
    OrderDate 
	  ,OrderMonth 
      ,TotalDue 
	  ,OrderRank 
 )
 SELECT 
       OrderDate
	  ,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1)
      ,TotalDue
	  ,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC)
FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader


create table #AvgPurchasesMinusTop10
(
     ordermonth date,
	 totalpurchases money
)
insert into #AvgPurchasesMinusTop10(
      ordermonth,
	 totalpurchases 
)
SELECT
OrderMonth,
TotalPurchases = SUM(TotalDue)
FROM #Purchases
WHERE OrderRank > 10
GROUP BY OrderMonth









