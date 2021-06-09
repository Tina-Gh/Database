-- Question 10:
select name, title, stars, ratingDate
from Movie, Rating, Reviewer
where Movie.mID = Rating.mID and Rating.rID = Reviewer.rID
order by name, title, stars;
