WITH dedup_query as (
    
Select
    *,
    ROW_NUMBER() OVER (PARTITION BY id ORDER BY updateDate Desc) AS dedup_key
FROM
    {{source('source', 'items') }}


)

Select 
    id, name , category , updateDate 
from 
    dedup_query
WHERE dedup_key=1