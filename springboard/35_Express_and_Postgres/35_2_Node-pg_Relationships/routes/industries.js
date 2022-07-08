const express = require("express");
const ExpressError = require("../expressError");
const router = express.Router();
const db = require("../db");

// adding an industry
router.post('/', async (req, res, next) => {
    try {
        const {code, industry} = req.body;

        const results = await db.query('INSERT INTO industries VALUES ($1, $2) RETURNING code, industry', [code, industry]);

        // checking to make sure we got some results
        if(results.rows.length === 0) {
            // If the company given cannot be found, this should return a 404 status response.
            throw new ExpressError(`Can't add industry with code ${code}`, 404)
        }

        return res.send({message: "Added", code, industry})

    } catch(e) {
        next(e);
    }

    /* TESTING
    POST http://localhost:3000/industries
    {
	"code": "mus",
	"industry": "Music"
    }	

    RETURNING
    {
	"message": "Added",
	"code": "mus",
	"industry": "Music"
    }

    DB
    code |        industry
    ------+------------------------
    it   | Information Technology
    acct | Accounting
    hc   | Health Care
    edu  | Education
    mus  | Music
    (5 rows)

    */
})

// listing all industries, which should show the company code(s) for that industry
router.get('/', async (req, res, next) => {
    try {
        const results = await db.query('SELECT * FROM industries LEFT JOIN industries_companies ON industries.code=industries_companies.ind_code;');

        // checking to make sure we got some results
        if(results.rows.length === 0) {
            throw new ExpressError(`No industries found`, 404)
        }

        return res.send(results.rows);

    } catch(e) {
        next(e);
    }
    /* TESTING
    GET http://localhost:3000/industries

    RETURNS
    [
	{
		"code": "it",
		"industry": "Information Technology",
		"comp_code": "apple",
		"ind_code": "it"
	},
	{
		"code": "acct",
		"industry": "Accounting",
		"comp_code": "apple",
		"ind_code": "acct"
	},
	{
		"code": "hc",
		"industry": "Health Care",
		"comp_code": "ibm",
		"ind_code": "hc"
	},
	{
		"code": "edu",
		"industry": "Education",
		"comp_code": "ibm",
		"ind_code": "edu"
	},
	{
		"code": "mus",
		"industry": "Music",
		"comp_code": null,
		"ind_code": null
	}
    ]
    */
})

// associating an industry to a company
router.put('/', async (req, res, next) => {
    try {
        const {companyCode, industryCode} = req.body;

        const results = await db.query('INSERT INTO industries_companies VALUES ($1, $2)', [companyCode, industryCode]);

        return res.send({message:`Added company code ${companyCode} to industry ${industryCode} successfully!`});
    } catch(e) {
        next(e);
    }
    /* TESTING
    PUT http://localhost:3000/industries
    { 
	"companyCode": "apple",
	"industryCode": "mus"
    }	

    RETURNS
    {
	"message": "Added company code apple to industry mus successfully!"
    }

    AFTER UPDATE
    [
	{
		"code": "it",
		"industry": "Information Technology",
		"comp_code": "apple",
		"ind_code": "it"
	},
	{
		"code": "acct",
		"industry": "Accounting",
		"comp_code": "apple",
		"ind_code": "acct"
	},
	{
		"code": "hc",
		"industry": "Health Care",
		"comp_code": "ibm",
		"ind_code": "hc"
	},
	{
		"code": "edu",
		"industry": "Education",
		"comp_code": "ibm",
		"ind_code": "edu"
	},
	{
		"code": "mus",
		"industry": "Music",
		"comp_code": "apple",
		"ind_code": "mus" <<< UPDATED
	}
    ]
    */ 
})


//  Must have this export statement, otherwise the app errors out.
module.exports = router;