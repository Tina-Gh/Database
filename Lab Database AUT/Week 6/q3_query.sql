--part (a):
create function max_rate()
returns int
as
begin

	declare @num int;
	select @num = account_number
	from Account
	where interest_rate = (select MAX(interest_rate)
	from Account);
	return @num;

end


declare @acc_num_temp int;
exec @acc_num_temp = max_rate;
print(@acc_num_temp);



--part (b):
create function give_department(@emp_id int)
returns varchar(50)
as
begin
	declare @dept_name varchar(50);
	select @dept_name = dependent_name
	from Employee
	where employee_id = @emp_id;
	return @dept_name;
end



declare @dept_name_temp varchar(50);
exec @dept_name_temp = give_department @emp_id = 3;
print @dept_name_temp;



