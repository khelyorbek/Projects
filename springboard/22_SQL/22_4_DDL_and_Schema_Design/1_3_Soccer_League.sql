DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    team_name VARCHAR(15) NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    player_name VARCHAR(30) NOT NULL
);

CREATE TABLE players_teams (
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams(id) ON DELETE CASCADE,
    player_id INTEGER REFERENCES players(id) ON DELETE CASCADE
);

CREATE TABLE goals_scored (
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams(id) ON DELETE CASCADE,
    player_id INTEGER REFERENCES players(id) ON DELETE CASCADE
);

CREATE TABLE league_dates (
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE team_matches (
    id SERIAL PRIMARY KEY,
    team1_id INTEGER REFERENCES teams(id) ON DELETE CASCADE,
    team2_id INTEGER REFERENCES teams(id) ON DELETE CASCADE
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    referee_name VARCHAR(30) NOT NULL,
    game_id INTEGER REFERENCES team_matches(id) ON DELETE CASCADE
);

    -- soccer_league-# \dt
    --            List of relations
    --  Schema |     Name      | Type  | Owner
    -- --------+---------------+-------+-------
    --  public | goals_scored  | table | khely
    --  public | league_dates  | table | khely
    --  public | players       | table | khely
    --  public | players_teams | table | khely
    --  public | referees      | table | khely
    --  public | team_matches  | table | khely
    --  public | teams         | table | khely
    -- (7 rows)

INSERT INTO teams (team_name)
VALUES
('Real Madrid'),
('Barcelona'),
('Man. United');

    -- soccer_league=# SELECT * FROM teams;
    --  id |  team_name
    -- ----+-------------
    --   1 | Real Madrid
    --   2 | Barcelona
    --   3 | Man. United
    -- (3 rows)

INSERT INTO players (player_name)
VALUES
('Christiano Ronaldo'),
('David Beckham'),
('Zlatan Ibrahimovic');

    -- soccer_league=# SELECT * FROM players;
    --  id |    player_name
    -- ----+--------------------
    --   1 | Christiano Ronaldo
    --   2 | David Beckham
    --   3 | Zlatan Ibrahimovic
    -- (3 rows)

INSERT INTO players_teams (team_id, player_id)
VALUES
('1','1'),
('2','3'),
('3','2');

    -- soccer_league=# SELECT * FROM players_teams;
    --  id | team_id | player_id
    -- ----+---------+-----------
    --   1 |       1 |         1
    --   2 |       2 |         3
    --   3 |       3 |         2
    -- (3 rows)

INSERT INTO goals_scored (player_id, team_id)
VALUES
('1','1'),
('1','1'),
('2','3'),
('3','2');

    -- soccer_league=# SELECT * FROM goals_scored;
    --  id | team_id | player_id
    -- ----+---------+-----------
    --   1 |       1 |         1
    --   2 |       1 |         1
    --   3 |       3 |         2
    --   4 |       2 |         3
    -- (4 rows)

INSERT INTO league_dates (start_date, end_date)
VALUES
('2020-01-01','2020-12-31'),
('2021-01-01','2021-12-31'),
('2022-01-01','2022-12-31');

    -- soccer_league=# SELECT * FROM league_dates;
    --  id | start_date |  end_date
    -- ----+------------+------------
    --   1 | 2020-01-01 | 2020-12-31
    --   2 | 2021-01-01 | 2021-12-31
    --   3 | 2022-01-01 | 2022-12-31
    -- (3 rows)

INSERT INTO team_matches (team1_id, team2_id)
VALUES
('1','2'),
('2','3'),
('1','3');

    -- soccer_league=# SELECT * FROM team_matches;
    --  id | team1_id | team2_id
    -- ----+----------+----------
    --   1 |        1 |        2
    --   2 |        2 |        3
    --   3 |        1 |        3
    -- (3 rows)

INSERT INTO referees (referee_name, game_id)
VALUES
('Snoop Dogg','1'),
('Jared Leto','2'),
('Corey Taylor','3');

    -- soccer_league=# SELECT * FROM referees;
    --  id | referee_name | game_id
    -- ----+--------------+---------
    --   1 | Snoop Dogg   |       1
    --   2 | Jared Leto   |       2
    --   3 | Corey Taylor |       3
    -- (3 rows)

-- The standings/rankings of each team in the league (This doesn’t have to be its own table if the data can be captured somehow).
SELECT team_name, COUNT(team_id) as win_count FROM goals_scored JOIN teams ON goals_scored.team_id=teams.id GROUP BY team_name;

    --   team_name  | win_count
    -- -------------+-----------
    --  Real Madrid |         2
    --  Barcelona   |         1
    --  Man. United |         1
    -- (3 rows)
