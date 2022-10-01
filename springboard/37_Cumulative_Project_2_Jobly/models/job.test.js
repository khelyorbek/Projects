"use strict";

const db = require("../db.js");
const { BadRequestError, NotFoundError } = require("../expressError");
const { remove } = require("./user.js");
const Job = require("./job.js");
const {
  commonBeforeAll,
  commonBeforeEach,
  commonAfterEach,
  commonAfterAll,
} = require("./_testCommon");

let allJobs;
let jobIDs;

beforeAll(commonBeforeAll);
beforeEach(async () => {await commonBeforeEach(); allJobs = await Job.findAll(); jobIDs = allJobs.map(j => j.id);});
afterEach(commonAfterEach);
afterAll(commonAfterAll);

/************************************** create */

describe("create", function () {
  const newJob = {
    title: "Test job title 1",
    salary: 200300,
    equity: "0.085",
    company_handle: "c1",
  };

  test("works", async function () {
    let job = await Job.create(newJob);
    // capturing the id into a separate variable
    let jobId = job.id;
    // deleting the id from the object
    delete job.id;
    // checking to make sure the returned object is the same as our newJob
    expect(job).toEqual(newJob);
    // checking to make sure an Id has been generated as a number
    expect(jobId).toEqual(expect.any(Number));
  });
});

/************************************** findAll */

describe("findAll", function () {
    test("works: no filter", async function () {
      let jobs = await Job.findAll();
      expect(jobs).toEqual([
        {
          id: expect.any(Number),
          title: "Job1",
          salary: 100,
          equity: "0.1",
          company_handle: "c1",
        },
        {
          id: expect.any(Number),
          title: "Job2",
          salary: 200,
          equity: "0.2",
          company_handle: "c1",
        },
        {
          id: expect.any(Number),
          title: "Job3",
          salary: 300,
          equity: "0",
          company_handle: "c1",
        },
        {
          id: expect.any(Number),
          title: "Job4",
          salary: null,
          equity: null,
          company_handle: "c1",
        },
      ]);
    });
});

// /************************************** get */

describe("get", function () {
  test("works", async function () {

    // getting the ids of the jobs
    // const allJobs = await Job.findAll();
    // const jobIDs = allJobs.map(j => j.id);

    let job = await Job.get(jobIDs[0]);
    // console.log("JOBIDSSSSSSSS-0: ",jobIDs);
    expect(job).toEqual({
      id: jobIDs[0],
      title: "Job1",
      salary: 100,
      equity: "0.1",
      company_handle: "c1",
    });
});

  test("not found if no such job", async function () {
    try {
      await Job.get(99999);
      fail();
    } catch (err) {
      expect(err instanceof NotFoundError).toBeTruthy();
    }
  });
});

// /************************************** update */

describe("update", function () {
  const updateData = {
    title: "Job1-Updated-Title",
    salary: 111,
    equity: "0.222",
  };



  test("works", async function () {
    // getting the ids of the jobs
    // const allJobs = await Job.findAll();
    // const jobIDs = allJobs.map(j => j.id);

    let job = await Job.update(jobIDs[0], updateData);
    expect(job).toEqual({
      id: jobIDs[0],
      company_handle: "c1",
      ...updateData,
    });
  });

  test("not found if no such job", async function () {
    try {
      await Job.update(0, updateData);
      fail();
    } catch (err) {
      expect(err instanceof NotFoundError).toBeTruthy();
    }
  });

  test("bad request with no data", async function () {
    try {
      await Job.update(123456, {});
      fail();
    } catch (err) {
      expect(err instanceof BadRequestError).toBeTruthy();
    }
  });
});

// /************************************** remove */

describe("remove", function () {
  test("works", async function () {

    // getting the ids of the jobs
    // const allJobs = await Job.findAll();
    // const jobIDs = allJobs.map(j => j.id);

    await Job.remove(jobIDs[0]);
    const res = await db.query(
        `SELECT id FROM jobs WHERE id='${jobIDs[0]}'`);
    expect(res.rows.length).toEqual(0);
  });

  test("not found if no such job", async function () {
    try {
      await Job.remove(99999);
      fail();
    } catch (err) {
      expect(err instanceof NotFoundError).toBeTruthy();
    }
  });
});


// PASS  models/job.test.js
// create
//   ✓ works (4 ms)
// findAll
//   ✓ works: no filter (2 ms)
// get
//   ✓ works (2 ms)
//   ✓ not found if no such job (1 ms)
// update
//   ✓ works (2 ms)
//   ✓ not found if no such job (1 ms)
//   ✓ bad request with no data (1 ms)
// remove
//   ✓ works (3 ms)
//   ✓ not found if no such job (1 ms)

// Test Suites: 1 passed, 1 total
// Tests:       9 passed, 9 total
// Snapshots:   0 total
// Time:        2.805 s