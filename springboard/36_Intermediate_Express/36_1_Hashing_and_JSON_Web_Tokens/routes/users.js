const Router = require("express").Router;
const User = require("../models/user");
const {ensureLoggedIn, ensureCorrectUser} = require("../middleware/auth");
const router = new Router();

/** GET / - get list of users.
 *
 * => {users: [{username, first_name, last_name, phone}, ...]}
 *
 **/
router.get('/', ensureLoggedIn, async (req, res, next) => {
    try {
        const results = User.all();
        return res.json({users: results});
    } catch(e) {
        return next(e);
    }
});

/** GET /:username - get detail of users.
 *
 * => {user: {username, first_name, last_name, phone, join_at, last_login_at}}
 *
 **/
router.get('/:username', ensureCorrectUser, async (req, res, next) => {
    try {
        const results = User.get(req.params.username);
        return res.json({user: results});
    } catch(e) {
        return next(e);
    }
});

/** GET /:username/to - get messages to user
 *
 * => {messages: [{id,
 *                 body,
 *                 sent_at,
 *                 read_at,
 *                 from_user: {username, first_name, last_name, phone}}, ...]}
 *
 **/
router.get('/:username/to', ensureCorrectUser, async (req, res, next) => {
    try {
        const results = User.messagesTo(req.params.username);
        return res.json({messages: results});
    } catch(e) {
        return next(e);
    }
})

/** GET /:username/from - get messages from user
 *
 * => {messages: [{id,
 *                 body,
 *                 sent_at,
 *                 read_at,
 *                 to_user: {username, first_name, last_name, phone}}, ...]}
 *
 **/
 router.get('/:username/from', ensureCorrectUser, async (req, res, next) => {
    try {
        const results = User.messagesFrom(req.params.username);
        return res.json({messages: results});
    } catch(e) {
        return next(e);
    }
})

module.exports = router;