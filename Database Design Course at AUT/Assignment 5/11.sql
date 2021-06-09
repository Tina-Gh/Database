-- Queston 11:
select distinct(year)
from Movie, Rating 
where Movie.mID = Rating.mID and stars = 4 
union 
select distinct(year)
from Movie, Rating 
where Movie.mID = Rating.mID and stars = 5
order by year ASC;
