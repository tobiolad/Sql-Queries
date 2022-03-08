WITH STEP1 as
(
select
 orderdate,
 TotalDue,
 ordermonth = DATEFROMPARTS(year(orderdate),month(orderdate),1),
 orderrank = ROW_NUMBER() over(partition by DATEFROMPARTS(year(orderdate),month(orderdate),1) order by totaldue desc)
from AdventureWorks2019.Sales.SalesOrderHeader
)

select * from step1

select
a.ordermonth,
a.top10total,
prevtop10total = b.top10total

from
(select
ordermonth,
top10total = sum(totaldue)
from(
select
 orderdate,
 TotalDue,
 ordermonth = DATEFROMPARTS(year(orderdate),month(orderdate),1),
 orderrank = ROW_NUMBER() over(partition by DATEFROMPARTS(year(orderdate),month(orderdate),1) order by totaldue desc)
from AdventureWorks2019.Sales.SalesOrderHeader
) t

where orderrank <= 10
group by ordermonth) a
left join
(select
ordermonth,
top10total = sum(totaldue)
from(
select
 orderdate,
 TotalDue,
 ordermonth = DATEFROMPARTS(year(orderdate),month(orderdate),1),
 orderrank = ROW_NUMBER() over(partition by DATEFROMPARTS(year(orderdate),month(orderdate),1) order by totaldue desc)
from AdventureWorks2019.Sales.SalesOrderHeader
) t

where orderrank <= 10
group by ordermonth) b on a.ordermonth = dateadd(month,1,b.ordermonth)

order by ordermonth;