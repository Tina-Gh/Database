create table Persons(
	P_Id int,
	LastName varchar(50) not null,
	FirstName varchar(50) not null,
	Address varchar(50),
	City varchar(50),
	primary key(LastName, FirstName)
);