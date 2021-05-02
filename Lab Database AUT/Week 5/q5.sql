create trigger t5
on DATABASE
for DROP_TABLE
as
print('The Admin does not allow you to drop the table!')
ROLLBACK;


drop table Book;



