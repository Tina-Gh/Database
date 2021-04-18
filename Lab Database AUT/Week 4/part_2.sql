create procedure add_grade @num int
as
declare @less_than_10 int;
select @less_than_10 = count(stuGrade) from tblstudent
where stuGrade < 10;

if @less_than_10 < @num
update tblstudent
set stuGrade = stuGrade + 1
where stuGrade between 9 and 10 

else
update tblstudent
set stuGrade = stuGrade + 0.5
where stuGrade between 9.5 and 10;


exec add_grade @num = 3;


