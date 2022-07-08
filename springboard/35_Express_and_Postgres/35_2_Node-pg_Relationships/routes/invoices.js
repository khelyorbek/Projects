const express = require("express");
const ExpressError = require("../expressError");
const router = express.Router();
const db = require("../db");

// GET /invoices
router.get('/', async (req, res, next) => {
    try {
        const results = await db.query('SELECT * FROM invoices');
        // Return info on invoices: like {invoices: [{id, comp_code}, ...]}
        return res.json({invoices: results.rows})
    } catch(e) {
        next(e);
    }
    /* TESTING 
    GET http://localhost:3000/invoices

    RETURNS
    {
        "invoices": [
            {
                "id": 1,
                "comp_code": "apple",
                "amt": 100,
                "paid": false,
                "add_date": "2022-06-29T04:00:00.000Z",
                "paid_date": null
            },
            {
                "id": 2,
                "comp_code": "apple",
                "amt": 200,
                "paid": false,
                "add_date": "2022-06-29T04:00:00.000Z",
                "paid_date": null
            },
            {
                "id": 3,
                "comp_code": "apple",
                "amt": 300,
                "paid": true,
                "add_date": "2022-06-29T04:00:00.000Z",
                "paid_date": "2018-01-01T05:00:00.000Z"
            },
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

// GET /invoices/[id]
router.get('/:id', async (req, res, next) => {
    try {
        // Returns obj on given invoice.
        const res1 = await db.query('SELECT * FROM invoices WHERE id=$1;',[req.params.id]);
        // If invoice cannot be found, returns 404.
        if(res1.rows.length === 0) {
            throw new ExpressError(`Can't find user with code of ${code}`, 404)
        }
        const {id, comp_code, amt, paid, add_date, paid_date} = res1.rows[0];

        // Queries data for company information
        const res2 = await db.query('SELECT * FROM companies WHERE code=$1',[comp_code]);
        const {code, name, description} = res2.rows[0];

        // Returns {invoice: {id, amt, paid, add_date, paid_date, company: {code, name, description}}}
        return res.json({invoice: {id, amt, paid, add_date, paid_date, company: {code, name, description}}});
    } catch(e) {
        next(e);
    }
    /* TESTING
    GET http://localhost:3000/invoices/1

    RETURNS
    {
	"invoice": {
		"id": 1,
		"amt": 100,
		"paid": false,
		"add_date": "2022-06-29T04:00:00.000Z",
		"paid_date": null,
		"company": {
			"code": "apple",
			"name": "Apple Computer",
			"description": "Maker of OSX."
            }
        }
    }
    */
})

// POST /invoices
router.post('/', async (req, res, next) => {
    try {
        // Needs to be passed in JSON body of: {comp_code, amt}
        const {comp_code, amt} = req.body;

        // Adds an invoice.
        const results = await db.query('INSERT INTO invoices (comp_code, amt) VALUES ($1, $2) RETURNING id, comp_code, amt, paid, add_date, paid_date', [comp_code, amt]);

        // Returns: {invoice: {id, comp_code, amt, paid, add_date, paid_date}}
        return res.status(201).json({invoice: results.rows[0]});
    } catch(e) {
        next(e);
    }
    /* TESTING
    POST http://localhost:3000/invoices
    {
	"comp_code": "ibm",
	"amt": 333
    }	

    RETURNS 201
    {
	"invoice": {
		"id": 7,
		"comp_code": "ibm",
		"amt": 333,
		"paid": false,
		"add_date": "2022-07-06T04:00:00.000Z",
		"paid_date": null
        }
    }

    Database
    8 | ibm       | 333 | f    | 2022-07-06 |
    */
})

// PUT /invoices/[id]
router.put('/:id', async (req,res,next) => {
    try {
        const { id } = req.params;
        // Needs to be passed in a JSON body of {amt, paid}
        const { amt, paid } = req.body;

        const invoice = await db.query('SELECT * FROM invoices WHERE id=$1',[id]);

        if(invoice.rows.length === 0) {
            // If invoice cannot be found, returns a 404.
            throw new ExpressError(`Can't update the invoice with amount ${amt}}`, 404);
        }

        const currPDate = invoice.rows[0].paid_date;
        let newPDate = null;

        
        if(currPDate === null && paid === true) {
            // If paying unpaid invoice: sets paid_date to today
            newPDate = new Date();
        } else if(currPDate !== null && paid === false) {
            // If un-paying: sets paid_date to null
            newPDate = null;
        } else {
            // Else: keep current paid_date
            newPDate = currPDate;
        }

        // Updates an invoice.
        const results = await db.query('UPDATE invoices SET amt=$1, paid=$2, paid_date=$3 WHERE id=$4 RETURNING id, comp_code, amt, paid, add_date, paid_date',[amt, paid, newPDate, id]);

        // Returns: {invoice: {id, comp_code, amt, paid, add_date, paid_date}}
        return res.status(201).send({invoice: results.rows[0]})
    } catch(e) {
        next(e);
    }
    /* TESTING
    PUT http://localhost:3000/invoices/8

    {
	"amt": 444
    }	

    TESTING PAYING THE INVOICE
    PUT http://localhost:3000/invoices/1

    {
	"amt": 222,
	"paid": true
    }	

    BEFORE
    {
	"invoice": {
		"id": 1,
		"amt": 100,
		"paid": false,
		"add_date": "2022-06-29T04:00:00.000Z",
		"paid_date": null,
		"company": {
			"code": "apple",
			"name": "Apple Computer",
			"description": "Maker of OSX."
		    }
	    }
    }

    AFTER
    {
	"invoice": {
		"id": 1,
		"comp_code": "apple",
		"amt": 222,
		"paid": true, <<< UPDATED
		"add_date": "2022-06-29T04:00:00.000Z",
		"paid_date": "2022-07-08T04:00:00.000Z" <<< UPDATED
        }
    }
    */
})

// DELETE /invoices/[id]
router.delete('/:id', async (req, res, next) => {
    try {
        const { id } = req.params;
        // Deletes an invoice.
        const results = await db.query('DELETE FROM invoices WHERE id=$1 RETURNING id', [id]);
        
        if(results.rows.length === 0) {
            // If invoice cannot be found, returns a 404.
            throw new ExpressError(`Company cannot be found`, 404);
        }

        // Returns: {status: "deleted"}
        return res.status(201).send({status: "deleted"});
    } catch(e) {
        next(e);
    }
    /* TESTING 
    DELETE http://localhost:3000/invoices/8

    RETURNS
    {
	"status": "deleted"
    }
    */
})

//  Must have this export statement, otherwise the app errors out.
module.exports = router;