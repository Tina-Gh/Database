declare @temp table(
	name varchar(10),
	student_id int,
	grade_old int,
	grade_new int
);


update Students
set grade = grade + 2
output inserted.name, inserted.student_id, deleted.grade, inserted.grade
into @temp
where grade<15;


select * from @temp
order by name;



