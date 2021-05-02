--part (a):
insert into branch values('Branch Finance', 'London', 5000000);
insert into branch values('Branch House', 'Berlin', 10000000);
insert into branch values('Branch Car', 'Toronto', 1000000);

insert into Employee values(1, null, 'Kim Mng', 'Ryan', 30, '1990-03-03', 1111111111);
insert into Employee values(2, 1, 'Sam Emp', 'Ryan', 3, '2018-03-03', 1111111111);
insert into Employee values(3, 1, 'David Emp', 'Ryan', 5, '2016-03-03', 1111111111);

insert into Customer values(1, 2, 'Martin Lam', '1st Rose Avenue', 'London');
insert into Customer values(2, 3, 'Amy Clam', 'Richmond Street', 'Berlin');

insert into Loan values(101, 230000, 'Branch Finance');
insert into Loan values(102, 510000, 'Branch House');

insert into Borrower values(1, 101);
insert into Borrower values(2, 102);



--part (b):
insert into Account values(1001, 20000, 10, 100);
insert into Account values(1002, 30000, 12, 200);

insert into Depositor values(1, 1001, '2005-09-21');
insert into Depositor values(2, 1002, '2012-04-04');



--part (c):
insert into Branch values('Branch Health', 'Tehran', 9000000);

insert into Loan values(103, 54000, 'Branch Health');

insert into Payment values(1, '2020-11-08', 4000, 103);
insert into Payment values(2, '2020-12-08', 8000, 103);
insert into Payment values(3, '2020-12-10', 5000, 102);



