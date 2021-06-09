-- -- question 1:
select *
from Artist
where ArtistId not in (select Artist.ArtistId
					   from Artist, Album
					   where Artist.ArtistId = Album.ArtistId);

