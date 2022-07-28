/** Common config for bookstore. */

const DB_URI = (process.env.NODE_ENV === "test")
  ? "postgresql://test:test@localhost/books_test"
  : "postgresql://test:test@localhost/books";

module.exports = { DB_URI };