create procedure StuStatus 
as 
declare @num_stu int;
select @num_stu = count(stuID) from tblstudent
where stuGrade < 10;

if @num_stu <= 1
print 'GOOD';
else if @num_stu between 2 and 3
print 'Normal';
else
print 'Bad';


exec StuStatus;


