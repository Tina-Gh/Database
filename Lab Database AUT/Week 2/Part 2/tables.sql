create table Emp(
	Emp_id int identity not null primary key,
	Emp_name varchar(50),
	Salary int
);


create table Project(
	Prj_id int identity not null primary key,
	Prj_name varchar(5)
);


create table Employee_Project(
	Prj_id int not null,
	Emp_id int not null,
	primary key(Prj_id, Emp_id),
	foreign key (Prj_id) references Project(Prj_id), 
	foreign key (Emp_id) references Emp(Emp_id)
);
