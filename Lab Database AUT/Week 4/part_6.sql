create function four_days_later(@input varchar(50))
returns varchar(50)
as
begin
	declare @temp varchar(50);
	select @temp = DATEADD(day, 4, @input);
	select @temp = DATENAME(day, @temp);
	--declare @temp2 varchar(50);
	--select @temp2 = DATENAME(day, @temp)
	--return @temp2;
	return @temp;
end


declare @output varchar(50);
declare @time varchar(50);
select @time = GETDATE();	
exec @output = four_days_later @input = @time;
print @output;
