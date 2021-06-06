with filterDataWithZeroTripDuration as(
    Select *
    from {{ source('austin_bikeshare', 'bikeshare_trips') }}
    where duration_minutes > 0 
    )
, transformations as(
Select  CAST(bikeid as int64)as bike_id
, trip_id
, start_time
, CAST(duration_minutes as float64) as duration
, start_station_id
, start_station_name
, end_station_id
, end_station_name
, IFNULL(if(REGEXP_CONTAINS(subscriber_type,'Single Trip'),'Single Trip Ride',subscriber_type), 'unknown') as subscriber_type
from filterDataWithZeroTripDuration
)
, endTimeCalculation as(
Select 
*
, DATETIME_ADD(start_time, INTERVAL CAST(duration as int64) MINUTE) as end_time
from transformations

)
, stgaustinBikeTrips as (
select bike_id
, start_time
, end_time
, duration
, start_station_name
, end_station_name
, subscriber_type
from endTimeCalculation
)
select * from stgaustinBikeTrips