"use strict";

const {
  NotFoundError,
  BadRequestError,
  UnauthorizedError,
} = require("../expressError");
const db = require("../db.js");
const User = require("./user.js");
const Job = require("./job.js");
const {
  commonBeforeAll,
  commonBeforeEach,
  commonAfterEach,
  commonAfterAll,
} = require("./_testCommon");

beforeAll(commonBeforeAll);
beforeEach(commonBeforeEach);
afterEach(commonAfterEach);
afterAll(commonAfterAll);

/************************************** authenticate */

describe("authenticate", function () {
  test("works", async function () {
    const user = await User.authenticate("u1", "password1");
    expect(user).toEqual({
      username: "u1",
      firstName: "U1F",
      lastName: "U1L",
      email: "u1@email.com",
      isAdmin: false,
    });
  });

  test("unauth if no such user", async function () {
    try {
      await User.authenticate("nope", "password");
      fail();
    } catch (err) {
      expect(err instanceof UnauthorizedError).toBeTruthy();
    }
  });

  test("unauth if wrong password", async function () {
    try {
      await User.authenticate("c1", "wrong");
      fail();
    } catch (err) {
      expect(err instanceof UnauthorizedError).toBeTruthy();
    }
  });
});

/************************************** register */

describe("register", function () {
  const newUser = {
    username: "new",
    firstName: "Test",
    lastName: "Tester",
    email: "test@test.com",
    isAdmin: false,
  };

  test("works", async function () {
    let user = await User.register({
      ...newUser,
      password: "password",
    });
    expect(user).toEqual(newUser);
    const found = await db.query("SELECT * FROM users WHERE username = 'new'");
    expect(found.rows.length).toEqual(1);
    expect(found.rows[0].is_admin).toEqual(false);
    expect(found.rows[0].password.startsWith("$2b$")).toEqual(true);
  });

  test("works: adds admin", async function () {
    let user = await User.register({
      ...newUser,
      password: "password",
      isAdmin: true,
    });
    expect(user).toEqual({
      ...newUser,
      isAdmin: true
    });
    const found = await db.query("SELECT * FROM users WHERE username = 'new'");
    expect(found.rows.length).toEqual(1);
    expect(found.rows[0].is_admin).toEqual(true);
    expect(found.rows[0].password.startsWith("$2b$")).toEqual(true);
  });

  test("bad request with dup data", async function () {
    try {
      await User.register({
        ...newUser,
        password: "password",
      });
      await User.register({
        ...newUser,
        password: "password",
      });
      fail();
    } catch (err) {
      expect(err instanceof BadRequestError).toBeTruthy();
    }
  });
});

/************************************** findAll */

describe("findAll", function () {
  test("works", async function () {
    const users = await User.findAll();
    expect(users).toEqual([{
        username: "u1",
        firstName: "U1F",
        lastName: "U1L",
        email: "u1@email.com",
        isAdmin: false,
      },
      {
        username: "u2",
        firstName: "U2F",
        lastName: "U2L",
        email: "u2@email.com",
        isAdmin: false,
      },
    ]);
  });
});

/************************************** get */

describe("get", function () {
  test("works", async function () {
    let user = await User.get("u1");
    expect(user).toEqual({
      username: "u1",
      firstName: "U1F",
      lastName: "U1L",
      email: "u1@email.com",
      jobs: "No job applications were found for this user.",
      isAdmin: false,
    });
  });

  test("not found if no such user", async function () {
    try {
      await User.get("nope");
      fail();
    } catch (err) {
      expect(err instanceof NotFoundError).toBeTruthy();
    }
  });
});

/************************************** update */

describe("update", function () {
  const updateData = {
    firstName: "NewF",
    lastName: "NewF",
    email: "new@email.com",
    isAdmin: true,
  };

  test("works", async function () {
    let job = await User.update("u1", updateData);
    expect(job).toEqual({
      username: "u1",
      ...updateData,
    });
  });

  test("works: set password", async function () {
    let job = await User.update("u1", {
      password: "new",
    });
    expect(job).toEqual({
      username: "u1",
      firstName: "U1F",
      lastName: "U1L",
      email: "u1@email.com",
      isAdmin: false,
    });
    const found = await db.query("SELECT * FROM users WHERE username = 'u1'");
    expect(found.rows.length).toEqual(1);
    expect(found.rows[0].password.startsWith("$2b$")).toEqual(true);
  });

  test("not found if no such user", async function () {
    try {
      await User.update("nope", {
        firstName: "test",
      });
      fail();
    } catch (err) {
      expect(err instanceof NotFoundError).toBeTruthy();
    }
  });

  test("bad request if no data", async function () {
    expect.assertions(1);
    try {
      await User.update("c1", {});
      fail();
    } catch (err) {
      expect(err instanceof BadRequestError).toBeTruthy();
    }
  });
});

/************************************** remove */

describe("remove", function () {
  test("works", async function () {
    await User.remove("u1");
    const res = await db.query(
      "SELECT * FROM users WHERE username='u1'");
    expect(res.rows.length).toEqual(0);
  });

  test("not found if no such user", async function () {
    try {
      await User.remove("nope");
      fail();
    } catch (err) {
      expect(err instanceof NotFoundError).toBeTruthy();
    }
  });
});

/************************************** applying to a job */
describe("applying to a job", function () {
  test("works", async function () {
    // getting the ids of the jobs
    const allJobs = await Job.findAll();
    const jobIDs = allJobs.map(j => j.id);

    const res = await User.applyToJob("u1", jobIDs[0]);

    expect(res).toEqual({
      username: 'u1',
      job_id: jobIDs[0]
    });
    // console.log("RES>>>>", res);
  });

  test("not found if no such user", async function () {
    // getting the ids of the jobs
    const allJobs = await Job.findAll();
    const jobIDs = allJobs.map(j => j.id);

    try {
      // trying to add the job with a username that doesn't exist
      await User.applyToJob("user999", jobIDs[0]);
    } catch (e) {
      // making sure that the thrown item is an error
      expect(e.severity).toEqual('ERROR');
      // making sure that the error is matching what we are expecting
      expect(e.detail).toEqual(`Key (username)=(user999) is not present in table "users".`);
    }
  });

  test("not found if no such job", async function () {
    // getting the ids of the jobs
    const allJobs = await Job.findAll();
    const jobIDs = allJobs.map(j => j.id);

    try {
      // trying to add the job with a username that doesn't exist
      await User.applyToJob("u1", '999888');
    } catch (e) {
      // console.log("EEEE>>>>>>",e);
      // making sure that the thrown item is an error
      expect(e.severity).toEqual('ERROR');
      // making sure that the error is matching what we are expecting
      expect(e.detail).toEqual(`Key (job_id)=(999888) is not present in table "jobs".`);
    }
  });
});


// PASS  models/user.test.js
// authenticate
//   ✓ works (5 ms)
//   ✓ unauth if no such user (2 ms)
//   ✓ unauth if wrong password (1 ms)
// register
//   ✓ works (4 ms)
//   ✓ works: adds admin (4 ms)
//   ✓ bad request with dup data (3 ms)
// findAll
//   ✓ works (2 ms)
// get
//   ✓ works (2 ms)
//   ✓ not found if no such user (1 ms)
// update
//   ✓ works (2 ms)
//   ✓ works: set password (3 ms)
//   ✓ not found if no such user (2 ms)
//   ✓ bad request if no data
// remove
//   ✓ works (1 ms)
//   ✓ not found if no such user (1 ms)
// applying to a job
//   ✓ works (2 ms)
//   ✓ not found if no such user (2 ms)
//   ✓ not found if no such job (1 ms)

// Test Suites: 1 passed, 1 total
// Tests:       18 passed, 18 total
// Snapshots:   0 total
// Time:        2.943 s
