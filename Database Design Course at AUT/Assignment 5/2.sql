-- question 2
select * 
from Artist
where ArtistId not in (select ArtistId                           
					   from Track, Genre, Album
					   where Track.GenreId = Genre.GenreId and GenreName = 'Latin' and Track.AlbumId = Album.AlbumId);

