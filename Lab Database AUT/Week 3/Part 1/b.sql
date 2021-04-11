--begin transaction t1;

--alter table Persons
--add Phone nvarchar(10) constraint phone_beggining check (Phone like '001%');

--commit transaction t1;





----Does not work!
--begin transaction t1;

--insert into People(Phone) values('0011111111');
--insert into People(Phone) values('0012222222');
--insert into People(Phone) values('0013333333');
--insert into People(Phone) values('0014444444');

--commit transaction t1;


begin transaction t2;

update Persons
set Phone = '0011111111'
where P_Id = 1;

update Persons
set Phone = '0012222222'
where P_Id = 2;

update Persons
set Phone = '0013333333'
where P_Id = 3;

update Persons
set Phone = '0014444444'
where P_Id = 4;

commit transaction t2;







