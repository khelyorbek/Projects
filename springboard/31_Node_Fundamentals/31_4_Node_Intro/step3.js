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

async function writeToFile(newFile, oldFile, type){
    if(type==='file') {
        fs.readFile(oldFile,'utf8',(err,data) => {
            if(err) {
                console.log(err);
                process.exit(1);
            }
            fs.writeFile(newFile, data, { encoding: 'utf8' }, err => {
                if (err) {
                  console.log(`Error writing to ${newFile}: \n ${err}`);
                  process.kill(1)
                } 
              })
        })
    }  else {
        let res = await axios.get(oldFile);
        fs.writeFile(newFile, res.data, { encoding: 'utf8' }, err => {
            if (err) {
              console.log(`Error writing to ${file}: \n ${err}`);
              process.kill(1)
            } 
          })
    }
    
    

    
      
}

let arg = process.argv[2];

if(arg.startsWith('http')) {
    webCat(arg);
} 
else if(arg === '--out') {
    let outputFile = process.argv[3];
    let input = process.argv[4];

    if(input.startsWith('http')) {
        writeToFile(outputFile, input, 'link');
    } else {
        writeToFile(outputFile, input, 'file');
    }
    
} else {
    cat(arg);
}

// node step3.js one.txt
// This is file one.

// node step3.js http://google.com
// <!doctype html><html

// node step3.js --out new.txt one.txt
// new.txt contents
// // This is file one.

// node step3.js --out /no/dir/new.txt one.txt
// Error writing to /no/dir/new.txt:
//  Error: ENOENT: no such file or directory, open '/no/dir/new.txt'