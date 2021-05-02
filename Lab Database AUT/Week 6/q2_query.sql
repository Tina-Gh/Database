--part (a):
create procedure p1
@name varchar(50), @balance int output, @acc_num int output
as
select @balance = balance
from Account, Depositor, Customer
where Account.account_number = Depositor.account_number and Depositor.customer_id = Customer.customer_id and @name = customer_name;

select @acc_num = Account.account_number
from Account, Depositor, Customer
where Account.account_number = Depositor.account_number and Depositor.customer_id = Customer.customer_id and @name = customer_name;


declare @balance_temp int, @acc_num_temp int;
exec p1
@name = 'Martin Lam',
@balance = @balance_temp output,
@acc_num = @acc_num_temp output;
print @balance_temp;
print @acc_num_temp;



--part (b):
create procedure p2
@pay_num int, @b_name varchar(50) output
as
select @b_name = branch_name
from Payment, Loan
where Payment.loan_number = Loan.loan_number;


declare @b_name_temp varchar(50);
exec p2
@pay_num = 3,
@b_name = @b_name_temp output;
print  @b_name_temp;



--part (c):
create procedure p3
@cust_num int
as
WAITFOR delay '000:00:10';
select * from Customer 
where customer_id = @cust_num;


exec p3
@cust_num = 2;
