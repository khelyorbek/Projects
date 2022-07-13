const express = require("express");
const ExpressError = require("../expressError");
const router = express.Router();
const db = require("../db");
const { default: slugify } = require("slugify");

// GET /companies
router.get('/', async (req, res, next) => {
    try {
        const results = await db.query('SELECT * FROM companies');
        // Returns list of companies, like {companies: [{code, name}, ...]}
        return res.json({companies: results.rows});
    } catch(e){
        return next(e);
    }
    /* TEST
    GET http://localhost:3000/companies

    RETURNS
    {
	"companies": [
		{
			"code": "apple",
			"name": "Apple Computer",
			"description": "Maker of OSX."
		},
		{
			"code": "ibm",
			"name": "IBM",
			"description": "Big blue."
		},
		{
			"code": "ms",
			"name": "Microsoft",
			"description": "Maker of Windows."
		}
    ]
    }
    */
})

// GET /companies/[code]
router.get('/:code', async(req, res, next) => {
    
    try {
        const {code} = req.params;

        const results = await db.query(
            `SELECT * 
            FROM companies 
            LEFT JOIN industries_companies 
            ON companies.code=industries_companies.comp_code 
            WHERE code=$1`, [code]);
        
        // checking to make sure we got some results
        if(results.rows.length === 0) {
            // If the company given cannot be found, this should return a 404 status response.
            throw new ExpressError(`Can't find company with code of ${code}`, 404)
        }

        let results2 = await db.query('SELECT * FROM invoices WHERE comp_code=$1',[code]);
        if(results2.rows.length === 0) {
            // If the company given cannot be found, this should return a 404 status response.
            results2.rows = "No invoices found"
        }

        const inds = results.rows.map(d => d.ind_code);

        // Return obj of company: {company: {code, name, description}}
        return res.send({company: results.rows[0], invoices: results2.rows, tags: inds});
    } catch(e) {
        return next(e);
    }
    /* TEST
    GET http://localhost:3000/companies/ibm

    RETURNS
	{
	"company": {
		"code": "ibm",
		"name": "IBM",
		"description": "Big blue."
	},
	"invoices": [
		{
			"id": 4,
			"comp_code": "ibm",
			"amt": 400,
			"paid": false,
			"add_date": "2022-06-29T04:00:00.000Z",
			"paid_date": null
		}
    ]
    }
    */
})

// POST /companies
router.post('/', async (req, res, next) => {
    
    try {
        // Needs to be given JSON like: {name, description}
        const {name, description} = req.body;
        // Using slugify to make the code automatically
        const code = slugify(name, {lower: true});
        /* TEST
        POST http://localhost:3000/companies
        {
    	"name": "Google",
	    "description": "Maker of Android"
        }	

        RETURNS
        {
    	"company": {
	    	"code": "google",
		    "name": "Google",
		    "description": "Maker of Android"
	        }
        }
        */ 
        // Adds a company.
        const results = await db.query(`INSERT INTO companies (code, name, description) VALUES ($1, $2, $3) RETURNING code, name, description`, [code, name, description]);
        // Returns obj of new company: {company: {code, name, description}}
        return res.status(201).json({company: results.rows[0]})
    } catch(e) {
        next(e);
    }
    /* TEST
    POST http://localhost:3000/companies
    {
	"code": "ms",
	"name": "Microsoft",
	"description": "Maker of Windows."	
    }	

    RETURNS
    {
	"company": {
		"code": "ms",
		"name": "Microsoft",
		"description": "Maker of Windows."
	    }
    }
     */
})

// PUT /companies/[code]
router.put('/:code', async (req, res, next) => {
    
    try {
        const {code} = req.params;
        // Needs to be given JSON like: {name, description}
        const {name, description} = req.body;
        // Edit existing company.
        const results = await db.query('UPDATE companies SET name=$1, description=$2 WHERE code=$3 RETURNING code, name, description', [name, description, code]);
        if(results.rows.length === 0) {
            // Should return 404 if company cannot be found.
            throw new ExpressError(`Can't update company code ${code} with name ${name} and description ${description}`, 404);
        }
        // Returns update company object: {company: {code, name, description}}
        return res.status(201).send({company: results.rows[0]})
    } catch(e) {
        next(e);
    }
    /* TEST
    PUT http://localhost:3000/companies/ms
    {
	"code": "ms",
	"name": "Microsoft",
	"description": "Maker of Windows and XBOX."	
    }	

    RETURNS
    {
	"company": {
		"code": "ms",
		"name": "Microsoft",
		"description": "Maker of Windows and XBOX."
	    }
    }
    */
})

// DELETE /companies/[code]
router.delete('/:code', async (req, res, next) => {
    
    try {
        const {code} = req.params;
        // Deletes company.
        const results = await db.query('DELETE FROM companies WHERE code=$1 RETURNING code', [code]);

        if(results.rows.length === 0) {
            // Should return 404 if company cannot be found.
            throw new ExpressError(`Company cannot be found`, 404);
        }
        // Returns {status: "deleted"}
        return res.status(201).send({status: "deleted"});
    } catch(e) {
        next(e);
    }
    /* TEST
    DELETE http://localhost:3000/companies/ms

    RETURNS
    {
	"status": "deleted"
    }
    */
})

//  Must have this export statement, otherwise the app errors out.
module.exports = router;