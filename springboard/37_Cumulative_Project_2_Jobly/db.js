"use strict";
/** Database setup for jobly. */
const { Client } = require("pg");
const { getDatabaseUri } = require("./config");

let db;

if (process.env.NODE_ENV === "production") {
  db = new Client({
    connectionString: getDatabaseUri(),
    ssl: {
      rejectUnauthorized: false
    }
  });
} else {
  db = new Client({
    connectionString: getDatabaseUri()
  });
}

db.connect();

module.exports = db;

// khely=# \c jobly;
// You are now connected to database "jobly" as user "khely".
// jobly=# \d+
//                           List of relations
//  Schema |     Name     |   Type   | Owner |    Size    | Description
// --------+--------------+----------+-------+------------+-------------
//  public | applications | table    | khely | 0 bytes    |
//  public | companies    | table    | khely | 48 kB      |
//  public | jobs         | table    | khely | 48 kB      |
//  public | jobs_id_seq  | sequence | khely | 8192 bytes |
//  public | users        | table    | khely | 16 kB      |
// (5 rows)

// jobly=# SELECT * FROM applications;
//  username | job_id
// ----------+--------
// (0 rows)

// jobly=# SELECT * FROM companies;
// handle = bauer-gallagher
// name = Bauer-gallagher
// num_employees = 862
// description =  Difficult ready trip question produce produce someone.
// logo_url = blank

// jobly=# SELECT * FROM jobs;
// id  |                       title                       | salary | equity |     company_handle
// -----+---------------------------------------------------+--------+--------+-------------------------
// 1 | Conservator, furniture                            | 110000 |      0 | watson-davis
// 2 | Information officer                               | 200000 |      0 | hall-mills

// jobly=# SELECT * FROM users;
// username  |                           password                           | first_name | last_name |        email        | is_admin
// -----------+--------------------------------------------------------------+------------+-----------+---------------------+----------
// testuser  | $2b$12$AZH7virni5jlTTiGgEg4zu3lSvAw68qVEfSIOjJ3RqtbJbdW/Oi5q | Test       | User      | joel@joelburton.com | f
// testadmin | $2b$12$AZH7virni5jlTTiGgEg4zu3lSvAw68qVEfSIOjJ3RqtbJbdW/Oi5q | Test       | Admin!    | joel@joelburton.com | t
// (2 rows)