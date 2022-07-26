const jwt = require("jsonwebtoken");
const Router = require("express").Router;
const router = new Router();

const User = require("../models/user");
const {SECRET_KEY} = require("../config");
const ExpressError = require("../expressError");


/** POST /login - login: {username, password} => {token}  **/
router.post('/login', async (req, res, next) => {
    try{
        const {username, password} = req.body;
        
        const result = await User.authenticate(username, password);

        if(!result) {
            throw new ExpressError("Invalid username or password", 403);
        }

        const token = jwt.sign({username}, SECRET_KEY);

        // Make sure to update their last-login!
        User.updateLoginTimestamp(username);

        return res.json({token});

    } catch(e) {
        return next(e);
    }
});

// TESTING
// POST http://localhost:3000/auth/login
// {	
//     "username": "test7", 
//     "password": "test7"

//    }

// RETURNS
// {
// 	"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3Q3IiwiaWF0IjoxNjU4Nzk2NjQzfQ.c--qUicLy9SKvkPqisvaSZz1OvYG5jpZxwpDQrHGRgw"
// }


/** POST /register - register user: registers, logs in, and returns token.
 *
 * {username, password, first_name, last_name, phone} => {token}.
 *
 */
router.post('/register', async (req, res, next) => {
    try {
        const {username, password, first_name, last_name, phone} = req.body;
        await User.register(username, password, first_name, last_name, phone);

        const token = jwt.sign({username}, SECRET_KEY);

        // Make sure to update their last-login!
        User.updateLoginTimestamp(username);

        return res.json({token});

        
    } catch(e) {
        return next(e);
    }
});

// TESTING

// POST http://localhost:3000/auth/register
// {	
//     "username": "test7", 
//     "password": "test7", 
//     "first_name": "Test", 
//     "last_name": "Testovich", 
//     "phone": "412-123-4567"
//    }

// RETURNS
// {
// 	"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3Q3IiwiaWF0IjoxNjU4Nzk2NTMxfQ.YGvjCnaCi2dnh3fAn3Cks31V3NKsKTQUG_krvteNVGc"
// }


module.exports = router;