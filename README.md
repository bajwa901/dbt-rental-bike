Welcome to dbt bike rental project!

## Table of Contents
1. [Problem Statement](#problem-statement)
2. [Architecture](#architecture)
3. [Modeling](#modeling)
4. [Approach](#approach)
5. [Cases](#cases)
6. [Conclusion](#conclusion)
### Problem Statement
This project is task from Growth Hackers. A fictinal customer has acquired bike rental businesses in Austin, London and New York. Now they want to build dashboards to better understand their new business empire. Purpose of the project is to built workflow and analyse data using bigquery, dbt and data studio. Followng analysis is required as part of task

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
Following is the architecture diagram of the project

## Modeling
![GitHub Logo](/images/Modeling.PNG)

## Approach
We have use ELT appraoch to solve this problem. This approach was used beacuse raw data was already extracted and loaded in biqquery, we were required to transformed and analyse data. We have build the dataware house in bigquery using dbt and git hub with best practices. Workflow is automated using git hub actions. 

## Cases





## Conclusion









Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
