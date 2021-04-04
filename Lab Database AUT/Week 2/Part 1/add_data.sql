SET IDENTITY_INSERT Sailor ON
insert into Sailor(Sailor_name, Sailor_rank) values (300, 200);
insert into Sailor(Sailor_name, Sailor_rank) values (301, 400);
insert into Sailor(Sailor_name, Sailor_rank) values (302, 700);
insert into Sailor(Sailor_name, Sailor_rank) values (303, 300);


insert into Boat values ('S32', 'red', 110);
insert into Boat values ('G73', 'black', 100);
insert into Boat values ('A51', 'white', 80);
insert into Boat values ('T99', 'blue', 120);


insert into Reserve(Sailor_name, Boat_name, Weekday) values (300, 'S32', 'saturday');
insert into Reserve(Sailor_name, Boat_name, Weekday) values (301, 'T99', 'sunday');
insert into Reserve(Sailor_name, Boat_name, Weekday) values (302, 'G73', 'thursday');
insert into Reserve(Sailor_name, Boat_name, Weekday) values (303, 'A51', 'friday');



