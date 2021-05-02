create table Branch(
	branch_name varchar(50) primary key,
	branch_city varchar(50),
	assets int
);

create table Loan(
	loan_number int primary key,
	amount int,
	branch_name varchar(50),
	foreign key (branch_name) references Branch(branch_name)
);

create table Payment(
	payment_number int primary key,
	payment_date date,
	payment_amount int,
	loan_number int,
	foreign key (loan_number) references Loan(loan_number)
);

create table Employee(
	employee_id int primary key,
	manager_id int,
	employee_name varchar(50),
	dependent_name varchar(50),
	employment_length int,
	starting_date date,
	telephone_number int,
	foreign key (manager_id) references Employee(employee_id)
);


create table Customer(
	customer_id int primary key, 
	employee_id int,
	customer_name varchar(50),
	customer_street varchar(50),
	customer_city varchar(50),
	foreign key (employee_id) references Employee(employee_id)
);

create table Borrower(
	customer_id int, 
	loan_number int,
	foreign key (customer_id) references Customer(customer_id),
	foreign key (loan_number) references Loan(loan_number)
);

create table Account(
	account_number int primary key,
	balance int,
	interest_rate int,
	overdraft_amount int
);

create table Depositor(
	customer_id int,
	account_number int,
	access_date date,
	foreign key (customer_id) references Customer(customer_id),
	foreign key (account_number) references Account(account_number)
);



