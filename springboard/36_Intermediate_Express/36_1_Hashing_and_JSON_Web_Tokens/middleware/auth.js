/** Middleware for handling req authorization for routes. */

const jwt = require("jsonwebtoken");
const { SECRET_KEY } = require("../config");

/** Middleware: Authenticate user. */

// looks for a token, if valid, adds the payload onto the request itself
// then calls next(), that means if we use this middleware in every single route,
// every route handler will have access to req.user
// if req.user exists, its verified.
// if req.user doesn't exist, that means token was not verified or no token provided.
// authenticating the token but we are not changing the behaviour of the app.
function authenticateJWT(req, res, next) {
  try {
    // retrieves a _token sent in the request
    const tokenFromBody = req.body._token;
    // checks that the token is valid. also passes app SECRET_KEY to make sure the data is not tampered.
    // if the token is valid, returns the payload sent.
    const payload = jwt.verify(tokenFromBody, SECRET_KEY);
    // assigns the payload to user parameters under the request object.
    // this .user will be available for every request that has a valid token.
    // this .user will be used to tell us if the user is   authenticated.
    req.user = payload; // create a current user
    return next();
  } catch (err) {
    return next();
  }
}

/** Middleware: Requires user is authenticated. */
// similar to session cookie. Corresponds to current user that is logged in.
function ensureLoggedIn(req, res, next) {
  // checks if the .user exists/authenticated
  if (!req.user) {
    // if the req.user is missing, we will throw unauthorized.
    // will selectively use it on some pages/routes (Example: admin)
    // but for registration and login, we will not use this.
    return next({ status: 401, message: "Unauthorized" });
  } else {
    return next();
  }
}

/** Middleware: Requires correct username. */

function ensureCorrectUser(req, res, next) {
  try {
    if (req.user.username === req.params.username) {
      return next();
    } else {
      // throws an error if the username stored in JWT matches username passed as a parameter
      return next({ status: 401, message: "Unauthorized" });
    }
  } catch (err) {
    // errors would happen here if we made a request and req.user is undefined
    return next({ status: 401, message: "Unauthorized" });
  }
}
// end

module.exports = {
  authenticateJWT,
  ensureLoggedIn,
  ensureCorrectUser
};
