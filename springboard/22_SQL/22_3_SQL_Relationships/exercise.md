# Part One: Getting Started

Let’s start with the following sql file called data.sql.

Download the starter code, and first, take a look at the SQL in that file and make sure you understand what it is doing. Once you have read that code, run the following in the unzipped folder:

    $ psql < data.sql
    $ psql joins_exercise

## Join the two tables so that every column and record appears, regardless of if there is not an owner_id. Your output should look like this:
    SELECT * FROM owners 
    JOIN vehicles 
    ON owners.id = vehicles.owner_id;
| id | first_name | last_name | id |  make  |  model  | year |  price   | owner_id|
|----|------------|-----------|----|--------|---------|------|----------|---------|
|  1 | Bob        | Hope      |  1 | Toyota | Corolla | 2002 |  2999.99 |    1    |
|  1 | Bob        | Hope      |  2 | Honda  | Civic   | 2012 | 12999.99 |    1    |
|  2 | Jane       | Smith     |  3 | Nissan | Altima  | 2016 | 23999.99 |    2    |
|  2 | Jane       | Smith     |  4 | Subaru | Legacy  | 2006 |  5999.99 |    2    |
|  3 | Melody     | Jones     |  5 | Ford   | F150    | 2012 |  2599.99 |    3    |
|  3 | Melody     | Jones     |  6 | GMC    | Yukon   | 2016 | 12999.99 |    3    |
|  4 | Sarah      | Palmer    |  7 | GMC    | Yukon   | 2014 | 22999.99 |    4    |
|  4 | Sarah      | Palmer    |  8 | Toyota | Avalon  | 2009 | 12999.99 |    4    |
|  4 | Sarah      | Palmer    |  9 | Toyota | Camry   | 2013 | 12999.99 |    4    |
|  5 | Alex       | Miller    | 10 | Honda  | Civic   | 2001 |  7999.99 |    5    |
|  6 | Shana      | Smith     | 11 | Nissan | Altima  | 1999 |  1899.99 |    6    |
|  6 | Shana      | Smith     | 12 | Lexus  | ES350   | 1998 |  1599.99 |    6    |
|  6 | Shana      | Smith     | 13 | BMW    | 300     | 2012 | 22999.99 |    6    |
|  6 | Shana      | Smith     | 14 | BMW    | 700     | 2015 | 52999.99 |    6    |
(14 rows)

## Count the number of cars for each owner. Display the owners first_name, last_name and count of vehicles. The first_name should be ordered in ascending order. Your output should look like this:
    SELECT first_name, last_name, COUNT(first_name) AS count 
    FROM owners 
    JOIN vehicles 
    ON owners.id = vehicles.owner_id 
    GROUP BY owners.first_name, owners.last_name 
    ORDER BY count;

|  first_name | last_name | count |
| ------------|-----------|------ |
|  Alex       | Miller    |     1 |
|  Bob        | Hope      |     2 |
|  Melody     | Jones     |     2 |
|  Jane       | Smith     |     2 |
|  Sarah      | Palmer    |     3 |
|  Shana      | Smith     |     4 |
(6 rows)

## Count the number of cars for each owner and display the average price for each of the cars as integers. Display the owners first_name, last_name, average price and count of vehicles. The first_name should be ordered in descending order. Only display results with more than one vehicle and an average price greater than 10000. Your output should look like this:
    SELECT first_name, last_name, 
        CAST(AVG(price) AS int) AS average_price, 
        COUNT(owner_id) 
    FROM owners 
    JOIN vehicles 
    ON owners.id = vehicles.owner_id 
    GROUP BY (first_name, last_name)
    HAVING COUNT(owner_id) > 1 AND CAST(AVG(price) AS int) > 10000 
    ORDER BY count DESC;
| first_name | last_name | average_price | count |
|------------|-----------|---------------|-------|
| Shana      | Smith     |         19875 |     4 |
| Sarah      | Palmer    |         16333 |     3 |
| Jane       | Smith     |         15000 |     2 |
(3 rows)


# Part Two: SQL Zoo
Complete the exercises in the Tutorials steps 6 and 7 in https://sqlzoo.net/
## 6 JOIN
### Task 1
    SELECT matchid, player FROM goal 
    WHERE teamid LIKE 'GER'

### Task 2
    SELECT id, stadium,team1,team2
    FROM game WHERE id=1012

### Task 3
    SELECT player,teamid, stadium, mdate
    FROM game JOIN goal ON (id=matchid) WHERE teamid = 'GER'

### Task 4
    SELECT team1, team2, player
    FROM game JOIN goal ON (id=matchid)
    WHERE player LIKE 'Mario%'

### Task 5
    SELECT player, teamid, coach, gtime
    FROM goal JOIN eteam on teamid=id
    WHERE gtime<=10

### Task 6
    SELECT mdate, teamname
    FROM game JOIN eteam on eteam.id=game.team1
    WHERE coach = 'Fernando Santos'

### Task 7
    SELECT player FROM goal
    JOIN game ON goal.matchid=game.id
    WHERE stadium = 'National Stadium, Warsaw'

### Task 8
    SELECT DISTINCT player, gtime
    FROM game JOIN goal ON matchid = id 
    WHERE (teamid!='GER' AND team1='GER' OR team2='GER')

### Task 9
    SELECT teamname, COUNT(teamid)
    FROM eteam JOIN goal ON id=teamid
    GROUP BY teamname
    ORDER BY teamname

### Task 10
    SELECT stadium, COUNT(gtime)
    FROM game JOIN goal ON game.id=goal.matchid
    GROUP BY stadium
    ORDER BY stadium

### Task 11
    SELECT matchid, mdate, COUNT(gtime)
    FROM game JOIN goal ON matchid = id 
    WHERE (team1 = 'POL' OR team2 = 'POL')
    GROUP BY matchid, mdate

### Task 12
    SELECT matchid, mdate, COUNT(mdate)
    FROM game JOIN goal ON matchid = id 
    WHERE (team1 = 'GER' AND team2 != 'GER') OR (team1 != 'GER' AND team2 = 'GER')
    GROUP BY matchid, mdate

## 7 More JOIN operations

### Task 1
    SELECT id, title
    FROM movie
    WHERE yr=1962

### Task 2
    SELECT yr 
    FROM movie 
    WHERE title = 'Citizen Kane'

### Task 3
    SELECT id, title, yr
    FROM movie
    WHERE title LIKE '%Star Trek%'
    ORDER BY yr

### Task 4
    SELECT id 
    FROM actor
    WHERE name = 'Glenn Close'

### Task 5
    SELECT id 
    FROM movie
    WHERE title = 'Casablanca'

### Task 6
    SELECT name
    FROM casting 
    JOIN actor 
    ON actor.id = casting.actorid
    WHERE movieid=11768

### Task 7
    SELECT name
    FROM casting 
    JOIN actor 
    ON actor.id = casting.actorid
    JOIN movie
    ON movie.id = casting.movieid
    WHERE title = 'Alien'

### Task 8
    SELECT title
    FROM movie 
    JOIN casting
    ON movie.id = casting.movieid
    JOIN actor
    ON actor.id = casting.actorid
    WHERE name = 'Harrison Ford'

### Task 9
    SELECT title
    FROM movie 
    JOIN casting
    ON movie.id = casting.movieid
    JOIN actor
    ON actor.id = casting.actorid
    WHERE name = 'Harrison Ford' AND ord!=1


### Task 10 !
    Don't understand the question. Skipping.


### Task 11
    SELECT yr,COUNT(title) FROM
    movie JOIN casting ON movie.id=movieid
            JOIN actor   ON actorid=actor.id
    WHERE name='Rock Hudson'
    GROUP BY yr
    HAVING COUNT(title) > 2

### Task 12 !
    SELECT title, name
    FROM movie
    JOIN casting
    ON movie.id = casting.movieid
    JOIN actor
    ON casting.actorid = actor.id
    WHERE name = 'Julie Andrews' AND ord!=1


### Task 13 !
    SELECT name
    FROM actor
    JOIN casting
    ON actor.id = casting.actorid
    GROUP BY name
    ORDER BY name
    HAVING casting.ord=1

### Task 14 !
    SELECT title, COUNT(actorid)
    FROM casting
    JOIN movie
    ON movie.id = casting.movieid
    WHERE yr = 1978
    GROUP BY title
    ORDER BY COUNT(actorid), title


### Task 15
    SELECT *
    FROM actor
    JOIN casting
    ON actor.id = casting.actorid
    JOIN movie
    ON movie.id = casting.movieid

Got an Error:
Lost connection to MySQL server during query