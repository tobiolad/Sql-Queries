declare @myinput int
set @myinput = 1

if @myinput > 1
begin
select 'hello world'
end
else
begin
select 'no word'
end