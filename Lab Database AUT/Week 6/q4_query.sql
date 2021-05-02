--part (a):
create table payment_log(
	payment_number int primary key,
	payment_date date,
	payment_amount int,
	loan_number int,
	foreign key (loan_number) references Loan(loan_number)
);


create trigger t1 on Payment
after insert as
declare @p_num int, @p_date date, @p_amount int, @l_num int;
select @p_num = payment_number, @p_date = payment_date, @p_amount = payment_amount, @l_num = loan_number
from inserted;
insert into payment_log values(@p_num, @p_date, @p_amount, @l_num);


--insert into Payment values(4, '2021-01-01', 3000, 102);
--select * from payment_log;



--part (b):
create trigger t2 on Branch
after update as
if UPDATE(branch_name)
begin
	print('Hi! You are not allowed to upfdate the name of the branch :(');
	ROLLBACK TRANSACTION;
end;

----table "Branch" before updating:
--select * from Branch;


----table "Branch" after updating:
--update Branch
--set branch_name = 'Random!'
--where branch_city = 'Toronto';


