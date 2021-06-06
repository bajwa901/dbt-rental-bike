{{ config(
    materialized="table",
    tags=["MOM Comparison"]
) }}
with duration_over_month as (
  select year
  , month as month_num
  , FORMAT_DATE("%b %Y",  start_time) month
  , round(avg(duration),2) AS duration
  , count(*) Rides
  from {{ref('bike_trips')}}
  group by 1,2,3
  )

select month
, ROW_NUMBER() OVER (ORDER BY year,month_num Asc) month_number
, rides
, duration
, ROUND((duration - LAG(duration) OVER(ORDER BY year,month_num ASC)) / LAG(duration) OVER(ORDER BY year,month_num ASC) * 100,2) AS duration_growth_rate
, ROUND((Rides - LAG(Rides) OVER(ORDER BY year,month_num ASC)) / LAG(Rides) OVER(ORDER BY year,month_num ASC) * 100,2) AS rides_growth_rate
from duration_over_month
order by  2  asc
