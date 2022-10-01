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

let allJobs;
let jobIDs;

beforeAll(commonBeforeAll);
beforeEach(async () => {await commonBeforeEach(); allJobs = await Job.findAll(); jobIDs = allJobs.map(j => j.id);});
afterEach(commonAfterEach);
afterAll(commonAfterAll);


const Job = require("../models/job");


/************************************** POST /jobs */

describe("POST /jobs", function () {
    const newJob = {
        title: "Test job title 1",
        salary: 200300,
        equity: 0.085,
        company_handle: "c1",
    };

    test("ok for Admins", async function () {
        const resp = await request(app)
            .post("/jobs")
            .send(newJob)
            .set("authorization", `Bearer ${adminToken}`);

        // console.log(">>>RESP>>>", resp);
        expect(resp.statusCode).toEqual(201);
        expect(resp.body).toEqual({
            job: {
                company_handle: newJob.company_handle,
                equity: newJob.equity.toString(),
                id: expect.any(Number),
                salary: newJob.salary,
                title: newJob.title
            },
        });
    });

    test("Unauthorized for non-admins", async function () {
        const resp = await request(app)
            .post("/jobs")
            .send(newJob)
            .set("authorization", `Bearer ${u1Token}`);
        expect(resp.statusCode).toEqual(401);
    });

    test("bad admin request with missing data", async function () {
        // the request below is missing the company_handle which is required in JSON Validator Schema
        const resp = await request(app)
            .post("/jobs")
            .send({
                title: "Somerandomtitle",
                salary: 111222
            })
            .set("authorization", `Bearer ${adminToken}`);
        expect(resp.statusCode).toEqual(400);
    });

    test("bad admin request with invalid data", async function () {
        // here Salary must be an integer but I am passing a string
        const resp = await request(app)
            .post("/jobs")
            .send({
                title: "Somerandomtitle2",
                salary: "222333",
                company_handle: "c1",
            })
            .set("authorization", `Bearer ${adminToken}`);
        expect(resp.statusCode).toEqual(400);
    });
});

/************************************** GET /jobs */

describe("GET /jobs", function () {
    test("ok for anon", async function () {
        const resp = await request(app).get("/jobs");
        expect(resp.body).toEqual({
            jobs: [{
                    id: expect.any(Number),
                    title: "J1",
                    salary: 1,
                    equity: "0.1",
                    company_handle: "c1"
                },
                {
                    id: expect.any(Number),
                    title: "J2",
                    salary: 2,
                    equity: "0.2",
                    company_handle: "c1"
                },
                {
                    id: expect.any(Number),
                    title: "J3",
                    salary: 3,
                    equity: "0.3",
                    company_handle: "c1"
                },
            ],
        });
    });

    test("fails: test next() handler", async function () {
        // there's no normal failure event which will cause this route to fail ---
        // thus making it hard to test that the error-handler works with it. This
        // should cause an error, all right :)
        await db.query("DROP TABLE jobs CASCADE");
        const resp = await request(app)
            .get("/jobs")
            .set("authorization", `Bearer ${u1Token}`);
        expect(resp.statusCode).toEqual(500);
    });

    test("ok with name case-insensitive title filter", async function () {
        const resp = await request(app).get("/jobs?title=j1");
        expect(resp.body).toEqual({
            jobs: [{
                id: expect.any(Number),
                title: "J1",
                salary: 1,
                equity: "0.1",
                company_handle: "c1"
            }, ],
        });
    });

    test("ok with minSalary filter", async function () {
        const resp = await request(app).get("/jobs?minSalary=3");
        expect(resp.body).toEqual({
            jobs: [{
                id: expect.any(Number),
                title: "J3",
                salary: 3,
                equity: "0.3",
                company_handle: "c1"
            }, ],
        });
    });

    test("ok with minSalary AND title AND hasEquity filter", async function () {
        const resp = await request(app).get("/jobs?title=j&minSalary=3&hasEquity=true");
        expect(resp.body).toEqual({
            jobs: [{
                id: expect.any(Number),
                title: "J3",
                salary: 3,
                equity: "0.3",
                company_handle: "c1"
            }, ],
        });
    });

});

/************************************** GET /jobs/:id */

describe("GET /jobs/:id", function () {
    test("works for anon", async function () {
        // const allJobs = await Job.findAll();
        // const jobIDs = allJobs.map(j => j.id);

        const resp = await request(app).get(`/jobs/${jobIDs[0]}`);
        expect(resp.body).toEqual({
            job: allJobs[0]
        });
    });

    test("not found for no such job", async function () {
        const resp = await request(app).get(`/jobs/111222`);
        expect(resp.statusCode).toEqual(404);
    });
});

/************************************** PATCH /companies/:handle */

describe("PATCH /jobs/:id", function () {
    test("works for admin", async function () {
        // const allJobs = await Job.findAll();
        // const jobIDs = allJobs.map(j => j.id);

        const resp = await request(app)
            .patch(`/jobs/${jobIDs[0]}`)
            .send({
                title: "Somenewtitle",
            })
            .set("authorization", `Bearer ${adminToken}`);
        expect(resp.body).toEqual({
            job: {
                id: expect.any(Number),
                title: "Somenewtitle",
                salary: allJobs[0].salary,
                equity: allJobs[0].equity,
                company_handle: allJobs[0].company_handle
            },
        });
    });

    test("unauth for anon", async function () {
        // const allJobs = await Job.findAll();
        // const jobIDs = allJobs.map(j => j.id);

        const resp = await request(app)
            .patch(`/jobs/${jobIDs[0]}`)
            .send({
                title: "Somenewtitle2",
            });
        expect(resp.statusCode).toEqual(401);
    });

    test("admin - not found on no such job", async function () {
        const resp = await request(app)
            .patch(`/jobs/999888`)
            .send({
                title: "Somenewtitle3",
            })
            .set("authorization", `Bearer ${adminToken}`);
        expect(resp.statusCode).toEqual(404);
    });

    test("admin - bad request on id change attempt", async function () {
        // const allJobs = await Job.findAll();
        // const jobIDs = allJobs.map(j => j.id);

        const resp = await request(app)
            .patch(`/jobs/${jobIDs[0]}`)
            .send({
                id: 679,
            })
            .set("authorization", `Bearer ${adminToken}`);
        expect(resp.statusCode).toEqual(400);
    });

    test("bad request on invalid data", async function () {
        // const allJobs = await Job.findAll();
        // const jobIDs = allJobs.map(j => j.id);

        // sending salary as string and equity as letter which are both incorrect per the JSON Validator Schema
        const resp = await request(app)
            .patch(`/jobs/${jobIDs[0]}`)
            .send({
                title: "Somenewtitle4",
                salary: "12345",
                equity: "abc",
                company_handle: "c1",
            })
            .set("authorization", `Bearer ${adminToken}`);
        expect(resp.statusCode).toEqual(400);
    });
});

/************************************** DELETE /jobs/:id */

describe("DELETE /jobs/:id", function () {
    test("works for admin", async function () {
        // const allJobs = await Job.findAll();
        // const jobIDs = allJobs.map(j => j.id);

        const resp = await request(app)
            .delete(`/jobs/${jobIDs[0]}`)
            .set("authorization", `Bearer ${adminToken}`);
        expect(resp.body).toEqual({
            deleted: jobIDs[0].toString()
        });
    });

    test("unauth for others", async function () {
        // const allJobs = await Job.findAll();
        // const jobIDs = allJobs.map(j => j.id);

        const resp = await request(app)
            .delete(`/jobs/${jobIDs[0]}`);
        expect(resp.statusCode).toEqual(401);
    });

    test("not found for no such company", async function () {
        const resp = await request(app)
            .delete(`/jobs/8899`)
            .set("authorization", `Bearer ${adminToken}`);
        expect(resp.statusCode).toEqual(404);
    });
});

// PASS  routes/jobs.test.js (9.069 s)
// POST /jobs
//   ✓ ok for Admins (166 ms)
//   ✓ Unauthorized for non-admins (5 ms)
//   ✓ bad admin request with missing data (3 ms)
//   ✓ bad admin request with invalid data (3 ms)
// GET /jobs
//   ✓ ok for anon (4 ms)
//   ✓ fails: test next() handler (5 ms)
//   ✓ ok with name case-insensitive title filter (4 ms)
//   ✓ ok with minSalary filter (3 ms)
//   ✓ ok with minSalary AND title AND hasEquity filter (4 ms)
// GET /jobs/:id
//   ✓ works for anon (3 ms)
//   ✓ not found for no such job (3 ms)
// PATCH /jobs/:id
//   ✓ works for admin (4 ms)
//   ✓ unauth for anon (4 ms)
//   ✓ admin - not found on no such job (3 ms)
//   ✓ admin - bad request on id change attempt (3 ms)
//   ✓ bad request on invalid data (4 ms)
// DELETE /jobs/:id
//   ✓ works for admin (5 ms)
//   ✓ unauth for others (4 ms)
//   ✓ not found for no such company (3 ms)

// Test Suites: 1 passed, 1 total
// Tests:       19 passed, 19 total
// Snapshots:   0 total
// Time:        9.099 s