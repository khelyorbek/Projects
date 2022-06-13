process.env.NODE_ENV = "test";

const request = require("supertest");

const app = require("../app");
// importing our fake database (array)
let items = require('../fakeDb')

// POST /items - this route should accept JSON data and add it to the shopping list.
describe("POST /items", function () {
    test("accepts JSON data and add it to the shopping list", async function () {
        const resp = await request(app)
            .post('/items')
            .send({
                "name": "popsicle",
                "price": 1.45
            });
        expect(resp.statusCode).toBe(200);
        expect(resp.body).toEqual({
            "added": {
                "name": "popsicle",
                "price": 1.45
            }
        });
    });
});

// GET /items - this should render a list of shopping items.
describe("GET /items", function () {
    test("renders a list of shopping items", async function () {
        const resp = await request(app)
            .get('/items')
        expect(resp.statusCode).toBe(200);
        expect(resp.body).toEqual([{
            "name": "popsicle",
            "price": 1.45
        }]);
    });
});

// GET /items/:name - this route should display a single item’s name and price.
describe("GET /items/:name", function () {
    test("displays a single item’s name and price.", async function () {
        const resp = await request(app)
            .get('/items/popsicle')
        expect(resp.statusCode).toBe(200);
        expect(resp.body).toEqual({
            "name": "popsicle",
            "price": 1.45
        });
    });
});

// PATCH /items/:name, this route should modify a single item’s name and/or price.
describe("PATCH /items/:name", function () {
    test("modifies a single item’s name and/or price.", async function () {
        const resp = await request(app)
            .patch('/items/popsicle')
            .send({
                "name": "popsicle2",
                "price": 1.50
            })
        expect(resp.statusCode).toBe(200);
        expect(resp.body).toEqual({
            "updated": {
                "name": "popsicle2",
                "price": 1.5
            }
        });
    });
});

// DELETE /items/:name - this route should allow you to delete a specific item from the array.
describe("DELETE /items/:name", function () {
    test("deletes a specific item from the array.", async function () {
        const resp = await request(app)
            .delete('/items/popsicle')
        expect(resp.statusCode).toBe(200);
        expect(resp.body).toEqual({"message": "Deleted"});
    });
});

//////////// JEST - CONSOLE OUTPUT ////////////
// PASS  routes/todo.test.js (8.467 s)
// POST /items
//   ✓ accepts JSON data and add it to the shopping list (234 ms)
// GET /items
//   ✓ renders a list of shopping items (3 ms)
// GET /items/:name
//   ✓ displays a single item’s name and price. (2 ms)
// PATCH /items/:name
//   ✓ modifies a single item’s name and/or price. (2 ms)
// DELETE /items/:name
//   ✓ deletes a specific item from the array. (3 ms)

// Test Suites: 1 passed, 1 total
// Tests:       5 passed, 5 total
// Snapshots:   0 total
// Time:        8.497 s, estimated 9 s
// Ran all test suites.