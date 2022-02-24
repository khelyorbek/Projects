DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    region_name TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(10) NOT NULL,
    region_preferred INTEGER REFERENCES regions(id) ON DELETE SET NULL
);

CREATE TABLE locations (
    id SERIAL PRIMARY KEY,
    location_name TEXT NOT NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    cat_name TEXT NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    p_text TEXT NOT NULL,
    author INTEGER REFERENCES users(id) ON DELETE SET NULL,
    p_location INTEGER REFERENCES locations(id) ON DELETE SET NULL,
    region INTEGER REFERENCES regions(id) ON DELETE SET NULL,
    cat_id INTEGER REFERENCES categories(id) ON DELETE SET NULL
);

    -- craigslist=# \dt
    --           List of relations
    --  Schema |    Name    | Type  | Owner
    -- --------+------------+-------+-------
    --  public | categories | table | khely
    --  public | locations  | table | khely
    --  public | posts      | table | khely
    --  public | regions    | table | khely
    --  public | users      | table | khely
    -- (5 rows)

INSERT INTO regions (region_name)
VALUES
('San Francisco'),
('Atlanta'),
('Seattle'),
('New York'),
('Philadelphia');

    -- craigslist=# SELECT * FROM regions;
    --  id |  region_name
    -- ----+---------------
    --   1 | San Francisco
    --   2 | Atlanta
    --   3 | Seattle
    --   4 | New York
    --   5 | Philadelphia
    -- (5 rows)

INSERT INTO users (username, region_preferred)
VALUES
('sunflower2','1'),
('sharp7guy','3'),
('moon5light','2'),
('selin4cash','5'),
('catlady321','5');

    -- craigslist=# SELECT * FROM users;
    --  id |  username  | region_preferred
    -- ----+------------+------------------
    --   1 | sunflower2 |                1
    --   2 | sharp7guy  |                3
    --   3 | moon5light |                2
    --   4 | selin4cash |                5
    --   5 | catlady321 |                5
    -- (5 rows)

INSERT INTO locations (location_name)
VALUES
('Queens'),
('Los Angeles'),
('Harrisburg'),
('Long Island'),
('Mountain View');

    -- craigslist=# SELECT * FROM locations;
    --  id | location_name
    -- ----+---------------
    --   1 | Queens
    --   2 | Los Angeles
    --   3 | Harrisburg
    --   4 | Long Island
    --   5 | Mountain View
    -- (5 rows)

INSERT INTO categories (cat_name)
VALUES
('Technology'),
('Construction'),
('Vehicles'),
('Beauty'),
('Clothes');

    -- craigslist=# SELECT * FROM categories;
    --  id |   cat_name
    -- ----+--------------
    --   1 | Technology
    --   2 | Construction
    --   3 | Vehicles
    --   4 | Beauty
    --   5 | Clothes
    -- (5 rows)

INSERT INTO posts (title, p_text, author, p_location, region, cat_id)
VALUES
('Selling quick','Selling used PS4','1','2','1','1'),
('Need cash urgently','2010 Honda Civic 6000 OBO','2','1','3','3'),
('Free bricks','You hault - free bricks','3','3','4','2'),
('Coach bag for sale','Selling OG 2004 Coach Bag','4','4','5','4'),
('Dr Martins for sale','Selling for 500 OBO','5','5','1','5');

    -- craigslist=# SELECT * FROM posts;
    --  id |        title        |          p_text           | author | p_location | region | cat_id
    -- ----+---------------------+---------------------------+--------+------------+--------+--------
    --   1 | Selling quick       | Selling used PS4          |      1 |          2 |      1 |      1
    --   2 | Need cash urgently  | 2010 Honda Civic 6000 OBO |      2 |          1 |      3 |      3
    --   3 | Free bricks         | You hault - free bricks   |      3 |          3 |      4 |      2
    --   4 | Coach bag for sale  | Selling OG 2004 Coach Bag |      4 |          4 |      5 |      4
    --   5 | Dr Martins for sale | Selling for 500 OBO       |      5 |          5 |      1 |      5
    -- (5 rows)