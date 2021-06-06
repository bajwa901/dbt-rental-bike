with filterDataWithZeroTripDuration as(
    Select *
    from {{ source('new_york_citibike', 'citibike_trips') }}
    where tripduration > 0 
),
 transformations as(
Select bikeid as bike_id
, timestamp( starttime, "UTC") as start_time
, timestamp( stoptime, "UTC") as end_time
, round(tripduration/60) as duration
, start_station_id
, start_station_name
, start_station_latitude
, start_station_longitude
, end_station_id
, end_station_name
, end_station_latitude
, end_station_longitude
, usertype user_type
, birth_year
, gender
, customer_plan
from filterDataWithZeroTripDuration
)
, ageCalculation as (
Select 
*
, EXTRACT(YEAR from  Current_Date()) - birth_year as age,
from transformations
)

, stgNyBikeTrips as (
select bike_id
, start_time
, end_time
, duration
, start_station_name
, start_station_latitude
, start_station_longitude
, end_station_name
, end_station_latitude
, end_station_longitude
, user_type
, age
, birth_year
, gender
from ageCalculation
)
select * from stgNyBikeTrips