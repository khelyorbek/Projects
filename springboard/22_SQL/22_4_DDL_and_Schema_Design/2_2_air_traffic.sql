-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

INSERT INTO passengers (first_name, last_name)
VALUES
('Jennifer', 'Finch'),
('Thadeus', 'Gathercoal'),
('Sonja', 'Pauley'),
('Jennifer', 'Finch'),
('Waneta', 'Skeleton'),
('Thadeus', 'Gathercoal'),
('Berkie', 'Wycliff'),
('Alvin', 'Leathes'),
('Berkie', 'Wycliff'),
('Cory', 'Squibbes');

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  country_name TEXT
);

INSERT INTO countries (country_name)
VALUES
('United States'), --1
('Japan'), --2
('United Kingdom'), --3
('Mexico'), --4
('France'), --5
('Morocco'), --6
('UAE'), --7
('China'), --8
('Brazil'), --9
('Chile'); --10

CREATE TABLE airline (
  id SERIAL PRIMARY KEY,
  air_name TEXT
);

INSERT INTO airline (air_name)
VALUES
('United'), --1
('British Airways'), --2
('Delta'), --3
('TUI Fly Belgium'), --4
('Air China'), --5
('American Airlines'), --6
('Avianca Brasil'); --7

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  city_name TEXT
);

INSERT INTO cities (city_name)
VALUES
('Washington DC'), --1
('Seattle'), --2
('Tokyo'), --3
('London'), --4
('Los Angeles'), --5
('Las Vegas'), --6
('Mexico City'), --7
('Paris'), --8
('Casablanca'), --9
('Dubai'), --10
('Beijing'), --11
('New York'), --12
('Charlotte'), --13
('Cedar Rapids'), --14
('Chicago'), --15
('New Orleans'), --16
('Sao Paolo'), --17
('Santiago'); --18


CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passengers(id) ON DELETE CASCADE,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INTEGER REFERENCES airline(id) ON DELETE SET NULL,
  from_city INTEGER REFERENCES cities(id) ON DELETE SET NULL,
  from_country INTEGER REFERENCES countries(id) ON DELETE SET NULL,
  to_city INTEGER REFERENCES cities(id) ON DELETE SET NULL,
  to_country INTEGER REFERENCES countries(id) ON DELETE SET NULL
);

INSERT INTO tickets
  (passenger_id, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  ('1', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', '1', '1', '1', '2', '1'),
  ('2', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', '2', '3', '2', '4', '3'),
  ('3', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', '3', '5', '1', '6', '1'),
  ('4', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', '3', '2', '1', '7', '4'),
  ('5', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', '4', '8', '5', '9', '6'),
  ('6', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', '5', '10', '7', '11', '8'),
  ('7', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', '1', '12', '1', '13', '1'),
  ('8', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', '6', '14', '1', '15', '1'),
  ('9', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', '6', '13', '1', '16', '1'),
  ('10', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', '7', '17', '9', '18', '10');
  
-- Testing to make sure we are getting the same thing
SELECT tickets.id, ps.first_name, ps.last_name, seat, departure, arrival, air_name, fci.city_name, fco.country_name, tci.city_name, tco.country_name
FROM tickets
JOIN passengers ps
ON tickets.passenger_id = ps.id
JOIN airline
ON tickets.airline = airline.id
JOIN cities fci
ON tickets.from_city = fci.id
JOIN cities tci
ON tickets.to_city = tci.id
JOIN countries fco
ON tickets.from_country = fco.id
JOIN countries tco
ON tickets.to_country = tco.id
;

  --  id | first_name | last_name  | seat |      departure      |       arrival       |     air_name      |   city_name   | country_name  |  city_name  |  country_name
  -- ----+------------+------------+------+---------------------+---------------------+-------------------+---------------+---------------+-------------+----------------
  --   1 | Jennifer   | Finch      | 33B  | 2018-04-08 09:00:00 | 2018-04-08 12:00:00 | United            | Washington DC | United States | Seattle     | United States
  --   2 | Thadeus    | Gathercoal | 8A   | 2018-12-19 12:45:00 | 2018-12-19 16:15:00 | British Airways   | Tokyo         | Japan         | London      | United Kingdom
  --   3 | Sonja      | Pauley     | 12F  | 2018-01-02 07:00:00 | 2018-01-02 08:03:00 | Delta             | Los Angeles   | United States | Las Vegas   | United States
  --   4 | Jennifer   | Finch      | 20A  | 2018-04-15 16:50:00 | 2018-04-15 21:00:00 | Delta             | Seattle       | United States | Mexico City | Mexico
  --   5 | Waneta     | Skeleton   | 23D  | 2018-08-01 18:30:00 | 2018-08-01 21:50:00 | TUI Fly Belgium   | Paris         | France        | Casablanca  | Morocco
  --   6 | Thadeus    | Gathercoal | 18C  | 2018-10-31 01:15:00 | 2018-10-31 12:55:00 | Air China         | Dubai         | UAE           | Beijing     | China
  --   7 | Berkie     | Wycliff    | 9E   | 2019-02-06 06:00:00 | 2019-02-06 07:47:00 | United            | New York      | United States | Charlotte   | United States
  --   8 | Alvin      | Leathes    | 1A   | 2018-12-22 14:42:00 | 2018-12-22 15:56:00 | American Airlines | Cedar Rapids  | United States | Chicago     | United States
  --   9 | Berkie     | Wycliff    | 32B  | 2019-02-06 16:28:00 | 2019-02-06 19:18:00 | American Airlines | Charlotte     | United States | New Orleans | United States
  --  10 | Cory       | Squibbes   | 10D  | 2019-01-20 19:30:00 | 2019-01-20 22:45:00 | Avianca Brasil    | Sao Paolo     | Brazil        | Santiago    | Chile
  -- (10 rows)