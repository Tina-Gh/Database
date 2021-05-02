--part (a):
create view v1 as
select Customer.customer_name, Customer.customer_id, Loan.amount, Loan.branch_name
from Customer, Loan, Borrower
where Borrower.customer_id = Customer.customer_id and Borrower.loan_number = Loan.loan_number;


--part (b):
select Account.account_number, Account.interest_rate 
from Account, Depositor
where Account.account_number = Depositor.account_number and YEAR(access_date) > 2009;


--part (c):
select payment_number 
from Loan, Branch, Payment
where Payment.loan_number = Loan.loan_number and Loan.branch_name = Branch.branch_name and branch_city = 'Tehran';

