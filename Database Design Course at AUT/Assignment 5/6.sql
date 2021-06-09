-- Question 6:
select *
from Playlist
where PlaylistId not in (select distinct(Playlist.PlaylistId)
						 from Playlist, PlaylistTrack, Track, Genre
						 where Playlist.PlaylistId = PlaylistTrack.PlaylistId 
                         and PlaylistTrack.TrackId = Track.TrackId 
						 and Track.GenreId = Genre.GenreId and GenreName = 'Latin');
                         
                         