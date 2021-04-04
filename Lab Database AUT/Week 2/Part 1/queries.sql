--1:
select Boat_name from Reserve
where Weekday = 'saturday';


--2:
create view v1 as
select Sailor_name, Reserve.Boat_name, Boat_color 
from Reserve 
inner join Boat on Reserve.Boat_name = Boat.Boat_name;
select * from v1;

--3:
select Boat_rank from Boat;


--4:
select Boat_name from Reserve
where Weekday='saturday' or Weekday='monday';


5:
select Boat_color 
from Boat
inner join Reserve on Reserve.Boat_name = Boat.Boat_name
where Weekday like 's%';