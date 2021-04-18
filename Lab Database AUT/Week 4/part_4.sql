create function Grade(@name varchar(50))
returns int
as 
begin 
	declare @temp int
	select @temp = stuGrade from tblstudent where stuName = 'ali'
	return @temp;
end



declare @grade_student int;
exec @grade_student = Grade @name = 'ali'
print @grade_student;


