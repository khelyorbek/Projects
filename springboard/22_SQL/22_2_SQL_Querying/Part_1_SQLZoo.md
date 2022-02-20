[Link to exercises](https://sqlzoo.net/wiki/SQL_Tutorial)

# Section 0 - SELECT basics
## Task 1
    SELECT population FROM world
    WHERE name = 'Germany
    

## Task 2
    SELECT name, population FROM world
    WHERE name IN ('Sweden', 'Norway','Denmark');

## Task 3
    SELECT name, area FROM world
    WHERE area BETWEEN 200000 AND 250000
 
# Section 1 - SELECT names
## Task 1
    SELECT name FROM world
    WHERE name LIKE 'Y%'

## Task 2 
    SELECT name FROM world
    WHERE name LIKE '%y'

## Task 3
    SELECT name FROM world
    WHERE name LIKE '%x%'

## Task 4
    SELECT name FROM world
    WHERE name LIKE '%land'

## Task 5
    SELECT name FROM world
    WHERE name LIKE 'C%ia'

## Task 6
    SELECT name FROM world  
    WHERE name LIKE '%oo%'

## Task 7
    SELECT name FROM world
    WHERE name LIKE '%a%a%a%'

## Task 8
    SELECT name FROM world
    WHERE name LIKE '_t%'
    ORDER BY name

## Task 9
    SELECT name FROM world
    WHERE name LIKE '%o__o%'

## Task 10
    SELECT name FROM world
    WHERE name LIKE '____'

## Task 11
    SELECT name
    FROM world
    WHERE name LIKE capital

## Task 12
    SELECT name
    FROM world
    WHERE capital LIKE concat(name, ' City')

## Task 13
    SELECT capital, name
    FROM world
    WHERE capital LIKE concat(name, '%')

## Task 14
    SELECT capital, name
    FROM world
    WHERE capital LIKE concat(name, '_%')

## Task 15
    SELECT name, REPLACE(capital, name, '') as ext
    FROM world
    WHERE capital LIKE concat(name, '_%')
