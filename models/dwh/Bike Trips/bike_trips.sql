{{ config(
    materialized="table",
    tags=["Bike Trips"]
) }}
with bike_trips as (
select 
* 
from {{ref('dwh_bike_trips')}} where year >=2015 and year <=2017 and month <=6

)

Select * from bike_trips
