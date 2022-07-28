const express = require("express");
const Book = require("../models/book");
const jsonschema = require("jsonschema");
const ExpressError = require("../expressError")

const router = new express.Router();
const bookSchema = require("../schemas/book.json");


/** GET / => {books: [book, ...]}  */

router.get("/", async function (req, res, next) {
  try {
    const books = await Book.findAll(req.query);
    return res.json({ books });
  } catch (err) {
    return next(err);
  }
});

/** GET /[id]  => {book: book} */

router.get("/:id", async function (req, res, next) {
  try {
    const book = await Book.findOne(req.params.id);
    return res.json({ book });
  } catch (err) {
    return next(err);
  }
});

/** POST /   bookData => {book: newBook}  */

router.post("/", async function (req, res, next) {
  try {
    // Use JSONSchema to validate the creation and updating of your books! 
    const result = jsonschema.validate(req.body, bookSchema);

    // Display an error message containing all of the validation errors if book creation or updating fails.
    if(!result.valid) {
      let errStack = result.errors.map(e => e.stack);
      let err = new ExpressError(errStack, 400);
      return next(err);
    }

    // If validations do not error, then create the book.    
    const book = await Book.create(req.body);
    return res.status(201).json({ book });
  } catch (err) {
    return next(err);
  }
});

/** PUT /[isbn]   bookData => {book: updatedBook}  */

router.put("/:isbn", async function (req, res, next) {
  try {
    // Use JSONSchema to validate the creation and updating of your books! 
    const result = jsonschema.validate(req.body, bookSchema);

    // Display an error message containing all of the validation errors if book creation or updating fails.
    if(!result.valid) {
      let errStack = result.errors.map(e => e.stack);
      let err = new ExpressError(errStack, 400);
      return next(err);
    }

    // If validations do not error, then update the book.
    const book = await Book.update(req.params.isbn, req.body);
    return res.json({ book });
  } catch (err) {
    return next(err);
  }
});

/** DELETE /[isbn]   => {message: "Book deleted"} */

router.delete("/:isbn", async function (req, res, next) {
  try {
    await Book.remove(req.params.isbn);
    return res.json({ message: "Book deleted" });
  } catch (err) {
    return next(err);
  }
});

module.exports = router;


// TESTING THE POST ROUTE VALIDATIONS
// POST http://localhost:3000/books

// PAYLOAD BELOW:
// {
//   "isbn": "978-1590304488",
//   "amazon_url": "https://www.amazon.com/Art-Peace-Morihei-Ueshiba/dp/1590304489",
//   "author": "Morihei Ueshiba",
//   "language": "english",
//   "pages": 192,
//   "publisher": "Shambhala",
//   "title": "The Art of Peace",
//   "year": 2007
// }

// RECEIVED:
// {
// 	"book": {
// 		"isbn": "978-1590304488",
// 		"amazon_url": "https://www.amazon.com/Art-Peace-Morihei-Ueshiba/dp/1590304489",
// 		"author": "Morihei Ueshiba",
// 		"language": "english",
// 		"pages": 192,
// 		"publisher": "Shambhala",
// 		"title": "The Art of Peace",
// 		"year": 2007
// 	}
// }



// TESTING THE PUT ROUTE VALIDATIONS
// PUT http://localhost:3000/books/0691161518

// PAYLOAD
// {
//   "isbn": "0691161518",
//   "amazon_url": "http://a.co/eobPtX2",
//   "author": "Matthew Lane_UPDATE",
//   "language": "russian",
//   "pages": 321,
//   "publisher": "Some test university Press",
//   "title": "Power-Up: Unlocking the Hidden Mathematics in Video Games",
//   "year": 2030
// }

// RECEIVED:
// CHANGES ALSO REFLECTED IN DB
// {
// 	"book": {
// 		"isbn": "0691161518",
// 		"amazon_url": "http://a.co/eobPtX2",
// 		"author": "Matthew Lane_UPDATE",
// 		"language": "russian",
// 		"pages": 321,
// 		"publisher": "Some test university Press",
// 		"title": "Power-Up: Unlocking the Hidden Mathematics in Video Games",
// 		"year": 2030
// 	}
// }