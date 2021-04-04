create table Sailor(
	Sailor_name int identity(300, 1) not null primary key,
	Sailor_rank int not null
);

create table Boat(
	Boat_name varchar(50) not null primary key,
	Boat_color varchar(30) not null,
	Boat_rank int not null, 
	constraint rank_limit check(Boat_rank>=70 and Boat_rank<=150)
);

create table Reserve(
	Sailor_name int not null,
	Boat_name varchar(50) not null,
	Weekday varchar(20) not null,
	primary key(Sailor_name, Boat_name),
	foreign key(Sailor_name) references Sailor(Sailor_name),
	foreign key(Boat_name) references Boat(Boat_name)
);