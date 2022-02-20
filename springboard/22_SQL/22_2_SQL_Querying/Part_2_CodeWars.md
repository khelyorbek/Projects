# Section 2 - More SQL (Including aggregates)
## [SQL Basics: Simple WHERE and ORDER BY](https://www.codewars.com/kata/sql-basics-simple-where-and-order-by/train/sql)
    SELECT * FROM people WHERE age > 50 ORDER BY age desc

## [SQL Basics: Simple SUM](https://www.codewars.com/kata/sql-basics-simple-sum)
    SELECT SUM(age) AS age_sum FROM people

## [SQL Basics: Simple MIN / MAX](https://www.codewars.com/kata/sql-basics-simple-min-slash-max/train/sql)
    SELECT MIN(age), MAX(age) FROM people

## [Find all active students](https://www.codewars.com/kata/1-find-all-active-students/train/sql)
    SELECT * FROM students WHERE IsActive LIKE 'true'; 

## [SQL Basics: Simple GROUP BY](https://www.codewars.com/kata/sql-basics-simple-group-by/train/sql)
    SELECT age, COUNT(age) AS people_count FROM people GROUP BY age;

## [SQL Basics: Simple HAVING](https://www.codewars.com/kata/sql-basics-simple-having/train/sql)
    SELECT age, COUNT(age) AS total_people FROM people GROUP BY age HAVING COUNT(age) >= 10

## [5 SUM and COUNT on SQLZoo](https://sqlzoo.net/wiki/SUM_and_COUNT)
### Task 1 - Total world population
    SELECT SUM(population)
    FROM world

### Task 2 - List of continents
    SELECT continent FROM world GROUP BY continent

### Task 3 - GDP of Africa
    SELECT SUM(gdp) FROM world WHERE continent = 'Africa'

### Task 4 - Count the big countries
    SELECT COUNT(*) FROM world WHERE area >= 1000000   

### Task 5 - Baltic states population
    SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

### Task 6 - Using GROUP BY and HAVING
    SELECT continent, COUNT(name) FROM world GROUP BY continent

### Task 7 - Counting big countries in each continent
    SELECT continent, COUNT(name) FROM world WHERE population >= 10000000 GROUP BY continent 

### Task 8 - Counting big continents
    SELECT continent FROM world GROUP BY continent HAVING SUM(population) >= 100000000
