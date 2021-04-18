select *,
	ROW_NUMBER() over (order by PostalCode) as RowNumber, 
	RANK() over (order by PostalCode) as RankNumber,
	DENSE_RANK() over (order by PostalCode) as DenseRank
from People;



