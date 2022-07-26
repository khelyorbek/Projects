/** User class for message.ly */
const db = require("../db");
const ExpressError = require("../expressError");
const {BCRYPT_WORK_FACTOR} = require("../config");
const bcrypt = require("bcrypt");

/** User of the site. */

class User {

  /** register new user -- returns
   *    {username, password, first_name, last_name, phone}
   */
  static async register(username, password, first_name, last_name, phone) {
     const hashedPw = await bcrypt.hash(password,BCRYPT_WORK_FACTOR);
     const currentDate = new Date();
     const res = await db.query(`
     INSERT INTO users (username, password, first_name, last_name, phone, join_at, last_login_at) 
     VALUES ($1, $2, $3, $4, $5, $6, $7)
     RETURNING username, password, first_name, last_name, phone;`,
     [username, hashedPw, first_name, last_name, phone, currentDate, currentDate]);
     
     return res.rows[0];
   }

  /** Authenticate: is this username/password valid? Returns boolean. */
  static async authenticate(username, password) {
    if (!username || !password) {
      throw new ExpressError(`Please provide a valid username and/or password`, 403);
    }
    
    const result = await db.query(`
    SELECT password 
    FROM users
    WHERE username = $1`,
    [username]);

    let user = result.rows[0];

    return user && await bcrypt.compare(password, user.password);
   }

  /** Update last_login_at for user */
  static async updateLoginTimestamp(username) {
    const currentDate = new Date();

    if (!username) {
      throw new ExpressError(`Please provide a valid username`, 403);
    }

    const res = await db.query(`
    UPDATE users
    SET last_login_at = $1
    WHERE username = $2
    RETURNING username;`,
    [currentDate,username])

    if (!res.rows[0]) {
      throw new ExpressError(`Username not found`, 404);
    }
   }

  /** All: basic info on all users:
   * [{username, first_name, last_name, phone}, ...] */
  static async all() {
    const res = await db.query(`
    SELECT username, first_name, last_name, phone
    FROM users`);

    return res.rows;
   }


  /** Get: get user by username
   *
   * returns {username,
   *          first_name,
   *          last_name,
   *          phone,
   *          join_at,
   *          last_login_at } */
  static async get(username) {
    const res = await db.query(`
    SELECT username, first_name, last_name, phone, join_at, last_login_at
    FROM users
    WHERE username = $1`,
    [username]);

    if (!res.rows[0]) {
      throw new ExpressError(`Username not found`, 404);
    }

    return res.rows[0];
   }


  /** Return messages from this user.
   *
   * [{id, to_user, body, sent_at, read_at}]
   *
   * where to_user is
   *   {username, first_name, last_name, phone}
   */
  static async messagesFrom(username) {
    const res = await db.query(`
    SELECT msg.id, msg.to_username, usr.first_name, usr.last_name, usr.phone, msg.body, msg.sent_at, msg.read_at 
    FROM messages AS msg 
    JOIN users AS usr 
    ON msg.to_username = usr.username 
    WHERE msg.from_username = $1;`,
    [username]);

    return res.rows.map(i => ({
      id: i.id,
      to_user: {
        username: i.to_username,
        first_name: i.first_name,
        last_name: i.last_name,
        phone: i.phone
      },
      body: i.body,
      sent_at: i.sent_at,
      read_at: i.read_at
    }));
   }


  /** Return messages to this user.
   *
   * [{id, from_user, body, sent_at, read_at}]
   *
   * where from_user is
   *   {username, first_name, last_name, phone}
   */
  static async messagesTo(username) {
    const res = await db.query(`
    SELECT msg.id, msg.from_username, usr.first_name, usr.last_name, usr.phone, msg.body, msg.sent_at, msg.read_at 
    FROM messages AS msg 
    JOIN users AS usr 
    ON msg.from_username = usr.username 
    WHERE msg.to_username = $1;`,
    [username]);

    return res.rows.map(i => ({
      id: i.id,
      from_user: {
        username: i.from_username,
        first_name: i.first_name,
        last_name: i.last_name,
        phone: i.phone
      },
      body: i.body,
      sent_at: i.sent_at,
      read_at: i.read_at
    }));
   }
}


module.exports = User;

// jest -i --verbose
//  PASS  __tests__/users.test.js (5.852 s)
//   Test User class
//     ✓ can register (417 ms)
//     ✓ can authenticate (602 ms)
//     ✓ can update login timestamp (206 ms)
//     ✓ can get (202 ms)
//     ✓ can get all (202 ms)
//   Test messages part of User class
//     ✓ can get messages from user (407 ms)
//     ✓ can get messages to user (407 ms)