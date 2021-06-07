Welcome to dbt bike rental project!

## Table of Contents
1. [Problem Statement](#problem-statement)
2. [Architecture](#architecture)
3. [Modeling](#modeling)
4. [Approach](#approach)
5. [Cases](#cases)
6. [Conclusion](#conclusion)
7. [Reference](#reference)



### Problem Statement
This project is task from Growth Hackers Stockholm. A fictinal customer has acquired bike rental businesses in Austin, London and New York. Now they want to build dashboards to better understand their new business empire. Purpose of the project is to built workflow and analyse data using bigquery, dbt and data studio. Followng analysis is required as part of task

1. Top 20 performing stations last week, globally, in terms of rides started or duration of
rides started.
2. Most successful subscriber_type, year on year comparison (in terms of ride duration
minutes)
3. Break-down of last months riders, by age / gender groups (think bar charts)
4. Top Cities last month in terms of rides / duration

 ## Data ##
Data set is public dataset available in bigquery public dataset project. Following are the links to the data

1.  bigquery-public-data:new_york_citibike.citibike_trips
2.  bigquery-public-data:london_bicycles.cycle_hire
3.  bigquery-public-data:austin_bikeshare.bikeshare_trips



## Architecture
Following is the architecture diagram of the project. I have extended following diagram according to task requirements.
![GitHub Logo](/images/dbt-arch.png)

## Modeling
Following are the models built
1. stg_austin_biketrips (Materialization = View)
2. stg_austin_biketrips (Materialization = View)
3. stg_austin_biketrips (Materialization = View)
4. dwh_bike_trips (Materialization = View)
5. bike_trips (Materialization = Table)
6. mom_comparison (Materialization = Table)
7. yoy_comparison (Materialization = Table)

Table materialization is used for the models that are being used built dashboard to make dashboard's response time. Tests are also added for the models.
![GitHub Logo](/images/Modeling.PNG)




## Approach
I have use ELT appraoch to solve this problem. This approach was used beacuse raw data was already extracted and loaded in biqquery, I was required to transformed and analyse data. I have build the dataware house in bigquery using dbt and git hub with best practices. Workflow is automated using git hub actions. 

I have setup virtual machine on azure using terraform and done required installations. Dbt docs are also generated and hosted on machine. Link to the dbt docs is http://40.121.141.175:8080. In case if link is not working that might be due to hosted machine is down. You can reach me out, I will make sure machine is up and link is working as expected.

Following points are implemented 
1. Data Filteration
2. Time conversion
3. Unit conversion
4. Adding Columns

## Cases
Link to the dashboard [link](https://datastudio.google.com/reporting/c1de4bd1-a4e3-45b6-83fa-fe46e9e502bb).

1. Top 20 performing stations last week, globally, in terms of rides started or duration of
rides started.

![GitHub Logo](/images/Q1.PNG)

2. Most successful subscriber_type, year on year comparison (in terms of ride duration
minutes)

![GitHub Logo](/images/Q2-a.PNG)   




![GitHub Logo](/images/Q2-b.PNG) 
   

3. Break-down of last months riders, by age / gender groups (think bar charts)

![GitHub Logo](/images/Q3.PNG)  

4. Top Cities last month in terms of rides / duration

![GitHub Logo](/images/Q4.PNG)  



## Conclusion
By analysing the rental bike data I have following observations
1. Males are dominant and are large in number when it comes to rent/ride bike.
2. Peak times are from 7 AM to 8 AM and 5 PM to 6 PM.
3. There is trend in rides, number of rides increases in summer and decreased in winter.
4. Top performing subscribers are in terms of Duration

    1. Try before you Buy Special
    2. Walk Up
    3. Explorere ($8 plus tax)

![GitHub Logo](/images/dashboard.jpg)  



### Reference
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Architecture [Diagram](https://raw.githubusercontent.com/fishtown-analytics/dbt/6c6649f9129d5d108aa3b0526f634cd8f3a9d1ed/etc/dbt-arch.png)
- https://www.youtube.com/watch?v=GvI1s6zOWNo
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
