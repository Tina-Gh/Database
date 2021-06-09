-- Question 4:
-- Size: (TrackId == 2) + (TrackId == 4) = 320 + 600 = 920
-- Price: (TrackId == 2) + (TrackId == 4) = 600 + 800 = 1400
select sum(Bytes) as Size, sum(UnitPrice) as Price
from Playlist, PlaylistTrack, Track
where Playlist.PlaylistId = PlaylistTrack.PlaylistId and PlaylistTrack.TrackId = Track.TrackId and
PlaylistName = 'Grunge';

