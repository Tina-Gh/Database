-- Question 7:
select title
from Movie
where mID not in (select distinct(mID)
				  from Rating);
                                             
