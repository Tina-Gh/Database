declare @number nvarchar(10);
set @number = '0011234567';


if @number < (select phone 
from Persons 
where LastName = 'Tjessem')
insert into Persons(P_Id, LastName, FirstName, Address, City, Phone) values(6, 'Taylor', 'Jackson', 'Nisseisten 87', 'Sandnes', @number);
else 
insert into Persons(P_Id, LastName, FirstName, Address, City, Phone) values(8, 'Taylor', 'Jackson', 'Nisseisten 87', 'Sandnes', @number);





