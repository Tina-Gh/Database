-- insert into table Artist:
insert into Artist(ArtistId, ArtistName) values (1, 'Katy Perry');
insert into Artist(ArtistId, ArtistName) values (2, 'Selena Gomez');
insert into Artist(ArtistId, ArtistName) values (3, 'Taylor Swift');
insert into Artist(ArtistId, ArtistName) values (4, 'Justin Timberlake');


-- insert into table Album:
insert into Album(AlbumId, AlbumTitle, ArtistId) values (101, 'Red', 3);
insert into Album(AlbumId, AlbumTitle, ArtistId) values (102, 'Fearless', 3);
insert into Album(AlbumId, AlbumTitle, ArtistId) values (103, '1989', 3);
insert into Album(AlbumId, AlbumTitle, ArtistId) values (104, 'Folklore', 3);
insert into Album(AlbumId, AlbumTitle, ArtistId) values (105, 'Evermore', 3);
insert into Album(AlbumId, AlbumTitle, ArtistId) values (106, 'Love Story', 3);
insert into Album(AlbumId, AlbumTitle, ArtistId) values (107, 'Revelacion', 2);
insert into Album(AlbumId, AlbumTitle, ArtistId) values (108, 'Rare', 2);
insert into Album(AlbumId, AlbumTitle, ArtistId) values (109, 'Man of the Woods', 4);


-- insert into table MediaType:
insert into MediaType(MediaTypeId, MediaTypeName) values (1, 'audio');
insert into MediaType(MediaTypeId, MediaTypeName) values (2, 'video');
insert into MediaType(MediaTypeId, MediaTypeName) values (3, 'live concert');


-- insert into table Genre:
insert into Genre(GenreId, GenreName) values (1, 'Country');
insert into Genre(GenreId, GenreName) values (2, 'Jazz');
insert into Genre(GenreId, GenreName) values (3, 'Pop');
insert into Genre(GenreId, GenreName) values (4, 'Latin');
insert into Genre(GenreId, GenreName) values (5, 'Hip hop');


-- insert into table Track:
insert into Track(TrackId, TrackName, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) 
values (1, 'Begin Again', 101, 1, 3, 'A.C', 60, 128, 200);
insert into Track(TrackId, TrackName, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) 
values (2, 'All Too Well', 101, 2, 5, 'K.J', 60, 320, 600);
insert into Track(TrackId, TrackName, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) 
values (3, 'Fifteen', 102, 3, 3, 'I.O', 90, 560, 200);
insert into Track(TrackId, TrackName, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) 
values (4, 'Bad Blood', 103, 2, 3, 'T.S', 100, 600, 800);
insert into Track(TrackId, TrackName, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) 
values (5, 'Epiphany', 104, 1, 1, 'M.N', 120, 500, 600);
insert into Track(TrackId, TrackName, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) 
values (6, 'Willow', 105, 1, 3, 'B.F', 80, 120, 200);
insert into Track(TrackId, TrackName, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) 
values (7, 'Ivy', 105, 1, 3, 'B.F', 90, 130, 200);
insert into Track(TrackId, TrackName, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) 
values (8, 'De Una Vez', 107, 2, 4, 'Selena.G', 100, 300, 500);
insert into Track(TrackId, TrackName, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) 
values (9, 'Baila Conmigo', 107, 2, 4, 'Selena.G', 103, 321, 400);
insert into Track(TrackId, TrackName, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) 
values (10, 'Rare', 108, 1, 3, 'Selena.G', 110, 300, 400);
insert into Track(TrackId, TrackName, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) 
values (11, 'Wave', 109, 1, 5, 'J.T', 150, 500, 600);


-- insert into Playlist:
insert into Playlist(PlaylistId, PlaylistName) values (1, 'My Favorite Songs'); -- no Latin!
insert into Playlist(PlaylistId, PlaylistName) values (2, 'Selena!');
insert into Playlist(PlaylistId, PlaylistName) values (3, 'Grunge'); -- no Latin!
insert into Playlist(PlaylistId, PlaylistName) values (4, 'Rmance!');
insert into Playlist(PlaylistId, PlaylistName) values (5, 'Soothing'); -- no Latin!


-- insert into PlaylistTrack:
insert into PlaylistTrack(PlaylistId, TrackId) values (1, 1);
insert into PlaylistTrack(PlaylistId, TrackId) values (1, 2);
insert into PlaylistTrack(PlaylistId, TrackId) values (1, 3);
insert into PlaylistTrack(PlaylistId, TrackId) values (1, 4);
insert into PlaylistTrack(PlaylistId, TrackId) values (1, 10);
insert into PlaylistTrack(PlaylistId, TrackId) values (1, 11);
insert into PlaylistTrack(PlaylistId, TrackId) values (2, 8);
insert into PlaylistTrack(PlaylistId, TrackId) values (2, 9);
insert into PlaylistTrack(PlaylistId, TrackId) values (2, 10);
insert into PlaylistTrack(PlaylistId, TrackId) values (3, 2);
insert into PlaylistTrack(PlaylistId, TrackId) values (3, 4);
insert into PlaylistTrack(PlaylistId, TrackId) values (4, 3);
insert into PlaylistTrack(PlaylistId, TrackId) values (4, 8);
insert into PlaylistTrack(PlaylistId, TrackId) values (4, 9);
insert into PlaylistTrack(PlaylistId, TrackId) values (5, 5);
insert into PlaylistTrack(PlaylistId, TrackId) values (5, 6);
insert into PlaylistTrack(PlaylistId, TrackId) values (5, 7);
insert into PlaylistTrack(PlaylistId, TrackId) values (5, 11);


-- insert into Employee:
insert into Employee(EmployeeId, EmpFirstName, EmpLastName, EmpTitle, ReportsTo, BirthDate, HireDate, EmpAddress, EmpCity, EmpState, EmpCountry, EmpPostalCode, EmpPhone, EmpFax, EmpEmail) 
values (1, 'Tina', 'Holmes', 'Supervisor', null, '1998-03-08', '2019-05-10', 'Richmond Street', 'London', 'Ontario', 'Canada', 111111, 01999999, 666, 'tina@amazon.ca'); 
insert into Employee(EmployeeId, EmpFirstName, EmpLastName, EmpTitle, ReportsTo, BirthDate, HireDate, EmpAddress, EmpCity, EmpState, EmpCountry, EmpPostalCode, EmpPhone, EmpFax, EmpEmail) 
values (2, 'John', 'Sanders', 'Employee', 1, '1995-04-11', '2018-02-03', 'Kings Street', 'London', 'Ontario', 'Canada', 222222, 01888888, 665, 'john@amazon.ca'); 
insert into Employee(EmployeeId, EmpFirstName, EmpLastName, EmpTitle, ReportsTo, BirthDate, HireDate, EmpAddress, EmpCity, EmpState, EmpCountry, EmpPostalCode, EmpPhone, EmpFax, EmpEmail) 
values (3, 'Victor', 'Frankel', 'Employee', 1, '1996-10-12', '2020-04-06', 'Princeton Street', 'Princeton', 'New Jersey', 'USA', 333333, 01777777, 664, 'victor@amazon.ca'); 
insert into Employee(EmployeeId, EmpFirstName, EmpLastName, EmpTitle, ReportsTo, BirthDate, HireDate, EmpAddress, EmpCity, EmpState, EmpCountry, EmpPostalCode, EmpPhone, EmpFax, EmpEmail) 
values (4, 'Leo', 'Manson', 'HR', 2, '1998-05-09', '2020-02-05', 'Yonge Street', 'Toronto', 'Ontario', 'Canada', 444444, 01666666, 663, 'leo@amazon.ca');
insert into Employee(EmployeeId, EmpFirstName, EmpLastName, EmpTitle, ReportsTo, BirthDate, HireDate, EmpAddress, EmpCity, EmpState, EmpCountry, EmpPostalCode, EmpPhone, EmpFax, EmpEmail) 
values (5, 'Barbara', 'Golan', 'Intern', 3, '2000-05-29', '2021-03-10', 'Adelaide Street', 'London', 'Ontario', 'Canada', 555555, 01555555, 662, 'barbara@amazon.ca')


-- insert into Customer:
insert into Customer(CustomerId, CustFirstName, CustLastName, Company, CustAddress, CustCity, CustState, CustCountry, CustPostalCode, CustPhone, CustFax, CustEmail, SupportRepId)
values (1, 'Behina', 'Holmes', 'Amazon', 'Melrose Street', 'Los Angeles', 'California', 'USA', 123456, 01456734, 343434, 'b_2@gmail.com', 3);
insert into Customer(CustomerId, CustFirstName, CustLastName, Company, CustAddress, CustCity, CustState, CustCountry, CustPostalCode, CustPhone, CustFax, CustEmail, SupportRepId)
values (2, 'Michael', 'Milani', 'Amazon', 'Water Street', 'Toronto', 'Ontario', 'Canada', 456900, 01541826, 782398, 'mich_mi@gmail.com', 4);
insert into Customer(CustomerId, CustFirstName, CustLastName, Company, CustAddress, CustCity, CustState, CustCountry, CustPostalCode, CustPhone, CustFax, CustEmail, SupportRepId)
values (3, 'Cameron', 'Pert', 'Amazon', 'Rose Street', 'London', 'Ontario', 'Canada', 122349, 01998543, 990089, 'cam_p@gmail.com', 2);


-- insert into Invoice:
insert into Invoice(InvoiceId, CustomerId, InvoiceDate, BillingAddress, BillingCity, BillingState, BillingCountry, BillingPostalCode, Total) 
values (1001, 1, '2021-01-08', 'Melrose Street', 'Los Angeles', 'California', 'USA', 123456, 1400);
insert into Invoice(InvoiceId, CustomerId, InvoiceDate, BillingAddress, BillingCity, BillingState, BillingCountry, BillingPostalCode, Total) 
values (1002, 2, '2021-04-06', 'Water Street', 'Toronto', 'Ontario', 'Canada', 456900, 400);
insert into Invoice(InvoiceId, CustomerId, InvoiceDate, BillingAddress, BillingCity, BillingState, BillingCountry, BillingPostalCode, Total) 
values (1003, 1, '2021-03-10', 'Melrose Street', 'Los Angeles', 'California', 'USA', 123456, 600);
insert into Invoice(InvoiceId, CustomerId, InvoiceDate, BillingAddress, BillingCity, BillingState, BillingCountry, BillingPostalCode, Total) 
values (1004, 3, '2021-05-03', 'Rose Street', 'London', 'Ontario', 'Canada', 122349, 600);


-- insert into InvoiceLine:
insert into InvoiceLine(InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) 
values (1, 1001, 2, 600, 1);
insert into InvoiceLine(InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) 
values (2, 1001, 4, 800, 1);
insert into InvoiceLine(InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) 
values (3, 1002, 10, 400, 1);
insert into InvoiceLine(InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) 
values (4, 1003, 11, 600, 1);
insert into InvoiceLine(InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) 
values (5, 1004, 2, 600, 1);


