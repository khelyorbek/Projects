"use strict";

const db = require("../db.js");
const {
  BadRequestError,
  NotFoundError
} = require("../expressError");
const Company = require("./company.js");
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

/************************************** create */

describe("create", function () {
  const newCompany = {
    handle: "new",
    name: "New",
    description: "New Description",
    numEmployees: 1,
    logoUrl: "http://new.img",
  };

  test("works", async function () {
    let company = await Company.create(newCompany);
    expect(company).toEqual(newCompany);

    const result = await db.query(
      `SELECT handle, name, description, num_employees, logo_url
           FROM companies
           WHERE handle = 'new'`);
    expect(result.rows).toEqual([{
      handle: "new",
      name: "New",
      description: "New Description",
      num_employees: 1,
      logo_url: "http://new.img",
    }, ]);
  });

  test("bad request with dupe", async function () {
    try {
      await Company.create(newCompany);
      await Company.create(newCompany);
      fail();
    } catch (err) {
      expect(err instanceof BadRequestError).toBeTruthy();
    }
  });
});

/************************************** findAll */

describe("findAll", function () {
  test("works: no filter", async function () {
    let companies = await Company.findAll();
    expect(companies).toEqual([{
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
    ]);
  });

  // Write unit tests for the model that exercise this in different ways, so you can be assured different combinations of filtering will work.
  test("works: with name filter", async function () {
    let companies = await Company.findAll({
      name: 'c1'
    });
    expect(companies).toEqual([{
      handle: "c1",
      name: "C1",
      description: "Desc1",
      numEmployees: 1,
      logoUrl: "http://c1.img",
    }, ]);
  });

  test("works: with minEmployees filter", async function () {
    let companies = await Company.findAll({
      minEmployees: '3'
    });
    expect(companies).toEqual([{
      handle: "c3",
      name: "C3",
      description: "Desc3",
      numEmployees: 3,
      logoUrl: "http://c3.img",
    }, ]);
  });

  test("works: with maxEmployees filter", async function () {
    let companies = await Company.findAll({
      maxEmployees: '1'
    });
    expect(companies).toEqual([{
      handle: "c1",
      name: "C1",
      description: "Desc1",
      numEmployees: 1,
      logoUrl: "http://c1.img",
    }, ]);
  });

  test("works: with minEmployees and maxEmployees filter", async function () {
    let companies = await Company.findAll({
      minEmployees: '1',
      maxEmployees: '2'
    });
    expect(companies).toEqual([{
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
    ]);
  });

  test("throws an error when minEmployees is larger than maxEmployees", async function () {
    try {
      let companies = await Company.findAll({
        minEmployees: '3',
        maxEmployees: '1'
      });
    } catch (e) {
      expect(e.message).toBe('Minimum amount of employees cannot be greated than maximum amount of employees!');
    }

  });
});

/************************************** get */

describe("get", function () {
  test("works", async function () {
    let company = await Company.get("c1");
    expect(company).toEqual({
      handle: "c1",
      name: "C1",
      description: "Desc1",
      numEmployees: 1,
      logoUrl: "http://c1.img",
      jobs: {
        "company_handle": "c1",
        "equity": "0.1",
        "id": expect.any(Number),
        "salary": 100,
        "title": "Job1",
      },
    });
  });

  test("not found if no such company", async function () {
    try {
      await Company.get("nope");
      fail();
    } catch (err) {
      expect(err instanceof NotFoundError).toBeTruthy();
    }
  });
});

/************************************** update */

describe("update", function () {
  const updateData = {
    name: "New",
    description: "New Description",
    numEmployees: 10,
    logoUrl: "http://new.img",
  };

  test("works", async function () {
    let company = await Company.update("c1", updateData);
    expect(company).toEqual({
      handle: "c1",
      ...updateData,
    });

    const result = await db.query(
      `SELECT handle, name, description, num_employees, logo_url
           FROM companies
           WHERE handle = 'c1'`);
    expect(result.rows).toEqual([{
      handle: "c1",
      name: "New",
      description: "New Description",
      num_employees: 10,
      logo_url: "http://new.img",
    }]);
  });

  test("works: null fields", async function () {
    const updateDataSetNulls = {
      name: "New",
      description: "New Description",
      numEmployees: null,
      logoUrl: null,
    };

    let company = await Company.update("c1", updateDataSetNulls);
    expect(company).toEqual({
      handle: "c1",
      ...updateDataSetNulls,
    });

    const result = await db.query(
      `SELECT handle, name, description, num_employees, logo_url
           FROM companies
           WHERE handle = 'c1'`);
    expect(result.rows).toEqual([{
      handle: "c1",
      name: "New",
      description: "New Description",
      num_employees: null,
      logo_url: null,
    }]);
  });

  test("not found if no such company", async function () {
    try {
      await Company.update("nope", updateData);
      fail();
    } catch (err) {
      expect(err instanceof NotFoundError).toBeTruthy();
    }
  });

  test("bad request with no data", async function () {
    try {
      await Company.update("c1", {});
      fail();
    } catch (err) {
      expect(err instanceof BadRequestError).toBeTruthy();
    }
  });
});

/************************************** remove */

describe("remove", function () {
  test("works", async function () {
    await Company.remove("c1");
    const res = await db.query(
      "SELECT handle FROM companies WHERE handle='c1'");
    expect(res.rows.length).toEqual(0);
  });

  test("not found if no such company", async function () {
    try {
      await Company.remove("nope");
      fail();
    } catch (err) {
      expect(err instanceof NotFoundError).toBeTruthy();
    }
  });
});

// PASS  models/company.test.js
// create
//   ✓ works (7 ms)
//   ✓ bad request with dupe (4 ms)
// findAll
//   ✓ works: no filter (1 ms)
//   ✓ works: with name filter (1 ms)
//   ✓ works: with minEmployees filter (2 ms)
//   ✓ works: with maxEmployees filter (1 ms)
//   ✓ works: with minEmployees and maxEmployees filter (1 ms)
//   ✓ throws an error when minEmployees is larger than maxEmployees (1 ms)
// get
//   ✓ works (2 ms)
//   ✓ not found if no such company (1 ms)
// update
//   ✓ works (1 ms)
//   ✓ works: null fields (2 ms)
//   ✓ not found if no such company (1 ms)
//   ✓ bad request with no data (1 ms)
// remove
//   ✓ works (1 ms)
//   ✓ not found if no such company (1 ms)

// Test Suites: 1 passed, 1 total
// Tests:       16 passed, 16 total
// Snapshots:   0 total
// Time:        2.685 s
// Ran all test suites matching /models\/company.test.js/i.