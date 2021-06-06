with filter_data_with_zero_trip_duration as(
    Select *
    from {{ source('london_bicycles', 'cycle_hire') }}
    where duration > 0 
),
 transformations as(
Select  bike_id
, rental_id
, start_date as start_time
, end_date as end_time
, round(duration/60) as duration
, start_station_id
, start_station_name
, end_station_id
, end_station_name
, end_station_logical_terminal
, start_station_logical_terminal
, end_station_priority_id
from filter_data_with_zero_trip_duration
)

, stg_london_bike_trips as (
select bike_id
, start_time
, end_time
, duration
, start_station_name
, end_station_name

from transformations
)
select * from stg_london_bike_trips