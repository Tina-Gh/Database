create procedure swap @num_1 int, @num_2 int, @out_1 int output, @out_2 int output
as
set @out_1 = @num_2
set @out_2 = @num_1
;


declare @number_1 int, @number_2 int;
exec swap @num_1 = 123, @num_2 = 24, @out_1 = @number_1 output, @out_2 = @number_2 output;
print @number_1;
print @number_2; 


