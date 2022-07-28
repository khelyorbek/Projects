/** Database config for database. */


const { Client } = require("pg");
const {DB_URI} = require("./config");

let db = new Client({
  connectionString: DB_URI
});

db.connect();


module.exports = db;

// khely=# \c books
// You are now connected to database "books" as user "khely".
// books=# \dt
//        List of relations
//  Schema | Name  | Type  | Owner
// --------+-------+-------+-------
//  public | books | table | khely
// (1 row)

// books=# SELECT * FROM books;
//  isbn | amazon_url | author | language | pages | publisher | title | year
// ------+------------+--------+----------+-------+-----------+-------+------
// (0 rows)