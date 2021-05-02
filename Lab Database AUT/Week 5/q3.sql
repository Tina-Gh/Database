create trigger t3
on Book 
after update
as
if UPDATE(Bookname)
begin
	print 'No update is allowed on "Bookname" :))'
	rollback transaction
end;


update Book 
set Bookname = 'Mary II' 
where ID = 10;





