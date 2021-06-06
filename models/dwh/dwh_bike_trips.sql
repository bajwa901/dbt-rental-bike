{{ config(
    
    tags=["Combined Bike Trips of cities"]
) }}

with ny_biketrip as (
select 'New York' as city
, bike_id
, start_time
, end_time
, EXTRACT(HOUR from start_time) as hour
, EXTRACT(WEEK from start_time) as week
, EXTRACT(DAYOFWEEK from start_time) as week_day
, EXTRACT(MONTH from start_time) as month
, EXTRACT(QUARTER from start_time) as quarter
, EXTRACT(YEAR from start_time) as year
, duration
, start_station_name
, end_station_name
, 'null' as subscriber_type
, user_type
, age
, birth_year
, gender
from {{ref('stg_ny_biketrips')}}
)
, london_biketrip as (
select 'London' as City
, bike_id
, start_time
, end_time
, EXTRACT(HOUR from start_time) as hour
, EXTRACT(WEEK from start_time) as week
, EXTRACT(DAYOFWEEK from start_time) as week_day
, EXTRACT(MONTH from start_time) as month
, EXTRACT(QUARTER from start_time) as quarter
, EXTRACT(YEAR from start_time) as year
, duration
, start_station_name
, end_station_name
, 'null' as subscriber_type
, 'null' as user_type
, 0 as age
, 0 as birth_year
, 'null' as gender
from {{ref('stg_london_biketrips')}}
)
, austin_biketrip as (
select 'Austin' as City
, bike_id
, start_time
, end_time
, EXTRACT(HOUR from start_time) as hour
, EXTRACT(WEEK from start_time) as week
, EXTRACT(DAYOFWEEK from start_time) as week_day
, EXTRACT(MONTH from start_time) as month
, EXTRACT(QUARTER from start_time) as quarter
, EXTRACT(YEAR from start_time) as year
, duration
, start_station_name
, end_station_name
, subscriber_type
, 'null' as user_type
, 0 as age
, 0 as birth_year
, 'null' as gender

from {{ref('stg_austin_biketrips')}}
) 
, dwh as (
Select *  from ny_biketrip 
Union ALL
Select * from london_biketrip 
Union ALL
select * from austin_biketrip 
)
select * from dwh
