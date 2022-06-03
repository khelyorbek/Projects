// requiring express
const express = require('express');
// requiring my custom methods file and desctructuring right away
// const { numMean, strArrToIntArr } = require('./methods');

// mapping express to a variable
const app = express();

app.get('/mean', (req, res) => {
    const { nums } = req.query;
    const strArr = nums.split(',');
    const len = strArr.length;
    let sum = 0;

    // console.log(`Full string array: ${strArr}`);

    for(let i of strArr) {
        sum += parseInt(i);
    }

    res.json({response: {operation:"mean",value:sum/len}});
})

app.get('/median', (req, res) => {
    const { nums } = req.query;
    const strArr = nums.split(',');
    let intArr = [];

    for(let i of strArr) {
        intArr.push(parseInt(i));
    }
    
    intArr.sort();
    let median = intArr[parseInt(intArr.length / 2)];
    res.json({response: {operation:"median",value:median}});
})

app.get('/mode', (req, res) => {
    const { nums } = req.query;
    const strArr = nums.split(',');
    let intArr = [];

    for(let i of strArr) {
        intArr.push(parseInt(i));
    }

    let counter = {};

    for(let i of intArr) { counter[i] = 0 }
    for(let i of intArr) { counter[i] += 1 }

    let max = Math.max(...Object.values(counter));
    
    res.json({response: {operation:"mode",value:max}});
})

app.use(function (err, req, res, next) {
    if(!req.query.nums) { res.status(400); res.json("nums are required")}
    
    for(let i of req.query.nums) { if(isNaN(parseInt(i))) { res.status(400); res.json("not a number") } }
  });
// at the bottom of the app
app.listen(5000, () => {
    console.log("Server running on port 5000");
})