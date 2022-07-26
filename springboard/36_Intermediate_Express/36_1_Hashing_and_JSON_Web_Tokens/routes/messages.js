const Router = require("express").Router;
const router = new Router();
const Message = require("../models/message");
const {ensureLoggedIn} = require("../middleware/auth");
const ExpressError = require("../expressError");

/** GET /:id - get detail of message.
 *
 * => {message: {id,
 *               body,
 *               sent_at,
 *               read_at,
 *               from_user: {username, first_name, last_name, phone},
 *               to_user: {username, first_name, last_name, phone}}
 *
 * Make sure that the currently-logged-in users is either the to or from user.
 *
 **/
router.get("/:id", ensureLoggedIn, async (req, res, next) => {
    try {
        const currUser = req.user.username;
        const msg = await Message.get(req.params.id);

        if(msg.from_user == currUser || msg.to_user == currUser) {
            return res.json({message: msg});
        } else {
            throw new ExpressError("Currently-logged-in user must be the sender or the recipient of the msg!", 403);
        }
    } catch(e) {
        return next(e);
    }
})

/** POST / - post message.
 *
 * {to_username, body} =>
 *   {message: {id, from_username, to_username, body, sent_at}}
 *
 **/
 router.post("/", ensureLoggedIn, async (req, res, next) => {
    try {
        const from_username = req.user.username;
        const to_username = req.body.to_username;
        const body = req.body.body;

        const result = Message.create(from_username, to_username, body);

        return res.json({message: result});
    } catch(e) {
        return next(e);
    }
})

/** POST/:id/read - mark message as read:
 *
 *  => {message: {id, read_at}}
 *
 * Make sure that the only the intended recipient can mark as read.
 *
 **/
 router.post("/:id/read", ensureLoggedIn, async (req, res, next) => {
    try {
        const currUser = req.user.username;
        const msg = await Message.get(req.params.id);

        if(currUser == msg.to_user.username) {
            const msg_read = Message.markRead(req.params.id);
        } else {
            throw new ExpressError("Operation not allowed!", 403);
        }

        return res.json({message: msg_read});

    } catch(e) {
        return next(e);
    }
})

module.exports = router;