const request = require('supertest');
const app = require('../app');
const db = require('../db');
let testCompany;

beforeEach(async () => {
    const result = await db.query(`INSERT INTO companies (code, name, description) VALUES ('amazon','Amazon','Maker of Alexa') RETURNING code, name, description`)
    testCompany = result.rows[0];
})

afterEach(async () => {
    await db.query(`DELETE FROM companies WHERE code='amazon';`);
})

afterAll(async () => {
    // await db.query(`DELETE FROM companies WHERE code='meta';`);
    await db.end();
})

describe("GET /companies", () => {
    test("Returns list of companies", async () => {
        const res = await request(app).get('/companies')
        expect(res.statusCode).toBe(200);
        expect(res.body).toEqual({
            "companies": [
                {
                    "code": "apple",
                    "name": "Apple Computer",
                    "description": "Maker of OSX."
                },
                {
                    "code": "ibm",
                    "name": "IBM",
                    "description": "Big blue."
                },
                {
                    "code": "google",
                    "name": "Google",
                    "description": "Maker of Android"
                },
                {
                    "code": "amazon",
                    "name": "Amazon",
                    "description": "Maker of Alexa"
                }
            ]
        });
    })
})


describe("GET /companies/amazon", () => {
    test("Return obj of company", async () => {
        const res = await request(app).get('/companies/amazon')
        expect(res.statusCode).toBe(200);
        expect(res.body).toEqual({
            "company": {
                "code": "amazon",
                "name": "Amazon",
                "description": "Maker of Alexa",
                "comp_code": null,
                "ind_code": null
            },
            "invoices": "No invoices found",
            "tags": [
                null
            ]
        })
    })
})


describe("POST /companies", () => {
    test("Adds a company", async () => {
        const res = await request(app).post('/companies').send({ name: 'Meta', description: 'Creator of facebook' });
        expect(res.statusCode).toBe(201);
        expect(res.body).toEqual({
            "company": {
                "code": "meta",
                "name": "Meta",
                "description": "Creator of facebook"
            }
        });
        
    })
})


describe("PUT /companies/meta", () => {
    test("Returns updated company object", async () => {
        const res = await request(app).put('/companies/meta').send({ name: 'Meta', description: 'Creator of Messenger' });
        expect(res.statusCode).toBe(201);
        expect(res.body).toEqual({
            "company": {
                "code": "meta",
                "name": "Meta",
                "description": "Creator of Messenger"
            }
        });
    })
})


describe("DELETE /companies/meta", () => {
    test("Deletes company", async () => {
        const res = await request(app).delete("/companies/meta");
        expect(res.statusCode).toBe(201);
        expect(res.body).toEqual({
            "status": "deleted"
            })
    })
})


// jest
//  PASS  routes/companies.test.js (8.024 s)
//   GET /companies
//     ✓ Returns list of companies (30 ms)
//   GET /companies/amazon
//     ✓ Return obj of company (6 ms)
//   POST /companies
//     ✓ Adds a company (165 ms)
//   PUT /companies/meta
//     ✓ Returns updated company object (6 ms)
//   DELETE /companies/meta
//     ✓ Deletes company (5 ms)

// Test Suites: 1 passed, 1 total
// Tests:       5 passed, 5 total
// Snapshots:   0 total
// Time:        8.052 s
// Ran all test suites.