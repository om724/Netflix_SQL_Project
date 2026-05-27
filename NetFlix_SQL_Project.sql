--Netflix Project
select * from netflix;
select 
	count(*) 
from netflix;

select * from netflix;


select 
distinct type
from netflix;

-- 15 Bussiness Problem
--Q1 Count the number of movies vs TV Shows
select count(type) from netflix where  type='Movie';
--6131
select count(type) from netflix where type='TV Show';
--2676
select * from netflix;

select type,count(*) as total_content
from netflix
group by type;

--Q2 Find The Most Common rating for movies and TV 

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


--Q3 List all movie released in a specific year(e.g 2020)

select * from netflix

select * from netflix where type='Movie'
AND
release_year=2020;


--Q4 Find the top 5 countries with the most content on Netflix
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

--Q5 Identify the longest movie

select * from netflix
where 
  type = 'Movie'
  AND
  duration = (Select max(duration) from netflix)

--Q6  Find Content Added in the last five year

select 
	*
from netflix
where 
		to_date(date_added,'Month DD,YYYY')>=Current_DATE -INTERVAL '5 years'

select current_date - interval '5 years'

--Q7 Find All the movies/ TV shows by director 'Rajiv Chilaka'
select *  from netflix
where director like '%Rajiv Chilaka%';

--Q 8 List all TV shows with more than 5 seasons
select
*
from netflix
where type ='TV Show'
and
SPLIT_PART(duration,' ',1)::numeric >5


--Q9 Count the number of content items in each genre
select
	unnest(string_to_array(listed_in,',')) as genre,
	count(show_id)as total_content
	
from netflix
group by 1

--Q10 Find each year and the average number of content relases by india on netflix return top 5 year with highest avg content release

select 
	Extract(YEAR FROM TO_DATE(date_added ,'Month DD,YYYY'))as year,
	count(*)
from netflix
where country='India'
group by 1

--Q11 List all movies thats are documentaries

select * from netflix
where listed_in Ilike '%documentaries';

--Q12 find all the content without a director

select * from netflix
where director is null;

--Q13 Find How Many Movies actor 'Salman Khan 'apperared in last 10 years
select * from netflix
where casts like '%Salman Khan%'
and
release_year > Extract(year from current_Date)-10