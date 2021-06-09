create table Movie(
	mID int primary key,
    title text,
    year int,
    director text
);


create table Reviewer(
	rID int primary key,
    name text
);


create table Rating(
	rID int,
    mID int,
    stars int,
    ratingDate date,
    primary key(rID, mID),
    foreign key(mID) references Movie(mID),
    foreign key(rID) references Reviewer(rID)
);

