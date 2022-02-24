-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  moon_name TEXT NOT NULL
);

CREATE TABLE planets (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy TEXT NOT NULL
);

CREATE TABLE planet_moons (
  id SERIAL PRIMARY KEY,
  moon_id INTEGER REFERENCES moons(id),
  planet_id INTEGER REFERENCES planets(id)
);

INSERT INTO moons (moon_name)
VALUES
('The Moon'),('Phobos'),('Deimos'),
('Naiad'),('Thalassa'),('Despina'),
('Galatea'),('Larissa'),('S/2004 N 1'),
('Proteus'),('Triton'),('Nereid'),
('Halimede'),('Sao'),('Laomedeia'),
('Psamathe'),('Neso');

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way'),
  ('Mars', 1.88, 'The Sun', 'Milky Way'),
  ('Venus', 0.62, 'The Sun', 'Milky Way'),
  ('Neptune', 164.8, 'The Sun', 'Milky Way'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way');

INSERT INTO planet_moons (planet_id, moon_id)
VALUES
('1','1'),
('2','2'),('2','3'),
('4','4'),('4','5'),('4','6'),('4','7'),('4','8'),('4','9'),('4','10'),('4','11'),('4','12'),('4','13'),('4','14'),('4','15'),('4','16'),('4','17');

-- Testing to make sure everything shows up properly
SELECT planets.id, name, orbital_period_in_years, orbits_around, galaxy, moon_name
FROM planets
FULL JOIN planet_moons
ON planets.id = planet_moons.planet_id
FULL JOIN moons
ON planet_moons.moon_id = moons.id
ORDER BY planets.id
;

  --  id |        name        | orbital_period_in_years |  orbits_around   |  galaxy   | moon_name
  -- ----+--------------------+-------------------------+------------------+-----------+------------
  --   1 | Earth              |                       1 | The Sun          | Milky Way | The Moon
  --   2 | Mars               |                    1.88 | The Sun          | Milky Way | Phobos
  --   2 | Mars               |                    1.88 | The Sun          | Milky Way | Deimos
  --   3 | Venus              |                    0.62 | The Sun          | Milky Way |
  --   4 | Neptune            |                   164.8 | The Sun          | Milky Way | Naiad
  --   4 | Neptune            |                   164.8 | The Sun          | Milky Way | Despina
  --   4 | Neptune            |                   164.8 | The Sun          | Milky Way | Galatea
  --   4 | Neptune            |                   164.8 | The Sun          | Milky Way | Larissa
  --   4 | Neptune            |                   164.8 | The Sun          | Milky Way | S/2004 N 1
  --   4 | Neptune            |                   164.8 | The Sun          | Milky Way | Proteus
  --   4 | Neptune            |                   164.8 | The Sun          | Milky Way | Triton
  --   4 | Neptune            |                   164.8 | The Sun          | Milky Way | Nereid
  --   4 | Neptune            |                   164.8 | The Sun          | Milky Way | Halimede
  --   4 | Neptune            |                   164.8 | The Sun          | Milky Way | Sao
  --   4 | Neptune            |                   164.8 | The Sun          | Milky Way | Laomedeia
  --   4 | Neptune            |                   164.8 | The Sun          | Milky Way | Psamathe
  --   4 | Neptune            |                   164.8 | The Sun          | Milky Way | Neso
  --   4 | Neptune            |                   164.8 | The Sun          | Milky Way | Thalassa
  --   5 | Proxima Centauri b |                    0.03 | Proxima Centauri | Milky Way |
  --   6 | Gliese 876 b       |                    0.23 | Gliese 876       | Milky Way |
  -- (20 rows)