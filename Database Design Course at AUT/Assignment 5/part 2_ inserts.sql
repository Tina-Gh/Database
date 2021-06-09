-- insert into table Movie:
insert into Movie(mID, title, year, director) values (1, 'Howls Moving Castle', 2004, 'Hayao Miyazaki');
insert into Movie(mID, title, year, director) values (2, 'My Neighbor Totoro', 1988, 'Hayao Miyazaki'); -- is not going to have any ratings
insert into Movie(mID, title, year, director) values (3, 'Your Name', 2016, 'Makoto Shinkai');
insert into Movie(mID, title, year, director) values (4, 'Ready Player One', 2018, 'Steven Spielberg');
insert into Movie(mID, title, year, director) values (5, 'Saving Private Ryan', 1998, 'Steven Spielberg');
insert into Movie(mID, title, year, director) values (6, 'get out', 2017, 'Jordan Peele');
insert into Movie(mID, title, year, director) values (7, 'Superbabies', 2004, 'Bob Clark');


-- insert into table Reviewer:
insert into Reviewer(rID, name) values (1, 'Roger Ebert');
insert into Reviewer(rID, name) values (2, 'Gene Shalit');
insert into Reviewer(rID, name) values (3, 'Judith Crist');
insert into Reviewer(rID, name) values (4, 'Pauline Kael');


-- insert into table Rating:
insert into Rating(rID, mID, stars, ratingDate) values (1, 1, 2, '2005-02-02');
insert into Rating(rID, mID, stars, ratingDate) values (2, 1, 5, '2005-02-03');
insert into Rating(rID, mID, stars, ratingDate) values (3, 3, 4, '2016-10-10');
insert into Rating(rID, mID, stars, ratingDate) values (1, 5, 5, '2000-04-12');
insert into Rating(rID, mID, stars, ratingDate) values (4, 5, 5, '1999-03-08');
insert into Rating(rID, mID, stars, ratingDate) values (2, 4, 4, '2018-11-10');
insert into Rating(rID, mID, stars, ratingDate) values (1, 6, 3, '2017-09-12');
insert into Rating(rID, mID, stars, ratingDate) values (3, 6, 1, '2018-10-12');
