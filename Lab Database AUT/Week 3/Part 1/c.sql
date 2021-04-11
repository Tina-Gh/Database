begin transaction t3;

insert into Persons(P_Id, LastName, FirstName, Address, City, Phone) values(7, 'Tjessem', 'Jakob', 'Nissestien 67', 'Sandnes', '0017777777');

select P_Id, LastName, FirstName
from Persons
order by FirstName ASC;

commit transaction t3;



