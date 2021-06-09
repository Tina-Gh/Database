-- Question 5:
select Artist.ArtistId, ArtistName, count(TrackId)
from Artist, Album, Track
where Artist.ArtistId = Album.ArtistId and Album.AlbumId = Track.AlbumId 
group by Artist.ArtistId
having count(TrackId) > 5;
