const fs = require('fs');
const process = require('process');
const axios = require('axios');

function cat(path){
    fs.readFile(path,'utf8',(err,data) => {
        if(err) {
            console.log(err);
            process.exit(1);
        }
        console.log(data);
    })
}

async function webCat(url) {
    try {
        let res = await axios.get(url);
        console.log(res.data);
    } catch (err){
        console.log(`Error fetching ${url}: \n ${err}`);
        process.exit(1);
    }
    
}

let arg = process.argv[2];
if(arg.startsWith('http')) {
    webCat(arg);
} else {
    cat(arg);
}

// node step2.js one.txt
// This is file one.

// node step2.js http://google.com
// <!doctype html><html

// node step2.js http://rithmschool.com/no-such-path
// Error fetching http://rithmschool.com/no-such-path:
//  Error: Request failed with status code 404