// importing express
const express = require('express')
// mapping express to app variable
const app = express();
// importing the custom express error class
const ExpressError = require('./expressError')
// importing our custom routes
const todoRoutes = require('./routes/todo')

// telling express to return JSON format
app.use(express.json());
// telling express to use todoRoutes custom routes for anything related to /items
app.use('/items', todoRoutes);

module.exports = app;