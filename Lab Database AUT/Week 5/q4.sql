create view v1 as
select Bookname, authorname, QTY
from Book;


create trigger t4 
on v1
instead of insert
as
begin
	declare @temp int;
	set @temp = 1000;
	insert into Book(Bookname, authorname, QTY)
	select INSERTED.Bookname, INSERTED.authorname, @temp
	from INSERTED
	where INSERTED.QTY < 1000
end;


