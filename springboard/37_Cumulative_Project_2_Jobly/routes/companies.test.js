"use strict";

const request = require("supertest");

const db = require("../db");
const app = require("../app");

const {
  commonBeforeAll,
  commonBeforeEach,
  commonAfterEach,
  commonAfterAll,
  u1Token,
  adminToken
} = require("./_testCommon");

beforeAll(commonBeforeAll);
beforeEach(commonBeforeEach);
afterEach(commonAfterEach);
afterAll(commonAfterAll);

/************************************** POST /companies */

describe("POST /companies", function () {
  const newCompany = {
    handle: "new",
    name: "New",
    logoUrl: "http://new.img",
    description: "DescNew",
    numEmployees: 10,
  };

  test("ok for Admins", async function () {
    const resp = await request(app)
      .post("/companies")
      .send(newCompany)
      .set("authorization", `Bearer ${adminToken}`);
    expect(resp.statusCode).toEqual(201);
    expect(resp.body).toEqual({
      company: newCompany,
    });
  });

  test("Unauthorized for non-admins", async function () {
    const resp = await request(app)
      .post("/companies")
      .send(newCompany)
      .set("authorization", `Bearer ${u1Token}`);
    expect(resp.statusCode).toEqual(401);
  });

  test("bad request with missing data", async function () {
    const resp = await request(app)
      .post("/companies")
      .send({
        handle: "new",
        numEmployees: 10,
      })
      .set("authorization", `Bearer ${adminToken}`);
    expect(resp.statusCode).toEqual(400);
  });

  test("bad request with invalid data", async function () {
    const resp = await request(app)
      .post("/companies")
      .send({
        ...newCompany,
        logoUrl: "not-a-url",
      })
      .set("authorization", `Bearer ${adminToken}`);
    expect(resp.statusCode).toEqual(400);
  });
});

/************************************** GET /companies */

describe("GET /companies", function () {
  test("ok for anon", async function () {
    const resp = await request(app).get("/companies");
    expect(resp.body).toEqual({
      companies: [{
          handle: "c1",
          name: "C1",
          description: "Desc1",
          numEmployees: 1,
          logoUrl: "http://c1.img",
        },
        {
          handle: "c2",
          name: "C2",
          description: "Desc2",
          numEmployees: 2,
          logoUrl: "http://c2.img",
        },
        {
          handle: "c3",
          name: "C3",
          description: "Desc3",
          numEmployees: 3,
          logoUrl: "http://c3.img",
        },
      ],
    });
  });

  test("fails: test next() handler", async function () {
    // there's no normal failure event which will cause this route to fail ---
    // thus making it hard to test that the error-handler works with it. This
    // should cause an error, all right :)
    await db.query("DROP TABLE companies CASCADE");
    const resp = await request(app)
      .get("/companies")
      .set("authorization", `Bearer ${u1Token}`);
    expect(resp.statusCode).toEqual(500);
  });

  test("ok with name case-insensitive filter", async function () {
    const resp = await request(app).get("/companies?name=c1");
    expect(resp.body).toEqual({
      companies: [{
        handle: "c1",
        name: "C1",
        description: "Desc1",
        numEmployees: 1,
        logoUrl: "http://c1.img",
      }, ],
    });
  });

  test("ok with minEmployees filter", async function () {
    const resp = await request(app).get("/companies?minEmployees=3");
    expect(resp.body).toEqual({
      companies: [{
        handle: "c3",
        name: "C3",
        description: "Desc3",
        numEmployees: 3,
        logoUrl: "http://c3.img",
      }, ],
    });
  });

  test("ok with maxEmployees filter", async function () {
    const resp = await request(app).get("/companies?maxEmployees=1");
    expect(resp.body).toEqual({
      companies: [{
        handle: "c1",
        name: "C1",
        description: "Desc1",
        numEmployees: 1,
        logoUrl: "http://c1.img",
      }, ],
    });
  });

  test("ok with minEmplyees AND maxEmployees filter", async function () {
    const resp = await request(app).get("/companies?minEmployees=2&maxEmployees=3");
    expect(resp.body).toEqual({
      companies: [{
          handle: "c2",
          name: "C2",
          description: "Desc2",
          numEmployees: 2,
          logoUrl: "http://c2.img",
        },
        {
          handle: "c3",
          name: "C3",
          description: "Desc3",
          numEmployees: 3,
          logoUrl: "http://c3.img",
        },
      ],
    });
  });

  test("produces an error when minEmplyees is greater than maxEmployees", async function () {
    const resp = await request(app).get("/companies?minEmployees=3&maxEmployees=1");
    expect(resp.body).toEqual({
      error: {
        "message": "Minimum amount of employees cannot be greated than maximum amount of employees!",
        "status": 400,
      },
    });
  });

});

/************************************** GET /companies/:handle */

describe("GET /companies/:handle", function () {
  test("works for anon", async function () {
    const resp = await request(app).get(`/companies/c1`);
    expect(resp.body).toEqual({
      company: {
        handle: "c1",
        name: "C1",
        description: "Desc1",
        numEmployees: 1,
        logoUrl: "http://c1.img",
        jobs: {
          "company_handle": "c1",
          "equity": "0.1",
          "id": expect.any(Number),
          "salary": 1,
          "title": "J1",
        },
      },
    });
  });

  test("works for anon: company w/o jobs", async function () {
    const resp = await request(app).get(`/companies/c2`);
    expect(resp.body).toEqual({
      company: {
        handle: "c2",
        name: "C2",
        description: "Desc2",
        numEmployees: 2,
        logoUrl: "http://c2.img",
        jobs: {
          "message": "No jobs available for this company.",
        },
      },
    });
  });

  test("not found for no such company", async function () {
    const resp = await request(app).get(`/companies/nope`);
    expect(resp.statusCode).toEqual(404);
  });
});

/************************************** PATCH /companies/:handle */

describe("PATCH /companies/:handle", function () {
  test("works for admins", async function () {
    const resp = await request(app)
      .patch(`/companies/c1`)
      .send({
        name: "C1-new",
      })
      .set("authorization", `Bearer ${adminToken}`);
    expect(resp.body).toEqual({
      company: {
        handle: "c1",
        name: "C1-new",
        description: "Desc1",
        numEmployees: 1,
        logoUrl: "http://c1.img",
      },
    });
  });

  test("unauth for anon", async function () {
    const resp = await request(app)
      .patch(`/companies/c1`)
      .send({
        name: "C1-new",
      });
    expect(resp.statusCode).toEqual(401);
  });

  test("not found on no such company", async function () {
    const resp = await request(app)
      .patch(`/companies/nope`)
      .send({
        name: "new nope",
      })
      .set("authorization", `Bearer ${adminToken}`);
    expect(resp.statusCode).toEqual(404);
  });

  test("bad request on handle change attempt", async function () {
    const resp = await request(app)
      .patch(`/companies/c1`)
      .send({
        handle: "c1-new",
      })
      .set("authorization", `Bearer ${adminToken}`);
    expect(resp.statusCode).toEqual(400);
  });

  test("bad request on invalid data", async function () {
    const resp = await request(app)
      .patch(`/companies/c1`)
      .send({
        logoUrl: "not-a-url",
      })
      .set("authorization", `Bearer ${adminToken}`);
    expect(resp.statusCode).toEqual(400);
  });
});

/************************************** DELETE /companies/:handle */

describe("DELETE /companies/:handle", function () {
  test("works for users", async function () {
    const resp = await request(app)
      .delete(`/companies/c1`)
      .set("authorization", `Bearer ${adminToken}`);
    expect(resp.body).toEqual({
      deleted: "c1"
    });
  });

  test("unauth for anon", async function () {
    const resp = await request(app)
      .delete(`/companies/c1`);
    expect(resp.statusCode).toEqual(401);
  });

  test("not found for no such company", async function () {
    const resp = await request(app)
      .delete(`/companies/nope`)
      .set("authorization", `Bearer ${adminToken}`);
    expect(resp.statusCode).toEqual(404);
  });
});

// PASS  routes/companies.test.js (9.746 s)
// POST /companies
//   ✓ ok for Admins (144 ms)
//   ✓ Unauthorized for non-admins (5 ms)
//   ✓ bad request with missing data (3 ms)
//   ✓ bad request with invalid data (3 ms)
// GET /companies
//   ✓ ok for anon (3 ms)
//   ✓ fails: test next() handler (4 ms)
//   ✓ ok with name case-insensitive filter (4 ms)
//   ✓ ok with minEmployees filter (3 ms)
//   ✓ ok with maxEmployees filter (3 ms)
//   ✓ ok with minEmplyees AND maxEmployees filter (3 ms)
//   ✓ produces an error when minEmplyees is greater than maxEmployees (3 ms)
// GET /companies/:handle
//   ✓ works for anon (4 ms)
//   ✓ works for anon: company w/o jobs (3 ms)
//   ✓ not found for no such company (3 ms)
// PATCH /companies/:handle
//   ✓ works for admins (5 ms)
//   ✓ unauth for anon (3 ms)
//   ✓ not found on no such company (5 ms)
//   ✓ bad request on handle change attempt (3 ms)
//   ✓ bad request on invalid data (3 ms)
// DELETE /companies/:handle
//   ✓ works for users (3 ms)
//   ✓ unauth for anon (3 ms)
//   ✓ not found for no such company (2 ms)

// Test Suites: 1 passed, 1 total
// Tests:       22 passed, 22 total
// Snapshots:   0 total
// Time:        9.778 s