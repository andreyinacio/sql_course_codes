/* Part 1: Yelp Dataset Profiling and Understanding */

/* 1. Profile the data by finding the total number of records for each of the tables below: */
SELECT COUNT(*)
FROM attribute;

SELECT COUNT(*)
FROM business;

SELECT COUNT(*)
FROM category;

SELECT COUNT(*)
FROM checkin;

SELECT COUNT(*)
FROM elite_years;

SELECT COUNT(*)
FROM friend;

SELECT COUNT(*)
FROM hours;

SELECT COUNT(*)
FROM photo;

SELECT COUNT(*)
FROM review;

SELECT COUNT(*)
FROM tip;

SELECT COUNT(*)
FROM user;

/* 2. Find the total distinct records by either the foreign key or primary key for each table. 
If two foreign keys are listed in the table, please specify which foreign key. */
SELECT COUNT(DISTINCT id)
FROM business;

SELECT COUNT(DISTINCT business_id)
FROM hours;

SELECT COUNT(DISTINCT business_id)
FROM category;

SELECT COUNT(DISTINCT business_id)
FROM attribute;

SELECT COUNT(DISTINCT id)
FROM review;

SELECT COUNT(DISTINCT business_id)
FROM review;

SELECT COUNT(DISTINCT user_id)
FROM review;

SELECT COUNT(DISTINCT id)
FROM photo;

SELECT COUNT(DISTINCT business_id)
FROM photo;

SELECT COUNT(DISTINCT user_id)
FROM tip;

SELECT COUNT(DISTINCT business_id)
FROM tip;

SELECT COUNT(DISTINCT id)
FROM user;

SELECT COUNT(DISTINCT user_id)
FROM friend;

SELECT COUNT(DISTINCT user_id)
FROM elite_years;

/* 3. Are there any columns with null values in the Users table? Indicate "yes," or "no." */
SELECT COUNT(*)
FROM user
WHERE name IS NULL
OR review_count IS NULL
OR yelping_since IS NULL
OR useful IS NULL
OR funny IS NULL
OR cool IS NULL
OR fans IS NULL
OR average_stars IS NULL
OR compliment_hot IS NULL
OR compliment_more IS NULL
OR compliment_profile IS NULL
OR compliment_cute IS NULL
OR compliment_list IS NULL
OR compliment_note IS NULL
OR compliment_plain IS NULL
OR compliment_cool IS NULL
OR compliment_funny IS NULL
OR compliment_writer IS NULL
OR compliment_photos IS NULL;

/* 4. For each table and column listed below, display the smallest (minimum), largest (maximum),
and average (mean) value for the following fields: */
SELECT MIN(stars),
MAX(stars), 
AVG(stars)
FROM review;

SELECT MIN(stars),
MAX(stars), 
AVG(stars)
FROM business;

SELECT MIN(likes), 
MAX(likes), 
AVG(likes)
FROM tip

SELECT MIN(count), 
MAX(count), 
AVG(count)
FROM checkin;

SELECT MIN(review_count),
MAX(review_count),
AVG(review_count)
FROM user;

/* 5. List the cities with the most reviews in descending order: */
SELECT city, 
SUM(review_count)
FROM business
GROUP BY city
ORDER BY SUM(review_count) DESC;

/* 6. Find the distribution of star ratings to the business in the following cities: */
/* i. Avon */
SELECT stars, 
COUNT(stars)
FROM business
WHERE city = 'Avon'
GROUP BY stars;


/* ii. Beachwood */
SELECT stars, 
COUNT(stars)
FROM business
WHERE city = 'Beachwood'
GROUP BY stars;

/* 7. Find the top 3 users based on their total number of reviews: */
SELECT name, 
review_count
FROM user
ORDER by review_count DESC
LIMIT 3;

/* 8. Does posing more reviews correlate with more fans? */
SELECT fans, 
review_count
FROM user
ORDER BY fans DESC;

/* 9. Are there more reviews with the word "love" or with the word "hate" in them? */
SELECT COUNT(text)
FROM review
WHERE text 
LIKE '%love%';

SELECT COUNT(text)
FROM review
WHERE text 
LIKE '%hate%';

/* 10. Find the top 10 users with the most fans: */
SELECT name, 
fans
FROM user
ORDER BY fans DESC
LIMIT 10;

/* Part 2: Inferences and Analysis */

/* 1. Pick one city and category of your choice and group the businesses in that city or 
category by their overall star rating. Compare the businesses with 2-3 stars to the 
businesses with 4-5 stars and answer the following questions. Include your code.
i. Do the two groups you chose to analyze have a different distribution of hours? 
ii. Do the two groups you chose to analyze have a different number of reviews? 
iii. Are you able to infer anything from the location data provided between these two groups?
Explain. */
SELECT 
b.city, 
c.category, 
b.stars, 
h.hours, 
b.review_count, 
b.address
FROM business b 
INNER JOIN category c
ON b.id = c.business_id
INNER JOIN hours h
ON b.id = h.business_id
WHERE b.city = 'Chandler' 
AND category = 'Nightlife'
ORDER BY stars DESC;

/* 2. Group business based on the ones that are open and the ones that are closed. What 
differences can you find between the ones that are still open and the ones that are closed? 
List at least two differences and the SQL code you used to arrive at your answer. */
SELECT 
COUNT(id), 
is_open, 
ROUND(AVG(stars), 2), 
ROUND(AVG(review_count))
FROM business
GROUP BY is_open;

/* 3. For this last part of your analysis, you are going to choose the type of analysis you 
want to conduct on the Yelp dataset and are going to prepare the data for analysis. */
SELECT
b.name, 
b.city, 
c.category, 
b.stars, 
b.review_count
FROM business b 
INNER JOIN category c
ON b.id = c.business_id
WHERE category = 'Nightlife'
ORDER BY review_count DESC;