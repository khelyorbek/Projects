const { BadRequestError } = require("../expressError");

// first argument is that data that needs updated
// second argument is javascript to SQL column translations. Example firstName is js variable and first_name is SQL column name
function sqlForPartialUpdate(dataToUpdate, jsToSql) {
  // grabbing the keys from the object and storing into variable
  const keys = Object.keys(dataToUpdate);
  // if there are no keys available, throws error
  if (keys.length === 0) throw new BadRequestError("No data");

    // {firstName: 'Aliya', age: 32} => ['"first_name"=$1', '"age"=$2']
  const cols = keys.map((colName, idx) =>
  // takes column name and index and creates a new array
  // increases index by 1 and add $ to the beginning
  // this is to ensure that no SQL injections can be performed
      `"${jsToSql[colName] || colName}"=$${idx + 1}`,
  );

  return {
    // joins the new array with , so the values are passed correctly while preventing sql injection
    // once the new array is joined and ready, sets it as columns/keys for the query
    setCols: cols.join(", "),
    // passes the data to be updated in SQL
    values: Object.values(dataToUpdate),
  };
}

module.exports = { sqlForPartialUpdate };
