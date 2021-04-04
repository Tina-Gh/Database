--1
SET IDENTITY_INSERT Emp ON
insert into Emp(Emp_id, Emp_name, Salary) values (1, 'manager', 1500);
insert into Emp(Emp_id, Emp_name, Salary) values (2, 'a', 100)
insert into Emp(Emp_id, Emp_name, Salary) values (3, 'b', 200)
insert into Emp(Emp_id, Emp_name, Salary) values (4, 'c', 300)
insert into Emp(Emp_id, Emp_name, Salary) values (5, 'd', 400)
insert into Emp(Emp_id, Emp_name, Salary) values (6, 'e', 500)
insert into Emp(Emp_id, Emp_name, Salary) values (7, 'f', 600)
insert into Emp(Emp_id, Emp_name, Salary) values (8, 'g', 700)
insert into Emp(Emp_id, Emp_name, Salary) values (9, 'h', 750)
insert into Emp(Emp_id, Emp_name, Salary) values (10, 'i', 800)
insert into Emp(Emp_id, Emp_name, Salary) values (11, 'k', 840)
insert into Emp(Emp_id, Emp_name, Salary) values (12, 'o', 900)



--2
SET IDENTITY_INSERT Project ON
insert into Project(Prj_id, Prj_name) values (100, 'A');
insert into Project(Prj_id, Prj_name) values (101, 'B');
insert into Project(Prj_id, Prj_name) values (102, 'C');
insert into Project(Prj_id, Prj_name) values (103, 'D');



--3
insert into Employee_Project(Prj_id, Emp_id) values (100, 1);
insert into Employee_Project(Prj_id, Emp_id) values (100, 3);
insert into Employee_Project(Prj_id, Emp_id) values (100, 12);
insert into Employee_Project(Prj_id, Emp_id) values (101, 4);
insert into Employee_Project(Prj_id, Emp_id) values (101, 5);
insert into Employee_Project(Prj_id, Emp_id) values (101, 2);
insert into Employee_Project(Prj_id, Emp_id) values (101, 6);
insert into Employee_Project(Prj_id, Emp_id) values (101, 3);
insert into Employee_Project(Prj_id, Emp_id) values (102, 2);
insert into Employee_Project(Prj_id, Emp_id) values (102, 7);
insert into Employee_Project(Prj_id, Emp_id) values (103, 1);
insert into Employee_Project(Prj_id, Emp_id) values (103, 7);
insert into Employee_Project(Prj_id, Emp_id) values (103, 9);
insert into Employee_Project(Prj_id, Emp_id) values (103, 10);
insert into Employee_Project(Prj_id, Emp_id) values (103, 8);
insert into Employee_Project(Prj_id, Emp_id) values (103, 11);