// getting the app from our app.js file
const app = require("./app")
// listening to port 3000 and printing a text when the server starts
app.listen(3000, function () {
  console.log("Server starting on port 3000")
})