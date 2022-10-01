"use strict";

const request = require("supertest");

const db = require("../db.js");
const app = require("../app");
const User = require("../models/user");
const Job = require("../models/job.js");

const {
  commonBeforeAll,
  commonBeforeEach,
  commonAfterEach,
  commonAfterAll,
  u1Token,
  adminToken,
} = require("./_testCommon");

let allJobs;
let jobIDs;

beforeAll(commonBeforeAll);
beforeEach(commonBeforeEach);
afterEach(commonAfterEach);
afterAll(commonAfterAll);

/************************************** POST /users */

describe("POST /users", function () {
  test("works for admins: create non-admin", async function () {
    const resp = await request(app)
      .post("/users")
      .send({
        username: "u-new",
        firstName: "First-new",
        lastName: "Last-newL",
        password: "password-new",
        email: "new@email.com",
        isAdmin: false,
      })
      .set("authorization", `Bearer ${adminToken}`);
    expect(resp.statusCode).toEqual(201);
    expect(resp.body).toEqual({
      user: {
        username: "u-new",
        firstName: "First-new",
        lastName: "Last-newL",
        email: "new@email.com",
        isAdmin: false,
      },
      token: expect.any(String),
    });
  });

  test("works for admins: create admin", async function () {
    const resp = await request(app)
      .post("/users")
      .send({
        username: "u-new",
        firstName: "First-new",
        lastName: "Last-newL",
        password: "password-new",
        email: "new@email.com",
        isAdmin: true,
      })
      .set("authorization", `Bearer ${adminToken}`);
    expect(resp.statusCode).toEqual(201);
    expect(resp.body).toEqual({
      user: {
        username: "u-new",
        firstName: "First-new",
        lastName: "Last-newL",
        email: "new@email.com",
        isAdmin: true,
      },
      token: expect.any(String),
    });
  });

  test("unauth for non-admins", async function () {
    const resp = await request(app)
      .post("/users")
      .send({
        username: "u-new",
        firstName: "First-new",
        lastName: "Last-newL",
        password: "password-new",
        email: "new@email.com",
        isAdmin: true,
      })
      .set("authorization", `Bearer ${u1Token}`);
    expect(resp.statusCode).toEqual(401);
  });

  test("unauth for anon", async function () {
    const resp = await request(app)
      .post("/users")
      .send({
        username: "u-new",
        firstName: "First-new",
        lastName: "Last-newL",
        password: "password-new",
        email: "new@email.com",
        isAdmin: true,
      });
    expect(resp.statusCode).toEqual(401);
  });

  test("bad request if missing data", async function () {
    const resp = await request(app)
      .post("/users")
      .send({
        username: "u-new",
      })
      .set("authorization", `Bearer ${adminToken}`);
    expect(resp.statusCode).toEqual(400);
  });

  test("bad request if invalid data", async function () {
    const resp = await request(app)
      .post("/users")
      .send({
        username: "u-new",
        firstName: "First-new",
        lastName: "Last-newL",
        password: "password-new",
        email: "not-an-email",
        isAdmin: true,
      })
      .set("authorization", `Bearer ${adminToken}`);
    expect(resp.statusCode).toEqual(400);
  });
});

/************************************** GET /users */

describe("GET /users", function () {
  test("works for admins", async function () {
    const resp = await request(app)
      .get("/users")
      .set("authorization", `Bearer ${adminToken}`);
    expect(resp.body).toEqual({
      users: [{
          username: "u1",
          firstName: "U1F",
          lastName: "U1L",
          email: "user1@user.com",
          isAdmin: false,
        },
        {
          username: "u2",
          firstName: "U2F",
          lastName: "U2L",
          email: "user2@user.com",
          isAdmin: false,
        },
        {
          username: "u3",
          firstName: "U3F",
          lastName: "U3L",
          email: "user3@user.com",
          isAdmin: false,
        },
      ],
    });
  });

  test("unauth for regular users", async function () {
    const resp = await request(app)
      .get("/users")
      .set("authorization", `Bearer ${u1Token}`);
    expect(resp.statusCode).toEqual(401);
  });

  test("unauth for anon", async function () {
    const resp = await request(app)
      .get("/users");
    expect(resp.statusCode).toEqual(401);
  });

  test("fails: test next() handler", async function () {
    // there's no normal failure event which will cause this route to fail ---
    // thus making it hard to test that the error-handler works with it. This
    // should cause an error, all right :)
    await db.query("DROP TABLE users CASCADE");
    const resp = await request(app)
      .get("/users")
      .set("authorization", `Bearer ${adminToken}`);
    expect(resp.statusCode).toEqual(500);
  });
});

/************************************** GET /users/:username */

describe("GET /users/:username", function () {
  test("works for admins", async function () {
    const resp = await request(app)
      .get(`/users/u1`)
      .set("authorization", `Bearer ${adminToken}`);
    expect(resp.body).toEqual({
      user: {
        username: "u1",
        firstName: "U1F",
        lastName: "U1L",
        email: "user1@user.com",
        isAdmin: false,
        jobs: "No job applications were found for this user.",
      },
    });
  });

  test("unauth for non-admin and non-same user", async function () {
    const resp = await request(app)
      .get(`/users/u1`)
      .set("authorization", `Bearer ${u1Token}`);
    expect(resp.statusCode).toEqual(200);
  });

  test("unauth for anon", async function () {
    const resp = await request(app)
      .get(`/users/u1`);
    expect(resp.statusCode).toEqual(401);
  });

  test("not found if user not found", async function () {
    const resp = await request(app)
      .get(`/users/nope`)
      .set("authorization", `Bearer ${adminToken}`);
    expect(resp.statusCode).toEqual(404);
  });
});

/************************************** PATCH /users/:username */

describe("PATCH /users/:username", () => {
  test("works for admins", async function () {
    const resp = await request(app)
      .patch(`/users/u1`)
      .send({
        firstName: "New",
      })
      .set("authorization", `Bearer ${adminToken}`);
    expect(resp.body).toEqual({
      user: {
        username: "u1",
        firstName: "New",
        lastName: "U1L",
        email: "user1@user.com",
        isAdmin: false,
      },
    });
  });

  test("unauth for non-admin and non-same user", async function () {
    const resp = await request(app)
      .patch(`/users/u1`)
      .send({
        firstName: "New",
      })
      .set("authorization", `Bearer ${u1Token}`);
    expect(resp.statusCode).toEqual(200);
  });

  test("unauth for anon", async function () {
    const resp = await request(app)
      .patch(`/users/u1`)
      .send({
        firstName: "New",
      });
    expect(resp.statusCode).toEqual(401);
  });

  test("not found if no such user", async function () {
    const resp = await request(app)
      .patch(`/users/nope`)
      .send({
        firstName: "Nope",
      })
      .set("authorization", `Bearer ${adminToken}`);
    expect(resp.statusCode).toEqual(404);
  });

  test("bad request if invalid data", async function () {
    const resp = await request(app)
      .patch(`/users/u1`)
      .send({
        firstName: 42,
      })
      .set("authorization", `Bearer ${u1Token}`);
    expect(resp.statusCode).toEqual(400);
  });

  test("works: set new password", async function () {
    const resp = await request(app)
      .patch(`/users/u1`)
      .send({
        password: "new-password",
      })
      .set("authorization", `Bearer ${u1Token}`);
    expect(resp.body).toEqual({
      user: {
        username: "u1",
        firstName: "U1F",
        lastName: "U1L",
        email: "user1@user.com",
        isAdmin: false,
      },
    });
    const isSuccessful = await User.authenticate("u1", "new-password");
    expect(isSuccessful).toBeTruthy();
  });
});

/************************************** DELETE /users/:username */

describe("DELETE /users/:username", function () {
  test("works for admins", async function () {
    const resp = await request(app)
      .delete(`/users/u1`)
      .set("authorization", `Bearer ${adminToken}`);
    expect(resp.body).toEqual({
      deleted: "u1"
    });
  });

  test("unauth for non-admin and non-same user", async function () {
    const resp = await request(app)
      .delete(`/users/u1`)
      .set("authorization", `Bearer ${u1Token}`);
    expect(resp.statusCode).toEqual(200);
  });

  test("unauth for anon", async function () {
    const resp = await request(app)
      .delete(`/users/u1`);
    expect(resp.statusCode).toEqual(401);
  });

  test("not found if user missing", async function () {
    const resp = await request(app)
      .delete(`/users/nope`)
      .set("authorization", `Bearer ${adminToken}`);
    expect(resp.statusCode).toEqual(404);
  });
});

/************************************** POST /users/:username/jobs/:id */
describe("POST /users/:username/jobs/:id", function () {
  test("works for admins", async function () {
    // getting the ids of the jobs
    const allJobs = await Job.findAll();
    const allJobIDs = allJobs.map(j => j.id);

    const resp = await request(app)
      .post(`/users/u1/jobs/${allJobIDs[0]}`)
      .set("authorization", `Bearer ${adminToken}`);

    // console.log("RESP>>>", resp);
    expect(resp.statusCode).toEqual(200);
    expect(resp.text).toEqual(`{"applied":"${allJobIDs[0]}"}`);
  });

  test("works for same user", async function () {
    // getting the ids of the jobs
    const allJobs = await Job.findAll();
    const allJobIDs = allJobs.map(j => j.id);

    const resp = await request(app)
      .post(`/users/u1/jobs/${allJobIDs[0]}`)
      .set("authorization", `Bearer ${u1Token}`);

    // console.log("RESP>>>", resp);
    expect(resp.statusCode).toEqual(200);
    expect(resp.text).toEqual(`{"applied":"${allJobIDs[0]}"}`);
  });

  test("unauth for non-admin and non-same user", async function () {
    // getting the ids of the jobs
    const allJobs = await Job.findAll();
    const allJobIDs = allJobs.map(j => j.id);

    const resp = await request(app)
      .post(`/users/u2/jobs/${allJobIDs[0]}`)
      .set("authorization", `Bearer SOMERANDOMTOKEN`);

    expect(resp.statusCode).toEqual(401);
  });

  test("unauth for anon", async function () {
    // getting the ids of the jobs
    const allJobs = await Job.findAll();
    const allJobIDs = allJobs.map(j => j.id);

    const resp = await request(app)
      .post(`/users/u2/jobs/${allJobIDs[0]}`);

    expect(resp.statusCode).toEqual(401);
  });
});

// PASS  routes/users.test.js (9.525 s)
// POST /users
//   ✓ works for admins: create non-admin (142 ms)
//   ✓ works for admins: create admin (7 ms)
//   ✓ unauth for non-admins (3 ms)
//   ✓ unauth for anon (2 ms)
//   ✓ bad request if missing data (3 ms)
//   ✓ bad request if invalid data (4 ms)
// GET /users
//   ✓ works for admins (4 ms)
//   ✓ unauth for regular users (2 ms)
//   ✓ unauth for anon (3 ms)
//   ✓ fails: test next() handler (4 ms)
// GET /users/:username
//   ✓ works for admins (4 ms)
//   ✓ unauth for non-admin and non-same user (3 ms)
//   ✓ unauth for anon (2 ms)
//   ✓ not found if user not found (2 ms)
// PATCH /users/:username
//   ✓ works for admins (3 ms)
//   ✓ unauth for non-admin and non-same user (3 ms)
//   ✓ unauth for anon (2 ms)
//   ✓ not found if no such user (3 ms)
//   ✓ bad request if invalid data (2 ms)
//   ✓ works: set new password (6 ms)
// DELETE /users/:username
//   ✓ works for admins (2 ms)
//   ✓ unauth for non-admin and non-same user (2 ms)
//   ✓ unauth for anon (2 ms)
//   ✓ not found if user missing (2 ms)
// POST /users/:username/jobs/:id
//   ✓ works for admins (3 ms)
//   ✓ works for same user (4 ms)
//   ✓ unauth for non-admin and non-same user (3 ms)
//   ✓ unauth for anon (2 ms)

// Test Suites: 1 passed, 1 total
// Tests:       28 passed, 28 total
// Snapshots:   0 total
// Time:        9.558 s, estimated 10 s