create table Artist(
	ArtistId int primary key,
	ArtistName varchar(20)
);


create table Album(
	AlbumId int primary key,
    AlbumTitle varchar(20),
    ArtistId int,
    foreign key (ArtistId) references Artist(ArtistId)
);


create table MediaType(
	MediaTypeId int primary key,
    MediaTypeName varchar(20)
);


create table Genre(
	GenreId int primary key,
    GenreName varchar(20)
);


create table Track(
	TrackId int primary key,
    TrackName varchar(20),
	AlbumId int,
    MediaTypeId int,
    GenreId int,
    Composer varchar(20),
    Milliseconds int,
    Bytes int,
    UnitPrice int,
    foreign key(AlbumId) references Album(AlbumId),
    foreign key(MediaTypeId) references MediaType(MediaTypeId),
    foreign key (GenreId) references Genre(GenreId)
);


create table Playlist(
	PlaylistId int primary key,
	PlaylistName varchar(20)
);


create table PlaylistTrack(
	PlaylistId int,
	TrackId int,
    primary key(PlaylistId, TrackId),
    foreign key (PlaylistId) references Playlist(PlaylistId),
    foreign key (TrackId) references Track(TrackId)
);


create table Employee(
	EmployeeId int primary key,
	EmpFirstName varchar(20),
    EmpLastName varchar(20),
    EmpTitle varchar(20),
    ReportsTo int,
    BirthDate date,
    HireDate date,
    EmpAddress varchar(30),
    EmpCity varchar(20),
    EmpState varchar(20),
    EmpCountry varchar(20),
    EmpPostalCode int,
    EmpPhone int,
    EmpFax int,
    EmpEmail varchar(20),
    foreign key(ReportsTo) references Employee(EmployeeId)
);


create table Customer(
	CustomerId int primary key,
    CustFirstName varchar(20),
    CustLastName varchar(20),
    Company varchar(20),
    CustAddress varchar(20),
    CustCity varchar(20),
    CustState varchar(20),
    CustCountry varchar(20),
    CustPostalCode int,
    CustPhone int,
    CustFax int,
    CustEmail varchar(20),
    SupportRepId int,
    foreign key (SupportRepId) references Employee(EmployeeId)
);


create table Invoice(
	InvoiceId int primary key, 
    CustomerId int,
    InvoiceDate date,
    BillingAddress varchar(20),
    BillingCity varchar(20),
    BillingState varchar(20),
    BillingCountry varchar(20),
    BillingPostalCode int,
    Total int,
	foreign key (CustomerId) references Customer(CustomerId)
);


create table InvoiceLine(
	InvoiceLineId int primary key,
    InvoiceId int,
    TrackId int,
    UnitPrice int,
    Quantity int,
	foreign key (InvoiceId) references Invoice(InvoiceId),
    foreign key (TrackId) references Track(TrackId)
);

