{{ config(
    materialized="table",
    tags=["YOY Comparison"]
) }}
with duration_over_year as (
  select year
  , round(avg(duration),2) AS duration
  , count(*) Rides
  from {{ref('dwh_bike_trips')}}
  group by 1
  )

select *
, ROUND((duration - LAG(duration) OVER(ORDER BY year ASC)) / LAG(duration) OVER(ORDER BY year ASC) * 100,2) AS duration_growth_rate
, ROUND((Rides - LAG(Rides) OVER(ORDER BY year ASC)) / LAG(Rides) OVER(ORDER BY year ASC) * 100,2) AS rides_growth_rate
from duration_over_year
order by  year asc
