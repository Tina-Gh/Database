create trigger t1
on Book
instead of insert 
as 
begin
	print 'No change was done';
	ROLLBACK TRANSACTION
end;



SET IDENTITY_INSERT Book ON
insert into Book(ID, Bookname, yearpublish, authorname, QTY) values (1, 'The Catcher in the Rye', 1951, 'J.D Salinger', 23);



