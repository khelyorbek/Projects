// importing express
const express = require('express')
// importing the router library
const router = express.Router();
// importing our fake database (array)
let items = require('../fakeDb')

// ------------------------------------------------------------------------------------
// 1. GET /items - this should render a list of shopping items.
router.get('/', (req, res, next) => {
    try {
        res.json(items);
    } catch(err) {
        return next(err);
    }
})

// Here is what a response looks like:
// [{“name”: “popsicle”, “price”: 1.45}, {“name”:”cheerios”, “price”: 3.40}]

// Our response
// 

// ------------------------------------------------------------------------------------
// 2. POST /items - this route should accept JSON data and add it to the shopping list.
router.post('/', (req, res, next) => {
    try {
        let obj = {"name": req.body.name, "price": req.body.price};
        items.push(obj);
        console.log(`Added object into the items array`);
        res.json({"added": obj});
    } catch(err) {
        return next(err);
    }
})

// Here is what a sample request/response looks like:
// {“name”:”popsicle”, “price”: 1.45} => {“added”: {“name”: “popsicle”, “price”: 1.45}}

// Our response
// { "added": { "name": "popsicle", "price": 1.45 } }

// ------------------------------------------------------------------------------------
// 3. GET /items/:name - this route should display a single item’s name and price.
router.get('/:name', (req, res, next) => {
    try {
        let itemName = items.find(i => i.name === req.params.name);
        res.json(itemName);
    } catch(err) {
        return next(err);
    }
})

// Here is what a sample response looks like:
// {“name”: “popsicle”, “price”: 1.45}

// Our response
// { "name": "popsicle", "price": 1.45 }

// ------------------------------------------------------------------------------------
// 4. PATCH /items/:name, this route should modify a single item’s name and/or price.
router.patch('/:name', (req, res, next) => {
    try {
        let item = items.find(i => i.name === req.params.name);
        item.name = req.body.name;
        item.price = req.body.price;
        res.json({"updated": item});

    } catch(err) {
        return next(err);
    }
})

// Here is what a sample request/response looks like:
// {“name”:”new popsicle”, “price”: 2.45} => {“updated”: {“name”: “new popsicle”, “price”: 2.45}}

// Our request / response
// http://localhost:3000/items/popsicle {"name":"popsicle2", "price": 1.50} }
// { "updated": { "name": "popsicle2", "price": 1.5 }}

// ------------------------------------------------------------------------------------
// 5. DELETE /items/:name - this route should allow you to delete a specific item from the array.
router.delete('/:name', (req, res, next) => {
    try {
        items = items.filter(i => i.name !== req.params.name);
        res.json({"message": "Deleted"});
    } catch(err) {
        return next(err);
    }
})

// Here is what a sample response looks like:
// {message: “Deleted”}

// Our request / response
// DELETE http://localhost:3000/items/popsicle
// { "message": "Deleted" }
// [] <<< empty array after the deletion. had to change "const items" to "let items" at the top of this file.

// within app.js you can import this router and tell the app to use it. magic that connects this userRoutes file to the app file
module.exports = router;