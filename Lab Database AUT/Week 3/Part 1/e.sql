declare @temp int;

select @temp = P_Id from Persons;

while @temp > 0
	begin
		print 'okay';
		set @temp = @temp - 1;
	end



