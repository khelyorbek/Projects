process.env.NODE_ENV = "test";

const request = require("supertest");
const app = require("../app");
const db = require("../db");

beforeEach(async function () {
    await request(app).post('/books').send({
        "isbn": "0691161518",
        "amazon_url": "http://a.co/eobPtX2",
        "author": "Matthew Lane",
        "language": "english",
        "pages": 264,
        "publisher": "Princeton University Press",
        "title": "Power-Up: Unlocking the Hidden Mathematics in Video Games",
        "year": 2017
    });

    await request(app).post('/books').send({
        "isbn": "978-1590304488",
        "amazon_url": "https://www.amazon.com/Art-Peace-Morihei-Ueshiba/dp/1590304489",
        "author": "Morihei Ueshiba",
        "language": "english",
        "pages": 192,
        "publisher": "Shambhala",
        "title": "The Art of Peace",
        "year": 2007
    });
})

describe('GET /', function () {
    test("get all books", async function () {
        const response = await request(app)
            .get('/books');
        expect(response.statusCode).toBe(200);
        expect(response.body).toEqual({
            "books": [{
                    "isbn": "0691161518",
                    "amazon_url": "http://a.co/eobPtX2",
                    "author": "Matthew Lane",
                    "language": "english",
                    "pages": 264,
                    "publisher": "Princeton University Press",
                    "title": "Power-Up: Unlocking the Hidden Mathematics in Video Games",
                    "year": 2017
                },
                {
                    "isbn": "978-1590304488",
                    "amazon_url": "https://www.amazon.com/Art-Peace-Morihei-Ueshiba/dp/1590304489",
                    "author": "Morihei Ueshiba",
                    "language": "english",
                    "pages": 192,
                    "publisher": "Shambhala",
                    "title": "The Art of Peace",
                    "year": 2007
                }
            ]
        });
    })
})

describe('GET /[id]', function () {
    test("get details of 1 book", async function () {
        const response = await request(app)
            .get('/books/0691161518')
        expect(response.statusCode).toBe(200);
        expect(response.body).toEqual({
            "book": {
                "isbn": "0691161518",
                "amazon_url": "http://a.co/eobPtX2",
                "author": "Matthew Lane",
                "language": "english",
                "pages": 264,
                "publisher": "Princeton University Press",
                "title": "Power-Up: Unlocking the Hidden Mathematics in Video Games",
                "year": 2017
            }
        });
    })
})

describe('POST /', function () {
    test("make sure all fields are required", async function () {
        const response = await request(app)
            .post('/books')
            .send({});
        expect(response.statusCode).toBe(400);
        expect(response.body).toEqual({
            "error": {
                "message": [
                    "instance requires property \"isbn\"",
                    "instance requires property \"amazon_url\"",
                    "instance requires property \"author\"",
                    "instance requires property \"language\"",
                    "instance requires property \"pages\"",
                    "instance requires property \"publisher\"",
                    "instance requires property \"title\"",
                    "instance requires property \"year\""
                ],
                "status": 400
            },
            "message": [
                "instance requires property \"isbn\"",
                "instance requires property \"amazon_url\"",
                "instance requires property \"author\"",
                "instance requires property \"language\"",
                "instance requires property \"pages\"",
                "instance requires property \"publisher\"",
                "instance requires property \"title\"",
                "instance requires property \"year\""
            ]
        });
    });
    test("ensure ISBN minimum length requirement validations are working", async function () {
        const response = await request(app)
            .post('/books')
            .send({
                "isbn": "123456",
                "amazon_url": "https://www.amazon.com/Hundred-Solitude-Harper-Perennial-Classics/dp/0060883286",
                "author": "Gabriel Garcia Marquez",
                "language": "english",
                "pages": 417,
                "publisher": "Harper Perennial Modern Classics",
                "title": "One Hundred Years of Solitude",
                "year": 2006
            });
        expect(response.statusCode).toBe(400);
        expect(response.body).toEqual({
            "error": {
                "message": [
                    "instance.isbn does not meet minimum length of 10"
                ],
                "status": 400
            },
            "message": [
                "instance.isbn does not meet minimum length of 10"
            ]
        });
    });
    test("ensure ISBN maximum length requirement validations are working", async function () {
        const response = await request(app)
            .post('/books')
            .send({
                "isbn": "123456492384094823904823904284902384920",
                "amazon_url": "https://www.amazon.com/Hundred-Solitude-Harper-Perennial-Classics/dp/0060883286",
                "author": "Gabriel Garcia Marquez",
                "language": "english",
                "pages": 417,
                "publisher": "Harper Perennial Modern Classics",
                "title": "One Hundred Years of Solitude",
                "year": 2006
            });
        expect(response.statusCode).toBe(400);
        expect(response.body).toEqual({
            "error": {
                "message": [
                    "instance.isbn does not meet maximum length of 14"
                ],
                "status": 400
            },
            "message": [
                "instance.isbn does not meet maximum length of 14"
            ]
        });
    });
    test("ensure URL validations are working", async function () {
        const response = await request(app)
            .post('/books')
            .send({
                "isbn": "0060883286",
                "amazon_url": 123124332585739792342424,
                "author": "Gabriel Garcia Marquez",
                "language": "english",
                "pages": 417,
                "publisher": "Harper Perennial Modern Classics",
                "title": "One Hundred Years of Solitude",
                "year": 2006
            });
        expect(response.statusCode).toBe(400);
        expect(response.body).toEqual({
            "error": {
                "message": [
                    "instance.amazon_url is not of a type(s) string"
                ],
                "status": 400
            },
            "message": [
                "instance.amazon_url is not of a type(s) string"
            ]
        });
    });
    test("ensure year minimum length requirement validations are working", async function () {
        const response = await request(app)
            .post('/books')
            .send({
                "isbn": "0060883286",
                "amazon_url": "https://www.amazon.com/Hundred-Solitude-Harper-Perennial-Classics/dp/0060883286",
                "author": "Gabriel Garcia Marquez",
                "language": "english",
                "pages": 417,
                "publisher": "Harper Perennial Modern Classics",
                "title": "One Hundred Years of Solitude",
                "year": 1899
            });
        expect(response.statusCode).toBe(400);
        expect(response.body).toEqual({
            "error": {
                "message": [
                    "instance.year must be greater than or equal to 1900"
                ],
                "status": 400
            },
            "message": [
                "instance.year must be greater than or equal to 1900"
            ]
        });
    });
    test("ensure year maximum length requirement validations are working", async function () {
        const response = await request(app)
            .post('/books')
            .send({
                "isbn": "0060883286",
                "amazon_url": "https://www.amazon.com/Hundred-Solitude-Harper-Perennial-Classics/dp/0060883286",
                "author": "Gabriel Garcia Marquez",
                "language": "english",
                "pages": 417,
                "publisher": "Harper Perennial Modern Classics",
                "title": "One Hundred Years of Solitude",
                "year": 2055
            });
        expect(response.statusCode).toBe(400);
        expect(response.body).toEqual({
            "error": {
                "message": [
                    "instance.year must be less than or equal to 2050"
                ],
                "status": 400
            },
            "message": [
                "instance.year must be less than or equal to 2050"
            ]
        });
    });
    test("create a new book", async function () {
        const response = await request(app)
            .post('/books')
            .send({
                "isbn": "0060883286",
                "amazon_url": "https://www.amazon.com/Hundred-Solitude-Harper-Perennial-Classics/dp/0060883286",
                "author": "Gabriel Garcia Marquez",
                "language": "english",
                "pages": 417,
                "publisher": "Harper Perennial Modern Classics",
                "title": "One Hundred Years of Solitude",
                "year": 2006
            });
        expect(response.statusCode).toBe(201);
        expect(response.body).toEqual({
            "book": {
                "isbn": "0060883286",
                "amazon_url": "https://www.amazon.com/Hundred-Solitude-Harper-Perennial-Classics/dp/0060883286",
                "author": "Gabriel Garcia Marquez",
                "language": "english",
                "pages": 417,
                "publisher": "Harper Perennial Modern Classics",
                "title": "One Hundred Years of Solitude",
                "year": 2006
            }
        });
    });
})

describe('PUT /[isbn]', function () {
    test("make sure all fields are required", async function () {
        const response = await request(app)
            .put('/books/0060883286')
            .send({});
        expect(response.statusCode).toBe(400);
        expect(response.body).toEqual({
            "error": {
                "message": [
                    "instance requires property \"isbn\"",
                    "instance requires property \"amazon_url\"",
                    "instance requires property \"author\"",
                    "instance requires property \"language\"",
                    "instance requires property \"pages\"",
                    "instance requires property \"publisher\"",
                    "instance requires property \"title\"",
                    "instance requires property \"year\""
                ],
                "status": 400
            },
            "message": [
                "instance requires property \"isbn\"",
                "instance requires property \"amazon_url\"",
                "instance requires property \"author\"",
                "instance requires property \"language\"",
                "instance requires property \"pages\"",
                "instance requires property \"publisher\"",
                "instance requires property \"title\"",
                "instance requires property \"year\""
            ]
        });
    });
    test("ensure ISBN minimum length requirement validations are working", async function () {
        const response = await request(app)
            .put('/books/0060883286')
            .send({
                "isbn": "123456",
                "amazon_url": "https://www.amazon.com/Hundred-Solitude-Harper-Perennial-Classics/dp/0060883286",
                "author": "Gabriel Garcia Marquez",
                "language": "english",
                "pages": 417,
                "publisher": "Harper Perennial Modern Classics",
                "title": "One Hundred Years of Solitude",
                "year": 2006
            });
        expect(response.statusCode).toBe(400);
        expect(response.body).toEqual({
            "error": {
                "message": [
                    "instance.isbn does not meet minimum length of 10"
                ],
                "status": 400
            },
            "message": [
                "instance.isbn does not meet minimum length of 10"
            ]
        });
    });
    test("ensure ISBN maximum length requirement validations are working", async function () {
        const response = await request(app)
            .put('/books/0060883286')
            .send({
                "isbn": "123456492384094823904823904284902384920",
                "amazon_url": "https://www.amazon.com/Hundred-Solitude-Harper-Perennial-Classics/dp/0060883286",
                "author": "Gabriel Garcia Marquez",
                "language": "english",
                "pages": 417,
                "publisher": "Harper Perennial Modern Classics",
                "title": "One Hundred Years of Solitude",
                "year": 2006
            });
        expect(response.statusCode).toBe(400);
        expect(response.body).toEqual({
            "error": {
                "message": [
                    "instance.isbn does not meet maximum length of 14"
                ],
                "status": 400
            },
            "message": [
                "instance.isbn does not meet maximum length of 14"
            ]
        });
    });
    test("ensure URL validations are working", async function () {
        const response = await request(app)
            .put('/books/0060883286')
            .send({
                "isbn": "0060883286",
                "amazon_url": 123124332585739792342424,
                "author": "Gabriel Garcia Marquez",
                "language": "english",
                "pages": 417,
                "publisher": "Harper Perennial Modern Classics",
                "title": "One Hundred Years of Solitude",
                "year": 2006
            });
        expect(response.statusCode).toBe(400);
        expect(response.body).toEqual({
            "error": {
                "message": [
                    "instance.amazon_url is not of a type(s) string"
                ],
                "status": 400
            },
            "message": [
                "instance.amazon_url is not of a type(s) string"
            ]
        });
    });
    test("ensure year minimum length requirement validations are working", async function () {
        const response = await request(app)
            .put('/books/0060883286')
            .send({
                "isbn": "0060883286",
                "amazon_url": "https://www.amazon.com/Hundred-Solitude-Harper-Perennial-Classics/dp/0060883286",
                "author": "Gabriel Garcia Marquez",
                "language": "english",
                "pages": 417,
                "publisher": "Harper Perennial Modern Classics",
                "title": "One Hundred Years of Solitude",
                "year": 1899
            });
        expect(response.statusCode).toBe(400);
        expect(response.body).toEqual({
            "error": {
                "message": [
                    "instance.year must be greater than or equal to 1900"
                ],
                "status": 400
            },
            "message": [
                "instance.year must be greater than or equal to 1900"
            ]
        });
    });
    test("ensure year maximum length requirement validations are working", async function () {
        const response = await request(app)
            .put('/books/0060883286')
            .send({
                "isbn": "0060883286",
                "amazon_url": "https://www.amazon.com/Hundred-Solitude-Harper-Perennial-Classics/dp/0060883286",
                "author": "Gabriel Garcia Marquez",
                "language": "english",
                "pages": 417,
                "publisher": "Harper Perennial Modern Classics",
                "title": "One Hundred Years of Solitude",
                "year": 2055
            });
        expect(response.statusCode).toBe(400);
        expect(response.body).toEqual({
            "error": {
                "message": [
                    "instance.year must be less than or equal to 2050"
                ],
                "status": 400
            },
            "message": [
                "instance.year must be less than or equal to 2050"
            ]
        });
    });
    test("update existing book with new info", async function () {
        const response = await request(app)
            .put('/books/0691161518')
            .send({
                "isbn": "0691161518",
                "amazon_url": "http://a.co/eobPtX2",
                "author": "Matthew Lane",
                "language": "english",
                "pages": 264,
                "publisher": "Princeton University Press",
                "title": "Power-Up: Unlocking the Hidden Mathematics in Video Games",
                "year": 2035
            });
        expect(response.statusCode).toBe(200);
        expect(response.body).toEqual({
            "book": {
                "isbn": "0691161518",
                "amazon_url": "http://a.co/eobPtX2",
                "author": "Matthew Lane",
                "language": "english",
                "pages": 264,
                "publisher": "Princeton University Press",
                "title": "Power-Up: Unlocking the Hidden Mathematics in Video Games",
                "year": 2035
            }
        });
    });
})

describe('DELETE /[isbn]', function() {
    test("delete a book that does exist", async function () {
        const response = await request(app)
        .delete('/books/0691161518')
        .send({});
        expect(response.statusCode).toBe(200);
        expect(response.body).toEqual(
            {
                "message": "Book deleted"
            }
        );
    })
    test("delete a book that doesn't exist", async function () {
        const response = await request(app)
        .delete('/books/1234567890')
        .send({});
        expect(response.statusCode).toBe(404);
        expect(response.body).toEqual(
            {
                "error": {
                    "message": "There is no book with an isbn '1234567890",
                    "status": 404
                },
                "message": "There is no book with an isbn '1234567890"
            }
        );
    })
})

afterEach(async function () {
    // delete any data created by test
    await db.query("DELETE FROM books");

})

afterAll(async function () {
    // close db connection
    await db.end();
})


// PASS  tests/book.test.js (6.265 s)
// GET /
//   ✓ get all books (194 ms)
// GET /[id]
//   ✓ get details of 1 book (11 ms)
// POST /
//   ✓ make sure all fields are required (74 ms)
//   ✓ ensure ISBN minimum length requirement validations are working (15 ms)
//   ✓ ensure ISBN maximum length requirement validations are working (16 ms)
//   ✓ ensure URL validations are working (15 ms)
//   ✓ ensure year minimum length requirement validations are working (15 ms)
//   ✓ ensure year maximum length requirement validations are working (12 ms)
//   ✓ create a new book (9 ms)
// PUT /[isbn]
//   ✓ make sure all fields are required (12 ms)
//   ✓ ensure ISBN minimum length requirement validations are working (11 ms)
//   ✓ ensure ISBN maximum length requirement validations are working (13 ms)
//   ✓ ensure URL validations are working (11 ms)
//   ✓ ensure year minimum length requirement validations are working (11 ms)
//   ✓ ensure year maximum length requirement validations are working (12 ms)
//   ✓ update existing book with new info (10 ms)
// DELETE /[isbn]
//   ✓ delete a book that does exist (8 ms)
//   ✓ delete a book that doesn't exist (7 ms)

// Test Suites: 1 passed, 1 total
// Tests:       18 passed, 18 total
// Snapshots:   0 total
// Time:        6.294 s, estimated 7 s
// Ran all test suites.