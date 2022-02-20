-- Comments in SQL Start with dash-dash --

-- \d analytics
--                                  Table "public.analytics"
--      Column      |  Type   | Collation | Nullable |                Default
-- -----------------+---------+-----------+----------+---------------------------------------
--  id              | integer |           | not null | nextval('analytics_id_seq'::regclass)
--  app_name        | text    |           | not null |
--  category        | text    |           | not null |
--  rating          | real    |           |          |
--  reviews         | integer |           |          |
--  size            | text    |           |          |
--  min_installs    | integer |           |          |
--  price           | real    |           |          |
--  content_rating  | text    |           |          |
--  genres          | text[]  |           |          |
--  last_updated    | date    |           |          |
--  current_version | text    |           |          |
--  android_version | text    |           |          |
-- Indexes:
--     "analytics_pkey" PRIMARY KEY, btree (id)

-- Here are the rest of the queries you should write, phrased like your boss is asking for specific stuff:
-- 1. Find the app with an ID of 1880.
SELECT * FROM analytics WHERE id = 1880;

-- 2. Find the ID and app name for all apps that were last updated on August 01, 2018.
SELECT id, app_name FROM analytics WHERE last_updated = '2018-08-01';

-- 3. Count the number of apps in each category, e.g. “Family | 1972”.
SELECT category, COUNT(category) FROM analytics GROUP BY category;

-- 4. Find the top 5 most-reviewed apps and the number of reviews for each.
SELECT app_name, reviews FROM analytics GROUP BY app_name, reviews ORDER BY reviews desc LIMIT 5;

-- 5. Find the app that has the most reviews with a rating greater than equal to 4.8.
SELECT app_name FROM analytics WHERE rating >= 4.8 GROUP BY app_name, rating ORDER BY rating LIMIT 1;

-- 6. Find the average rating for each category ordered by the highest rated to lowest rated.
SELECT category, AVG(rating) FROM analytics GROUP BY category ORDER BY AVG(rating) desc;

-- 7. Find the name, price, and rating of the most expensive app with a rating that’s less than 3.
SELECT app_name, price, rating FROM analytics WHERE rating < 3 GROUP BY app_name, price, rating ORDER BY price desc;

-- 8. Find all apps with a min install not exceeding 50, that have a rating. Order your results by highest rated first.
SELECT app_name, rating FROM analytics WHERE min_installs <= 50 AND rating IS NOT NULL GROUP BY app_name, rating ORDER BY rating desc;

-- 9. Find the names of all apps that are rated less than 3 with at least 10000 reviews.
SELECT app_name, rating FROM analytics WHERE rating < 3 AND reviews > 10000;

-- 10. Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
SELECT app_name, reviews, price FROM analytics WHERE price BETWEEN 0.10 AND 1.00 GROUP BY app_name, reviews, price ORDER BY reviews desc LIMIT 10;

-- 11. Find the most out of date app. Hint: You don’t need to do it this way, but it’s possible to do with a subquery: http://www.postgresqltutorial.com/postgresql-max-function/
SELECT app_name, last_updated FROM analytics GROUP BY app_name, last_updated ORDER BY last_updated LIMIT 1;

-- 12. Find the most expensive app (the query is very similar to #11).
SELECT app_name, price FROM analytics GROUP BY app_name, price ORDER BY price desc LIMIT 1;

-- 13. Count all the reviews in the Google Play Store.
SELECT SUM(reviews) FROM analytics;

-- 14. Find all the categories that have more than 300 apps in them.
SELECT category, COUNT(app_name) FROM analytics GROUP BY category HAVING COUNT(app_name) > 300 ORDER BY COUNT(app_name) desc;

-- 15. Find the app that has the highest proportion of min_installs to reviews, among apps that have been installed at least 100,000 times. Display the name of the app along with the number of reviews, the min_installs, and the proportion.
SELECT app_name, reviews, min_installs, min_installs / reviews AS proportion FROM analytics GROUP BY app_name, reviews, min_installs ORDER BY proportion desc;