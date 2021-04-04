--1
select Prj_id, count(Prj_id) as summation from Employee_Project
group by Prj_id
having count(Prj_id) < 4;


--2
select Emp_id, Prj_name 
from Employee_Project
inner join Project on Project.Prj_id = Employee_Project.Prj_id
order by Emp_id ASC;


--3
select sum(Salary) as sum_salary
from Emp
inner join Employee_Project on Employee_Project.Emp_id = Emp.Emp_id
inner join Project on Project.Prj_id = Employee_Project.Prj_id
where Prj_name = 'B';
--group by Emp.Emp_id;


--4
select Prj_name, avg(salary) as average_salary
from Emp
inner join Employee_Project on Employee_Project.Emp_id = Emp.Emp_id
inner join Project on Project.Prj_id = Employee_Project.Prj_id
group by Prj_name;


--5
select Prj_name
from Emp
inner join Employee_Project on Employee_Project.Emp_id = Emp.Emp_id
inner join Project on Project.Prj_id = Employee_Project.Prj_id
where Emp_name = 'manager';





