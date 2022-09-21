const { sqlForPartialUpdate } = require("./sql");
const { SECRET_KEY } = require("../config");

describe("sql for partial update", function () {
  test("updates sql correctly", function () {
    const { setCols, values } = sqlForPartialUpdate(
        {firstName: "Aliya", isAdmin: "t"},
        {firstName: "first_name", isAdmin: "is_admin"}
    )
    
    expect(setCols).toEqual("\"first_name\"=$1, \"is_admin\"=$2");
    expect(values).toEqual(['Aliya',"t"]);
  });
});

// PASS  helpers/sql.test.js
// sql for partial update
//   ✓ updates sql correctly (2 ms)