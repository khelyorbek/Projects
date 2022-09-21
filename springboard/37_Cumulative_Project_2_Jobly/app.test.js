const request = require("supertest");

const app = require("./app");
const db = require("./db");


test("not found for site 404", async function () {
  const resp = await request(app).get("/no-such-path");
  expect(resp.statusCode).toEqual(404);
});

test("not found for site 404 (test stack print)", async function () {
  process.env.NODE_ENV = "";
  const resp = await request(app).get("/no-such-path");
  expect(resp.statusCode).toEqual(404);
  delete process.env.NODE_ENV;
});

afterAll(function () {
  db.end();
});

// Test Suites: 12 passed, 12 total
// Tests:       137 passed, 137 total
// Snapshots:   0 total
// Time:        17.961 s, estimated 50 s
// Ran all test suites.

// PASS  ./app.test.js (8.978 s)
// ✓ not found for site 404 (28 ms)
// ✓ not found for site 404 (test stack print) (37 ms)

// Test Suites: 1 passed, 1 total
// Tests:       2 passed, 2 total
// Snapshots:   0 total
// Time:        9.004 s