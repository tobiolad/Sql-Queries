create function dbo.ufnCurrentDate()

returns date

as

begin

return cast(getdate() as date)
end

create function dbo.ufnElapsedBusinessDays(@startdate date, @enddate date)

returns int

as

begin
 select
 count (*)
 from AdventureWorks2019.dbo.Calendar
 where DateValue BETWEEN @startdate and @enddate
 and weekendflag = 0
 and holidayflag = 0


end

