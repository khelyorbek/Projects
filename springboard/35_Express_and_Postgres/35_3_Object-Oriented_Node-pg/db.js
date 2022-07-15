/** Database for lunchly */

const pg = require("pg");

// have to use this format because the default method just failes
// not sure why??????????????
const db = new pg.Client("postgresql://test:test@localhost/lunchly");

db.connect();

module.exports = db;
