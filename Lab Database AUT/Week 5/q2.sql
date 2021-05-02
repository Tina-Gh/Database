create table Book_Audit(
	ID int,
	Bookname varchar(30),
	yearpublish int,
	authorname varchar(40),
	QTY int,
	Ins_or_del int
);


exec sp_configure 'nested triggers', 0
reconfigure with override

create trigger t2
on Book
after insert, delete 
as 
begin

	declare @ID_2 int, @Bookname_2 varchar(30), @yearpublish_2 int, @authorname_2 varchar(40), @QTY_2 int, @Ins_or_del_2 int;

	if exists (select * from INSERTED)
	begin
		set @Ins_or_del_2 = 1;
		select @ID_2 = ID, @Bookname_2 = Bookname, @yearpublish_2 = yearpublish, @authorname_2 = authorname, @QTY_2 = QTY
		from INSERTED
	end

	if exists (select * from DELETED)
	begin
		set @Ins_or_del_2 = 0;
		select @ID_2 = ID, @Bookname_2 = Bookname, @yearpublish_2 = yearpublish, @authorname_2 = authorname, @QTY_2 = QTY
		from DELETED
	end

	insert into Book_Audit values(@ID_2, @Bookname_2, @yearpublish_2, @authorname_2, @QTY_2, @Ins_or_del_2);

end


SET IDENTITY_INSERT Book ON
insert into Book(ID, Bookname, yearpublish, authorname, QTY) values(1, 'Jane Eyre', 1847, 'Charlotte Bronte', 32);
insert into Book(ID, Bookname, yearpublish, authorname, QTY) values(2, 'War and Peace', 1800, 'Leo Tolstoy', 50);



delete from Book where Bookname = 'Jane Eyre';


select * from Book_Audit;
