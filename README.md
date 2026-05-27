# Netflix_SQL_Project Data Analysis Project
## Project Overview

This project focuses on analyzing Netflix data using SQL Queries.
The Dataset contains information about Movies and TV Shows available on Netflix, including title,director,cast,country,release year,rating,duration and genres.

The main Objective Of This Project is to Solve real World Business Problems Using SQL Concept 

-Filtering
-Group By
-Aggregate Function
-Window Functions
-String Functions
-Date Functions
-Subqueries
-Common SQL Analysis Techniques

# Technologies USED

-PostgreSQL
-SQL
- CSV Dataset
- pgAdmin
  
# 📂 Dataset Information

The dataset contains the following columns:

- show_id
- type
- title
- director
- casts
- country
- date_added
- release_year
- rating
- duration
- listed_in
- description

# 🚀 SQL Concepts Used

## 🔹 Aggregate Functions
- COUNT()
- MAX()
- AVG()

## 🔹 String Functions
- SPLIT_PART()
- STRING_TO_ARRAY()
- UNNEST()

## 🔹 Window Functions
- RANK() OVER()

## 🔹 Date Functions
- TO_DATE()
- EXTRACT()
- CURRENT_DATE
- INTERVAL

## 🔹 Filtering & Conditions
- WHERE
- LIKE
- ILIKE
- AND

## 🔹 Grouping & Sorting
- GROUP BY
- ORDER BY
- LIMIT




# 📊 Business Problems Solved

## 1️⃣ Count Movies vs TV Shows
Analyzed the total number of Movies and TV Shows available on Netflix.

select type,count(*) as total_content
from netflix
group by type;


## 2️⃣ Most Common Rating
Found the most frequent rating category for Movies and TV Shows using Window Functions.

select 
	type,
	 rating
from 
(
select 
	type,
	rating,
	count(*),
	RANK() OVER(PARTITION BY TYPE ORDER BY COUNT(*) DESC)as ranking
from netflix
group by 1,2
) as t1
where ranking=1


## 3️⃣ Movies Released in 2020
Filtered all movies released in the year 2020.

select * from netflix
select * from netflix where type='Movie'
AND
release_year=2020;



## 4️⃣ Top 5 Countries with Most Content
Identified countries producing the highest amount of Netflix content.

select
	unnest(string_to_Array(country,',')) as new_country,
	COUNT(show_id) as total_content
from netflix

group by 1
order by 2 desc
limit 5


select 
	unnest(string_to_Array(country,',')) as new_country

from netflix


## 5️⃣ Longest Movie
Found the movie with the maximum duration.


select * from netflix
where 
  type = 'Movie'
  AND
  duration = (Select max(duration) from netflix)

## 6️⃣ Content Added in Last 5 Years
Analyzed recently added Netflix content.


select 
	*
from netflix
where 
		to_date(date_added,'Month DD,YYYY')>=Current_DATE -INTERVAL '5 years'
select current_date - interval '5 years'

## 7️⃣ Content by Director Rajiv Chilaka
Retrieved all movies and TV Shows directed by Rajiv Chilaka.

select *  from netflix
where director like '%Rajiv Chilaka%';

## 8️⃣ TV Shows with More Than 5 Seasons
Filtered TV Shows having more than five seasons.
select
*
from netflix
where type ='TV Show'
and
SPLIT_PART(duration,' ',1)::numeric >5

## 9️⃣ Content Count by Genre

Calculated the number of content items available in each genre.
select
	unnest(string_to_array(listed_in,',')) as genre,
	count(show_id)as total_content
	
from netflix
group by 1

## 🔟 Netflix Content Released by India
Analyzed yearly content releases from India.
select 
	Extract(YEAR FROM TO_DATE(date_added ,'Month DD,YYYY'))as year,
	count(*)
from netflix
where country='India'
group by 1


## 1️⃣1️⃣ Documentary Movies
Filtered all documentary movies available on Netflix.

select * from netflix
where listed_in Ilike '%documentaries';


## 1️⃣2️⃣ Content Without Director
Found records where director information is missing.

select * from netflix
where director is null;

## 1️⃣3️⃣ Salman Khan Movies in Last 10 Years
Analyzed Salman Khan appearances in Netflix movies released during the last decade.

select * from netflix
where casts like '%Salman Khan%'
and
release_year > Extract(year from current_Date)-10


# 📈 Key Learnings

Through this project, I improved my understanding of:

- Real-world SQL problem solving
- Data cleaning techniques
- Handling null values
- Advanced SQL queries
- Data filtering and analysis
- PostgreSQL query optimization
- Business data interpretation

- --

# 🎯 Project Outcome

This project helped me strengthen my SQL skills by solving practical business-related queries on a real dataset. It also improved my analytical thinking and database handling abilities.

---


## Author
Om Ramesh Patil
Aspiring Data Analytic & SQL Developer
Passionate about Data Analysis and Backend Development

